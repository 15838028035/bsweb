package com.lj.app.bsweb.upm.flows.web;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowLeaveTest;
import com.lj.app.core.common.flows.service.FlowEngineFacetsService;
import com.lj.app.core.common.flows.service.FlowLeaveTestService;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :
 * @description :FlowLeaveTestAction
 * @author: liujie
 * @date: 2016-11-04 18:26:32
 * 
 *  * 请假流程Controller
 * 流程特点:多级审批流程、decision节点的表达式写法->${day > 2 ? 'transition5' : 'transition4'}
 * 业务数据:
 *     所有节点的业务数据均以json格式保存在order、task表的variable字段中
 *     建议业务数据以独立的表保存，通过orderId来关联
 *     
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flowLeaveTest")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "flowLeaveTestAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/flowLeaveTest/flowLeaveTest-input.jsp"),
		@Result(name ="flowLeaveTestApply", location = "/jsp/flowLeaveTest/flowLeaveTestApply.jsp"),
		@Result(name ="flowLeaveTestApplyView", location = "/jsp/flowLeaveTest/flowLeaveTestApplyView.jsp"),
		@Result(name ="flowLeaveTestApproveDeptApp", location = "/jsp/flowLeaveTest/flowLeaveTestApproveDeptApp.jsp"),
		@Result(name ="flowLeaveTestApproveDeptView", location = "/jsp/flowLeaveTest/flowLeaveTestApproveDeptView.jsp"),
		@Result(name ="flowLeaveTestBossApp", location = "/jsp/flowLeaveTest/flowLeaveTestBossApp.jsp"),
		@Result(name ="flowLeaveTestBossAppView", location = "/jsp/flowLeaveTest/flowLeaveTestBossAppView.jsp"),
		
		@Result(name = AbstractBaseAction.SAVE, location = "flowLeaveTestAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/flowLeaveTest/flowLeaveTestList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("flowLeaveTestAction")
public class FlowLeaveTestAction extends AbstractBaseUpmAction<FlowLeaveTest> {
	
	 protected Logger logger = LoggerFactory.getLogger(FlowLeaveTestAction.class);

	@Autowired
	private FlowLeaveTestService<FlowLeaveTest> flowLeaveTestService;
	
	private FlowLeaveTest flowLeaveTest;
	
	private java.lang.Integer id;
	
	private  String processId;
	private String orderId;
	private String taskId;
	private String taskName;
	
	private String operator;
	
	@Autowired
    private FlowEngineFacetsService flowEngineFacetsService;
	
	private Map<String, Object> flowData;
	 
	
	public   BaseService<FlowLeaveTest> getBaseService(){
		return flowLeaveTestService;
	}
	
	public FlowLeaveTest getModel() {
		return flowLeaveTest;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			flowLeaveTest = (FlowLeaveTest)flowLeaveTestService.getInfoByKey(id);
		} else {
			flowLeaveTest = new FlowLeaveTest();
		}
	}

	/**
	 * 请假申请路由方法
	 */
	public String apply() {
		//设置操作人为当前登录用户，请假流程演示时，将申请人、部门经理审批人、总经理审批人都设置为当前用户
		//可通过修改申请页面的部门经理、总经理输入框来改变下一步的处理人
		operator = this.getUserName();
		//根据taskId是否为空来标识当前请求的页面是否为活动任务的节点页面
		if(StringUtil.isBlank(orderId) &&  StringUtil.isBlank(taskId)) {
			//如果实例id为空或者驳回情况下，返回apply.jsp
			return "flowLeaveTestApply";
		} else {
			//如果orderId非空、taskId为空，则表示申请步骤已提交，此时可获取申请数据
			//由于请假流程中的业务数据，是保存在任务表的variable字段中，所以通过flowData方法获取
			//如果业务数据保存在业务表中，需要业务表的orderId字段来关联流程，进而根据orderId查询出业务数据
			flowData=flowEngineFacetsService.flowData(orderId, taskName);
			//返回申请的查看页面
			return "flowLeaveTestApplyView";
		}
	}
	
	/**
	 * 部门经理审批路由方法
	 */
	public String approveDept() {
		if(StringUtil.isNotBlank(taskId)) {
			return "flowLeaveTestApproveDeptApp";
		} else {
			flowData=flowEngineFacetsService.flowData(orderId, taskName);
			return "flowLeaveTestApproveDeptView";
		}
	}
	
	/**
	 * 总经理审批路由方法
	 */
	public String approveBoss() {
		if(StringUtil.isNotBlank(taskId)) {
			return "flowLeaveTestBossApp";
		} else {
			flowData=flowEngineFacetsService.flowData(orderId, taskName);
			return "flowLeaveTestBossAppView";
		}
	}
	
	public void setFlowLeaveTestService(FlowLeaveTestService flowLeaveTestService){
		this.flowLeaveTestService = flowLeaveTestService;
	}
	
	public void setFlowLeaveTest(FlowLeaveTest flowLeaveTest){
		this.flowLeaveTest = flowLeaveTest;
	}
	
	public void setId(java.lang.Integer id){
		this.id =  id;
	}
	
	
	public FlowLeaveTestService getFlowLeaveTestService(){
		return flowLeaveTestService;
	}
	
	public FlowLeaveTest getFlowLeaveTest(){
		return flowLeaveTest;
	}
	
	public java.lang.Integer  getId(){
		return id;
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

	public Map<String, Object> getFlowData() {
		return flowData;
	}

	public void setFlowData(Map<String, Object> flowData) {
		this.flowData = flowData;
	}
	
	
}

