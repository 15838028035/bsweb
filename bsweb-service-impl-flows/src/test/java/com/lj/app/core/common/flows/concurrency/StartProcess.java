package com.lj.app.core.common.flows.concurrency;

import java.util.HashMap;
import java.util.Map;

import com.lj.app.core.common.flows.service.FlowEngine;

/**
 *自定义类
 *
 */
public class StartProcess implements Runnable {
  private FlowEngine engine;
  private String processId;

  public StartProcess(FlowEngine engine, String processId) {
    this.engine = engine;
    this.processId = processId;
  }

  /**
   * 运行
   */
  public void run() {
    Map<String, Object> args = new HashMap<String, Object>();
    args.put("task1.operator", new String[] { "1" });
    try {
      engine.startInstanceById(processId, "2", args);// simple流程
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
