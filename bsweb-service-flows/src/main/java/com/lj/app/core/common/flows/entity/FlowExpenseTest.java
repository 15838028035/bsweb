package com.lj.app.core.common.flows.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
 * FlowExpenseTest111
 */
public class FlowExpenseTest extends BaseEntity {

  /**
   * ID id
   */
  private java.lang.Integer id;

  /**
   * 申请人 operator
   */
  private String operator;

  /**
   * 报销金额 operator_Amount
   */
  private java.lang.Double operatorAmount;

  /**
   * 操作时间 operator_Time
   */
  private java.util.Date operatorTime;

  /**
   * 操作时间Begin
   */
  private String operatorTimeBegin;
  /**
   * 操作时间End
   */
  private String operatorTimeEnd;
  /**
   * 流程实例ID flow_order_id
   */
  private java.lang.Integer flowOrderId;

  /**
   * 任务Id flow_task_id
   */
  private java.lang.Integer flowTaskId;

  /**
   * 申请备注 app_Memo
   */
  private String appMemo;

  /**
   * 流程定义ID process_Id
   */
  private java.lang.Integer processId;

  public void setId(java.lang.Integer value) {
    this.id = value;
  }

  public java.lang.Integer getId() {
    return this.id;
  }

  public void setOperator(String value) {
    this.operator = value;
  }

  public String getOperator() {
    return this.operator;
  }

  public void setOperatorAmount(java.lang.Double value) {
    this.operatorAmount = value;
  }

  public java.lang.Double getOperatorAmount() {
    return this.operatorAmount;
  }

  public void setOperatorTime(java.util.Date value) {
    this.operatorTime = value;
  }

  public java.util.Date getOperatorTime() {
    return this.operatorTime;
  }

  public void setFlowOrderId(java.lang.Integer value) {
    this.flowOrderId = value;
  }

  public java.lang.Integer getFlowOrderId() {
    return this.flowOrderId;
  }

  public void setFlowTaskId(java.lang.Integer value) {
    this.flowTaskId = value;
  }

  public java.lang.Integer getFlowTaskId() {
    return this.flowTaskId;
  }

  public void setAppMemo(String value) {
    this.appMemo = value;
  }

  public String getAppMemo() {
    return this.appMemo;
  }

  public void setProcessId(java.lang.Integer value) {
    this.processId = value;
  }

  public java.lang.Integer getProcessId() {
    return this.processId;
  }

  public String getOperatorTimeBegin() {
    return operatorTimeBegin;
  }

  public void setOperatorTimeBegin(String operatorTimeBegin) {
    this.operatorTimeBegin = operatorTimeBegin;
  }

  public String getOperatorTimeEnd() {
    return operatorTimeEnd;
  }

  public void setOperatorTimeEnd(String operatorTimeEnd) {
    this.operatorTimeEnd = operatorTimeEnd;
  }
  
}
