package com.lj.app.core.common.flows.handlers;

import com.lj.app.core.common.flows.core.Execution;

/**
 * 流程各模型操作处理接口
 */
public interface IHandler {
	/**
	 * 子类需要实现的方法，来处理具体的操作
	 * @param execution 执行对象
	 */
	public void handle(Execution execution);
}
