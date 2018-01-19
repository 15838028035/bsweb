package com.lj.app.core.common.flows.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * FlowTaskActorHist111
 */
public class FlowTaskActorHist extends BaseEntity {

  /**
   * id
   */
  private java.lang.Integer id;

  /**
   * TASK_ID
   */
  private java.lang.Integer taskId;

  /**
   * ACTOR_ID
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
}
