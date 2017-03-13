package com.lj.app.core.common.flows;

import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.model.TaskModel;

/**
 * 分配参与者的处理抽象类
 */
public abstract class FlowAssignment implements AssignmentHandler {
    /**
     * 分配参与者方法，可获取到当前的任务模型、执行对象
     * @param model 任务模型
     * @param execution 执行对象
     * @return Object 参与者对象
     */
    public abstract Object assign(TaskModel model, Execution execution);

    public Object assign(Execution execution) {
        return assign(null, execution);
    }
}