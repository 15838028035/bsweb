package com.lj.app.bsweb.flows.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.flows.AbstractBaseFlowsAction;
import com.lj.app.bsweb.flows.entity.FlowExpenseTest;
import com.lj.app.bsweb.flows.service.FlowExpenseTestService;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :FlowExpenseTestAction.java
 * @description :FlowExpenseTestAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flowExpenseTest")
@Results({
    @Result(name = "flowExpenseTestView",
        location = "/jsp/flowExpenseTest/flowExpenseTestView.jsp"),
    @Result(name = "flowExpenseTestTable", 
        location = "/jsp/flowExpenseTest/flowExpenseTestAppTable.jsp"),
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "flowExpenseTestAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT,
        location = "/jsp/flowExpenseTest/flowExpenseTest-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE_RESULT,
        location = "flowExpenseTestAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST_RESULT, 
        location = "/jsp/flowExpenseTest/flowExpenseTestList.jsp", type = AbstractBaseAction.REDIRECT) 
    })
@Action("flowExpenseTestAction")
public class FlowExpenseTestAction extends AbstractBaseFlowsAction<FlowExpenseTest> {

  @Autowired
  private FlowExpenseTestService flowExpenseTestService;

  private FlowExpenseTest flowExpenseTest;
  private java.lang.Integer id;

  private String processId;
  private String orderId;
  private String taskId;
  private String taskName;

  private String operator;
  private String readonly = "0";// 当前节点1,非当前节点0

  private String isApplyWhere = "";// 条件查询

  public BaseService getBaseService() {
    return flowExpenseTestService;
  }

  public FlowExpenseTest getModel() {
    return flowExpenseTest;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (id != null) {
      flowExpenseTest = (FlowExpenseTest) flowExpenseTestService.getInfoByKey(id);
    } else {
      flowExpenseTest = new FlowExpenseTest();
    }
  }

  /**
   * 公共bootStrapList查询方法
   * 
   * @return json
   * @throws Exception 异常
   */
  public String bootStrapList() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      page.setFilters(getModel());
      condition.put("operatorTimeBegin", Struts2Utils.getParameter("operatorTimeBegin"));
      condition.put("operatorTimeEnd", Struts2Utils.getParameter("operatorTimeEnd"));
      condition.put("repayTimeBegin", Struts2Utils.getParameter("repayTimeBegin"));
      condition.put("repayTimeEnd", Struts2Utils.getParameter("repayTimeEnd"));

      if (StringUtil.isNotBlank(this.getSortName())) {
        String orderBy = PageTool.convert(this.getSortName()) + " " + this.getSortOrder();
        page.setSortColumns(orderBy);
      }
      if (StringUtil.isNotBlank(isApplyWhere)) {
        condition.put("conditionWhere", " and flow_order_id is null and  operator='" + this.getUserName() + "'");
      }
      page = getBaseService().findPageList(page, condition);
      Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page), new String[0]);
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

    try {
      if (operate != null && operate.equals("edit")) {
        flowExpenseTest.setUpdateBy(getLoginUserId());
        flowExpenseTest.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowExpenseTestService.updateObject(flowExpenseTest);

        returnMessage = UPDATE_SUCCESS;
      } else {
        flowExpenseTest.setCreateBy(getLoginUserId());
        flowExpenseTest.setOperator(this.getUserName());
        flowExpenseTest.setCreateByUname(this.getUserName());
        flowExpenseTest.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowExpenseTestService.insertObject(flowExpenseTest);
        returnMessage = CREATE_SUCCESS;
      }

      return LIST_RESULT;
    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      e.printStackTrace();
      throw e;
    }

  }

  /**
   * 保存数据
   * 
   * @return json
   * @throws Exception 异常
   */
  public String ajaxSave() throws Exception {

    try {
      if (flowExpenseTest.getId() != null && flowExpenseTest.getId() > 0) {
        flowExpenseTest.setUpdateBy(getLoginUserId());
        flowExpenseTest.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowExpenseTestService.updateObject(flowExpenseTest);
        returnMessage = UPDATE_SUCCESS;
      } else {
        flowExpenseTest.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowExpenseTest.setCreateBy(getLoginUserId());
        flowExpenseTest.setOperator(this.getUserName());
        flowExpenseTest.setOperatorTime(new Date());
        flowExpenseTest.setCreateByUname(this.getUserName());

        flowExpenseTestService.insertObject(flowExpenseTest);
        returnMessage = CREATE_SUCCESS;
      }

    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      e.printStackTrace();
      throw e;
    }

    AjaxResult ar = new AjaxResult();
    ar.setOpResult(returnMessage);
    Struts2Utils.renderJson(ar);
    return null;
  }

  /**
   * 申请保存
   * 
   * @return 页面
   * @throws Exception 异常
   */
  public String applySave() throws Exception {
    return LIST_RESULT;
  }

  /**
   * 批量借款申请测试
   * 
   */
  public String flowExpenseTestAppTable() {
    if (readonly != null && "1".equals(readonly)) {
      return "flowExpenseTestTable";
    } else {
      return "flowExpenseTestView";
    }
  }
  

  @Override
  public String delete() throws Exception {
    return null;
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

  public String getReadonly() {
    return readonly;
  }

  public void setReadonly(String readonly) {
    this.readonly = readonly;
  }

  public String getIsApplyWhere() {
    return isApplyWhere;
  }

  public void setIsApplyWhere(String isApplyWhere) {
    this.isApplyWhere = isApplyWhere;
  }

  public FlowExpenseTestService getFlowExpenseTestService() {
    return flowExpenseTestService;
  }

  public void setFlowExpenseTestService(FlowExpenseTestService flowExpenseTestService) {
    this.flowExpenseTestService = flowExpenseTestService;
  }

  public FlowExpenseTest getFlowExpenseTest() {
    return flowExpenseTest;
  }

  public void setFlowExpenseTest(FlowExpenseTest flowExpenseTest) {
    this.flowExpenseTest = flowExpenseTest;
  }

}
