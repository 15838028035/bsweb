package com.lj.app.core.common.flows.handlers.impl;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.handlers.IHandler;
import com.lj.app.core.common.flows.model.SubProcessModel;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.util.Assert;

/**
 * 启动子流程的处理器
 */
public class StartSubProcessHandler implements IHandler {
  private SubProcessModel model;
  /**
   * 是否以future方式执行启动子流程任务
   */
  private boolean isFutureRunning = false;

  public StartSubProcessHandler(SubProcessModel model) {
    this.model = model;
  }

  public StartSubProcessHandler(SubProcessModel model, boolean isFutureRunning) {
    this.model = model;
    this.isFutureRunning = isFutureRunning;
  }

  /**
   * 子流程执行的处理
   */
  public void handle(Execution execution) {
    // 根据子流程模型名称获取子流程定义对象
    try {
      FlowEngine engine = execution.getEngine();
      FlowProcess process = engine.flowProcessService().getProcessByVersion(model.getProcessName(), model.getVersion());
      Execution child = execution.createSubExecution(execution, process, model.getName());
      FlowOrder order = null;
      if (isFutureRunning) {
        // 创建单个线程执行器来执行启动子流程的任务
        ExecutorService es = Executors.newSingleThreadExecutor();
        // 提交执行任务，并返回future
        Future<FlowOrder> future = es.submit(new ExecuteTask(execution, process, model.getName()));
        try {
          es.shutdown();
          order = future.get();
        } catch (InterruptedException e) {
          throw new FlowException("创建子流程线程被强制终止执行", e.getCause());
        } catch (ExecutionException e) {
          throw new FlowException("创建子流程线程执行异常.", e.getCause());
        }
      } else {
        order = engine.startInstanceByExecution(child);
      }
      Assert.notNull(order, "子流程创建失败");
      execution.addTasks(engine.flowQueryService().getActiveTasks(order.getId()));
    } catch (Exception e) {
      throw new FlowException("StartSubProcessHandler Exception");
    }
  }

  /**
   * Future模式的任务执行。通过call返回任务结果集
   *
   */
  class ExecuteTask implements Callable<FlowOrder> {
    private FlowEngine engine;
    private Execution child;

    /**
     * 构造函数
     *
     * @param execution 执行器
     * @param process 定义对象
     * @param parentNodeName 父节点名称
     */
    public ExecuteTask(Execution execution, FlowProcess process, String parentNodeName) {
      this.engine = execution.getEngine();
      child = execution.createSubExecution(execution, process, parentNodeName);
    }

    public FlowOrder call() throws Exception {
      return engine.startInstanceByExecution(child);
    }
  }
}