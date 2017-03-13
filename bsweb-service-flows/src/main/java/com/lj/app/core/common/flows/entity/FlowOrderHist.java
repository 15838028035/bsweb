package com.lj.app.core.common.flows.entity;

import java.util.Date;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
*FlowOrderHist
*/
public class FlowOrderHist extends BaseEntity{
	
	/**
	 *   ID
	 */
	private java.lang.Integer id;
	
	/**
	 * 流程编号  ORDER_NO
	 */
	private String orderNo;
	
	/**
	 * 流程版本  ORDER_VERSION
	 */
	private java.lang.Integer orderVersion;
	
	/**
	 * 流程定义ID  FLOW_PROCESS_ID
	 */
	private String flowProcessId;
	
	/**
	 * 父流程实例ID  PARENT_ID
	 */
	private String parentId;
	
	/**
	 * 父流程名称  parent_Node_Name
	 */
	private String parentNodeName;
	
	/**
	 * 流程实例期望完成时间  expire_time
	 */
	private java.util.Date expireTime;
	
	 /**
	 * 流程实例期望完成时间Begin
	 */
	private String  expireTimeBegin;
	/**
	 * 流程实例期望完成时间End
	 */
	private String expireTimeEnd;
	/**
	 * 流程实例优先级  priority
	 */
	private java.lang.Integer priority;
	
	/**
	 * 流程实例附属变量  variable
	 */
	private String variable;

	private Date endTime;
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public java.lang.Integer getOrderVersion() {
		return orderVersion;
	}

	public void setOrderVersion(java.lang.Integer orderVersion) {
		this.orderVersion = orderVersion;
	}

	public String getFlowProcessId() {
		return flowProcessId;
	}

	public void setFlowProcessId(String flowProcessId) {
		this.flowProcessId = flowProcessId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentNodeName() {
		return parentNodeName;
	}

	public void setParentNodeName(String parentNodeName) {
		this.parentNodeName = parentNodeName;
	}

	public java.util.Date getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(java.util.Date expireTime) {
		this.expireTime = expireTime;
	}

	public String getExpireTimeBegin() {
		return expireTimeBegin;
	}

	public void setExpireTimeBegin(String expireTimeBegin) {
		this.expireTimeBegin = expireTimeBegin;
	}

	public String getExpireTimeEnd() {
		return expireTimeEnd;
	}

	public void setExpireTimeEnd(String expireTimeEnd) {
		this.expireTimeEnd = expireTimeEnd;
	}

	public java.lang.Integer getPriority() {
		return priority;
	}

	public void setPriority(java.lang.Integer priority) {
		this.priority = priority;
	}

	public String getVariable() {
		return variable;
	}

	public void setVariable(String variable) {
		this.variable = variable;
	}

	public void setEndTime(Date date) {
		this.endTime= endTime;
	}

	public Date getEndTime() {
		return endTime;
	}
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("HistoryOrder(id=").append(this.id);
		sb.append(",processId=").append(this.flowProcessId);
		sb.append(",creator=").append(this.getCreateByUname());
		sb.append(",createTime").append(this.getCreateDate());
		sb.append(",orderNo=").append(this.orderNo).append(")");
		return sb.toString();
}
}

