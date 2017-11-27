package com.lj.app.core.common.flows.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
*FlowTaskActorHist111
*/
public class FlowTaskActorHist extends BaseEntity{
	
	/**
	 *   id
	 */
	private java.lang.Integer id;
	
	/**
	 *   TASK_ID
	 */
	private java.lang.Integer taskId;
	
	/**
	 *   ACTOR_ID
	 */
	private String actorId;
	


	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setTaskId(java.lang.Integer value) {
		this.taskId = value;
	}
	
	public java.lang.Integer getTaskId() {
		return this.taskId;
	}
	public void setActorId(String value) {
		this.actorId = value;
	}
	
	public String getActorId() {
		return this.actorId;
	}

	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("TaskId",getTaskId())
			.append("ActorId",getActorId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getTaskId())
			.append(getActorId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof FlowTaskActorHist == false) return false;
		if(this == obj) return true;
		FlowTaskActorHist other = (FlowTaskActorHist)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getTaskId(),other.getTaskId())
			.append(getActorId(),other.getActorId())
			.isEquals();
	}
}

