package com.lj.app.core.common.flows.service;

import com.lj.app.core.common.flows.FlowInterceptor;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.util.StringUtil;

/**
 * 委托代理拦截器 负责查询wf_surrogate表获取委托代理人，并通过addTaskActor设置为参与者 这里是对新创建的任务通过添加参与者进行委托代理(即授权人、代理人都可处理任务)
 * 对于运行中且未处理的待办任务，可调用engine.task().addTaskActor方法 {@link ITaskService#addTaskActor(String, String...)}
 */
public class SurrogateInterceptor implements FlowInterceptor {
  
  /**
   * 拦截方法，参数为执行对象
   * 
   * @param execution
   *          执行对象。可从中获取执行的数据
   */
  public void intercept(Execution execution) {
    FlowEngine engine = execution.getEngine();
    for (FlowTask task : execution.getTasks()) {
      if (task.getActorIds() == null) {
        continue;
      }
      for (String actor : task.getActorIds()) {
        if (StringUtil.isBlank(actor)) {
          continue;
        }

        // TODO:实现
        /*
         * String agent = engine.manager().getSurrogate(actor, execution.getProcess().getName()); if
         * (StringUtil.isNotBlank(agent) && !actor.equals(agent)) {
         * engine.getFlowTaskServiceApi().addTaskActor(task.getId(), agent); }
         */
      }
    }
  }
}
