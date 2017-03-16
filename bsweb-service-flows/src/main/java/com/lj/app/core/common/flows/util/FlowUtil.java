package com.lj.app.core.common.flows.util;

import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;

import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskHist;
import com.lj.app.core.common.flows.model.CustomModel;
import com.lj.app.core.common.flows.model.DecisionModel;
import com.lj.app.core.common.flows.model.EndModel;
import com.lj.app.core.common.flows.model.ExtTaskModel;
import com.lj.app.core.common.flows.model.ForkModel;
import com.lj.app.core.common.flows.model.JoinModel;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.model.StartModel;
import com.lj.app.core.common.flows.model.SubProcessModel;
import com.lj.app.core.common.flows.model.TaskModel;
import com.lj.app.core.common.flows.model.TransitionModel;

public class FlowUtil {
	private static Map<Class<? extends NodeModel>, String> mapper = new HashMap<Class<? extends NodeModel>, String>();
	static {
		mapper.put(ExtTaskModel.class, "task");
		mapper.put(TaskModel.class, "task");
		mapper.put(CustomModel.class, "custom");
		mapper.put(DecisionModel.class, "decision");
		mapper.put(EndModel.class, "end");
		mapper.put(ForkModel.class, "fork");
		mapper.put(JoinModel.class, "join");
		mapper.put(StartModel.class, "start");
		mapper.put(SubProcessModel.class, "subprocess");
	}
	public static String getStateJson(ProcessModel model, List<FlowTask> activeFlowTasks, List<FlowTaskHist> historyFlowTasks) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("{'activeRects':{'rects':[");
		if(activeFlowTasks != null && activeFlowTasks.size() > 0) {
			for(FlowTask FlowTask : activeFlowTasks) {
				buffer.append("{'paths':[],'name':'");
				buffer.append(FlowTask.getTaskName());
				buffer.append("'},");
			}
			buffer.deleteCharAt(buffer.length() - 1);
		}
		buffer.append("]}, 'historyRects':{'rects':[");
		if(historyFlowTasks != null && historyFlowTasks.size() > 0) {
			for(FlowTaskHist historyFlowTask : historyFlowTasks) {
				NodeModel parentModel = model.getNode(historyFlowTask.getTaskName());
				if(parentModel == null) continue;
				buffer.append("{'name':'").append(parentModel.getName()).append("','paths':[");
				buffer.append("]},");
			}
			buffer.deleteCharAt(buffer.length() - 1);
		}
		buffer.append("]}}");
		return buffer.toString();
	}

	public static String getModelJson(ProcessModel model) {
		StringBuffer buffer = new StringBuffer();
		List<TransitionModel> tms = new ArrayList<TransitionModel>();
		for(NodeModel node : model.getNodes()) {
			for(TransitionModel tm : node.getOutputs()) {
				tms.add(tm);
			}
		}
		buffer.append("{");
		buffer.append(getNodeJson(model.getNodes()));
		buffer.append(getPathJson(tms));
		buffer.append("props:{props:{name:{name:'name',value:'");
		buffer.append(convert(model.getName()));
		buffer.append("'},displayName:{name:'displayName',value:'");
		buffer.append(convert(model.getDisplayName()));
		buffer.append("'},expireTime:{name:'expireTime',value:'");
		buffer.append(convert(model.getExpireTime()));
		buffer.append("'},instanceUrl:{name:'instanceUrl',value:'");
		buffer.append(convert(model.getInstanceUrl()));
		buffer.append("'},instanceNoClass:{name:'instanceNoClass',value:'");
		buffer.append(convert(model.getInstanceNoClass()));
		buffer.append("'}}}}");
		return buffer.toString();
	}
	
	public static String getNodeJson(List<NodeModel> nodes) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("states: {");
		for(NodeModel node : nodes) {
			buffer.append(node.getName());
			buffer.append(getBase(node));
			buffer.append(getLayout(node));
			buffer.append(getProperty(node));
			buffer.append(",");
		}
		buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("},");
		return buffer.toString();
	}
	
	public static String getPathJson(List<TransitionModel> tms) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("paths:{");
		for(TransitionModel tm : tms) {
			buffer.append(tm.getName());
			buffer.append(":{from:'");
			buffer.append(tm.getSource().getName());
			buffer.append("',to:'");
			buffer.append(tm.getTarget().getName());
			buffer.append("', dots:[");
			if(StringUtils.isNotBlank(tm.getG())) {
		        String[] bendpoints = tm.getG().split(";");
		        for (String bendpoint: bendpoints) {
		        	buffer.append("{");
		            String[] xy = bendpoint.split(",");
		            buffer.append("x:").append(getNumber(xy[0]));
		            buffer.append(",y:").append(xy[1]);
		            buffer.append("},");
		        }
		        buffer.deleteCharAt(buffer.length() - 1);
			}
			buffer.append("],text:{text:'");
			buffer.append(tm.getDisplayName());
			buffer.append("'},textPos:{");
			if(StringUtils.isNotBlank(tm.getOffset())) {
				String[] values = tm.getOffset().split(",");
				buffer.append("x:").append(values[0]).append(",");
				buffer.append("y:").append(values[1]).append("");
			}
			buffer.append("}, props:{name:{value:'" + tm.getName() + "'},expr:{value:'" + tm.getExpr() + "'}}}");
			buffer.append(",");
		}
		buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("},");
		return buffer.toString();
	}
	
	public static String getBase(NodeModel node) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(":{type:'");
		buffer.append(mapper.get(node.getClass()));
		buffer.append("',text:{text:'");
		buffer.append(node.getDisplayName());
		buffer.append("'},");
		return buffer.toString();
	}
	
	private static String getProperty(NodeModel node) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("props:{");
		try {
		PropertyDescriptor[] beanProperties = PropertyUtils.getPropertyDescriptors(node);
		for (PropertyDescriptor propertyDescriptor : beanProperties) {
			if(propertyDescriptor.getReadMethod() == null || propertyDescriptor.getWriteMethod() == null)
				continue;
			String name = propertyDescriptor.getName();
			String value = "";
			if(propertyDescriptor.getPropertyType() == String.class) {
				value = (String)BeanUtils.getProperty(node, name);
			} else {
				continue;
			}
			if(value == null || value.equals("")) continue;
			buffer.append(name);
			buffer.append(":{value:'");
			buffer.append(convert(value));
			buffer.append("'},");
		}
		} catch(Exception e) {
			e.printStackTrace();
		}
		buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("}}");
		return buffer.toString();
	}
	
	private static String getLayout(NodeModel node) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("attr:{");
		String[] values = node.getLayout().split(",");
		buffer.append("x:").append(getNumber(values[0])).append(",");
		buffer.append("y:").append(values[1]).append(",");
		if("-1".equals(values[2])) {
			if(node instanceof TaskModel || node instanceof CustomModel || node instanceof SubProcessModel) {
				values[2] = "100";
			} else {
				values[2] = "50";
			}
		}
		if("-1".equals(values[3])) {
			values[3] = "50";
		}
		buffer.append("width:").append(values[2]).append(",");
		buffer.append("height:").append(values[3]);
		buffer.append("},");
		return buffer.toString();
	}
	
	private static String convert(String value) {
		if (StringUtils.isEmpty(value))
			return "";
		if (value.indexOf("'") != -1) {
			value = value.replaceAll("'", "#1");
		}
		if (value.indexOf("\"") != -1) {
			value = value.replaceAll("\"", "#2");
		}
		if (value.indexOf("\r\n") != -1) {
			value = value.replaceAll("\r\n", "#3");
		}
		if (value.indexOf("\n") != -1) {
			value = value.replaceAll("\n", "#4");
		}
		if (value.indexOf(">") != -1) {
			value = value.replaceAll(">", "#5");
		}
		if (value.indexOf("<") != -1) {
			value = value.replaceAll("<", "#6");
		}
        if (value.indexOf("&amp;") != -1) {
            value = value.replaceAll("&amp;", "#7");
        }
		return value;
	}
	
	public static String convertXml(String value) {
		if(value.indexOf("#1") != -1) {
			value = value.replaceAll("#1", "'");
		}
		if(value.indexOf("#2") != -1) {
			value = value.replaceAll("#2", "\"");
		}
		if(value.indexOf("#5") != -1) {
			value = value.replaceAll("#5", "&gt;");
		}
		if(value.indexOf("#6") != -1) {
			value = value.replaceAll("#6", "&lt;");
		}
        if(value.indexOf("&") != -1) {
            value = value.replaceAll("#7", "&amp;");
        }
		return value;
	}
	
	private static int getNumber(String value) {
		if(value == null) return 0;
		try {
			return Integer.parseInt(value) + 180;
		} catch(Exception e) {
			return 0;
		}
}
}
