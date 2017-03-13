package com.lj.app.core.common.flows.parser.impl;

import org.w3c.dom.Element;

import com.lj.app.core.common.flows.model.CustomModel;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.parser.AbstractNodeParser;

/**
 * 自定义节点解析器
 */
public class CustomParser extends AbstractNodeParser {
	protected void parseNode(NodeModel node, Element element) {
		CustomModel custom = (CustomModel) node;
		custom.setClazz(element.getAttribute(ATTR_CLAZZ));
		custom.setMethodName(element.getAttribute(ATTR_METHODNAME));
		custom.setArgs(element.getAttribute(ATTR_ARGS));
		custom.setVar(element.getAttribute(ATTR_VAR));
	}

	protected NodeModel newModel() {
		return new CustomModel();
	}

}