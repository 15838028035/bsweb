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
	
	/**
     * 向活动实例临时添加全局变量数据
     * @param orderId 实例id
     * @param args 变量数据
     */
    public void addVariable(String orderId, Map<String, Object> args) throws Exception;
    
    /**
  	 * 强制中止流程实例
  	 */
  	public void terminate(String orderId)  throws Exception ;

  	/**
  	 * 强制中止活动实例,并强制完成活动任务
  	 */
  	public void terminate(String orderId, String operator) throws Exception;
  	
  	/**
	 * 级联删除指定流程实例的所有数据：
	 * 1.flow_order,flow_order_hist
	 * 2.flow_task,flow_task_hist
	 * 3.flow_task_actor,flow_task_actor_actor
	 * 4.flow_ccOrder
	 * @param id 实例id
	 */
  	public void cascadeRemove(String id);
}
