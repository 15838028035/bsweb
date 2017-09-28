package com.lj.app.bsweb.upm.flows.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowBorrowTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.service.FlowBorrowTestService;
import com.lj.app.core.common.flows.service.FlowEngineFacetsService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :FlowBorrowTestAction.java
 * @description :FlowBorrowTestAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flowBorrowTest")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "flowBorrowTestAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/flowBorrowTest/flowBorrowTest-input.jsp"),
		@Result(name ="flowBorrowTestApply", location = "/jsp/flowBorrowTest/flowBorrowTestApply.jsp"),
		@Result(name ="flowBorrowTestView", location = "/jsp/flowBorrowTest/flowBorrowTestView.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "flowBorrowTestAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/flowBorrowTest/flowBorrowTestList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("flowBorrowTestAction")
public class FlowBorrowTestAction extends AbstractBaseUpmAction<FlowBorrowTest> {
	
	 protected Logger logger = LoggerFactory.getLogger(FlowBorrowTestAction.class);

	@Autowired
	private FlowBorrowTestService<FlowBorrowTest> flowBorrowTestService;
	
	private FlowBorrowTest flowBorrowTest;
	private java.lang.Integer id;
	
	private  String processId;
	private String orderId;
	private String taskId;
	private String taskName;
	
	private String operator;
	
	@Autowired
    private FlowEngineFacetsService flowEngineFacetsService;
	
	public   BaseService getBaseService(){
		return flowBorrowTestService;
	}
	
	public FlowBorrowTest getModel() {
		return flowBorrowTest;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			flowBorrowTest = (FlowBorrowTest)flowBorrowTestService.getInfoByKey(id);
		} else {
			flowBorrowTest = new FlowBorrowTest();
		}
	}
	
	/**
	 * 公共bootStrapList查询方法
	 * @return
	 * @throws Exception
	 */
	public String bootStrapList() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			page.setFilters(getModel());
			condition.put("operatorTimeBegin",  Struts2Utils.getParameter("operatorTimeBegin"));
			condition.put("operatorTimeEnd",  Struts2Utils.getParameter("operatorTimeEnd"));
			condition.put("repayTimeBegin",  Struts2Utils.getParameter("repayTimeBegin"));
			condition.put("repayTimeEnd",  Struts2Utils.getParameter("repayTimeEnd"));
			
			if (StringUtil.isNotBlank(this.getSortName())) {
				String orderBy = PageTool.convert(this.getSortName()) + " "+ this.getSortOrder();
				page.setSortColumns(orderBy);
			}
			
			page = getBaseService().findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public String input() throws Exception {
		return INPUT;
	}
	
	@Override
	public String save() throws Exception {
		
	try{
			if (operate != null && operate.equals("edit")) {
				flowBorrowTest.setUpdateBy(getLoginUserId());
				flowBorrowTest.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				flowBorrowTestService.updateObject(flowBorrowTest);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				flowBorrowTest.setCreateBy(getLoginUserId());
				flowBorrowTest.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				flowBorrowTestService.insertObject(flowBorrowTest);
				returnMessage = CREATE_SUCCESS;
			}
			
			return LIST;
		}catch(Exception e){
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}
		
	}
	
	/**
	 * 申请测试
	 * @return
	 */
	public String apply() {
		if(StringUtil.isBlank(orderId) && StringUtil.isBlank(taskId)) {
			return "flowBorrowTestApply";
		} else {
			Map<String,String> querMap = new HashMap<String,String>();
			querMap.put("flowOrderId", orderId);
			querMap.put("flowTaskId", taskId);
			
			List list = flowBorrowTestService.queryForList(querMap);
			if(list!=null && list.size()>0){
			flowBorrowTest =(FlowBorrowTest) list.get(0);
			}
			
			return "flowBorrowTestView";
		}
	}
	
	/**
	 * 申请保存
	 * @return
	 * @throws Exception
	 */
	public String applySave() throws  Exception {
		 /** 流程数据构造开始 */
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("apply.operator", this.getUserName());
        /** 流程数据构造结束 */

        /**
         * 启动流程并且执行申请任务
         */
        if (StringUtil.isBlank(orderId) && StringUtil.isBlank(taskId)) {
        	FlowOrder FlowOrder = flowEngineFacetsService.startAndExecute(processId, this.getUserName(), params);
            /** 业务数据处理开始*/
        	flowBorrowTest.setFlowOrderId(FlowOrder.getId());
        	flowBorrowTest.setOperatorTime(new Date());
        	flowBorrowTest.setOperator(this.getUserName());
            
            flowBorrowTestService.insertObject(flowBorrowTest);
        } else {
        	flowEngineFacetsService.execute(taskId, this.getUserName(), params);
            /** 业务数据处理开始*/
        	flowBorrowTest.setOperator(this.getUserName());
        	flowBorrowTestService.insertObject(flowBorrowTest);
        }
		return LIST;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public FlowBorrowTestService<FlowBorrowTest> getFlowBorrowTestService() {
		return flowBorrowTestService;
	}

	public void setFlowBorrowTestService(FlowBorrowTestService<FlowBorrowTest> flowBorrowTestService) {
		this.flowBorrowTestService = flowBorrowTestService;
	}

	public FlowBorrowTest getFlowBorrowTest() {
		return flowBorrowTest;
	}

	public void setFlowBorrowTest(FlowBorrowTest flowBorrowTest) {
		this.flowBorrowTest = flowBorrowTest;
	}

	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public String getProcessId() {
		return processId;
	}

	public void setProcessId(String processId) {
		this.processId = processId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public FlowEngineFacetsService getFlowEngineFacetsService() {
		return flowEngineFacetsService;
	}

	public void setFlowEngineFacetsService(FlowEngineFacetsService flowEngineFacetsService) {
		this.flowEngineFacetsService = flowEngineFacetsService;
	}
	
}

