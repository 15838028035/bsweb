package com.lj.app.core.common.flows;

import java.util.List;

/**
 * 服务查找接口
 */
public interface Context {
	/**
	 * 根据服务名称、实例向服务工厂注册
	 * @param name 服务名称
	 * @param object 服务实例
	 */
	public void put(String name, Object object);
	
	/**
	 * 根据服务名称、类型向服务工厂注册
	 * @param name 服务名称
	 * @param clazz 类型
	 */
	public void put(String name, Class<?> clazz);
	
	/**
	 * 判断是否存在给定的服务名称
	 * @param name 服务名称
	 * @return
	 */
	public boolean exist(String name);
	
	/**
	 * 根据给定的类型查找服务实例
	 * @param clazz 类型
	 * @return
	 */
	public <T> T find(Class<T> clazz);
	
	/**
	 * 根据给定的类型查找所有此类型的服务实例
	 * @param clazz 类型
	 * @return
	 */
	public <T> List<T> findList(Class<T> clazz);
	
	/**
	 * 根据给定的服务名称、类型查找服务实例
	 * @param name 服务名称
	 * @param clazz 类型
	 * @return
	 */
	public <T> T findByName(String name, Class<T> clazz);
}
