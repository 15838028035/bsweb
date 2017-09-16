package com.lj.app.bsweb.upm.flows.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowCcorder;
import com.lj.app.core.common.flows.service.FlowCcorderService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

@Controller
@Namespace("/jsp/flows")
@Results({
		@org.apache.struts2.convention.annotation.Result(name = "reload", location = "flowCcorderAction", type = "redirect"),
		@org.apache.struts2.convention.annotation.Result(name = "input", location = "/jsp/flows/flowCcorder-input.jsp"),
		@org.apache.struts2.convention.annotation.Result(name = "save", location = "flowCcorderAction!edit.action", type = "redirect"),
		@org.apache.struts2.convention.annotation.Result(name = "list", location = "/jsp/flows/flowCcorderList.jsp", type = "redirect") })
@Action("flowCcorderAction")
public class FlowCcorderAction extends AbstractBaseUpmAction<FlowCcorder> {
	protected Logger logger = LoggerFactory.getLogger(FlowCcorderAction.class);

	@Autowired
	private FlowCcorderService<FlowCcorder> flowCcorderService;
	private FlowCcorder flowCcorder;
	private Integer id;

	public BaseService getBaseService() {
		return this.flowCcorderService;
	}

	public FlowCcorder getModel() {
		return this.flowCcorder;
	}

	protected void prepareModel() throws Exception {
		if (this.id != null)
			this.flowCcorder = ((FlowCcorder) this.flowCcorderService.getInfoByKey(this.id));
		else
			this.flowCcorder = new FlowCcorder();
	}

	public String list() throws Exception {
		return null;
	}

	public String ccread() throws Exception {
		this.flowCcorderService.updateObject(this.flowCcorder);
		return "list";
	}

	public FlowCcorderService getFlowCcorderService() {
		return this.flowCcorderService;
	}

	public void setFlowCcorderService(FlowCcorderService flowCcorderService) {
		this.flowCcorderService = flowCcorderService;
	}

	public FlowCcorder getFlowCcorder() {
		return this.flowCcorder;
	}

	public void setFlowCcorder(FlowCcorder flowCcorder) {
		this.flowCcorder = flowCcorder;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}