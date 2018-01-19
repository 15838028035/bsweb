package com.lj.app.core.common.flows.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskHist;
import com.lj.app.core.common.flows.model.TaskModel.TaskType;
import com.lj.app.core.common.util.StringUtil;

/**
 * 
 * 流程引擎门面类
 *
 */
@Service("flowEngineFacetsService")
public class FlowEngineFacetsServiceImpl implements FlowEngineFacetsService, Serializable {

  @Autowired
  private FlowEngine flowEngine;

  @Autowired
  private ConfigurationService configurationService;

  public FlowEngine getEngine() {
    flowEngine = configurationService.buildSnakerEngine();
    return flowEngine;
  }

  /**
   * 根据流程定义ID，操作人ID，参数列表启动流程实例
   */
  public FlowOrder startInstanceById(String processId, String operator, Map<String, Object> args) throws Exception {
    return getEngine().startInstanceById(processId, operator, args);
  }

  /**
   * 根据流程名称、版本号、操作人、参数列表启动流程实例
   */
  public FlowOrder startInstanceByName(String name, Integer version, String operator, Map<String, Object> args)
      throws Exception {
    return getEngine().startInstanceByName(name, version, operator, args);
  }

  /**
   * 根据流程名称、版本号、操作人、参数列表启动流程实例
   */
  public FlowOrder startAndExecute(String name, Integer version, String operator, Map<String, Object> args)
      throws Exception {
    FlowOrder order = getEngine().startInstanceByName(name, version, operator, args);
    List<FlowTask> tasks = getEngine().flowQueryService().getActiveTasks(order.getId());
    List<FlowTask> newTasks = new ArrayList<FlowTask>();
    if (tasks != null && tasks.size() > 0) {
      FlowTask task = tasks.get(0);
      newTasks.addAll(getEngine().executeTask(task.getId().toString(), operator, args));
    }
    return order;
  }

  /**
   * 根据流程名称、版本号、操作人、参数列表启动流程实例
   */
  public FlowOrder startAndExecute(String processId, String operator, Map<String, Object> args) throws Exception {
    FlowOrder order = getEngine().startInstanceById(processId, operator, args);
    List<FlowTask> tasks = getEngine().flowQueryService().getActiveTasks(order.getId());
    List<FlowTask> newTasks = new ArrayList<FlowTask>();
    if (tasks != null && tasks.size() > 0) {
      FlowTask task = tasks.get(0);
      newTasks.addAll(getEngine().executeTask(task.getId().toString(), operator, args));
    }
    return order;
  }

  public List<FlowTask> execute(String taskId, String operator, Map<String, Object> args) throws Exception {
    return getEngine().executeTask(taskId, operator, args);
  }

  public List<FlowTask> executeAndJump(String taskId, String operator, Map<String, Object> args, String nodeName)
      throws Exception {
    return getEngine().executeAndJumpTask(taskId, operator, args, nodeName);
  }

  /**
   * 转办
   */
  public List<FlowTask> transferMajor(String taskId, String operator, String... actors) throws Exception {
    List<FlowTask> tasks = getEngine().flowTaskServiceApi().createNewTask(taskId, TaskType.Major.ordinal(), actors);
    getEngine().flowTaskServiceApi().complete(taskId, operator);
    return tasks;
  }

  /**
   * 转办
   */
  public List<FlowTask> transferAidant(String taskId, String operator, String... actors) throws Exception {
    List<FlowTask> tasks = getEngine().flowTaskServiceApi().createNewTask(taskId, TaskType.Aidant.ordinal(), actors);
    getEngine().flowTaskServiceApi().complete(taskId, operator);
    return tasks;
  }

  /**
   * 流程数据
   */
  public Map<String, Object> flowData(String orderId, String taskName) {
    Map<String, Object> data = new HashMap<String, Object>();
    if (StringUtil.isNotBlank(orderId) && StringUtil.isNotBlank(taskName)) {
      List<FlowTaskHist> histTasks = getEngine().flowQueryService().getHistoryTasks(orderId, taskName);

      List<Map<String, Object>> vars = new ArrayList<Map<String, Object>>();
      for (FlowTaskHist hist : histTasks) {
        vars.add(hist.getVariableMap());
      }
      data.put("vars", vars);
      data.put("histTasks", histTasks);
    }
    return data;
  }
}
