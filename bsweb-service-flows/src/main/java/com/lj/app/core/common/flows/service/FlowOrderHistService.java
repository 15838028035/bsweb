package com.lj.app.core.common.flows.service;

import com.lj.app.core.common.base.service.BaseService;

/**
 * @title :
 * @description :FlowOrderHistService
 * @author: zhangsan
 * @date: 2016-10-25 14:00:36
 */
public interface FlowOrderHistService<FlowOrderHist> extends BaseService {


	 public com.lj.app.core.common.flows.entity.FlowOrderHist getHistOrder(String orderId);

}
