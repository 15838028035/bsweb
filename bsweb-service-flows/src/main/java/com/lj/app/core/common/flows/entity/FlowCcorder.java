package com.lj.app.core.common.flows.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
*流程抄送
*/
public class FlowCcorder extends BaseEntity{
	
	/**
	 *   id
	 */
	private java.lang.Integer id;
	
	/**
	 * 流程实例编号  order_id
	 */
	private java.lang.Integer orderId;
	
	/**
	 * 执行人  actor_id
	 */
	private String actorId;
	
	/**
	 * 建创人  creator
	 */
	private String creator;
	
	/**
	 * 创建时间  createTime
	 */
	private java.util.Date createTime;
	
	 /**
	 * 创建时间Begin
	 */
	private String  createTimeBegin;
	/**
	 * 创建时间End
	 */
	private String createTimeEnd;
	/**
	 * 完成时间  finishTime
	 */
	private java.util.Date finishTime;
	
	 /**
	 * 完成时间Begin
	 */
	private String  finishTimeBegin;
	/**
	 * 完成时间End
	 */
	private String finishTimeEnd;

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setOrderId(java.lang.Integer value) {
		this.orderId = value;
	}
	
	public java.lang.Integer getOrderId() {
		return this.orderId;
	}
	public void setActorId(String value) {
		this.actorId = value;
	}
	
	public String getActorId() {
		return this.actorId;
	}
	public void setCreator(String value) {
		this.creator = value;
	}
	
	public String getCreator() {
		return this.creator;
	}
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	public void setFinishTime(java.util.Date value) {
		this.finishTime = value;
	}
	
	public java.util.Date getFinishTime() {
		return this.finishTime;
	}

	public String getCreateTimeBegin() {
		return createTimeBegin;
	}

	public void setCreateTimeBegin(String createTimeBegin) {
		this.createTimeBegin = createTimeBegin;
	}

	public String getCreateTimeEnd() {
		return createTimeEnd;
	}

	public void setCreateTimeEnd(String createTimeEnd) {
		this.createTimeEnd = createTimeEnd;
	}

	public String getFinishTimeBegin() {
		return finishTimeBegin;
	}

	public void setFinishTimeBegin(String finishTimeBegin) {
		this.finishTimeBegin = finishTimeBegin;
	}

	public String getFinishTimeEnd() {
		return finishTimeEnd;
	}

	public void setFinishTimeEnd(String finishTimeEnd) {
		this.finishTimeEnd = finishTimeEnd;
	}

}

