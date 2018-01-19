package com.lj.app.core.common.flows.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * 
 * 获得任务执行者
 *
 * @param <FlowTaskActor>
 *          获得任务执行者
 */
@Service("flowTaskActorService")
public class FlowTaskActorServiceImpl<FlowTaskActor> extends BaseServiceImpl<FlowTaskActor>
    implements FlowTaskActorService<FlowTaskActor>, Serializable {

  /**
   * 获得任务执行者
   * 
   * @param taskId 任务Id
   * @return 获得任务执行者
   */
  public List<FlowTaskActor> getTaskActorsByTaskId(String taskId) {
    com.lj.app.core.common.flows.entity.FlowTaskActor flowTaskActor = 
        new com.lj.app.core.common.flows.entity.FlowTaskActor();
    flowTaskActor.setTaskId(taskId);
    return this.queryForList(flowTaskActor);
  }

  /**
   * 移除任务参与者
   * 
   * @param taskId 任务Id
   * @param actors 参与者
   */
  public void removeTaskActor(String taskId, String... actors) {
    for (String actorId : actors) {
      com.lj.app.core.common.flows.entity.FlowTaskActor flowTaskActor = 
          new com.lj.app.core.common.flows.entity.FlowTaskActor();
      flowTaskActor.setTaskId(taskId);
      flowTaskActor.setActorId(actorId);
      this.delete("deleteFlowTaskActorByTaskIdAndActorId", flowTaskActor);
    }
  }


  /**
   * 移除任务参与者
   * 
   * @param taskId 任务Id
   */
  public void deleteFlowTaskActorByTaskId(String taskId) {
    this.delete("deleteFlowTaskActorByTaskId", taskId);
  }
}
