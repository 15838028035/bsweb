package com.lj.app.bsweb.upm.flows.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.service.FlowEngineFacetsService;
import com.lj.app.core.common.flows.service.FlowOrderService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :
 * @description :FlowOrderAction
 * @author: liujie
 * @date: 2016-10-18 08:19:32
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flows")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "flowOrderAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/flows/flowOrder-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "flowOrderAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/flows/flowOrderList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("flowOrderAction")
public class FlowOrderAction extends AbstractBaseUpmAction<FlowOrder> {
	
	 protected Logger logger = LoggerFactory.getLogger(FlowOrderAction.class);
	
	 @Autowired
	private FlowEngineFacetsService flowEngineFacetsService;
	 
	 @Autowired
	 private FlowOrderService flowOrderService;
	 
	private FlowOrder flowOrder;
	
	private java.lang.Integer id;
	
	public   BaseService<FlowOrder> getBaseService(){
		return flowOrderService;
	}
	
	public FlowOrder getModel() {
		return flowOrder;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			flowOrder = (FlowOrder)flowOrderService.getInfoByKey(id);
		} else {
			flowOrder = new FlowOrder();
		}
	}
	
	public void setFlowOrder(FlowOrder flowOrder){
		this.flowOrder = flowOrder;
	}
	
	public void setId(java.lang.Integer id){
		this.id =  id;
	}
	
	public FlowOrder getFlowOrder(){
		return flowOrder;
	}
	
	public java.lang.Integer  getId(){
		return id;
	}
}

