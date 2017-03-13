package com.lj.app.core.common.flows.entity;

import java.io.Serializable;

import com.lj.app.core.common.util.Assert;

public class FlowQueryFilter  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8155136377911571881L;
    public static final String ASC = "asc";
    public static final String DESC = "desc";

	/*********common parameters***********/
	/**
	 * 流程定义id
	 */
	private String processId;
	/**
	 * 流程定义版本号
	 */
	private Integer version;
	/**
	 * 流程实例id
	 */
	private String orderId;
	/**
	 * 任务id
	 */
	private String taskId;
	/**
	 * 创建时间范围
	 */
	private String createTimeStart;
	private String createTimeEnd;
	private String operateTime;
	/**
	 * 操作人员id
	 */
	private String[] operators;
	/**
	 * 名称
	 */
	private String[] names;
	/**
	 * 显示名称
	 */
	private String displayName;
	/**
	 * 状态
	 */
	private Integer state;
	/**
	 * 流程类型
	 */
	private String processType;
	/**
	 * exclude ids
	 */
	private String[] excludedIds;
	
	/*********order parameters***********/
	/**
	 * 父实例id
	 */
	private String parentId;
	/**
	 * 实例编号
	 */
	private String orderNo;
	
	/*********task parameters***********/
	/**
	 * 任务类型
	 */
	private Integer taskType;
	/**
	 * 任务参与类型
	 */
	private Integer performType;
	
	public String getProcessId() {
		return processId;
	}
	public FlowQueryFilter setProcessId(String processId) {
		Assert.notNull(processId);
		this.processId = processId;
		return this;
	}
	public String getOrderId() {
		return orderId;
	}
	public FlowQueryFilter setOrderId(String orderId) {
		Assert.notNull(orderId);
		this.orderId = orderId;
		return this;
	}
	public String getTaskId() {
		return taskId;
	}
	public FlowQueryFilter setTaskId(String taskId) {
		Assert.notNull(taskId);
		this.taskId = taskId;
		return this;
	}
	public String getCreateTimeStart() {
		return createTimeStart;
	}
	public FlowQueryFilter setCreateTimeStart(String createTimeStart) {
		Assert.notNull(createTimeStart);
		this.createTimeStart = createTimeStart;
		return this;
	}
	public String getCreateTimeEnd() {
		return createTimeEnd;
	}
	public FlowQueryFilter setCreateTimeEnd(String createTimeEnd) {
		Assert.notNull(createTimeEnd);
		this.createTimeEnd = createTimeEnd;
		return this;
	}
	public String[] getOperators() {
		return operators;
	}
	public FlowQueryFilter setOperators(String[] operators) {
		Assert.notNull(operators);
		this.operators = operators;
		return this;
	}
	public FlowQueryFilter setOperator(String operator) {
		Assert.notNull(operator);
		this.operators = new String[1];
		this.operators[0] = operator;
		return this;
	}
	public String[] getNames() {
		return names;
	}
	public FlowQueryFilter setNames(String[] names) {
		Assert.notNull(names);
		this.names = names;
		return this;
	}
	public FlowQueryFilter setName(String name) {
		Assert.notNull(name);
		this.names = new String[1];
		this.names[0] = name;
		return this;
	}
	public String getDisplayName() {
		return displayName;
	}
	public FlowQueryFilter setDisplayName(String displayName) {
		Assert.notNull(displayName);
		this.displayName = displayName;
		return this;
	}
	public Integer getState() {
		return state;
	}
	public FlowQueryFilter setState(Integer state) {
		Assert.notNull(state);
		this.state = state;
		return this;
	}
	public String getParentId() {
		return parentId;
	}
	public FlowQueryFilter setParentId(String parentId) {
		Assert.notNull(parentId);
		this.parentId = parentId;
		return this;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public FlowQueryFilter setOrderNo(String orderNo) {
		Assert.notNull(orderNo);
		this.orderNo = orderNo;
		return this;
	}
	public Integer getTaskType() {
		return taskType;
	}
	public FlowQueryFilter setTaskType(Integer taskType) {
		Assert.notNull(taskType);
		this.taskType = taskType;
		return this;
	}
	public Integer getPerformType() {
		return performType;
	}
	public FlowQueryFilter setPerformType(Integer performType) {
		this.performType = performType;
		return this;
	}
	public String[] getExcludedIds() {
		return excludedIds;
	}
	public FlowQueryFilter setExcludedIds(String[] excludedIds) {
		Assert.notNull(excludedIds);
		this.excludedIds = excludedIds;
		return this;
	}
	public Integer getVersion() {
		return version;
	}
	public FlowQueryFilter setVersion(Integer version) {
		Assert.notNull(version);
		this.version = version;
		return this;
	}
	public String getOperateTime() {
		return operateTime;
	}
	public FlowQueryFilter setOperateTime(String operateTime) {
		Assert.notNull(operateTime);
		this.operateTime = operateTime;
		return this;
	}
	public String getProcessType() {
		return processType;
	}
	public FlowQueryFilter setProcessType(String processType) {
		Assert.notNull(processType);
		this.processType = processType;
		return this;
	}
}