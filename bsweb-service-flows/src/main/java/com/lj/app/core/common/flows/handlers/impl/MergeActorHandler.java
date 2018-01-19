package com.lj.app.core.common.flows.handlers.impl;

/**
 * actor all方式的合并处理器
 */
public class MergeActorHandler extends AbstractMergeHandler {
  /**
   * 调用者需要提供actor all的任务名称
   */
  private String taskName;

  /**
   * 构造函数，由调用者提供taskName
   * 
   * @param taskName 任务名称
   */
  public MergeActorHandler(String taskName) {
    this.taskName = taskName;
  }

  /**
   * actor all方式，查询参数为：orderId、taskName
   * 
   * @see org.snaker.engine.handlers.impl.AbstractMergeHandler#findActiveNodes()
   */
  protected String[] findActiveNodes() {
    return new String[] { taskName };
  }
}