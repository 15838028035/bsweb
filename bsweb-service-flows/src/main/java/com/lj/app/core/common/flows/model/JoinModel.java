package com.lj.app.core.common.flows.model;

import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.handlers.impl.MergeBranchHandler;

/**
 * 合并定义join元素
 */
public class JoinModel extends NodeModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5296621319088076775L;
	
	public void exec(Execution execution) {
		fire(new MergeBranchHandler(this), execution);
		if(execution.isMerged()) runOutTransition(execution);
	}
}
