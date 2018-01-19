package com.lj.app.core.common.flows.scheduling;

import java.util.List;

import com.lj.app.core.common.flows.entity.FlowTask;

/**
 * 任务job执行后的回调类
 * 
 */
public interface JobCallback {
  /**
   * 回调函数
   * 
   * @param taskId
   *          当前任务id
   * @param newTasks
   *          新产生的任务集合
   */
  public void callback(String taskId, List<FlowTask> newTasks);
}