package com.lj.app.core.common.flows;

import com.lj.app.core.common.flows.core.Execution;

/**
 * 决策处理器接口
 */
public interface DecisionHandler {
	/**
	 * 定义决策方法，实现类需要根据执行对象做处理，并返回后置流转的name
	 * @param execution
	 * @return String 后置流转的name
	 */
	public String decide(Execution execution);
}