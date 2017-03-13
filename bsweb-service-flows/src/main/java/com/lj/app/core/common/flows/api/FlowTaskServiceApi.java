package com.lj.app.core.common.flows.api;

import java.util.List;
import java.util.Map;

import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskHist;
import com.lj.app.core.common.flows.model.CustomModel;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.model.TaskModel;

/**
 * @title :流程任务表
 * @description :FlowTaskService
 * @author: liujie
 * @date: 2016-10-18 10:40:15
 */
public interface FlowTaskServiceApi{

	/**
	 * 完成指定的任务，删除活动任务记录，创建历史任务
	 * @param taskId 任务id
	 * @return Task 任务对象
	 */
	public FlowTask complete(String taskId) throws Exception ;
	
	/**
	 * 完成指定的任务，删除活动任务记录，创建历史任务
	 * @param taskId 任务id
	 * @param operator 操作人
	 * @return Task 任务对象
	 */
	public FlowTask complete(String taskId, String operator) throws Exception ;
	
	/**
	 * 根据任务主键ID，操作人ID完成任务
	 * @param taskId 任务id
	 * @param operator 操作人id
	 * @param args 参数集合
	 * @return Task 任务对象
	 */
	public FlowTask complete(String taskId, String operator, Map<String, Object> args) throws Exception ;

	/**
	 * 更新任务对象
	 * @param task 任务对象
	 */
	public void updateTask(FlowTask task);
	/**
	 * 根据执行对象、自定义节点模型创建历史任务记录
	 * @param execution 执行对象
	 * @param model 自定义节点模型
	 * @return 历史任务
	 */
	public FlowTaskHist history(Execution execution, CustomModel model) throws Exception ;
	
	/**
	 * 根据任务主键ID，操作人ID提取任务
	 * 提取任务相当于预受理操作，仅仅标识此任务只能由此操作人处理
	 * @param taskId 任务id
	 * @param operator 操作人id
	 * @return Task 任务对象
	 */
	public FlowTask take(String taskId, String operator) throws Exception;

    /**
     * 根据历史任务主键id，操作人唤醒历史任务
     * 该方法会导致流程状态不可控，请慎用
     * @param taskId 历史任务id
     * @param operator 操作人id
     * @return Task 唤醒后的任务对象
     */
    public FlowTask resume(String taskId, String operator)  throws Exception;
	
	/**
	 * 向指定的任务id添加参与者
	 * @param taskId 任务id
	 * @param actors 参与者
	 */
	public void addTaskActor(String taskId, String... actors) throws Exception;
	
	/**
	 * 向指定的任务id添加参与者
	 * @param taskId 任务id
	 * @param performType 参与类型
	 * @param actors 参与者
	 */
	public void addTaskActor(String taskId, Integer performType, String... actors) throws Exception;
	
	/**
	 * 对指定的任务id删除参与者
	 * @param taskId 任务id
	 * @param actors 参与者
	 */
	public void removeTaskActor(String taskId, String... actors) throws Exception;
	
	/**
	 * 根据任务主键id、操作人撤回任务
	 * @param taskId 任务id
	 * @param operator 操作人
	 * @return Task 任务对象
	 */
	public FlowTask withdrawTask(String taskId, String operator) throws Exception;
	
	/**
	 * 根据当前任务对象驳回至上一步处理
	 * @param model 流程定义模型，用以获取上一步模型对象
	 * @param currentTask 当前任务对象
	 * @return Task 任务对象
	 */
	public FlowTask rejectTask(ProcessModel model, FlowTask currentTask) throws Exception;
	
	/**
	 * 根据taskId、operator，判断操作人operator是否允许执行任务
	 * @param task 任务对象
	 * @param operator 操作人
	 * @return boolean 是否允许操作
	 */
	public boolean isAllowed(FlowTask task, String operator) throws Exception;
	
	/**
	 * 根据任务模型、执行对象创建新的任务
	 * @param taskModel 任务模型
	 * @param execution 执行对象
	 * @return List<Task> 创建任务集合
	 */
	public List<FlowTask> createTask(TaskModel taskModel, Execution execution) throws Exception;
	
	/**
	 * 根据已有任务id、任务类型、参与者创建新的任务
	 * @param taskId 主办任务id
	 * @param taskType 任务类型
	 * @param actors 参与者集合
	 * @return List<Task> 创建任务集合
	 */
	public List<FlowTask> createNewTask(String taskId, int taskType, String... actors) throws Exception;

    /**
     * 根据任务id获取任务模型
     * @param taskId 任务id
     * @return
     */
	public TaskModel getTaskModel(String taskId) throws Exception;
	
	/**
	 * 获得下一个流程
	 * @param parentTaskId
	 * @return
	 * @throws Exception
	 */
	public List<FlowTask> getNextActiveTasks(Integer parentTaskId) throws Exception;
	
	/**
	 * 从历史表获得下一个流程
	 * @param parentTaskId
	 * @return
	 * @throws 
	 * */
	public List<FlowTask> getNextActiveTasks(Integer orderId, String taskName, Integer parentTaskId) throws Exception;
}
