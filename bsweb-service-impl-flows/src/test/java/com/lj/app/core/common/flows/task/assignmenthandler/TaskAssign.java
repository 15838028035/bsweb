package com.lj.app.core.common.flows.task.assignmenthandler;

import com.lj.app.core.common.flows.FlowAssignment;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.model.TaskModel;

public class TaskAssign extends FlowAssignment {
	
	public Object assign(TaskModel model, Execution execution) {
		System.out.println(model);
		System.out.println(execution.getArgs());
		return "admin";
	}
}
