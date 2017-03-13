package com.lj.app.core.common.flows.parser.impl;

import com.lj.app.core.common.flows.model.ForkModel;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.parser.AbstractNodeParser;

/**
 * 分支节点解析类
 */
public class ForkParser extends AbstractNodeParser {
	/**
	 * 产生ForkModel模型对象
	 */
	protected NodeModel newModel() {
		return new ForkModel();
	}
}