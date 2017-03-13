package com.lj.app.core.common.flows.service;

import java.util.List;

import com.lj.app.core.common.flows.entity.FlowApprove;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskHist;


public interface FlowQueryService {

	public FlowOrder getFlowOrder(String orderId);

	public List<FlowTask> getActiveTasks(String flowOrderId);
	public List<FlowTask> getActiveTasks(int flowOrderId);

	public FlowTask getFlowTask(String taskId);

	public List<FlowApprove> queryApprove(String orderId, String taskId)throws Exception;

	public FlowOrderHist getHistOrder(String orderId);

	public List<FlowTaskHist> getHistoryTasks(String orderId);
	
	public List<FlowTaskHist> getHistoryTasks(String orderId, String taskName);
}
