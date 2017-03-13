package com.lj.app.core.common.flows.parser.impl;

import com.lj.app.core.common.flows.model.JoinModel;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.parser.AbstractNodeParser;

/**
 * 合并节点解析类
 */
public class JoinParser extends AbstractNodeParser {
	/**
	 * 产生JoinModel模型对象
	 */
	protected NodeModel newModel() {
		return new JoinModel();
	}
}