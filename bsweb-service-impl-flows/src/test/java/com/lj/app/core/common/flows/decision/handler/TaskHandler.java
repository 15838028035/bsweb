package com.lj.app.core.common.flows.decision.handler;

import com.lj.app.core.common.flows.DecisionHandler;
import com.lj.app.core.common.flows.core.Execution;

/**
 * 决策处理器接口
 */
public class TaskHandler implements DecisionHandler {

  public String decide(Execution execution) {
    return (String) execution.getArgs().get("content");
  }

}
