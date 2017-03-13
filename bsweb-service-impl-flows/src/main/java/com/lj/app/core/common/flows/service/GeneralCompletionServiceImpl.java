package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.entity.FlowTaskHist;

@Service("flowCompletionService")
public class GeneralCompletionServiceImpl implements FlowCompletionService,Serializable{
	 private static final Log log = LogFactory.getLog(GeneralCompletionServiceImpl.class);
	 
	 
	/**
	 * 任务完成触发执行
	 * 
	 * @param task
	 *            任务对象
	 */
	public void complete(FlowTaskHist flowTaskHist){
		 log.debug("The task[{}] has been user[{}] has completed" +  flowTaskHist.getId() + "," +  flowTaskHist.getOperator());
	}

	/**
	 * 实例完成触发执行
	 * 
	 * @param order
	 *            实例对象
	 */
	public void complete(FlowOrderHist flowOrderHist){
		 log.debug("The order[{}] has completed"+ flowOrderHist.getId());
	}
}
