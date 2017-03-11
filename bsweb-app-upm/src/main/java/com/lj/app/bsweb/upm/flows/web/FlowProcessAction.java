package com.lj.app.bsweb.upm.flows.web;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskHist;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.flows.service.FlowEngineFacetsService;
import com.lj.app.core.common.flows.service.FlowProcessService;
import com.lj.app.core.common.flows.service.FlowQueryService;
import com.lj.app.core.common.flows.util.FlowUtil;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.Assert;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.FileUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :流程定义表
 * @description :FlowProcessAction
 * @author: liujie
 * @date: 2016-10-17 21:29:05
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flows")
@Results({
		@Result(name = AbstractBaseAction.RELOAD, location = "flowProcessAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/flows/flowProcess-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "flowProcessAction!edit.action", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/flows/flowProcessList.jsp", type = AbstractBaseAction.REDIRECT),
		@Result(name = "flowDiagram", location = "/jsp/flows/flowDiagram.jsp"),
		@Result(name = "flowProcessDesigner", location = "/jsp/flows/flowProcessDesigner.jsp"),
		@Result(name = "flowProcessView", location = "/jsp/flows/flowProcessView.jsp")

})
@Action("flowProcessAction")
public class FlowProcessAction extends AbstractBaseUpmAction<FlowProcess> {

	protected Logger logger = LoggerFactory.getLogger(FlowProcessAction.class);

	private FlowProcess flowProcess;

	private java.lang.Integer id;

	@Autowired
	private FlowEngineFacetsService flowEngineFacetsService;
	
	@Autowired
	private FlowEngine flowEngine;
	
	@Autowired
	private FlowProcessService<FlowProcess> flowProcessService;
	
	@Autowired
	private FlowQueryService flowQueryService;

	private String orderId;

	private String flowProcessJson;

	private String processId;
	
	/**
	 * 流程内容  FLOW_CONTENT
	 */
	private String  flowContentStr;

	public BaseService<FlowProcess> getBaseService() {
		return flowProcessService;
	}

	public FlowProcess getModel() {
		return flowProcess;
	}

	@Override
	protected void prepareModel() throws Exception {
		flowEngine = flowEngineFacetsService.getEngine();
		if (id != null) {
			flowProcess = (FlowProcess) flowProcessService.getProcessById(id.toString());
			flowProcess.setFlowContentStr(StringUtil.byteToString(flowProcess
					.getFlowContent()));
		} else {
			flowProcess = new FlowProcess();
			flowProcess.setFlowContentStr(StringUtil.byteToString(flowProcess
					.getFlowContent()));
		}
	}

	@Override
	public String commonSaveOrUpdate() throws Exception {
		try {
			if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT)) {
				flowProcess.setFlowContent(flowProcess.getFlowContentStr()
						.getBytes("UTF-8"));
				flowProcess.setUpdateBy(this.getLoginUserId());
				flowProcess.setUpdateByUname(this.getUserName());
				flowProcess.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());

				getBaseService().updateObject(flowProcess);
				returnMessage = UPDATE_SUCCESS;
			} else {
				flowProcess.setFlowContent(flowProcess.getFlowContentStr()
						.getBytes("UTF-8"));

				flowProcess.setCreateBy(this.getLoginUserId());
				flowProcess.setCreateByUname(this.getUserName());
				flowProcess.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());

				getBaseService().insertObject(flowProcess);
				returnMessage = CREATE_SUCCESS;
			}

			return LIST;
		} catch (Exception e) {
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}
	}

	public String processDeploy() throws Exception {
		InputStream input = null;
		String msg = this.OPT_SUCCESS;
		try {
			if (id != null) {
				flowProcess = (FlowProcess) flowProcessService.getProcessById(id.toString());
				flowProcess.setFlowContentStr(StringUtil.byteToString(flowProcess
						.getFlowContent()));
				
				String flowContent = flowProcess.getFlowContentStr();
				input = FileUtil.getStreamFromString(flowContent);
				flowProcessService.deploy(flowContent, this.getUserName());
			} else {
				msg = "";
			}

		} catch (Exception e) {
			e.printStackTrace();
			msg = this.OPT_FAILURE;
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setOpResult(msg);
		Struts2Utils.renderJson(ajaxResult);
		return null;
	}

	public String processReDeploy() throws Exception {
		InputStream input = null;
		String msg = this.OPT_SUCCESS;
		try {
			if (id != null) {
				flowProcess = (FlowProcess) flowProcessService.getProcessById(id.toString());
				flowProcess.setFlowContentStr(StringUtil.byteToString(flowProcess
						.getFlowContent()));
				String flowContent = flowProcess.getFlowContentStr();
				input = FileUtil.getStreamFromString(flowContent);
				flowProcessService.redeploy(id.toString(), flowContent);
			} else {
				msg = "";
			}

		} catch (Exception e) {
			e.printStackTrace();
			msg = this.OPT_FAILURE;
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setOpResult(msg);
		Struts2Utils.renderJson(ajaxResult);
		return null;
	}

	public String processDesigner() throws Exception {
		if (id != null) {
			flowProcess = flowProcessService.getProcessById(id.toString());
			ProcessModel processModel = flowProcess.getModel();
			if (processModel != null) {
				flowProcessJson = FlowUtil.getModelJson(processModel);
			}

		}
		return "flowProcessDesigner";
	}

	public String processDeployXml() {
		InputStream input = null;
		String msg = "true";
		try {
			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n";
			String flowContent = xml + FlowUtil.convertXml(flowContentStr);
			input = FileUtil.getStreamFromString(flowContent);
			if (id != null) {
				flowProcessService.redeploy(id.toString(), flowContent);
			} else {
				flowProcessService.deploy(flowContent, this.getUserName());
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "false";
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
					msg = "false";
				}
			}
		}
		Struts2Utils.renderText(msg);
		return null;
	}

	public String processStart() throws Exception {
		flowEngineFacetsService.startInstanceByName(flowProcess.getFlowName(), null,
				this.getUserName(), null);
		return LIST;
	}

	public String flowProcessView() {
		FlowOrderHist order = flowQueryService.getHistOrder(orderId);
		List<FlowTaskHist> tasks = flowEngine.flowQueryService().getHistoryTasks(orderId);
				
		return "flowProcessView";
	}

	/**
	 * 显示独立的流程图
	 */
	public String flowDiagram() {
		return "flowDiagram";
	}

	public Object diagramJson() throws Exception {
		FlowProcess process = flowProcessService.getProcessById(processId);
				
		Assert.notNull(process);
		ProcessModel model = process.getModel();
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (model != null) {
			jsonMap.put("process", FlowUtil.getModelJson(model));
		}

		if (StringUtil.isNotBlank(orderId)) {
			List<FlowTask> tasks = flowQueryService.getActiveTasks(orderId);
			List<FlowTaskHist> historyTasks = flowQueryService.getHistoryTasks(orderId);
					
			jsonMap.put("state",FlowUtil.getStateJson(model, tasks, historyTasks));
					
		}
		logger.debug(jsonMap.get("state"));
		// {"historyRects":{"rects":[{"paths":["TO 任务1"],"name":"开始"},{"paths":["TO 分支"],"name":"任务1"},{"paths":["TO 任务3","TO 任务4","TO 任务2"],"name":"分支"}]}}
		// return jsonMap;
		Struts2Utils.renderJson(jsonMap);
		return null;
	}

	public void setFlowProcess(FlowProcess flowProcess) {
		this.flowProcess = flowProcess;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public FlowProcess getFlowProcess() {
		return flowProcess;
	}

	public java.lang.Integer getId() {
		return id;
	}

	
	public FlowEngineFacetsService getFlowEngineFacetsService() {
		return flowEngineFacetsService;
	}

	public void setFlowEngineFacetsService(FlowEngineFacetsService flowEngineFacetsService) {
		this.flowEngineFacetsService = flowEngineFacetsService;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getFlowProcessJson() {
		return flowProcessJson;
	}

	public void setFlowProcessJson(String flowProcessJson) {
		this.flowProcessJson = flowProcessJson;
	}

	public String getProcessId() {
		return processId;
	}

	public void setProcessId(String processId) {
		this.processId = processId;
	}

	public String getFlowContentStr() {
		return flowContentStr;
	}

	public void setFlowContentStr(String flowContentStr) {
		this.flowContentStr = flowContentStr;
	}

	public FlowEngine getFlowEngine() {
		return flowEngine;
	}

	public void setFlowEngine(FlowEngine flowEngine) {
		this.flowEngine = flowEngine;
	}

	public FlowProcessService getFlowProcessService() {
		return flowProcessService;
	}

	public void setFlowProcessService(FlowProcessService flowProcessService) {
		this.flowProcessService = flowProcessService;
	}


}
