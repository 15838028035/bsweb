package com.lj.app.core.common.flows.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.AssignmentHandler;
import com.lj.app.core.common.flows.FlowAssignment;
import com.lj.app.core.common.flows.FlowConstains;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskActor;
import com.lj.app.core.common.flows.entity.FlowTaskHist;
import com.lj.app.core.common.flows.model.CustomModel;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.model.TaskModel;
import com.lj.app.core.common.flows.model.TaskModel.PerformType;
import com.lj.app.core.common.flows.model.TaskModel.TaskType;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.flows.service.FlowEngineFacetsServiceImpl;
import com.lj.app.core.common.util.Assert;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.JsonUtil;
import com.lj.app.core.common.util.StringUtil;

/**
 * @title :流程任务表
 * @description :FlowTaskService
 * @author: liujie
 * @date: 2016-10-18 10:40:15
 */
@Service("flowTaskServiceApi")
public class FlowTaskServiceApiImpl implements FlowTaskServiceApi{

	private static final String START = "start";
	
	@Autowired
	private FlowEngineFacetsServiceImpl flowEngineFacets;
	
	/**
	 * 完成指定任务
	 */
	public FlowTask complete(String taskId) throws Exception {
		return complete(taskId, null, null);
	}

	/**
	 * 完成指定任务
	 */
	public FlowTask complete(String taskId, String operator) throws Exception {
		return complete(taskId, operator, null);
	}
	
	/**
	 * 完成指定任务
	 * 该方法仅仅结束活动任务，并不能驱动流程继续执行
	 * @see SnakerEngineImpl#executeTask(String, String, java.util.Map)
	 */
	public FlowTask complete(String taskId, String operator, Map<String, Object> args) throws Exception {
		FlowTask task = (FlowTask)flowEngineFacets.getEngine().flowTaskService().getInfoByKey(taskId);
		
		Assert.notNull(task, "指定的任务[id=" + taskId + "]不存在");
		task.setVariable(JsonUtil.toJson(args));
		if(!isAllowed(task, operator)) {
			throw new FlowException("当前参与者[" + operator + "]不允许执行任务[taskId=" + taskId + "]");
		}
		FlowTaskHist flowTaskHist = new FlowTaskHist(task);
		flowTaskHist.setFinishTime(new Date());
		flowTaskHist.setStatus(FlowConstains.STATE_FINISH);
		flowTaskHist.setOperator(operator);
		if(flowTaskHist.getActorIds() == null) {
			List<FlowTaskActor> actors =flowEngineFacets.getEngine().flowTaskActorService().getTaskActorsByTaskId(taskId);
			String[] actorIds = new String[actors.size()];
			for(int i = 0; i < actors.size(); i++) {
				actorIds[i] = actors.get(i).getActorId();
			}
			flowTaskHist.setActorIds(actorIds);
		}
		flowEngineFacets.getEngine().FlowTaskHistService().insertObject(flowTaskHist);
		flowEngineFacets.getEngine().flowTaskService().delete(task.getId());
		flowEngineFacets.getEngine().flowCompletionService().complete(flowTaskHist);
		return task;
	}

	/**
	 * 更新任务对象的finish_Time、operator、expire_Time、version、variable
	 * @param task 任务对象
	 */
	public void updateTask(FlowTask task) {
		
	}

	/**
	 * 任务历史记录方法
	 * @param execution 执行对象
	 * @param model 自定义节点模型
	 * @return 历史任务对象
	 */
	public FlowTaskHist history(Execution execution, CustomModel model) throws Exception {
		FlowTaskHist historyTask = new FlowTaskHist();
		historyTask.setFlowOrderId(execution.getFlowOrder().getId());
		historyTask.setCreateTime(new Date());
		historyTask.setFinishTime(new Date());
		historyTask.setDisplayName(model.getDisplayName());
		historyTask.setTaskName(model.getName());
		historyTask.setStatus(FlowConstains.STATE_FINISH);
		historyTask.setTaskType(TaskType.Record.ordinal());
		java.lang.Integer parentTaskId = execution.getTask() == null ?
				null : execution.getTask().getId();
		historyTask.setParentTaskId(parentTaskId);
		historyTask.setVariable(JsonUtil.toJson(execution.getArgs()));
		flowEngineFacets.getEngine().flowTaskService().insertObject(historyTask);
		return historyTask;
		
	}
	
	/**
	 * 提取指定任务，设置完成时间及操作人，状态不改变
	 */
	public FlowTask take(String taskId, String operator) throws Exception {
		FlowTask task = (FlowTask)flowEngineFacets.getEngine().flowTaskService().getInfoByKey(taskId);
		Assert.notNull(task, "指定的任务[id=" + taskId + "]不存在");
		if(!isAllowed(task, operator)) {
			throw new FlowException("当前参与者[" + operator + "]不允许提取任务[taskId=" + taskId + "]");
		}
		task.setOperator(operator);
		task.setFinishTime(new Date());
		flowEngineFacets.getEngine().flowTaskService().updateObject(task);
		return task;
	}

    /**
     * 唤醒指定的历史任务
     */
    public FlowTask resume(String taskId, String operator) throws Exception {
        FlowTaskHist flowTaskHist =(FlowTaskHist)flowEngineFacets.getEngine().FlowTaskHistService().getInfoByKey(taskId);
        Assert.notNull(flowTaskHist, "指定的历史任务[id=" + taskId + "]不存在");
        boolean isAllowed = true;
        if(StringUtil.isNotBlank(flowTaskHist.getOperator())) {
            isAllowed = flowTaskHist.getOperator().equals(operator);
        }
        if(isAllowed) {
            FlowTask task = flowTaskHist.undoTask();
            task.setCreateTime(new Date());
            flowEngineFacets.getEngine().flowTaskService().insertObject(task);
            assignTask(String.valueOf(task.getId()), task.getOperator());
            return task;
        } else {
            throw new FlowException("当前参与者[" + operator + "]不允许唤醒历史任务[taskId=" + taskId + "]");
        }
    }
	
	/**
	 * 向指定任务添加参与者
	 */
	public void addTaskActor(String taskId, String... actors) throws Exception{
		addTaskActor(taskId, null, actors);
	}
	
	/**
	 * 向指定任务添加参与者
	 * 该方法根据performType类型判断是否需要创建新的活动任务
	 */
	public void addTaskActor(String taskId, Integer performType, String... actors) throws Exception{
		FlowTask flowTask = (FlowTask)flowEngineFacets.getEngine().flowTaskService().getInfoByKey(taskId);
		Assert.notNull(flowTask, "指定的任务[id=" + taskId + "]不存在");
		if(!flowTask.isMajor()) return;
		if(performType == null) performType = flowTask.getPerformType();
		if(performType == null) performType = 0;
		switch(performType) {
		case 0:
			assignTask(flowTask.getId().toString(), actors);
			Map<String, Object> data = flowTask.getVariableMap();
			String oldActor = (String)data.get(flowTask.KEY_ACTOR);
			data.put(flowTask.KEY_ACTOR, oldActor + "," + StringUtil.getStringByArray(actors));
			flowTask.setVariable(JsonUtil.toJson(data));
			flowEngineFacets.getEngine().flowTaskService().updateObject(flowTask);
			break;
		case 1:
			try {
				for(String actor : actors) {
					FlowTask newTask = (FlowTask)flowTask.clone();
					newTask.setCreateTime(new Date());
					newTask.setOperator(actor);
					Map<String, Object> taskData = flowTask.getVariableMap();
					taskData.put(flowTask.KEY_ACTOR, actor);
					flowTask.setVariable(JsonUtil.toJson(taskData));
					int newTaskid = flowEngineFacets.getEngine().flowTaskService().insertObjectReturnKey(newTask);
					assignTask(String.valueOf(newTaskid), actor);
				}
			} catch(CloneNotSupportedException ex) {
				throw new FlowException("任务对象不支持复制", ex.getCause());
			}
			break;
		default :
			break;
		}
	}
	
	/**
	 * 向指定任务移除参与者
	 */
	public void removeTaskActor(String taskId, String... actors)  throws Exception{
		FlowTask flowTask = (FlowTask)flowEngineFacets.getEngine().flowTaskService().getInfoByKey(taskId);
		Assert.notNull(flowTask, "指定的任务[id=" + taskId + "]不存在");
		if(actors == null || actors.length == 0) return;
		if(flowTask.isMajor()) {
			flowEngineFacets.getEngine().flowTaskActorService().removeTaskActor(String.valueOf(flowTask.getId()), actors);
			Map<String, Object> taskData = flowTask.getVariableMap();
			String actorStr = (String)taskData.get(FlowTask.KEY_ACTOR);
			if(StringUtil.isNotBlank(actorStr)) {
				String[] actorArray = actorStr.split(",");
				StringBuilder newActor = new StringBuilder(actorStr.length());
				boolean isMatch;
				for(String actor : actorArray) {
					isMatch = false;
					if(StringUtil.isBlank(actor)) continue;
					for(String removeActor : actors) {
						if(actor.equals(removeActor)) {
							isMatch = true;
							break;
						}
					}
					if(isMatch) continue;
					newActor.append(actor).append(",");
				}
				newActor.deleteCharAt(newActor.length() - 1);
				taskData.put(FlowTask.KEY_ACTOR, newActor.toString());
				flowTask.setVariable(JsonUtil.toJson(taskData));
				flowEngineFacets.getEngine().flowTaskService().updateObject(flowTask);
			}
		}
	}
	
	/**
	 * 撤回指定的任务
	 */
	public FlowTask withdrawTask(String taskId, String operator) throws Exception{
		FlowTaskHist hist = (FlowTaskHist)flowEngineFacets.getEngine().FlowTaskHistService().getInfoByKey(taskId);
		Assert.notNull(hist, "指定的历史任务[id=" + taskId + "]不存在");
		List<FlowTask> tasks;
		if(hist.isPerformAny()) {
			tasks = getNextActiveTasks(hist.getId());
		} else {
			tasks = getNextActiveTasks(hist.getFlowOrderId(),  hist.getTaskName(), hist.getParentTaskId());
		}
		if(tasks == null || tasks.isEmpty()) {
			throw new FlowException("后续活动任务已完成或不存在，无法撤回.");
		}
		for(FlowTask task : tasks) {
			flowEngineFacets.getEngine().flowTaskService().delete(task.getId().toString());
		}
		
		FlowTask task = hist.undoTask();
		task.setCreateTime(new Date());
		int id = flowEngineFacets.getEngine().flowTaskService().insertObjectReturnKey(task);
		assignTask(String.valueOf(id), task.getOperator());
		return task;
	}
	
	/**
	 * 驳回任务
	 */
	public FlowTask rejectTask(ProcessModel model, FlowTask currentTask) throws Exception{
		String parentTaskId = String.valueOf(currentTask.getParentTaskId());
		if(StringUtil.isBlank(parentTaskId) || parentTaskId.equals(START)) {
			throw new FlowException("上一步任务ID为空，无法驳回至上一步处理");
		}
		NodeModel current = model.getNode(currentTask.getTaskName());
		FlowTaskHist history =(FlowTaskHist) flowEngineFacets.getEngine().FlowTaskHistService().getInfoByKey(parentTaskId);
		
		NodeModel parent = model.getNode(history.getTaskName());
		if(!NodeModel.canRejected(current, parent)) {
			throw new FlowException("无法驳回至上一步处理，请确认上一步骤并非fork、join、suprocess以及会签任务");
		}

		FlowTask task = history.undoTask();
		task.setCreateTime(new Date());
		task.setOperator(history.getOperator());
		int id = flowEngineFacets.getEngine().flowTaskService().insertObjectReturnKey(task);
		assignTask(String.valueOf(id), task.getOperator());
		return task;
		
	}

	/**
	 * 对指定的任务分配参与者。参与者可以为用户、部门、角色
	 * @param taskId 任务id
	 * @param actorIds 参与者id集合
	 */
	private void assignTask(String taskId, String... actorIds) throws Exception{
		if(actorIds == null || actorIds.length == 0) return;
		for(String actorId : actorIds) {
			//修复当actorId为null的bug
			if(StringUtil.isBlank(actorId)) continue;
			FlowTaskActor taskActor = new FlowTaskActor();
			taskActor.setTaskId(taskId);
			taskActor.setActorId(actorId);
			flowEngineFacets.getEngine().flowTaskActorService().insertObject(taskActor);
		}
	}
	
	/**
	 * 根据已有任务、任务类型、参与者创建新的任务
	 * 适用于转派，动态协办处理
	 */
	public List<FlowTask> createNewTask(String taskId, int taskType, String... actors) throws Exception{
		FlowTask flowTask = (FlowTask)flowEngineFacets.getEngine().flowTaskService().getInfoByKey(taskId);
		Assert.notNull(flowTask, "指定的任务[id=" + taskId + "]不存在");
		List<FlowTask> tasks = new ArrayList<FlowTask>();
		try {
			FlowTask newTask = (FlowTask)flowTask.clone();
			newTask.setTaskType(taskType);
			newTask.setCreateTime(new Date());
			newTask.setParentTaskId(Integer.parseInt(taskId));
			tasks.add(saveNewTask(newTask, actors));
		} catch (CloneNotSupportedException e) {
			throw new FlowException("任务对象不支持复制", e.getCause());
		}
		return tasks;
		
	}

    /**
     * 获取任务模型
     * @param taskId 任务id
     * @return TaskModel
     */
    public TaskModel getTaskModel(String taskId) throws Exception{
    	FlowTask flowTask = (FlowTask)flowEngineFacets.getEngine().flowTaskService().getInfoByKey(taskId);
        Assert.notNull(flowTask);
        FlowOrder order =(FlowOrder) flowEngineFacets.getEngine().flowOrderService().getInfoByKey(flowTask.getFlowOrderId());
        Assert.notNull(order);
        FlowProcess process =(FlowProcess) flowEngineFacets.getEngine().flowProcessService().getProcessById(order.getFlowProcessId());
        ProcessModel model = process.getModel();
        NodeModel nodeModel = model.getNode(flowTask.getTaskName());
        Assert.notNull(nodeModel, "任务id无法找到节点模型.");
        if(nodeModel instanceof TaskModel) {
            return (TaskModel)nodeModel;
        } else {
            throw new IllegalArgumentException("任务id找到的节点模型不匹配");
        }
    }
    
    /**
	 * 由DBAccess实现类创建task，并根据model类型决定是否分配参与者
	 * @param taskModel 模型
	 * @param execution 执行对象
	 * @return List<Task> 任务列表
	 */
	public List<FlowTask> createTask(TaskModel taskModel, Execution execution) throws Exception{
		List<FlowTask> tasks = new ArrayList<FlowTask>();
		
		Map<String, Object> args = execution.getArgs();
		if(args == null) args = new HashMap<String, Object>();
		Date expireDate = DateUtil.processTime(args, taskModel.getExpireTime());
		Date remindDate = DateUtil.processTime(args, taskModel.getReminderTime());
		String form = (String)args.get(taskModel.getForm());
		String actionUrl = StringUtil.isBlank(form) ? taskModel.getForm() : form;
		
		String[] actors = getTaskActors(taskModel, execution);
		args.put(FlowTask.KEY_ACTOR, StringUtil.getStringByArray(actors));
		FlowTask task = createTaskBase(taskModel, execution);
		task.setActionUrl(actionUrl);
		task.setExpireDate(expireDate);
		task.setExpireTime(expireDate);
        task.setVariable(JsonUtil.toJson(args));
		
		if(taskModel.isPerformAny()) {
			//任务执行方式为参与者中任何一个执行即可驱动流程继续流转，该方法只产生一个task
			task = saveTask(task, actors);
			task.setRemindDate(remindDate);
			tasks.add(task);
		} else if(taskModel.isPerformAll()){
			//任务执行方式为参与者中每个都要执行完才可驱动流程继续流转，该方法根据参与者个数产生对应的task数量
			for(String actor : actors) {
				FlowTask singleTask;
                try {
                    singleTask = (FlowTask) task.clone();
                } catch (CloneNotSupportedException e) {
                    singleTask = task;
                }
                singleTask = saveTask(singleTask, actor);
                singleTask.setRemindDate(remindDate);
                tasks.add(singleTask);
			}
		}
		return tasks;
		
	}
	
	/**
	 * 根据模型、执行对象、任务类型构建基本的task对象
	 * @param model 模型
	 * @param execution 执行对象
	 * @return Task任务对象
	 */
	private FlowTask createTaskBase(TaskModel model, Execution execution) {
		FlowTask task = new FlowTask();
		task.setFlowOrderId(execution.getFlowOrder().getId());
		task.setTaskName(model.getName());
		task.setDisplayName(model.getDisplayName());
		task.setCreateTime(new Date());
		task.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
		
		if(model.isMajor()) { 
			task.setTaskType(TaskType.Major.ordinal());
		} else {
			task.setTaskType(TaskType.Aidant.ordinal());
		}
		task.setParentTaskId(execution.getTask()==null? null:execution.getTask().getId());
		task.setModel(model);
		return task;
	
	}
	
	private FlowTask saveTask(FlowTask task, String... actors) throws Exception{
		task.setPerformType(PerformType.ANY.ordinal());
		Integer id = flowEngineFacets.getEngine().flowTaskService().insertObjectReturnKey(task);
		assignTask(String.valueOf(id), actors);
		task.setActorIds(actors);
		return task;
	}
	
	private FlowTask saveNewTask(FlowTask task, String... actors) throws Exception{
		task.setPerformType(PerformType.ANY.ordinal());
		task.setId(null);
		Integer id = flowEngineFacets.getEngine().flowTaskService().insertObjectReturnKey(task);
		assignTask(String.valueOf(id), actors);
		task.setActorIds(actors);
		return task;
	}
	

	/**
	 * 根据Task模型的assignee、assignmentHandler属性以及运行时数据，确定参与者
	 * @param model 模型
	 * @param execution 执行对象
	 * @return 参与者数组
	 */
	private String[] getTaskActors(TaskModel model, Execution execution) {
		Object assigneeObject = null;
        AssignmentHandler handler = model.getAssignmentHandlerObject();
		if(StringUtil.isNotBlank(model.getAssignee())) {
			assigneeObject = execution.getArgs().get(model.getAssignee());
		} else if(handler != null) {
            if(handler instanceof FlowAssignment) {
                assigneeObject = ((FlowAssignment)handler).assign(model, execution);
            } else {
                assigneeObject = handler.assign(execution);
            }
		}
		return getTaskActors(assigneeObject == null ? model.getAssignee() : assigneeObject);
	}

	/**
	 * 根据taskmodel指定的assignee属性，从args中取值
	 * 将取到的值处理为String[]类型。
	 * @param actors 参与者对象
	 * @return 参与者数组
	 */
	private String[] getTaskActors(Object actors) {
		if(actors == null) return null;
		String[] results;
		if(actors instanceof String) {
			//如果值为字符串类型，则使用逗号,分隔
			return ((String)actors).split(",");
        } else if(actors instanceof List){
            //jackson会把stirng[]转成arraylist，此处增加arraylist的逻辑判断,by 红豆冰沙2014.11.21
			List<?> list = (List)actors;
			results = new String[list.size()];
			for(int i = 0; i < list.size(); i++) {
				results[i] = (String)list.get(i);
			}
            return results;
		} else if(actors instanceof Long) {
			//如果为Long类型，则返回1个元素的String[]
			results = new String[1];
			results[0] = String.valueOf((Long)actors);
			return results;
		} else if(actors instanceof Integer) {
			//如果为Integer类型，则返回1个元素的String[]
			results = new String[1];
			results[0] = String.valueOf((Integer)actors);
			return results;
		} else if(actors instanceof String[]) {
			//如果为String[]类型，则直接返回
			return (String[])actors;
		} else {
			//其它类型，抛出不支持的类型异常
			throw new FlowException("任务参与者对象[" + actors + "]类型不支持."
					+ "合法参数示例:Long,Integer,new String[]{},'10000,20000',List<String>");
		}
	}

	/**
	 * 判断当前操作人operator是否允许执行taskId指定的任务
	 */
	public boolean isAllowed(FlowTask task, String operator) {
		if(StringUtil.isNotBlank(operator)) {
			if(FlowEngine.ADMIN.equalsIgnoreCase(operator)|| FlowEngine.AUTO.equalsIgnoreCase(operator)) {
				return true;
			}
			if(StringUtil.isNotBlank(task.getOperator())) {
				return operator.equals(task.getOperator());
			}
		}
		
		List<FlowTaskActor> actors = flowEngineFacets.getEngine().flowTaskActorService().getTaskActorsByTaskId(String.valueOf(task.getId()));
		if(actors == null || actors.isEmpty()) return true;
		return !StringUtil.isBlank(operator)&& flowEngineFacets.getEngine().flowTaskAccessStrategyService().isAllowed(operator, actors);
	}
	/**
	 * 获得下一个流程
	 * @param parentTaskId
	 * @return
	 * @throws Exception
	 */
	public List<FlowTask> getNextActiveTasks(Integer parentTaskId) throws Exception{
		FlowTask flowTask = new FlowTask();
		flowTask.setParentTaskId(parentTaskId);
		return flowEngineFacets.getEngine().flowTaskService().queryForList(flowTask);
	}
	
	/**
	 * 从历史表获得下一个流程
	 * @param parentTaskId
	 * @return
	 * @throws 
	 * */
	public List<FlowTask> getNextActiveTasks(Integer flowOrderId, String taskName, Integer parentTaskId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("flowOrderId", flowOrderId);
		map.put("taskName", taskName);
		map.put("parentTaskId", parentTaskId);
		return flowEngineFacets.getEngine().flowTaskService().queryForList("getNextActiveTasks",map);
	}
}