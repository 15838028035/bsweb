package com.lj.app.core.common.flows.service;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.flows.FlowConstains;

@Service("flowCcorderService")
public class FlowCcorderServiceImpl<FlowCcorder> extends BaseServiceImpl<FlowCcorder> implements FlowCcorderService<FlowCcorder>{

	 /**
		* 创建实例的抄送
		*/
		public void createCCOrder(String orderId, String creator, String... actorIds) {
			for(String actorId : actorIds) {
				com.lj.app.core.common.flows.entity.FlowCcorder ccorder = new com.lj.app.core.common.flows.entity.FlowCcorder();
				ccorder.setOrderId(Integer.parseInt(orderId));
				ccorder.setActorId(actorId);
				ccorder.setCreator(creator);
				ccorder.setStatus(FlowConstains.STATE_ACTIVE);
				ccorder.setCreateTime(new Date());
				try{
				this.insertObject(ccorder);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
}
