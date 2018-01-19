package com.lj.app.core.common.flows.service;

import com.lj.app.core.common.base.service.BaseService;

/**
 * 
 * 历史流程实例
 *
 * @param <FlowOrderHist> 历史流程实例
 */
public interface FlowOrderHistService<FlowOrderHist> extends BaseService {

  public com.lj.app.core.common.flows.entity.FlowOrderHist getHistOrder(String orderId);

}
