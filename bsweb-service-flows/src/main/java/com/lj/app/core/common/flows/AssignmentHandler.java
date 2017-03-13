package com.lj.app.core.common.flows;

import com.lj.app.core.common.flows.core.Execution;

/**
 * 分配参与者的处理接口
 * 建议使用Assignment接口
 */
public interface AssignmentHandler {
	/**
	 * 分配参与者方法，可获取到当前的执行对象
	 * @param execution 执行对象
	 * @return Object 参与者对象
	 */
	public Object assign(Execution execution);
}
