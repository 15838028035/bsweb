
package com.lj.app.bsweb.upm.flows.web;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowApprove;
import com.lj.app.core.common.flows.entity.FlowCcorder;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.model.TaskModel;
import com.lj.app.core.common.flows.service.FlowApproveService;
import com.lj.app.core.common.flows.service.FlowCcorderService;
import com.lj.app.core.common.flows.service.FlowEngineFacetsService;
import com.lj.app.core.common.flows.service.FlowOrderService;
import com.lj.app.core.common.flows.service.FlowProcessService;
import com.lj.app.core.common.flows.service.FlowQueryService;
import com.lj.app.core.common.flows.service.FlowTaskService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :流程定义表
 * @description :FlowProcessAction
 * @author: liujie
 * @date: 2016-10-17 21:29:05
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flows")
@Results({ @Result(name = "flowAllStyle", location = "/jsp/flows/flowAllStyle%{flowAllStyle}.jsp"),
    @Result(name = "flowApproval", location = "/jsp/flows/flowApprove-input.jsp"),
    @Result(name = "approvalView", location = "/jsp/flows/flowApproval-view.jsp"),
    @Result(name = "flowApproveLogList", location = "/jsp/flows/flowApproveLogList.jsp"),
    @Result(name = "taskList", location = "/jsp/flows/flowTaskList.jsp", type = AbstractBaseAction.REDIRECT) })

@Action("flowControllerAction")
public class FlowControllerAction extends AbstractBaseUpmAction<FlowProcess> {

  protected Logger logger = LoggerFactory.getLogger(FlowProcessAction.class);

  private FlowProcess flowProcess;

  private java.lang.Integer id;

  public static final String PARA_PROCESSID = "processId";
  public static final String PARA_ORDERID = "orderId";
  public static final String PARA_TASKID = "taskId";
  public static final String PARA_TASKNAME = "taskName";
  public static final String PARA_METHOD = "method";
  public static final String PARA_NEXTOPERATOR = "nextOperator";
  public static final String PARA_NODENAME = "nodeName";
  public static final String PARA_CCOPERATOR = "ccOperator";

  @Autowired
  private FlowEngineFacetsService flowEngineFacetsService;

  @Autowired
  private FlowProcessService<FlowProcess> flowProcessService;

  @Autowired
  private FlowTaskService<FlowTask> flowTaskService;

  @Autowired
  private FlowOrderService<FlowOrder> flowOrderService;

  @Autowired
  private FlowCcorderService<FlowCcorder> flowCcorderService;

  @Autowired
  private FlowQueryService flowQueryService;

  private String processId;
  private String orderId;
  private String taskId;

  private FlowOrder flowOrder;
  private FlowTask flowTask;

  @Autowired
  private FlowApproveService<FlowApprove> flowApproveService;

  private FlowApprove flowApprove;

  private List<FlowApprove> flowApproveList;

  private String isAllowAddTaskActor = "false";// 是否允许配置任务参与者

  private String nextOperatorName;// 下一节点处理人

  private List<FlowApprove> flowApproveLogList;// 审批日志列表

  private String taskName;// 任务名称

  private String flowAllStyle;// 流程样式

  public BaseService getBaseService() {
    return flowEngineFacetsService.getEngine().flowProcessService();
  }

  public FlowProcess getModel() {
    return flowProcess;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (processId != null) {
      flowProcess = (FlowProcess) flowProcessService.getProcessById(processId);
    } else {
      flowProcess = new FlowProcess();
    }

    if (StringUtil.isNotBlank(orderId)) {
      flowOrder = flowQueryService.getFlowOrder(orderId);
    }
    if (StringUtil.isNotBlank(taskId)) {
      flowTask = flowQueryService.getFlowTask(taskId);
    }

  }

  /**
   * 通用的流程展现页面入口 将流程中的各环节表单以flowAllStyleA方式展现
   */
  public String flowAllStyle() throws Exception {

    if (StringUtil.isNotBlank(processId)) {
      flowProcess = flowProcessService.getProcessById(processId);
    }
    if (StringUtil.isNotBlank(orderId)) {
      flowOrder = (FlowOrder) flowOrderService.getInfoByKey(orderId);
    }
    if (StringUtil.isNotBlank(taskId)) {
      flowTask = (FlowTask) flowTaskService.getInfoByKey(taskId);
    }
    return "flowAllStyle";
  }

  /**
   * 流程解析
   * @return 任务列表
   * @throws Exception 异常
   */
  public String flowProcess() throws Exception {
    HttpServletRequest request = Struts2Utils.getRequest();
    Map<String, Object> params = new HashMap<String, Object>();
    Enumeration<String> paraNames = request.getParameterNames();

    while (paraNames.hasMoreElements()) {
      String element = paraNames.nextElement();
      int index = element.indexOf("_");
      String paraValue = Struts2Utils.getRequest().getParameter(element);
      if (index == -1) {
        params.put(element, paraValue);
      } else {
        char type = element.charAt(0);
        String name = element.substring(index + 1);
        Object value = null;
        switch (type) {
          case 'S':
            value = paraValue;
            break;
          case 'I':
            value = ConvertUtils.convert(paraValue, Integer.class);
            break;
          case 'L':
            value = ConvertUtils.convert(paraValue, Long.class);
            break;
          case 'B':
            value = ConvertUtils.convert(paraValue, Boolean.class);
            break;
          case 'D':
            value = ConvertUtils.convert(paraValue, Date.class);
            break;
          case 'N':
            value = ConvertUtils.convert(paraValue, Double.class);
            break;
          default:
            value = paraValue;
            break;
        }
        params.put(name, value);
      }
    }
    String processId = request.getParameter(PARA_PROCESSID);
    String orderId = request.getParameter(PARA_ORDERID);
    String taskId = request.getParameter(PARA_TASKID);
    String nextOperator = request.getParameter(PARA_NEXTOPERATOR);
    if (StringUtil.isBlank(orderId) && StringUtil.isBlank(taskId)) {
      flowEngineFacetsService.startAndExecute(processId, this.getUserName(), params);
    } else {
      String methodStr = request.getParameter(PARA_METHOD);
      int method;
      try {
        method = Integer.parseInt(methodStr);
      } catch (Exception e) {
        method = 0;
      }
      
      switch (method) {
        case 0:// 任务执行
          flowEngineFacetsService.execute(taskId, this.getUserName(), params);
          break;
        case -1:// 驳回、任意跳转
          flowEngineFacetsService.executeAndJump(taskId, getUserName(), params, request.getParameter(PARA_NODENAME));
          break;
        case 1:// 转办
          if (StringUtils.isNotEmpty(nextOperator)) {
            flowEngineFacetsService.transferMajor(taskId, this.getUserName(), nextOperator.split(","));
          }
          break;
        case 2:// 协办
          if (StringUtils.isNotEmpty(nextOperator)) {
            flowEngineFacetsService.transferAidant(taskId, this.getUserName(), nextOperator.split(","));
          }
          break;
        default:
          flowEngineFacetsService.execute(taskId, this.getUserName(), params);
          break;
      }
    }
    String ccOperator = request.getParameter(PARA_CCOPERATOR);
    if (StringUtils.isNotEmpty(ccOperator)) {
      flowCcorderService.createCcOrder(orderId, this.getUserName(), ccOperator.split(","));
    }
    return "taskList";
  }

  /**
   * 流程审批
   * 
   * @return 审批页面
   */
  public String flowApproval() throws Exception {

    taskName = URLDecoder.decode(taskName, "UTF-8");

    if (StringUtil.isNotBlank(taskId)) {
      return "flowApproval";
    } else {
      flowApproveList = flowQueryService.queryApprove(orderId, taskId);
      return "approvalView";
    }
  }

  /**
   * 任务审批
   * 
   * @return 任务列表
   * @throws Exception 异常
   */
  public String doApproval() throws Exception {
    flowApprove.setOperateTime(new Date());
    flowApprove.setOperator(this.getUserName());

    String optResult = flowApprove.getOptResult();// 审批结果
    String optContent = flowApprove.getOptContent();// 操作内容

    if (StringUtil.isNotBlank(optResult) && "1".equals(optResult) && StringUtil.isBlank(optContent)) {
      optContent = this.getUserName() + "转派给" + nextOperatorName;

      flowApprove.setOptContent(optContent);
    }

    flowApproveService.insertObject(flowApprove);

    Map<String, Object> params = new HashMap<String, Object>();
    params.put("result", flowApprove.getOptResult());

    HttpServletRequest request = Struts2Utils.getRequest();
    Enumeration<String> paraNames = request.getParameterNames();

    while (paraNames.hasMoreElements()) {
      String element = paraNames.nextElement();
      int index = element.indexOf("_");
      String paraValue = Struts2Utils.getRequest().getParameter(element);
      if (index == -1) {
        params.put(element, paraValue);
      } else {
        char type = element.charAt(0);
        String name = element.substring(index + 1);
        Object value = null;
        switch (type) {
          case 'S':
            value = paraValue;
            break;
          case 'I':
            value = ConvertUtils.convert(paraValue, Integer.class);
            break;
          case 'L':
            value = ConvertUtils.convert(paraValue, Long.class);
            break;
          case 'B':
            value = ConvertUtils.convert(paraValue, Boolean.class);
            break;
          case 'D':
            value = ConvertUtils.convert(paraValue, Date.class);
            break;
          case 'N':
            value = ConvertUtils.convert(paraValue, Double.class);
            break;
          default:
            value = paraValue;
            break;
        }
        params.put(name, value);
      }
    }
    String processId = request.getParameter(PARA_PROCESSID);
    String orderId = request.getParameter(PARA_ORDERID);
    String taskId = request.getParameter(PARA_TASKID);
    String nextOperator = request.getParameter(PARA_NEXTOPERATOR);
    if (StringUtil.isBlank(orderId) && StringUtil.isBlank(taskId)) {
      flowEngineFacetsService.startAndExecute(processId, this.getUserName(), params);
    } else {
      String methodStr = flowApprove.getOptResult();// 审批结果
      int method;
      try {
        method = Integer.parseInt(methodStr);
      } catch (Exception e) {
        method = 0;
      }
      switch (method) {
        case 0:// 任务执行
          flowEngineFacetsService.execute(taskId, getUserName(), params);
          break;
        case -1:// 驳回、任意跳转
          flowEngineFacetsService.executeAndJump(taskId, getUserName(), params, request.getParameter(PARA_NODENAME));
          break;
        case 1:// 转办
          if (StringUtils.isNotEmpty(nextOperator)) {
            flowEngineFacetsService.transferMajor(taskId, getUserName(), nextOperator.split(","));
          }
          break;
        case 2:// 协办
          if (StringUtils.isNotEmpty(nextOperator)) {
            flowEngineFacetsService.transferAidant(taskId, getUserName(), nextOperator.split(","));
          }
          break;
        default:
          flowEngineFacetsService.execute(taskId, getUserName(), params);
          break;
      }
    }
    String ccOperator = request.getParameter(PARA_CCOPERATOR);
    if (StringUtils.isNotEmpty(ccOperator)) {
      flowCcorderService.createCcOrder(orderId, this.getUserName(), ccOperator.split(","));
    }

    return "taskList";
  }

  /**
   * 流程审批信息
   */
  public String flowApproveInfoBootStrapList() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      condition.put("orderId", orderId);
      condition.put("taskId", taskId);

      if (StringUtil.isNotBlank(this.getSortName())) {
        String orderBy = PageTool.convert(this.getSortName()) + " " + this.getSortOrder();
        page.setSortColumns(orderBy);
      }

      if (StringUtils.isBlank(taskId)) {
        Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page), new String[0]);
        return null;
      }

      page = flowApproveService.findPageList(page, condition);
      Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page), new String[0]);
      return null;
    } catch (Exception e) {
      e.printStackTrace();
      throw e;
    }
  }

  /**
   * 查看审批日志
   * @return 审批日志页面
   * @throws Exception 异常
   */
  public String goToFlowApproveLogList() throws Exception {
    Map<String, Object> condition = new HashMap<String, Object>();
    condition.put("orderId", orderId);
    condition.put("taskId", taskId);

    if (StringUtil.isNotBlank(this.getSortName())) {
      String orderBy = PageTool.convert(this.getSortName()) + " " + this.getSortOrder();
      condition.put("sortColumns", orderBy);
    }

    if (StringUtil.isNotBlank(orderId)) {
      flowApproveLogList = flowApproveService.findBaseModeList(condition);
    }

    return "flowApproveLogList";
  }

  /**
   * 流程节点
   * @return json
   * @throws Exception 异常
   */
  public String flowNodeJson() throws Exception {
    FlowProcess process = flowProcessService.getProcessById(processId);
    List<TaskModel> models = process.getModel().getModels(TaskModel.class);
    List<TaskModel> viewModels = new ArrayList<TaskModel>();
    for (TaskModel model : models) {
      TaskModel viewModel = new TaskModel();
      viewModel.setName(model.getName());
      viewModel.setDisplayName(model.getDisplayName());
      viewModel.setForm(model.getForm());
      viewModels.add(viewModel);
    }

    Struts2Utils.renderJsonArray(viewModels);
    return null;
  }

  public void setFlowProcess(FlowProcess flowProcess) {
    this.flowProcess = flowProcess;
  }

  public void setId(java.lang.Integer id) {
    this.id = id;
  }

  public FlowProcess getFlowProcess() {
    return flowProcess;
  }

  public java.lang.Integer getId() {
    return id;
  }

  public FlowEngineFacetsService getFlowEngineFacetsService() {
    return flowEngineFacetsService;
  }

  public void setFlowEngineFacetsService(FlowEngineFacetsService flowEngineFacetsService) {
    this.flowEngineFacetsService = flowEngineFacetsService;
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

  public FlowOrder getFlowOrder() {
    return flowOrder;
  }

  public void setFlowOrder(FlowOrder flowOrder) {
    this.flowOrder = flowOrder;
  }

  public FlowTask getFlowTask() {
    return flowTask;
  }

  public void setFlowTask(FlowTask flowTask) {
    this.flowTask = flowTask;
  }

  public FlowProcessService<FlowProcess> getFlowProcessService() {
    return flowProcessService;
  }

  public void setFlowProcessService(FlowProcessService<FlowProcess> flowProcessService) {
    this.flowProcessService = flowProcessService;
  }

  public FlowTaskService<FlowTask> getFlowTaskService() {
    return flowTaskService;
  }

  public void setFlowTaskService(FlowTaskService<FlowTask> flowTaskService) {
    this.flowTaskService = flowTaskService;
  }

  public FlowOrderService<FlowOrder> getFlowOrderService() {
    return flowOrderService;
  }

  public void setFlowOrderService(FlowOrderService<FlowOrder> flowOrderService) {
    this.flowOrderService = flowOrderService;
  }

  public FlowQueryService getFlowQueryService() {
    return flowQueryService;
  }

  public void setFlowQueryService(FlowQueryService flowQueryService) {
    this.flowQueryService = flowQueryService;
  }

  public FlowApproveService<FlowApprove> getFlowApproveService() {
    return flowApproveService;
  }

  public void setFlowApproveService(FlowApproveService<FlowApprove> flowApproveService) {
    this.flowApproveService = flowApproveService;
  }

  public FlowApprove getFlowApprove() {
    return flowApprove;
  }

  public void setFlowApprove(FlowApprove flowApprove) {
    this.flowApprove = flowApprove;
  }

  public List<FlowApprove> getFlowApproveList() {
    return flowApproveList;
  }

  public void setFlowApproveList(List<FlowApprove> flowApproveList) {
    this.flowApproveList = flowApproveList;
  }

  public String getIsAllowAddTaskActor() {
    return isAllowAddTaskActor;
  }

  public void setIsAllowAddTaskActor(String isAllowAddTaskActor) {
    this.isAllowAddTaskActor = isAllowAddTaskActor;
  }

  public String getNextOperatorName() {
    return nextOperatorName;
  }

  public void setNextOperatorName(String nextOperatorName) {
    this.nextOperatorName = nextOperatorName;
  }

  public List<FlowApprove> getFlowApproveLogList() {
    return flowApproveLogList;
  }

  public void setFlowApproveLogList(List<FlowApprove> flowApproveLogList) {
    this.flowApproveLogList = flowApproveLogList;
  }

  public String getTaskName() {
    return taskName;
  }

  public void setTaskName(String taskName) {
    this.taskName = taskName;
  }

  public String getFlowAllStyle() {
    return flowAllStyle;
  }

  public void setFlowAllStyle(String flowAllStyle) {
    this.flowAllStyle = flowAllStyle;
  }
}
