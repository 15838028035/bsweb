package com.lj.app.core.common.flows.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.flows.entity.FlowApprove;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowQueryFilter;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskHist;

@Service("flowQueryService")
public class FlowQueryServiceImpl implements FlowQueryService,Serializable {
	
	@Autowired
	private FlowEngineFacetsServiceImpl flowEngineFacets;
	
	public FlowOrder getFlowOrder(String orderId){
		return (FlowOrder)flowEngineFacets.getEngine().flowOrderService().getInfoByKey(orderId);
	}
	
	public List<FlowTask> getActiveTasks(String flowOrderId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("flowOrderId", flowOrderId);
		return flowEngineFacets.getEngine().flowTaskService().queryForList(map);
	}
	
	public List<FlowTask> getActiveTasks(int flowOrderId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("flowOrderId", flowOrderId);
		return flowEngineFacets.getEngine().flowTaskService().queryForList(map);
	}
	
	public FlowTask getFlowTask(String taskId){
		return (FlowTask) flowEngineFacets.getEngine().flowTaskService().getInfoByKey(taskId);
	}
	
	public List<FlowApprove> queryApprove(String orderId, String taskId)throws Exception{
		FlowApprove flowApprove = new FlowApprove();
		flowApprove.setOrderId(Integer.valueOf(orderId));
		flowApprove.setTaskId(Integer.valueOf(taskId));
		return flowEngineFacets.getEngine().flowApproveService().queryForList(flowApprove);
	}
	
	public FlowOrderHist getHistOrder(String orderId){
		return (FlowOrderHist)flowEngineFacets.getEngine().flowOrderHistService().getInfoByKey(orderId);
	}

	public List<FlowTaskHist> getHistoryTasks(String orderId){
		FlowTaskHist flowTaskHist = new FlowTaskHist();
		flowTaskHist.setFlowOrderId(Integer.valueOf(orderId));
		return flowEngineFacets.getEngine().FlowTaskHistService().queryForList(flowTaskHist);
	}
	
	public List<FlowTaskHist> getHistoryTasks(String orderId, String taskName){
		FlowTaskHist flowTaskHist = new FlowTaskHist();
		flowTaskHist.setFlowOrderId(Integer.valueOf(orderId));
		flowTaskHist.setTaskName(taskName);
		return flowEngineFacets.getEngine().FlowTaskHistService().queryForList(flowTaskHist);
	}

	@Override
	public List<FlowTask> getActiveTasks(FlowQueryFilter filter) {
		return null;//TODO:query me
	}

	@Override
	public List<FlowOrder> getActiveOrders(FlowQueryFilter filter) {
		return null;//TODO:query me
	}
	
}
