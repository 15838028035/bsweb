package com.lj.app.core.common.flows.scheduling;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import com.lj.app.core.common.flows.entity.FlowTask;

/**
 * job实体，用于传递给具体的调度框架
 */
public class JobEntity implements Serializable {
  private static final long serialVersionUID = 5807718947643229134L;

  /**
   * 参与类型
   */
  public enum JobType {
    EXECUTER, REMINDER;
  }

  /**
   * job主键
   */
  private String key;
  /**
   * job组
   */
  private String group;
  /**
   * 任务对应的业务id串
   */
  private String id;
  /**
   * 节点模型名称
   */
  private String modelName;
  /**
   * job类型
   */
  private int jobType;
  /**
   * 任务对象
   */
  private FlowTask flowTask;
  /**
   * 启动时间
   */
  private Date startTime;
  /**
   * 间隔时间(分钟)
   */
  private int period;
  /**
   * 执行参数
   */
  private Map<String, Object> args;

  public JobEntity(String id, FlowTask flowTask, Date startTime) {
    this(id, flowTask, startTime, 0);
  }

  /**
   * 
   * @param id id
   * @param flowTask 任务
   * @param startTime 开始时间
   * @param period 间隔时间(分钟)
   */
  public JobEntity(String id, FlowTask flowTask, Date startTime, int period) {
    this.id = id;
    this.flowTask = flowTask;
    this.startTime = startTime;
    this.period = period;
  }

  public JobEntity(String id, FlowTask flowTask, Date startTime, Map<String, Object> args) {
    this(id, flowTask, startTime, args, 0);
  }

  /**
   * 
   * @param id id
   * @param flowTask 任务
   * @param startTime 开始时间
   * @param args 参数
   * @param period 间隔时间(分钟)
   */
  public JobEntity(String id, FlowTask flowTask, Date startTime, Map<String, Object> args, int period) {
    this.id = id;
    this.flowTask = flowTask;
    this.startTime = startTime;
    this.period = period;
    this.args = args;
  }

  public FlowTask getFlowTask() {
    return flowTask;
  }

  public void setFlowTask(FlowTask flowTask) {
    this.flowTask = flowTask;
  }

  public Date getStartTime() {
    return startTime;
  }

  public void setStartTime(Date startTime) {
    this.startTime = startTime;
  }

  public int getPeriod() {
    return period;
  }

  public void setPeriod(int period) {
    this.period = period;
  }

  public Map<String, Object> getArgs() {
    return args;
  }

  public void setArgs(Map<String, Object> args) {
    this.args = args;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getModelName() {
    return modelName;
  }

  public void setModelName(String modelName) {
    this.modelName = modelName;
  }

  public int getJobType() {
    return jobType;
  }

  public void setJobType(int jobType) {
    this.jobType = jobType;
  }

  public String getKey() {
    return key;
  }

  public void setKey(String key) {
    this.key = key;
  }

  public String getGroup() {
    return group;
  }

  public void setGroup(String group) {
    this.group = group;
  }
}