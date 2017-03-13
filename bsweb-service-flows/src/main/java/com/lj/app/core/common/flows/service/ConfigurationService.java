package com.lj.app.core.common.flows.service;

import com.lj.app.core.common.exception.FlowException;
/**
 * 初始化依赖的服务
 */
public interface ConfigurationService {
	
	/**
	 * 构造SnakerEngine对象，用于api集成
	 * 通过SpringHelper调用
	 * @return SnakerEngine
	 * @throws FlowException
	 */
	public FlowEngine buildSnakerEngine() throws FlowException;
	
	/**
	 * 配置项解析
	 */
	public void parser() ;
	
}
