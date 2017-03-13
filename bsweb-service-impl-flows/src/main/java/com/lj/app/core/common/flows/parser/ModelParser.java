package com.lj.app.core.common.flows.parser;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.DocumentBuilder;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.core.ServiceContext;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.model.TransitionModel;
import com.lj.app.core.common.flows.util.XmlHelper;

/**
 * 流程定义xml文件的模型解析器
 */
public class ModelParser {
	
	/**
	 * 解析流程定义文件，并将解析后的对象放入模型容器中
	 * @param bytes
	 */
	public static ProcessModel parse(InputStream in) {
		DocumentBuilder documentBuilder = XmlHelper.createDocumentBuilder();
		if(documentBuilder != null) {
			Document doc = null;
			try {
				doc = documentBuilder.parse(in);
				Element processE = doc.getDocumentElement();
				ProcessModel process = new ProcessModel();
				process.setName(processE.getAttribute(NodeParser.ATTR_NAME));
				process.setDisplayName(processE.getAttribute(NodeParser.ATTR_DISPLAYNAME));
				process.setExpireTime(processE.getAttribute(NodeParser.ATTR_EXPIRETIME));
				process.setInstanceUrl(processE.getAttribute(NodeParser.ATTR_INSTANCEURL));
				process.setInstanceNoClass(processE.getAttribute(NodeParser.ATTR_INSTANCENOCLASS));
				NodeList nodeList = processE.getChildNodes();
				int nodeSize = nodeList.getLength();
				for(int i = 0; i < nodeSize; i++) {
					Node node = nodeList.item(i);
					if (node.getNodeType() == Node.ELEMENT_NODE) {
						NodeModel model = parseModel(node);
						process.getNodes().add(model);
					}
				}
				
				//循环节点模型，构造变迁输入、输出的source、target
				for(NodeModel node : process.getNodes()) {
					for(TransitionModel transition : node.getOutputs()) {
						String to = transition.getTo();
						for(NodeModel node2 : process.getNodes()) {
							if(to.equalsIgnoreCase(node2.getName())) {
								node2.getInputs().add(transition);
								transition.setTarget(node2);
							}
						}
					}
				}
				return process;
			} catch (SAXException e) {
				e.printStackTrace();
				throw new FlowException(e);
			} catch (IOException e) {
				throw new FlowException(e);
			}
		} else {
			throw new FlowException("documentBuilder is null");
		}
	}
	
	/**
	 * 解析流程定义文件，并将解析后的对象放入模型容器中
	 * @param bytes
	 */
	public static ProcessModel parse(byte[] bytes) {
		DocumentBuilder documentBuilder = XmlHelper.createDocumentBuilder();
		if(documentBuilder != null) {
			Document doc = null;
			try {
				doc = documentBuilder.parse(new ByteArrayInputStream(bytes));
				Element processE = doc.getDocumentElement();
				ProcessModel process = new ProcessModel();
				process.setName(processE.getAttribute(NodeParser.ATTR_NAME));
				process.setDisplayName(processE.getAttribute(NodeParser.ATTR_DISPLAYNAME));
				process.setExpireTime(processE.getAttribute(NodeParser.ATTR_EXPIRETIME));
				process.setInstanceUrl(processE.getAttribute(NodeParser.ATTR_INSTANCEURL));
				process.setInstanceNoClass(processE.getAttribute(NodeParser.ATTR_INSTANCENOCLASS));
				NodeList nodeList = processE.getChildNodes();
				int nodeSize = nodeList.getLength();
				for(int i = 0; i < nodeSize; i++) {
					Node node = nodeList.item(i);
					if (node.getNodeType() == Node.ELEMENT_NODE) {
						NodeModel model = parseModel(node);
						process.getNodes().add(model);
					}
				}
				
				//循环节点模型，构造变迁输入、输出的source、target
				for(NodeModel node : process.getNodes()) {
					for(TransitionModel transition : node.getOutputs()) {
						String to = transition.getTo();
						for(NodeModel node2 : process.getNodes()) {
							if(to.equalsIgnoreCase(node2.getName())) {
								node2.getInputs().add(transition);
								transition.setTarget(node2);
							}
						}
					}
				}
				return process;
			} catch (SAXException e) {
				e.printStackTrace();
				throw new FlowException(e);
			} catch (IOException e) {
				throw new FlowException(e);
			}
		} else {
			throw new FlowException("documentBuilder is null");
		}
	}
	
	/**
	 * 对流程定义xml的节点，根据其节点对应的解析器解析节点内容
	 * @param node
	 * @return
	 */
	private static NodeModel parseModel(Node node) {
		String nodeName = node.getNodeName();
		Element element = (Element)node;
		NodeParser nodeParser = null;
		try {
			nodeParser = ServiceContext.getContext().findByName(nodeName, NodeParser.class);
			
			if(nodeParser ==null) {
				System.out.println("nodeName=" + nodeName);
			}
			nodeParser.parse(element);
			return nodeParser.getModel();
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw new FlowException(e);
		}
	}
}