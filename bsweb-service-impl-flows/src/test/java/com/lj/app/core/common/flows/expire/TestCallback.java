package com.lj.app.core.common.flows.expire;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.scheduling.JobCallback;

/**
 * 回调测试
 */
public class TestCallback implements JobCallback {
	private static final Log log = LogFactory.getLog(TestCallback.class);

	public void callback(String taskId, List<FlowTask> newTasks) {
		log.info("callback taskId=" + taskId);
		log.info("newTasks=" + newTasks);
	}
}