package com.lj.app.core.common.flows.service;

import java.util.List;

import com.lj.app.core.common.base.service.BaseService;

/**
 * 
 * 获得任务执行者
 *
 * @param <FlowTaskActor> 获得任务执行者
 */
public interface FlowTaskActorService<FlowTaskActor> extends BaseService {

  /**
   * 获得任务执行者
   * 
   * @param taskId 任务Id
   * @return 获得任务执行者
   */
  public List<FlowTaskActor> getTaskActorsByTaskId(String taskId);

  /**
   * 移除任务参与者
   * 
   * @param taskId 任务Id
   * @param actors 参与者
   */
  public void removeTaskActor(String taskId, String... actors);

  /**
   * 移除任务参与者
   * 
   * @param taskId 任务Id
   */
  public void deleteFlowTaskActorByTaskId(String taskId);
}
