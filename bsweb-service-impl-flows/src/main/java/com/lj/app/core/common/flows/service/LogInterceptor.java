package com.lj.app.core.common.flows.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.flows.FlowInterceptor;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.entity.FlowTask;

/**
 * 日志拦截器
 * 
 */
public class LogInterceptor implements FlowInterceptor {
  private  final Log log = LogFactory.getLog(LogInterceptor.class);

  /**
   * 拦截产生的任务对象，打印日志
   */
  public void intercept(Execution execution) {
    if (log.isInfoEnabled()) {
      for (FlowTask task : execution.getTasks()) {
        StringBuffer buffer = new StringBuffer(100);
        buffer.append("创建任务[标识=").append(task.getId());
        buffer.append(",名称=").append(task.getDisplayName());
        buffer.append(",创建时间=").append(task.getCreateTime());
        buffer.append(",参与者={");
        if (task.getActorIds() != null) {
          for (String actor : task.getActorIds()) {
            buffer.append(actor).append(";");
          }
        }
        buffer.append("}]");
        log.info(buffer.toString());
      }
    }
  }
}