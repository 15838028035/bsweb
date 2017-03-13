package com.lj.app.core.common.flows.parser.impl;

import com.lj.app.core.common.flows.model.EndModel;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.parser.AbstractNodeParser;

/**
 * 结束节点解析类
 */
public class EndParser extends AbstractNodeParser {
	/**
	 * 产生EndModel模型对象
	 */
	protected NodeModel newModel() {
		return new EndModel();
	}
}