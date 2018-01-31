package com.lj.app.bsweb.upm.flows.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.api.FlowTaskServiceApi;
import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskActor;
import com.lj.app.core.common.flows.service.FlowEngineFacetsService;
import com.lj.app.core.common.flows.service.FlowTaskActorService;
import com.lj.app.core.common.flows.service.FlowTaskService;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :流程任务表
 * @description :FlowTaskAction
 * @author: liujie
 * @date: 2016-10-18 10:40:15
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flows")
@Results({ 
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "flowTaskAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT,
      location = "/jsp/flows/flowTask-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE_RESULT, 
      location = "flowTaskAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST_RESULT, 
      location = "/jsp/flows/flowTaskList.jsp", type = AbstractBaseAction.REDIRECT),
    @Result(name = "ADD_TASK_ACTOR",
      location = "/jsp/flows/flowTaskActor-Input.jsp", type = AbstractBaseAction.REDIRECT) 
    })

@Action("flowTaskAction")
public class FlowTaskAction extends AbstractBaseUpmAction<FlowTask> {

  protected Logger logger = LoggerFactory.getLogger(FlowTaskAction.class);

  @Autowired
  private FlowTaskService<FlowTask> flowTaskService;

  private FlowTask flowTask;

  private java.lang.Integer id;

  @Autowired
  private FlowEngineFacetsService flowEngineFacetsService;

  @Autowired
  private FlowTaskServiceApi flowTaskServiceApi;

  @Autowired
  private FlowTaskActorService<FlowTaskActor> flowTaskActorService;

  private String orderId;
  private String taskId;
  private String taskName;
  private String operator;

  public BaseService<FlowTask> getBaseService() {
    return flowTaskService;
  }

  public FlowTask getModel() {
    return flowTask;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (id != null) {
      flowTask = (FlowTask) flowTaskService.getInfoByKey(id);
    } else {
      flowTask = new FlowTask();
    }
  }

  /**
   * 公共bootStrapList查询方法
   * 
   * @return json
   * @throws Exception 异常
   */
  @Override
  public String bootStrapList() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      page.setFilters(getModel());

      if (StringUtil.isNotBlank(this.getSortName())) {
        String orderBy = PageTool.convert(this.getSortName()) + " " + this.getSortOrder();
        page.setSortColumns(orderBy);
      }
      if (StringUtil.isNotBlank(this.conditionWhere)) {
        condition.put("conditionWhere", " and a. actor_id in ('" + this.getUserName() + "')" + this.conditionWhere);
      } else {
        condition.put("conditionWhere", " and a. actor_id in ('" + this.getUserName() + "')");
      }

      page = getBaseService().findPageList(page, condition, "homePage");
      Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page), new String[0]);
      return null;
    } catch (Exception e) {
      logger.error(e.getMessage(),null);
      throw e;
    }
  }

  /**
   * 所有运行中的流程
   * 
   * @return json
   * @throws Exception 异常
   */
  public String flowTaskRuntimeList() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      page.setFilters(getModel());

      if (StringUtil.isNotBlank(this.getSortName())) {
        String orderBy = PageTool.convert(this.getSortName()) + " " + this.getSortOrder();
        page.setSortColumns(orderBy);
      }

      page = getBaseService().findPageList(page, condition, "homePage");
      Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page), new String[0]);
      return null;
    } catch (Exception e) {
      logger.error(e.getMessage());
      throw e;
    }
  }

  /**
   * 添加任务执行者
   * 
   * @return json
   * @throws Exception 异常
   */
  public String addTaskActor() throws Exception {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("flowOrderId", orderId);
    List<FlowTask> tasks = flowTaskService.queryForList(map);
    for (FlowTask task : tasks) {
      if (task.getTaskName().equalsIgnoreCase(taskName) && StringUtil.isNotBlank(operator)) {
        flowTaskServiceApi.addTaskActor(task.getId().toString(), operator);
      }
    }
    Struts2Utils.renderJson("success");
    return null;
  }

  /**
   * 任务添加提示
   * 
   * @return json
   */
  public String addTaskActorJsonTip() {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("flowOrderId", orderId);

    List<FlowTask> tasks = flowTaskService.queryForList(map);

    StringBuilder builder = new StringBuilder();
    String createTime = "";
    for (FlowTask task : tasks) {
      if (task.getTaskName().equalsIgnoreCase(taskName)) {
        List<FlowTaskActor> actors = flowTaskActorService.getTaskActorsByTaskId(task.getId().toString());
        for (FlowTaskActor actor : actors) {
          builder.append(actor.getActorId()).append(",");
        }
        createTime = DateUtil.formatDate(task.getCreateTime());
      }
    }
    if (builder.length() > 0) {
      builder.deleteCharAt(builder.length() - 1);
    }
    Map<String, String> data = new HashMap<String, String>();
    data.put("actors", builder.toString());
    data.put("createTime", createTime);

    Struts2Utils.renderJson(data);
    return null;
  }
  
  /*
   * public String activeTaskList(Model model, Page<WorkItem> page, Integer taskType) { List<String> list =
   * ShiroUtils.getGroups(); list.add(ShiroUtils.getUsername()); log.info(list.toString()); String[] assignees = new
   * String[list.size()]; list.toArray(assignees); facets.getEngine().query().getWorkItems(page, new
   * QueryFilter().setOperators(assignees).setTaskType(taskType)); model.addAttribute("page", page);
   * model.addAttribute("taskType", taskType); return "snaker/activeTaskMore"; return null; }
   */

  /**
   * 活动任务查询列表
   * 
   * @param model 模型
   * @return 活动任务查询列表
   */
  public String activeCcList(Model model, Page<FlowOrderHist> page) {
    /*
     * List<String> list = ShiroUtils.getGroups(); list.add(ShiroUtils.getUsername()); log.info(list.toString());
     * String[] assignees = new String[list.size()]; list.toArray(assignees); facets.getEngine() .query()
     * .getCCWorks(page, new QueryFilter() .setOperators(assignees) .setState(1)); model.addAttribute("page", page);
     * return "snaker/activeCCMore";
     */
    return null;
  }

  /**
   * 测试任务的执行
   * 
   * @return 页面
   */
  public String activeTaskExec() throws Exception {
    flowEngineFacetsService.execute(taskId, this.getUserName(), null);
    return LIST_RESULT;
  }

  /**
   * 活动任务的驳回
   * 
   * @return 列表
   */
  public String activeTaskReject() throws Exception {
    flowEngineFacetsService.executeAndJump(taskId, this.getUserName(), null, null);
    return LIST_RESULT;
  }

  /**
   * 历史任务撤回
   * 
   * @return json
   */
  public String historyTaskUndo() {
    String returnMessage = "";
    try {
      flowTaskServiceApi.withdrawTask(taskId, this.getUserName());
      returnMessage = "任务撤回成功";
    } catch (Exception e) {
      returnMessage = e.getMessage();
    }
    Struts2Utils.renderText(returnMessage);
    return null;
  }

  public void setFlowTask(FlowTask flowTask) {
    this.flowTask = flowTask;
  }

  public void setId(java.lang.Integer id) {
    this.id = id;
  }

  public FlowTaskService<FlowTask> getFlowTaskService() {
    return flowTaskService;
  }

  public void setFlowTaskService(FlowTaskService<FlowTask> flowTaskService) {
    this.flowTaskService = flowTaskService;
  }

  public String getOrderId() {
    return orderId;
  }

  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }

  public FlowTask getFlowTask() {
    return flowTask;
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

}
