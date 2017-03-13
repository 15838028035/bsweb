package com.lj.app.core.common.flows.model;

public class FlowEntity extends BaseModel {

	// 流程实例ID
	protected String orderId;
	// 任务ID
	protected String taskId;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	
}
