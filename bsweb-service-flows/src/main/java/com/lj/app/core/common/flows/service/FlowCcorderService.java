package com.lj.app.core.common.flows.service;

import com.lj.app.core.common.base.service.BaseService;

/**
 * 
 * 流程抄送
 *
 * @param <FlowCcorder> 流程抄送
 */
public interface FlowCcorderService<FlowCcorder> extends BaseService {

  /**
   * 创建实例的抄送
   * 
   * @param orderId
   *          orderId
   * @param creator
   *          创建人
   * @param actorIds
   *          参与人
   */
  public void createCcOrder(String orderId, String creator, String... actorIds);
}
