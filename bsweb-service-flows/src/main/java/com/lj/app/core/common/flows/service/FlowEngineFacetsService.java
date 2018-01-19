package com.lj.app.core.common.flows.service;

import java.util.List;
import java.util.Map;

import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowTask;

/**
 * 
 * 流程引擎门面类
 *
 */
public interface FlowEngineFacetsService {

  public FlowEngine getEngine();

  public FlowOrder startInstanceById(String processId, String operator, Map<String, Object> args) throws Exception;

  public FlowOrder startInstanceByName(String name, Integer version, String operator, Map<String, Object> args)
      throws Exception;

  public FlowOrder startAndExecute(String name, Integer version, String operator, Map<String, Object> args)
      throws Exception;

  public FlowOrder startAndExecute(String processId, String operator, Map<String, Object> args) throws Exception;

  public List<FlowTask> execute(String taskId, String operator, Map<String, Object> args) throws Exception;

  public List<FlowTask> executeAndJump(String taskId, String operator, Map<String, Object> args, String nodeName)
      throws Exception;

  public List<FlowTask> transferMajor(String taskId, String operator, String... actors) throws Exception;

  public List<FlowTask> transferAidant(String taskId, String operator, String... actors) throws Exception;

  public Map<String, Object> flowData(String orderId, String taskName);
}
