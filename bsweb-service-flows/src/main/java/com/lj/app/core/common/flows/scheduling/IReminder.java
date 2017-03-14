package com.lj.app.core.common.flows.scheduling;

import java.util.Map;

import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.model.NodeModel;

/**
 * 提醒接口
 * 
 */
public interface IReminder {
	/**
	 * 提醒操作
	 * 
	 * @param process
	 *            流程定义对象
	 * @param orderId
	 *            流程实例id
	 * @param taskId
	 *            任务id
	 * @param nodeModel
	 *            节点模型
	 * @param data
	 *            数据
	 */
	public void remind(FlowProcess process, String orderId, String taskId, NodeModel nodeModel, Map<String, Object> data);
}