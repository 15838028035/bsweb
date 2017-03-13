package com.lj.app.core.common.flows;

import com.lj.app.core.common.flows.core.Execution;

/**
 * 所有的模型对象需要实现的接口，需要实现execute方法，每个节点的执行方式不一样
 */
public interface Action {
	/**
	 * 根据当前的执行对象所维持的process、order、model、args对所属流程实例进行执行
	 * @param execution 执行对象
	 */
	public void execute(Execution execution);
}