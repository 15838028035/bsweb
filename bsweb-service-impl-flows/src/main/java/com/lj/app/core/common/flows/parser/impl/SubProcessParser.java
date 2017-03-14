package com.lj.app.core.common.flows.parser.impl;


import org.apache.commons.lang.math.NumberUtils;
import org.w3c.dom.Element;

import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.model.SubProcessModel;
import com.lj.app.core.common.flows.parser.AbstractNodeParser;
import com.lj.app.core.common.flows.util.ConfigHelper;
import com.lj.app.core.common.util.StringUtil;

public class SubProcessParser extends AbstractNodeParser {
	/**
	 * 产生SubProcessModel模型对象
	 */
	protected NodeModel newModel() {
		return new SubProcessModel();
	}

	/**
	 * 解析decisition节点的特有属性expr
	 */
	protected void parseNode(NodeModel node, Element element) {
		SubProcessModel model = (SubProcessModel) node;
		model.setProcessName(element.getAttribute(ATTR_PROCESSNAME));
		String version = element.getAttribute(ATTR_VERSION);
		int ver = 0;
		if (NumberUtils.isNumber(version)) {
			ver = Integer.parseInt(version);
		}
		model.setVersion(ver);
		String form = element.getAttribute(ATTR_FORM);
		if (StringUtil.isNotBlank(form)) {
			model.setForm(form);
		} else {
			model.setForm(ConfigHelper.getProperty("subprocessurl"));
		}
	}
}
