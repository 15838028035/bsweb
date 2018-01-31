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
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowUpmUser;
import com.lj.app.core.common.flows.service.FlowEngineFacetsService;
import com.lj.app.core.common.flows.service.FlowUpmUserService;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :FlowUpmUserAction.java
 * @description :FlowUpmUserAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flowUpmUser")
@Results({
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "flowUpmUserAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT, 
        location = "/jsp/flowUpmUser/flowUpmUser-input.jsp"),
    @Result(name = "flowUpmUserApply", 
        location = "/jsp/flowUpmUser/flowUpmUserApply.jsp"),
    @Result(name = "flowUpmUserApplyView",
        location = "/jsp/flowUpmUser/flowUpmUserApplyView.jsp"),
    @Result(name = AbstractBaseAction.SAVE_RESULT, 
        location = "flowUpmUserAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST_RESULT,
        location = "/jsp/flowUpmUser/flowUpmUserList.jsp", type = AbstractBaseAction.REDIRECT)
    })

@Action("flowUpmUserAction")
public class FlowUpmUserAction extends AbstractBaseUpmAction<FlowUpmUser> {

  protected Logger logger = LoggerFactory.getLogger(FlowUpmUserAction.class);

  @Autowired
  private FlowUpmUserService flowUpmUserService;

  private FlowUpmUser flowUpmUser;

  private java.lang.Integer id;

  private String processId;
  private String orderId;
  private String taskId;
  private String taskName;

  private String operator;
  private String readonly = "0";// 当前节点1,非当前节点0

  private String isApplyWhere = "";// 条件查询

  @Autowired
  private FlowEngineFacetsService flowEngineFacetsService;

  public BaseService getBaseService() {
    return flowUpmUserService;
  }

  public FlowUpmUser getModel() {
    return flowUpmUser;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (id != null) {
      flowUpmUser = (FlowUpmUser) flowUpmUserService.getInfoByKey(id);
    } else {
      flowUpmUser = new FlowUpmUser();
    }
  }

  @Override
  public String input() throws Exception {
    return INPUT;
  }

  /**
   * 保存数据
   * 
   * @return 页面
   * @throws Exception 异常
   */
  public String ajaxSave() throws Exception {

    try {
      if (flowUpmUser.getId() != null && flowUpmUser.getId() > 0) {
        flowUpmUser.setUpdateBy(getLoginUserId());
        flowUpmUser.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowUpmUserService.updateObject(flowUpmUser);
        returnMessage = UPDATE_SUCCESS;
      } else {
        flowUpmUser.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowUpmUser.setCreateBy(getLoginUserId());
        flowUpmUser.setOperator(this.getUserName());
        flowUpmUser.setOperatorTime(new Date());
        flowUpmUser.setCreateByUname(this.getUserName());

        flowUpmUserService.insertObject(flowUpmUser);
        returnMessage = CREATE_SUCCESS;
      }

    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      logger.error(e.getMessage());
      throw e;
    }

    AjaxResult ar = new AjaxResult();
    ar.setOpResult(returnMessage);
    Struts2Utils.renderJson(ar);
    return null;
  }

  /**
   * 申请测试
   * 
   * @return 页面
   */
  public String apply() {
    if ((StringUtil.isBlank(orderId) && StringUtil.isBlank(taskId)) || (readonly != null && "1".equals(readonly))) {
      if (StringUtil.isNotBlank(orderId)) { // 查询流程申请数据
        Map<String, String> querMap = new HashMap<String, String>();
        querMap.put("flowOrderId", orderId);
        List list = flowUpmUserService.queryForList(querMap);
        if (list != null && list.size() > 0) {
          flowUpmUser = (FlowUpmUser) list.get(0);
        }
        operate = "edit";
      }

      return "flowUpmUserApply";
    } else {
      Map<String, String> querMap = new HashMap<String, String>();
      querMap.put("flowOrderId", orderId);
      querMap.put("flowTaskId", taskId);

      List list = flowUpmUserService.queryForList(querMap);
      if (list != null && list.size() > 0) {
        flowUpmUser = (FlowUpmUser) list.get(0);
      }

      return "flowUpmUserApplyView";
    }
  }

  /**
   * 申请保存
   * 
   * @return 页面
   * @throws Exception 异常
   */
  public String applySave() throws Exception {
    /** 流程数据构造开始 */
    Map<String, Object> params = new HashMap<String, Object>();
    params.put("apply.operator", this.getUserName());
    /** 流程数据构造结束 */

    /**
     * 启动流程并且执行申请任务
     */
    if (StringUtil.isBlank(orderId) && StringUtil.isBlank(taskId)) {
      FlowOrder flowOrder = flowEngineFacetsService.startAndExecute(processId, this.getUserName(), params);
      /** 业务数据处理开始 */
      flowUpmUser.setFlowOrderId(flowOrder.getId());
      flowUpmUser.setOperatorTime(new Date());
      flowUpmUser.setOperator(this.getUserName());

      flowUpmUserService.insertObject(flowUpmUser);
    } else {
      flowEngineFacetsService.execute(taskId, this.getUserName(), params);
      /** 业务数据处理开始 */
      flowUpmUser.setOperator(this.getUserName());

      if (operate != null && operate.equals("edit")) {
        flowUpmUser.setUpdateBy(getLoginUserId());
        flowUpmUser.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowUpmUserService.updateObject(flowUpmUser);

        returnMessage = UPDATE_SUCCESS;
      } else {
        flowUpmUser.setCreateBy(getLoginUserId());
        flowUpmUser.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        flowUpmUserService.insertObject(flowUpmUser);
        returnMessage = CREATE_SUCCESS;
      }
    }

    return LIST_RESULT;
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

  public FlowEngineFacetsService getFlowEngineFacetsService() {
    return flowEngineFacetsService;
  }

  public void setFlowEngineFacetsService(FlowEngineFacetsService flowEngineFacetsService) {
    this.flowEngineFacetsService = flowEngineFacetsService;
  }

  public String getIsApplyWhere() {
    return isApplyWhere;
  }

  public void setIsApplyWhere(String isApplyWhere) {
    this.isApplyWhere = isApplyWhere;
  }

  public FlowUpmUserService getFlowUpmUserService() {
    return flowUpmUserService;
  }

  public void setFlowUpmUserService(FlowUpmUserService flowUpmUserService) {
    this.flowUpmUserService = flowUpmUserService;
  }

  public FlowUpmUser getFlowUpmUser() {
    return flowUpmUser;
  }

  public void setFlowUpmUser(FlowUpmUser flowUpmUser) {
    this.flowUpmUser = flowUpmUser;
  }

}
