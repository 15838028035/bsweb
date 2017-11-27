package com.lj.app.core.common.flows.service;

import java.util.List;
import java.util.Map;

import com.lj.app.core.common.flows.api.FlowTaskServiceApi;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.entity.FlowTaskActorHist;
import com.lj.app.core.common.flows.model.TaskModel;

/**
 * 流程引擎接口
 */
public interface FlowEngine {
	public static final String ADMIN = "snaker.admin";
	public static final String AUTO = "snaker.auto";
    public static final String ID = "snaker.orderNo";
	/**
	 * 根据Configuration对象配置实现类
	 * @param config 全局配置对象
	 * @return SnakerEngine 流程引擎
	 */
	public FlowEngine configure(ConfigurationService configurationService);
	
	/**
	 * 获取process服务
	 * @return IProcessService 流程定义服务
	 */
	public FlowProcessService flowProcessService();
	
	/**
	 * 获取查询服务
	 * @return IQueryService 常用查询服务
	 */
	public FlowQueryService flowQueryService();
	
	/**
	 * 获取实例服务
	 * @return IQueryService 流程实例服务
	 */
	public FlowOrderService flowOrderService();
	/**
	 * 获取实例服务
	 * @return IQueryService 流程实例服务
	 */
	public FlowOrderHistService flowOrderHistService();
	
	/**
	 * 流程抄送
	 */
	public FlowCcorderService flowCcorderService();
	
	/**
	 * 获取任务服务
	 * @return ITaskService 任务服务
	 */
	public FlowTaskService flowTaskService();
	
	/**
	 * 获取任务服务
	 * @return
	 */
	public FlowTaskServiceApi FlowTaskServiceApi();
	
	/**
	 * 获取任务服务
	 * @return
	 */
	public FlowTaskHistService FlowTaskHistService();
	
	/**
	 * 任务参与
	 * @return
	 */
	public FlowTaskActorService flowTaskActorService();
	
	/**
	 * 历史任务参与
	 * @return
	 */
	public FlowTaskActorHistService<FlowTaskActorHist> flowTaskActorHistService();
	
	/**
	 * 流程完成接口
	 */
	public FlowCompletionService flowCompletionService();
	
	public FlowTaskAccessStrategyService flowTaskAccessStrategyService();
	
	public FlowApproveService flowApproveService();
	
	/**
	 * 根据流程定义ID启动流程实例
	 * @param id 流程定义ID
	 * @return Order 流程实例
	 * @see #startInstanceById(String, String, Map)
	 */
	public FlowOrder startInstanceById(String id)throws Exception ;
	
	/**
	 * 根据流程定义ID，操作人ID启动流程实例
	 * @param id 流程定义ID
	 * @param operator 操作人ID
	 * @return Order 流程实例
	 * @see #startInstanceById(String, String, Map)
	 */
	public FlowOrder startInstanceById(String id, String operator) throws Exception ;
	
	/**
	 * 根据流程定义ID，操作人ID，参数列表启动流程实例
	 * @param id 流程定义ID
	 * @param operator 操作人ID
	 * @param args 参数列表
	 * @return Order 流程实例
	 */
	public FlowOrder startInstanceById(String id, String operator, Map<String, Object> args)throws Exception ;
	
	/**
	 * 根据流程名称启动流程实例
	 * @param name 流程定义名称
	 * @return Order 流程实例
	 */
	public FlowOrder startInstanceByName(String name)throws Exception ;
	
	/**
	 * 根据流程名称、版本号启动流程实例
	 * @param name 流程定义名称
	 * @param version 版本号
	 * @return Order 流程实例
	 */
	public FlowOrder startInstanceByName(String name, Integer version)throws Exception ;
	
	/**
	 * 根据流程名称、版本号、操作人启动流程实例
	 * @param name 流程定义名称
	 * @param version 版本号
	 * @param operator 操作人
	 * @return Order 流程实例
	 */
	public FlowOrder startInstanceByName(String name, Integer version, String operator)throws Exception ;
	
	/**
	 * 根据流程名称、版本号、操作人、参数列表启动流程实例
	 * @param name 流程定义名称
	 * @param version 版本号
	 * @param operator 操作人
	 * @param args 参数列表
	 * @return Order 流程实例
	 */
	public FlowOrder startInstanceByName(String name, Integer version, String operator, Map<String, Object> args)throws Exception ;
	
	/**
	 * 根据父执行对象启动子流程实例
	 * @param execution 执行对象
	 * @return Order 流程实例
	 */
	public FlowOrder startInstanceByExecution(Execution execution) throws Exception ;
	
	/**
	 * 根据任务主键ID执行任务
	 * @param taskId 任务主键ID
	 * @return List<Task> 任务集合
	 * @see #executeTask(String, String, Map)
	 */
	public List<FlowTask> executeTask(String taskId) throws Exception ;
	
	/**
	 * 根据任务主键ID，操作人ID执行任务
	 * @param taskId 任务主键ID
	 * @param operator 操作人主键ID
	 * @return List<Task> 任务集合
	 * @see #executeTask(String, String, Map)
	 */
	public List<FlowTask> executeTask(String taskId, String operator) throws Exception ;
	
	/**
	 * 根据任务主键ID，操作人ID，参数列表执行任务
	 * @param taskId 任务主键ID
	 * @param operator 操作人主键ID
	 * @param args 参数列表
	 * @return List<Task> 任务集合
	 */
	public List<FlowTask> executeTask(String taskId, String operator, Map<String, Object> args) throws Exception ;
	
	/**
	 * 根据任务主键ID，操作人ID，参数列表执行任务，并且根据nodeName跳转到任意节点
	 * 1、nodeName为null时，则跳转至上一步处理
	 * 2、nodeName不为null时，则任意跳转，即动态创建转移
	 * @param taskId 任务主键ID
	 * @param operator 操作人主键ID
	 * @param args 参数列表
	 * @param nodeName 跳转的节点名称
	 * @return List<Task> 任务集合
	 */
	public List<FlowTask> executeAndJumpTask(String taskId, String operator, Map<String, Object> args, String nodeName) throws Exception;
	
	/**
	 * 根据流程实例ID，操作人ID，参数列表按照节点模型model创建新的自由任务
	 * @param orderId 流程实例id
	 * @param operator 操作人id
	 * @param args 参数列表
	 * @param model 节点模型
	 * @return List<Task> 任务集合
	 */
	public List<FlowTask> createFreeTask(String orderId, String operator, Map<String, Object> args, TaskModel model) throws Exception;
}