package com.lj.app.core.common.flows.model;

import java.util.ArrayList;
import java.util.List;

import com.lj.app.core.common.flows.AssignmentHandler;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.handlers.impl.MergeActorHandler;
import com.lj.app.core.common.util.Assert;
import com.lj.app.core.common.util.ClassUtil;
import com.lj.app.core.common.util.StringUtil;

/**
 * 任务定义task元素
 */
public class TaskModel extends WorkModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1775545243233990922L;
	/**
	 * 类型：普通任务
	 */
	public static final String PERFORMTYPE_ANY = "ANY";
	/**
	 * 类型：参与者fork任务
	 */
	public static final String PERFORMTYPE_ALL = "ALL";
	/**
	 * 类型：主办任务
	 */
	public static final String TASKTYPE_MAJOR = "Major";
	/**
	 * 类型：协办任务
	 */
	public static final String TASKTYPE_AIDANT = "Aidant";
	/**
	 * 参与类型
	 */
	public enum PerformType {
		ANY, ALL;
	}
	/**
	 * 任务类型(Major:主办的,Aidant:协助的,Record:仅仅作为记录的)
	 */
	public enum TaskType {
		Major, Aidant, Record;
	}
	/**
	 * 参与者变量名称
	 */
	private String assignee;
	/**
	 * 参与方式
	 * any：任何一个参与者处理完即执行下一步
	 * all：所有参与者都完成，才可执行下一步
	 */
	private String performType = PERFORMTYPE_ANY;
	/**
	 * 任务类型
	 * major：主办任务
	 * aidant：协办任务
	 */
	private String taskType = TASKTYPE_MAJOR;
	/**
	 * 期望完成时间
	 */
	private String expireTime;
	/**
	 * 提醒时间
	 */
	private String reminderTime;
	/**
	 * 提醒间隔(分钟)
	 */
	private String reminderRepeat;
	/**
	 * 是否自动执行
	 */
	private String autoExecute;
	/**
	 * 任务执行后回调类
	 */
	private String callback;
	/**
	 * 分配参与者处理类型
	 */
	private String assignmentHandler;
	/**
	 * 任务执行后回调对象
	 */
	//private JobCallback callbackObject;
	/**
	 * 分配参与者处理对象
	 */
	private AssignmentHandler assignmentHandlerObject;
    /**
     * 字段模型集合
     */
    private List<FieldModel> fields = null;

	protected void exec(Execution execution) {
		if(performType == null || performType.equalsIgnoreCase(PERFORMTYPE_ANY)) {
			/**
			 * any方式，直接执行输出变迁
			 */
			runOutTransition(execution);
		} else {
			/**
			 * all方式，需要判断是否已全部合并
			 * 由于all方式分配任务，是每人一个任务
			 * 那么此时需要判断之前分配的所有任务都执行完成后，才可执行下一步，否则不处理
			 */
			fire(new MergeActorHandler(getName()), execution);
			if(execution.isMerged()) runOutTransition(execution);
		}
	}
	
	public boolean isPerformAny() {
		return PERFORMTYPE_ANY.equalsIgnoreCase(this.performType);
	}
	
	public boolean isPerformAll() {
		return PERFORMTYPE_ALL.equalsIgnoreCase(this.performType);
	}
	
	public boolean isMajor() {
		return TASKTYPE_MAJOR.equalsIgnoreCase(this.taskType);
	}
	
	public String getAssignee() {
		return assignee;
	}
	
	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(String expireTime) {
		this.expireTime = expireTime;
	}

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = (StringUtil.isBlank(taskType) ? TASKTYPE_MAJOR : taskType);
	}

	public String getPerformType() {
		return performType;
	}

	public void setPerformType(String performType) {
		this.performType = (StringUtil.isBlank(performType) ? PERFORMTYPE_ANY : performType);
	}

	public String getReminderTime() {
		return reminderTime;
	}

	public void setReminderTime(String reminderTime) {
		this.reminderTime = reminderTime;
	}

	public String getReminderRepeat() {
		return reminderRepeat;
	}

	public void setReminderRepeat(String reminderRepeat) {
		this.reminderRepeat = reminderRepeat;
	}

	public String getAutoExecute() {
		return autoExecute;
	}

	public void setAutoExecute(String autoExecute) {
		this.autoExecute = autoExecute;
	}

	public AssignmentHandler getAssignmentHandlerObject() {
		return assignmentHandlerObject;
	}

	public void setAssignmentHandler(String assignmentHandlerStr) {
		if(StringUtil.isNotBlank(assignmentHandlerStr)) {
			this.assignmentHandler = assignmentHandlerStr;
			assignmentHandlerObject = (AssignmentHandler)ClassUtil.newInstance(assignmentHandlerStr);
			Assert.notNull(assignmentHandlerObject, "分配参与者处理类实例化失败");
		}
	}

	public String getAssignmentHandler() {
		return assignmentHandler;
	}

	public String getCallback() {
		return callback;
	}
	
/*	public JobCallback getCallbackObject() {
		return callbackObject;
	}

	public void setCallback(String callbackStr) {
		if(StringHelper.isNotEmpty(callbackStr)) {
			this.callback = callbackStr;
			callbackObject = (JobCallback)ClassUtil.newInstance(callbackStr);
			AssertHelper.notNull(callbackObject, "回调处理类实例化失败");
		}
	}*/

    public List<FieldModel> getFields() {
        return fields;
    }

    public void setFields(List<FieldModel> fields) {
        this.fields = fields;
    }

    /**
     * 获取后续任务模型集合（方便预处理）
     * @return 模型集合
     * @deprecated
     */
    public List<TaskModel> getNextTaskModels() {
        List<TaskModel> models = new ArrayList<TaskModel>();
        for(TransitionModel tm : this.getOutputs()) {
            addNextModels(models, tm, TaskModel.class);
        }
        return models;
    }
}
