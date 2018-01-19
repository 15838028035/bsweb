package com.lj.app.core.common.flows.entity;

import com.lj.app.core.common.base.entity.BaseEntity;
import com.lj.app.core.common.flows.model.ProcessModel;

/**
 * 流程定义表
 */
public class FlowProcess extends BaseEntity {

  /**
   * ID id
   */
  private java.lang.Integer id;

  /**
   * 流程编号 FLOW_NO
   */
  private String flowNo;

  /**
   * 流程版本 FLOW_VERSION
   */
  private java.lang.Integer flowVersion;

  /**
   * 流程名称 FLOW_NAME
   */
  private String flowName;

  /**
   * 显示名称 DISPLAY_NAME
   */
  private String displayName;

  /**
   * 流程类型 FLOW_TYPE
   */
  private String flowType;

  /**
   * 流程内容 FLOW_CONTENT
   */
  private byte[] flowContent;

  /**
   * 流程内容 FLOW_CONTENT
   */
  private String flowContentStr;

  /**
   * 当前流程的实例url（一般为流程第一步的url） 该字段可以直接打开流程申请的表单
   */
  private String instanceUrl;

  /**
   * 流程定义模型
   */
  private ProcessModel model;

  public java.lang.Integer getId() {
    return id;
  }

  public void setId(java.lang.Integer id) {
    this.id = id;
  }

  public String getFlowNo() {
    return flowNo;
  }

  public void setFlowNo(String flowNo) {
    this.flowNo = flowNo;
  }

  public java.lang.Integer getFlowVersion() {
    return flowVersion;
  }

  public void setFlowVersion(java.lang.Integer flowVersion) {
    this.flowVersion = flowVersion;
  }

  public String getFlowName() {
    return flowName;
  }

  public void setFlowName(String flowName) {
    this.flowName = flowName;
  }

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  public String getFlowType() {
    return flowType;
  }

  public void setFlowType(String flowType) {
    this.flowType = flowType;
  }

  public byte[] getFlowContent() {
    return flowContent;
  }

  public void setFlowContent(byte[] flowContent) {
    this.flowContent = flowContent;
  }

  public ProcessModel getModel() {
    return model;
  }

  public void setModel(ProcessModel model) {
    this.model = model;
  }

  public String getInstanceUrl() {
    return instanceUrl;
  }

  public void setInstanceUrl(String instanceUrl) {
    this.instanceUrl = instanceUrl;
  }

  public String getFlowContentStr() {
    return flowContentStr;
  }

  public void setFlowContentStr(String flowContentStr) {
    this.flowContentStr = flowContentStr;
  }

  /**
   * 重写
   */
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("Process(id=").append(this.id);
    sb.append(",name=").append(this.flowName);
    sb.append(",displayName=").append(this.displayName);
    sb.append(",flowVersion=").append(this.flowVersion);
    sb.append(",state=").append(this.getStatus()).append(")");
    return sb.toString();
  }
}