package com.lj.app.core.common.flows.service;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.flows.FlowInterceptor;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.core.ServiceContext;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.model.TaskModel;
import com.lj.app.core.common.flows.scheduling.IScheduler;
import com.lj.app.core.common.flows.scheduling.JobEntity;
import com.lj.app.core.common.flows.scheduling.JobEntity.JobType;

/**
 * 时限控制拦截器 主要拦截任务的expireDate(期望完成时间) 再交给具体的调度器完成调度处理
 * 
 */
public class SchedulerInterceptor implements FlowInterceptor {
	private static final Log log = LogFactory.getLog(SchedulerInterceptor.class);
	/**
	 * 调度器接口
	 */
	private IScheduler scheduler;
	/**
	 * 是否调度
	 */
	private boolean isScheduled = true;

	/**
	 * 时限控制拦截方法
	 */
	public void intercept(Execution execution) {
		if (!isScheduled)
			return;
		for (FlowTask task : execution.getTasks()) {
			String id = execution.getProcess().getId() + "-" + execution.getFlowOrder().getId() + "-" + task.getId();
			Date expireDate = task.getExpireDate();
			if (expireDate != null) {
				schedule(id, task, expireDate, JobType.EXECUTER.ordinal(), execution.getArgs());
			}
			Date remindDate = task.getRemindDate();
			if (remindDate != null) {
				schedule(id, task, remindDate, JobType.REMINDER.ordinal(), execution.getArgs());
			}
		}
	}

	public void schedule(String id, FlowTask task, Date startDate, int jobType, Map<String, Object> args) {
		try {
			JobEntity entity = new JobEntity(id, task, startDate, args);
			entity.setModelName(task.getTaskName());
			entity.setJobType(jobType);
			if (jobType == JobType.REMINDER.ordinal()) {
				TaskModel model = (TaskModel) task.getModel();
				if (model != null && NumberUtils.isNumber(model.getReminderRepeat())) {
					entity.setPeriod(Integer.parseInt(model.getReminderRepeat()));
				}
			}
			schedule(entity);
		} catch (Exception e) {
			log.error(e.getMessage());
			log.info("scheduler failed.task is:" + task);
		}
	}

	private void schedule(JobEntity entity) {
		if (scheduler == null) {
			scheduler = ServiceContext.getContext().find(IScheduler.class);
		}
		if (scheduler != null) {
			scheduler.schedule(entity);
		} else {
			isScheduled = false;
		}
	}
}
