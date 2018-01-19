package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * 
 * 历史流程实例
 *
 * @param <FlowOrderHist>
 *          历史流程实例
 */
@Service("flowOrderHistService")
public class FlowOrderHistServiceImpl<FlowOrderHist> extends BaseServiceImpl<FlowOrderHist>
    implements FlowOrderHistService<FlowOrderHist>, Serializable {

  @Override
  public com.lj.app.core.common.flows.entity.FlowOrderHist getHistOrder(String orderId) {
    com.lj.app.core.common.flows.entity.FlowOrderHist flowOrderHist = 
        (com.lj.app.core.common.flows.entity.FlowOrderHist) this.getInfoByKey(orderId);
        
    return flowOrderHist;
  }

}
