package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * @title :
 * @description :FlowOrderHistService
 * @author: zhangsan
 * @date: 2016-10-25 14:00:36
 */
@Service("flowOrderHistService")
public class FlowOrderHistServiceImpl<FlowOrderHist> extends BaseServiceImpl<FlowOrderHist> implements FlowOrderHistService<FlowOrderHist>,Serializable{

	@Override
	public com.lj.app.core.common.flows.entity.FlowOrderHist getHistOrder(String orderId) {
		com.lj.app.core.common.flows.entity.FlowOrderHist flowOrderHist =  (com.lj.app.core.common.flows.entity.FlowOrderHist) this.getInfoByKey(orderId);
		if(flowOrderHist==null){
			flowOrderHist = new com.lj.app.core.common.flows.entity.FlowOrderHist();
			flowOrderHist.setId(Integer.parseInt(orderId));
		}
		
		return flowOrderHist;
	}

}
