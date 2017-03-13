package com.lj.app.core.common.flows.core;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.service.FlowEngine;

/**
 * 流程执行过程中所传递的执行对象，其中包含流程定义、流程模型、流程实例对象、执行参数、返回的任务列表
 */
public class Execution implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3730741790729624400L;
	/**
	 * SnakerEngine holder
	 */
	private FlowEngine engine;
	/**
	 * 流程定义对象
	 */
	private FlowProcess process;
	/**
	 * 流程实例对象
	 */
	private FlowOrder flowOrder;
	/**
	 * 父流程实例
	 */
	private FlowOrder parentOrder;
	/**
	 * 父流程实例节点名称
	 */
	private String parentNodeName;
	/**
	 * 子流程实例节点名称
	 */
	private String childOrderId;
	/**
	 * 执行参数
	 */
	private Map<String, Object> args;
	/**
	 * 操作人
	 */
	private String operator;
	/**
	 * 任务
	 */
	private FlowTask task;
	/**
	 * 返回的任务列表
	 */
	private List<FlowTask> tasks = new ArrayList<FlowTask>();
	/**
	 * 是否已合并
	 * 针对join节点的处理
	 */
	private boolean isMerged = false;
	
	/**
	 * 用于产生子流程执行对象使用
	 * @param execution
	 * @param process
	 * @param parentNodeName
	 */
	Execution(Execution execution, FlowProcess process, String parentNodeName) {
		if(execution == null || process == null || parentNodeName == null) {
			throw new FlowException("构造Execution对象失败，请检查execution、process、parentNodeName是否为空");
		}
		this.engine = execution.getEngine();
		this.process = process;
		this.args = execution.getArgs();
		this.parentOrder = execution.getFlowOrder();
		this.parentNodeName = parentNodeName;
		this.operator = execution.getOperator();
	}
	
	/**
	 * 构造函数，接收流程定义、流程实例对象、执行参数
	 * @param process
	 * @param order
	 * @param args
	 */
	public Execution(FlowEngine engine, FlowProcess process, FlowOrder flowOrder, Map<String, Object> args) {
		if(process == null || flowOrder == null) {
			throw new FlowException("构造Execution对象失败，请检查process、order是否为空");
		}
		this.engine = engine;
		this.process = process;
		this.flowOrder = flowOrder;
		this.args = args;
	}
	
	/**
	 * 根据当前执行对象execution、子流程定义process、当前节点名称产生子流程的执行对象
	 * @param execution
	 * @param process
	 * @param parentNodeName
	 * @return
	 */
	public Execution createSubExecution(Execution execution, FlowProcess process, String parentNodeName) {
		return new Execution(execution, process, parentNodeName);
	}
	
	/**
	 * 获取流程定义对象
	 * @return
	 */
	public FlowProcess getProcess() {
		return process;
	}
	
	/**
	 * 获取流程模型对象
	 * @return
	 */
	public ProcessModel getModel() {
		return process.getModel();
	}
	
	/**
	 * 获取流程实例对象
	 * @return
	 */
	public FlowOrder getFlowOrder() {
		return flowOrder;
	}
	
	/**
	 * 获取执行参数
	 * @return
	 */
	public Map<String, Object> getArgs() {
		return args;
	}
	
	/**
	 * 返回任务结果集
	 * @return
	 */
	public List<FlowTask> getTasks() {
		return tasks;
	}
	
	/**
	 * 添加任务集合
	 * @param tasks
	 */
	public void addTasks(List<FlowTask> tasks) {
		this.tasks.addAll(tasks);
	}
	
	/**
	 * 添加任务
	 * @param task
	 */
	public void addTask(FlowTask task) {
		this.tasks.add(task);
	}

	/**
	 * 返回当前操作人ID
	 * @return
	 */
	public String getOperator() {
		return operator;
	}

	/**
	 * 设置当前操作人ID
	 * @param operator
	 */
	public void setOperator(String operator) {
		this.operator = operator;
	}

	/**
	 * 返回任务
	 * @return
	 */
	public FlowTask getTask() {
		return task;
	}

	/**
	 * 设置任务
	 * @param task
	 */
	public void setTask(FlowTask task) {
		this.task = task;
	}

	/**
	 * 判断是否已经成功合并
	 * @return
	 */
	public boolean isMerged() {
		return isMerged;
	}

	/**
	 * 设置是否为已合并
	 * @param isMerged
	 */
	public void setMerged(boolean isMerged) {
		this.isMerged = isMerged;
	}

	/**
	 * 获取引擎
	 * @return
	 */
	public FlowEngine getEngine() {
		return engine;
	}

	public FlowOrder getParentOrder() {
		return parentOrder;
	}

	public String getParentNodeName() {
		return parentNodeName;
	}

	public String getChildOrderId() {
		return childOrderId;
	}

	public void setChildOrderId(String childOrderId) {
		this.childOrderId = childOrderId;
	}
}
