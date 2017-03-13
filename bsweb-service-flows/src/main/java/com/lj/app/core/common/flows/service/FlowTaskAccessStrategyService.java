package com.lj.app.core.common.flows.service;

import java.util.List;

import com.lj.app.core.common.flows.entity.FlowTaskActor;


public interface FlowTaskAccessStrategyService {
	/**
	 * 根据操作人id、参与者集合判断是否允许访问所属任务
	 * @param operator 操作人id
	 * @param actors 参与者列表 传递至该接口的实现类中的参与者都是为非空
	 * @return boolean 是否允许访问
	 */
	public boolean isAllowed(String operator, List<FlowTaskActor> actors); 
}
