package com.lj.app.core.common.flows.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
 * 请假申请测试流程
 */
public class FlowLeaveTest extends BaseEntity {

  /**
   * ID id
   */
  private java.lang.Integer id;

  /**
   * 假请天数 leave_dates
   */
  private java.lang.Integer leaveDates;

  /**
   * 请假说明 LEAVE_MEM
   */
  private String leaveMem;

  /**
   * 流程实例ID order_id
   */
  private java.lang.Integer orderId;

  public void setId(java.lang.Integer value) {
    this.id = value;
  }

  public java.lang.Integer getId() {
    return this.id;
  }

  public void setLeaveDates(java.lang.Integer value) {
    this.leaveDates = value;
  }

  public java.lang.Integer getLeaveDates() {
    return this.leaveDates;
  }

  public void setLeaveMem(String value) {
    this.leaveMem = value;
  }

  public String getLeaveMem() {
    return this.leaveMem;
  }

  public void setOrderId(java.lang.Integer value) {
    this.orderId = value;
  }

  public java.lang.Integer getOrderId() {
    return this.orderId;
  }

}
