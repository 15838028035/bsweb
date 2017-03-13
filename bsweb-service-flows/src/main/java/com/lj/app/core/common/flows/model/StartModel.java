package com.lj.app.core.common.flows.model;

import java.util.Collections;
import java.util.List;

import com.lj.app.core.common.flows.core.Execution;

public class StartModel extends NodeModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4550530562581330477L;

	/**
	 * 开始节点无输入变迁
	 */
	public List<TransitionModel> getInputs() {
		return Collections.emptyList();
	}

	protected void exec(Execution execution) {
		runOutTransition(execution);
	}
}