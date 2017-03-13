package com.lj.app.core.common.flows.model;

import com.lj.app.core.common.flows.core.Execution;



/**
 * 分支定义fork元素
 */
public class ForkModel extends NodeModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2030281774771653617L;

	protected void exec(Execution execution) {
		runOutTransition(execution);
	}
}