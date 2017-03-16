package com.lj.app.core.common.flows.entity;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
*流程参与者
*/
public class FlowTaskActor extends BaseEntity{
	
	/**
	 * ID  id
	 */
	private java.lang.Integer id;
	
	/**
	 * 务任iD  TASK_ID
	 */
	private String taskId;
	
	/**
	 * 关联的参与者ID（参与者可以为用户、部门、角色)  ACTOR_ID
	 */
	private String actorId;

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setTaskId(String value) {
		this.taskId = value;
	}
	
	public String getTaskId() {
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
		if(obj instanceof FlowTaskActor == false) return false;
		if(this == obj) return true;
		FlowTaskActor other = (FlowTaskActor)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getTaskId(),other.getTaskId())
			.append(getActorId(),other.getActorId())
			.isEquals();
	}
}

