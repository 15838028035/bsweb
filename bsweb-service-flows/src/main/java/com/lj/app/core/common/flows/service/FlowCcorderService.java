package com.lj.app.core.common.flows.service;

import com.lj.app.core.common.base.service.BaseService;

public interface FlowCcorderService<FlowCcorder> extends BaseService {

	 /**
	* 创建实例的抄送
	*/
	public void createCCOrder(String orderId, String creator, String... actorIds) ;
}
