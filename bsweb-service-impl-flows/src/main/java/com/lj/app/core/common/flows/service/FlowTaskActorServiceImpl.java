package com.lj.app.core.common.flows.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * @title :
 * @description :FlowTaskActorService
 * @author: liujie
 * @date: 2016-10-29 09:54:58
 */
@Service("flowTaskActorService")
public class FlowTaskActorServiceImpl<FlowTaskActor> extends BaseServiceImpl<FlowTaskActor> implements FlowTaskActorService<FlowTaskActor>,Serializable{
	
	/**
	 * 获得任务执行者
	 * @param taskId
	 * @return
	 */
	public List<FlowTaskActor> getTaskActorsByTaskId(String taskId){
		 com.lj.app.core.common.flows.entity.FlowTaskActor flowTaskActor = new com.lj.app.core.common.flows.entity.FlowTaskActor();
		flowTaskActor.setTaskId(taskId);
		return this.queryForList(flowTaskActor);
	}
	
	/**
	 *移除任务参与者 
	 * @param taskId
	 * @param actors
	 */
	public void removeTaskActor(String taskId,String... actors){
		for(String actorId : actors) {
			 com.lj.app.core.common.flows.entity.FlowTaskActor flowTaskActor = new com.lj.app.core.common.flows.entity.FlowTaskActor();
			 flowTaskActor.setTaskId(taskId);
			 flowTaskActor.setActorId(actorId);
			 this.delete("deleteFlowTaskActorByTaskIdAndActorId", flowTaskActor);
		}
	}
}
