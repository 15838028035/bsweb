package com.lj.app.core.common.flows.service;

import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowTaskHist;

/**
 * 任务、实例完成时触发动作的接口
 */
public interface FlowCompletionService {
	/**
	 * 任务完成触发执行
	 * 
	 * @param task
	 *            任务对象
	 */
	public void complete(FlowTaskHist flowTaskHist);

	/**
	 * 实例完成触发执行
	 * 
	 * @param order
	 *            实例对象
	 */
	public void complete(FlowOrderHist flowOrderHist);
}
