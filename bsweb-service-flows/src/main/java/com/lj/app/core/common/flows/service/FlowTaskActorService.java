package com.lj.app.core.common.flows.service;

import java.util.List;

import com.lj.app.core.common.base.service.BaseService;

/**
 * @title :
 * @description :FlowTaskActorService
 * @author: liujie
 * @date: 2016-10-29 09:54:58
 */
public interface FlowTaskActorService<FlowTaskActor> extends BaseService {
	
	/**
	 * 获得任务执行者
	 * @param taskId
	 * @return
	 */
	public List<FlowTaskActor> getTaskActorsByTaskId(String taskId);
	
	/**
	 *移除任务参与者 
	 * @param taskId
	 * @param actors
	 */
	public void removeTaskActor(String taskId, String... actors);
}
