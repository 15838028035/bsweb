package com.lj.app.bsweb.upm.flows.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowCcorder;
import com.lj.app.core.common.flows.service.FlowCcorderService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :FlowCcorderAction.java
 * @description :FlowCcorderAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flows")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "flowCcorderAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/flows/flowCcorder-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "flowCcorderAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/flows/flowCcorderList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("flowCcorderAction")
public class FlowCcorderAction extends AbstractBaseUpmAction<FlowCcorder> {
	
	 protected Logger logger = LoggerFactory.getLogger(FlowCcorderAction.class);

	@Autowired
	private FlowCcorderService flowCcorderService;
	
	private FlowCcorder flowCcorder;
	
	private java.lang.Integer id;
	
	public   BaseService getBaseService(){
		return flowCcorderService;
	}
	
	public FlowCcorder getModel() {
		return flowCcorder;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			flowCcorder = (FlowCcorder)flowCcorderService.getInfoByKey(id);
		} else {
			flowCcorder = new FlowCcorder();
		}
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			page.setFilters(flowCcorder);
			condition.put("createTimeBegin",  Struts2Utils.getParameter("createTimeBegin"));
			condition.put("createTimeEnd",  Struts2Utils.getParameter("createTimeEnd"));
			condition.put("finishTimeBegin",  Struts2Utils.getParameter("finishTimeBegin"));
			condition.put("finishTimeEnd",  Struts2Utils.getParameter("finishTimeEnd"));
			flowCcorderService.findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 更新状态为已读
	 * @return
	 */
	 public String ccread()throws Exception{
		 flowCcorderService.updateObject(flowCcorder);
		 return LIST;
	 }

	public FlowCcorderService getFlowCcorderService() {
		return flowCcorderService;
	}

	public void setFlowCcorderService(FlowCcorderService flowCcorderService) {
		this.flowCcorderService = flowCcorderService;
	}

	public FlowCcorder getFlowCcorder() {
		return flowCcorder;
	}

	public void setFlowCcorder(FlowCcorder flowCcorder) {
		this.flowCcorder = flowCcorder;
	}
	
}

