package com.lj.app.core.common.flows.service;

import java.util.Map;

import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowProcess;

/**
 * @title :
 * @description :FlowOrderService
 * @author: liujie
 * @date: 2016-10-18 08:19:32
 */
public interface FlowOrderService<FlowOrder> extends BaseService {

	/**
	 *
	 * @param process
	 * @param operator
	 * @param args
	 * @param parentId
	 * @param parentNodeName
	 * @return
	 */
	public  com.lj.app.core.common.flows.entity.FlowOrder createFlowOrder(FlowProcess process, String operator,Map<String, Object> args, String parentId, String parentNodeName) throws Exception;

	/**
	 * 流程实例正常完成
	 * @param orderId 流程实例id
	 */
	public void complete(String orderId);
	
}
