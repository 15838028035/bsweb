package com.lj.app.core.common.flows.entity;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
*FlowApprove
*/
public class FlowApprove extends BaseEntity{
	
	/**
	 * ID  id
	 */
	private java.lang.Integer id;
	
	/**
	 * 流程ID  process_id
	 */
	private java.lang.Integer processId;
	
	/**
	 * 流程实例id  order_id
	 */
	private java.lang.Integer orderId;
	
	/**
	 * 程流任务ID  task_id
	 */
	private java.lang.Integer taskId;
	
	/**
	 * 操作着  operator
	 */
	private String operator;
	
	/**
	 * 操作时间  operate_Time
	 */
	private java.util.Date operateTime;
	
	 /**
	 * 操作时间Begin
	 */
	private String  operateTimeBegin;
	/**
	 * 操作时间End
	 */
	private String operateTimeEnd;
	/**
	 * 操作结果  opt_result
	 */
	private String optResult;
	
	/**
	 * 操作内容  opt_content
	 */
	private String optContent;
	
	/**
	 * 任务名称  task_Name
	 */
	private String taskName;
	


	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setProcessId(java.lang.Integer value) {
		this.processId = value;
	}
	
	public java.lang.Integer getProcessId() {
		return this.processId;
	}
	public void setOrderId(java.lang.Integer value) {
		this.orderId = value;
	}
	
	public java.lang.Integer getOrderId() {
		return this.orderId;
	}
	public void setTaskId(java.lang.Integer value) {
		this.taskId = value;
	}
	
	public java.lang.Integer getTaskId() {
		return this.taskId;
	}
	public void setOperator(String value) {
		this.operator = value;
	}
	
	public String getOperator() {
		return this.operator;
	}
	public void setOperateTime(java.util.Date value) {
		this.operateTime = value;
	}
	
	public java.util.Date getOperateTime() {
		return this.operateTime;
	}
	public void setOptResult(String value) {
		this.optResult = value;
	}
	
	public String getOptResult() {
		return this.optResult;
	}
	public void setOptContent(String value) {
		this.optContent = value;
	}
	
	public String getOptContent() {
		return this.optContent;
	}
	public void setTaskName(String value) {
		this.taskName = value;
	}
	
	public String getTaskName() {
		return this.taskName;
	}

	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("ProcessId",getProcessId())
			.append("OrderId",getOrderId())
			.append("TaskId",getTaskId())
			.append("Operator",getOperator())
			.append("OperateTime",getOperateTime())
			.append("OptResult",getOptResult())
			.append("OptContent",getOptContent())
			.append("TaskName",getTaskName())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getProcessId())
			.append(getOrderId())
			.append(getTaskId())
			.append(getOperator())
			.append(getOperateTime())
			.append(getOptResult())
			.append(getOptContent())
			.append(getTaskName())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof FlowApprove == false) return false;
		if(this == obj) return true;
		FlowApprove other = (FlowApprove)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getProcessId(),other.getProcessId())
			.append(getOrderId(),other.getOrderId())
			.append(getTaskId(),other.getTaskId())
			.append(getOperator(),other.getOperator())
			.append(getOperateTime(),other.getOperateTime())
			.append(getOptResult(),other.getOptResult())
			.append(getOptContent(),other.getOptContent())
			.append(getTaskName(),other.getTaskName())
			.isEquals();
	}
}

