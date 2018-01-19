package com.lj.app.core.common.flows.handlers.impl;

import java.util.List;
import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.handlers.IHandler;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.model.SubProcessModel;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.util.StringUtil;

/**
 * 结束流程实例的处理器
 */
public class EndProcessHandler implements IHandler {
  /**
   * 结束当前流程实例，如果存在父流程，则触发父流程继续执行
   */
  public void handle(Execution execution) {
    try {
      FlowEngine engine = execution.getEngine();
      FlowOrder order = execution.getFlowOrder();
      List<FlowTask> tasks = engine.flowQueryService().getActiveTasks(order.getId());
      for (FlowTask task : tasks) {
        if (task.isMajor()) {
          throw new FlowException("存在未完成的主办任务,请确认.");
        }
        engine.FlowTaskServiceApi().complete(task.getId().toString(), FlowEngine.AUTO);
      }
      engine.flowOrderService().complete(order.getId().toString());
      if (StringUtil.isNotBlank(order.getParentId())) {
        FlowOrder parentOrder = engine.flowQueryService().getFlowOrder(order.getParentId());
        if (parentOrder == null)  {
          return;
        }
        FlowProcess process = engine.flowProcessService().getProcessById(parentOrder.getFlowProcessId());
        ProcessModel pm = process.getModel();
        if (pm == null) {
          return;
        }
        SubProcessModel spm = (SubProcessModel) pm.getNode(order.getParentNodeName());
        Execution newExecution = new Execution(engine, process, parentOrder, execution.getArgs());
        newExecution.setChildOrderId(order.getId().toString());
        newExecution.setTask(execution.getTask());
        spm.execute(newExecution);
        // SubProcessModel执行结果的tasks合并到当前执行对象execution的tasks列表中
        execution.addTasks(newExecution.getTasks());
      }
    } catch (Exception e) {
      throw new FlowException(e);
    }
  }
}