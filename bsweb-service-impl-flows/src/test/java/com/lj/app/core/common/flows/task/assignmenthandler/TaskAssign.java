package com.lj.app.core.common.flows.task.assignmenthandler;

import com.lj.app.core.common.flows.FlowAssignment;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.model.TaskModel;

/**
* 分配参与者的处理抽象类
*/
public class TaskAssign extends FlowAssignment {

  /**
   * 分配参与者方法，可获取到当前的执行对象
   * 
   * @param execution
   *          执行对象
   * @return Object 参与者对象
   */
  public Object assign(TaskModel model, Execution execution) {
    System.out.println(model);
    System.out.println(execution.getArgs());
    return "admin";
  }
}
