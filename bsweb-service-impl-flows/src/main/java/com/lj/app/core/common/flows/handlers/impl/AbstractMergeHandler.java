package com.lj.app.core.common.flows.handlers.impl;

import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.handlers.IHandler;

/**
 * 合并处理的抽象处理器 需要子类提供查询无法合并的task集合的参数map
 */
public abstract class AbstractMergeHandler implements IHandler {
	public void handle(Execution execution) {
		/**
		 * 查询当前流程实例的无法参与合并的node列表 若所有中间node都完成，则设置为已合并状态，告诉model可继续执行join的输出变迁
		 *//*
			 * FlowQueryService queryService =
			 * execution.getEngine().flowQueryService(); FlowOrder order =
			 * execution.getFlowOrder(); ProcessModel model =
			 * execution.getModel(); String[] activeNodes = findActiveNodes();
			 * boolean isSubProcessMerged = false; boolean isTaskMerged = false;
			 * if(model.containsNodeNames(SubProcessModel.class, activeNodes)) {
			 * FlowQueryFilter filter = new
			 * FlowQueryFilter().setParentId(order.getId()) .setExcludedIds(new
			 * String[]{execution.getChildOrderId()}); List<Order> orders =
			 * queryService.getActiveOrders(filter); //如果所有子流程都已完成，则表示可合并
			 * if(orders == null || orders.isEmpty()) { isSubProcessMerged =
			 * true; } } else { isSubProcessMerged = true; }
			 * if(isSubProcessMerged && model.containsNodeNames(TaskModel.class,
			 * activeNodes)) { FlowQueryFilter filter = new FlowQueryFilter().
			 * setOrderId(order.getId()). setExcludedIds(new
			 * String[]{execution.getTask().getId() }). setNames(activeNodes);
			 * List<FlowTask> tasks = queryService.getActiveTasks(filter);
			 * if(tasks == null || tasks.isEmpty()) { //如果所有task都已完成，则表示可合并
			 * isTaskMerged = true; } } execution.setMerged(isSubProcessMerged
			 * && isTaskMerged);
			 */
	}

	/**
	 * 子类需要提供如何查询未合并任务的参数map
	 * 
	 * @return
	 */
	protected abstract String[] findActiveNodes();
}