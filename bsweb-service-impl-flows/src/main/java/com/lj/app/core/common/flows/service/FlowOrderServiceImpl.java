package com.lj.app.core.common.flows.service;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.flows.FlowConstains;
import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.JsonUtil;
import com.lj.app.core.common.util.StringUtil;

/**
 * @title :
 * @description :FlowOrderService
 * @author: liujie
 * @date: 2016-10-18 08:19:32
 */
@Service("flowOrderService")
public class FlowOrderServiceImpl<FlowOrder> extends BaseServiceImpl<FlowOrder> implements FlowOrderService<FlowOrder>,Serializable{
	@Autowired
	private FlowEngineFacetsServiceImpl flowEngineFacets;
	
	@Autowired
	private FlowOrderHistService flowOrderHistService;
	
	/**
	 *
	 * @param process
	 * @param operator
	 * @param args
	 * @param parentId
	 * @param parentNodeName
	 * @return
	 */
	public com.lj.app.core.common.flows.entity.FlowOrder createFlowOrder(FlowProcess process, String operator,Map<String, Object> args, String parentId, String parentNodeName)
	throws Exception{
		 com.lj.app.core.common.flows.entity.FlowOrder flowOrder = new  com.lj.app.core.common.flows.entity.FlowOrder();
		 
		 flowOrder.setFlowProcessId(process.getId().toString());
		 flowOrder.setParentId(parentId);
		 flowOrder.setParentNodeName(parentNodeName);
		 flowOrder.setVariable(JsonUtil.toJson(args));
		 flowOrder.setCreateByUname(operator);
		 flowOrder.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
		 
		 ProcessModel model = process.getModel();
		if(model != null && args != null) {
			if(StringUtil.isNotBlank(model.getExpireTime())) {
				Date expireTime = DateUtil.formatDate(model.getExpireTime(),"yyyy-MM-dd");
				flowOrder.setExpireTime(expireTime);
			}
            String orderNo = (String)args.get(FlowEngine.ID);
            if(StringUtil.isNotBlank(orderNo)) {
            	flowOrder.setOrderNo(orderNo);
            } else {
            	flowOrder.setOrderNo(model.getGenerator().generate(model));
            }
		}
	
		int retKey = this.insertObjectReturnKey(flowOrder);
		flowOrder = (com.lj.app.core.common.flows.entity.FlowOrder)this.getInfoByKey(retKey);
		
		FlowOrderHist history = new FlowOrderHist(flowOrder);
		history.setOrderState(FlowConstains.STATE_ACTIVE);
		flowOrderHistService.insertObject(history);
		 return flowOrder;
	}
	
	/**
	 * 流程实例数据会保存至活动实例表、历史实例表
	 */
	public void saveOrder(com.lj.app.core.common.flows.entity.FlowOrder flowOrder)  throws Exception{
		FlowOrderHist history = new FlowOrderHist(flowOrder);
		history.setOrderState(FlowConstains.STATE_ACTIVE);
		int retKey = this.insertObjectReturnKey(flowOrder);
		flowEngineFacets.getEngine().flowOrderHistService().insertObjectReturnKey(history);
	}
	
	/**
	 * 流程实例正常完成
	 * @param orderId 流程实例id
	 */
	public void complete(String orderId){
		FlowOrderHist history = flowEngineFacets.getEngine().flowOrderHistService().getHistOrder(orderId);
		history.setStatus(FlowConstains.STATE_FINISH);
		history.setEndTime(new Date());
		
		try{
			flowEngineFacets.getEngine().flowOrderHistService().updateObject(history);
		}catch(Exception e)  {
			e.printStackTrace();
		}
		this.delete(orderId);
		FlowCompletionService completion = flowEngineFacets.getEngine().flowCompletionService();
        if(completion != null) {
            completion.complete(history);
        }
	}
	
}
