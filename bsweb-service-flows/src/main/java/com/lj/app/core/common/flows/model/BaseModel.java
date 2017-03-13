package com.lj.app.core.common.flows.model;

import java.io.Serializable;

import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.handlers.IHandler;

/**
 * 模型元素基类
 */
public class BaseModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3082741431225739241L;
	/**
	 * 元素名称
	 */
	private String name;
	/**
	 * 显示名称
	 */
	private String displayName;
	
	/**
	 * 将执行对象execution交给具体的处理器处理
	 * @param handler
	 * @param execution
	 */
	protected void fire(IHandler handler, Execution execution) {
		handler.handle(execution);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
}