package com.lj.app.core.common.flows.service;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.flows.FlowConstains;
import com.lj.app.core.common.flows.api.FlowTaskServiceApi;
import com.lj.app.core.common.flows.entity.FlowCcorder;
import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskActor;
import com.lj.app.core.common.flows.entity.FlowTaskActorHist;
import com.lj.app.core.common.flows.entity.FlowTaskHist;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.util.Assert;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.JsonUtil;
import com.lj.app.core.common.util.StringUtil;

/**
 * 
 * 流程实例
 * 
 * @param <FlowOrder>
 *          流程实例
 */
@Service("flowOrderService")
public class FlowOrderServiceImpl<FlowOrder> extends BaseServiceImpl<FlowOrder>
    implements FlowOrderService<FlowOrder>, Serializable {
  @Autowired
  private FlowEngineFacetsServiceImpl flowEngineFacets;

  @Autowired
  private FlowOrderHistService flowOrderHistService;
  /**
   * 任务业务类
   */
  @Autowired
  protected FlowTaskService<FlowTask> flowTaskService;

  @Autowired
  private FlowTaskServiceApi flowTaskServiceApi;

  @Autowired
  private FlowCompletionService flowCompletionService;

  @Autowired
  private FlowTaskActorService<FlowTaskActor> flowTaskActorService;

  @Autowired
  private FlowTaskHistService<FlowTaskHist> flowTaskHistService;

  @Autowired
  private FlowCcorderService<FlowCcorder> flowCcorderService;

  @Autowired
  private FlowTaskActorHistService<FlowTaskActorHist> flowTaskActorHistService;

  /**
   *
   * @param process
   *          流程定义
   * @param operator
   *          操作人
   * @param args
   *          流程变量
   * @param parentId
   *          父Id
   * @param parentNodeName
   *          父节点名称
   * @return 流程实例
   */
  public com.lj.app.core.common.flows.entity.FlowOrder createFlowOrder(FlowProcess process, String operator,
      Map<String, Object> args, String parentId, String parentNodeName) throws Exception {
    com.lj.app.core.common.flows.entity.FlowOrder flowOrder = new com.lj.app.core.common.flows.entity.FlowOrder();

    flowOrder.setFlowProcessId(process.getId().toString());
    flowOrder.setParentId(parentId);
    flowOrder.setParentNodeName(parentNodeName);
    flowOrder.setVariable(JsonUtil.toJson(args));
    flowOrder.setCreateByUname(operator);
    flowOrder.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());

    ProcessModel model = process.getModel();
    if (model != null && args != null) {
      if (StringUtil.isNotBlank(model.getExpireTime())) {
        Date expireTime = DateUtil.formatDate(model.getExpireTime(), "yyyy-MM-dd");
        flowOrder.setExpireTime(expireTime);
      }
      String orderNo = (String) args.get(FlowEngine.ID);
      if (StringUtil.isNotBlank(orderNo)) {
        flowOrder.setOrderNo(orderNo);
      } else {
        flowOrder.setOrderNo(model.getGenerator().generate(model));
      }
    }

    int retKey = this.insertObjectReturnKey(flowOrder);
    flowOrder = (com.lj.app.core.common.flows.entity.FlowOrder) this.getInfoByKey(retKey);

    FlowOrderHist history = new FlowOrderHist(flowOrder);
    history.setOrderState(FlowConstains.STATE_ACTIVE);
    flowOrderHistService.insertObject(history);
    return flowOrder;
  }

  /**
   * 流程实例数据会保存至活动实例表、历史实例表
   */
  public void saveOrder(com.lj.app.core.common.flows.entity.FlowOrder flowOrder) throws Exception {
    FlowOrderHist history = new FlowOrderHist(flowOrder);
    history.setOrderState(FlowConstains.STATE_ACTIVE);
    int retKey = this.insertObjectReturnKey(flowOrder);
    flowEngineFacets.getEngine().flowOrderHistService().insertObjectReturnKey(history);
  }

  /**
   * 流程实例正常完成
   * 
   * @param orderId
   *          流程实例id
   */
  public void complete(String orderId) {
    FlowOrderHist history = flowEngineFacets.getEngine().flowOrderHistService().getHistOrder(orderId);
    history.setStatus(FlowConstains.STATE_FINISH);
    history.setEndTime(new Date());

    try {
      flowEngineFacets.getEngine().flowOrderHistService().updateObject(history);
    } catch (Exception e) {
      log.error(e);
    }
    this.delete(orderId);
    FlowCompletionService completion = flowEngineFacets.getEngine().flowCompletionService();
    if (completion != null) {
      completion.complete(history);
    }
  }

  /**
   * 向活动实例临时添加全局变量数据
   * 
   * @param orderId
   *          实例id
   * @param args
   *          变量数据
   */
  public void addVariable(String orderId, Map<String, Object> args) throws Exception {
    com.lj.app.core.common.flows.entity.FlowOrder flowOrder = (com.lj.app.core.common.flows.entity.FlowOrder) this
        .getInfoByKey(orderId);
    Map<String, Object> data = flowOrder.getVariableMap();
    data.putAll(args);
    flowOrder.setVariable(JsonUtil.toJson(data));
    this.updateObject(flowOrder);
  }

  /**
   * 强制中止流程实例
   */
  public void terminate(String orderId) throws Exception {
    terminate(orderId, null);
  }

  /**
   * 强制中止活动实例,并强制完成活动任务
   */
  public void terminate(String orderId, String operator) throws Exception {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("flowOrderId", orderId);

    List<FlowTask> tasks = flowTaskService.queryForList(map);
    for (FlowTask task : tasks) {
      flowTaskServiceApi.complete(String.valueOf(task.getId()), operator);
    }
    com.lj.app.core.common.flows.entity.FlowOrder flowOrder = (com.lj.app.core.common.flows.entity.FlowOrder) this
        .getInfoByKey(orderId);

    FlowOrderHist flowOrderHist = new FlowOrderHist(flowOrder);
    flowOrderHist.setOrderState(FlowConstains.STATE_TERMINATION);
    flowOrderHist.setEndTime(new Date());

    flowOrderHistService.updateObject(flowOrderHist);
    this.delete(orderId);
    flowCompletionService.complete(flowOrderHist);
  }

  /**
   * 级联删除指定流程实例的所有数据： 1.flow_order,flow_order_hist 2.flow_task,flow_task_hist 3.flow_task_actor,flow_task_actor_actor
   * 4.flow_ccOrder
   * 
   * @param orderId
   *          实例id
   */
  public void cascadeRemove(String orderId) {
    FlowOrderHist flowOrderHist = (FlowOrderHist) flowOrderHistService.getInfoByKey(orderId);
    Assert.notNull(flowOrderHist, "流程历史实例不能为空");

    Map<String, Object> map = new HashMap<String, Object>();
    map.put("flowOrderId", orderId);
    List<FlowTask> activeTasks = flowTaskService.queryForList(map);

    FlowTaskHist flowTaskHist = new FlowTaskHist();
    flowTaskHist.setFlowOrderId(Integer.valueOf(orderId));
    List<FlowTaskHist> historyTasks = flowTaskHistService.queryForList(flowTaskHist);

    for (FlowTask task : activeTasks) {
      flowTaskActorService.deleteFlowTaskActorByTaskId(String.valueOf(task.getId()));
      flowTaskService.delete(task.getId());
    }
    for (FlowTaskHist historyTask : historyTasks) {
      // TODO:删除历史任务参者
      flowTaskActorHistService.delete("deleteTaskActorByTaskId", historyTask.getId());
      flowTaskHistService.delete(historyTask.getId());
    }

    Map<String, Object> ccOrdersMap = new HashMap<String, Object>();
    ccOrdersMap.put("flowOrderId", orderId);
    List<FlowCcorder> ccOrders = flowCcorderService.queryForList(ccOrdersMap);
    for (FlowCcorder ccOrder : ccOrders) {
      flowCcorderService.delete(ccOrder.getId());
    }

    com.lj.app.core.common.flows.entity.FlowOrder flowOrder = (com.lj.app.core.common.flows.entity.FlowOrder) this
        .getInfoByKey(orderId);
    flowOrderHistService.delete(flowOrderHist.getId());
    this.delete(flowOrder.getId());
  }
}
