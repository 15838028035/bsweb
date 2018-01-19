package com.lj.app.core.common.flows;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.lj.app.core.common.util.ClassUtil;

/**
 * 简单的服务查找实现类，由 {@link configurationService}设置
 */
public class SimpleContext implements Context {
  /**
   * 上下文注册的配置对象
   */
  private Map<String, Object> contextMap = new HashMap<String, Object>();

  /**
   * 根据服务名称查找对象
   * 
   * @param name 服务名称
   * @return 是否
   */
  public boolean exist(String name) {
    return contextMap.get(name) != null;
  }

  /**
   * 对外部提供的查找对象方法，根据class类型查找
   * 
   * @param clazz clazz
   * @return 对象类型
   */
  public <T> T find(Class<T> clazz) {
    for (Entry<String, Object> entry : contextMap.entrySet()) {
      if (clazz.isInstance(entry.getValue())) {
        return clazz.cast(entry.getValue());
      }
    }
    return null;
  }

  /**
   * 对外部提供的查找对象实例列表方法，根据class类型查找
   * 
   * @param clazz clazz
   * @return 根据class类型查找
   */
  public <T> List<T> findList(Class<T> clazz) {
    List<T> list = new ArrayList<T>();
    for (Entry<String, Object> entry : contextMap.entrySet()) {
      if (clazz.isInstance(entry.getValue())) {
        list.add(clazz.cast(entry.getValue()));
      }
    }
    return list;
  }

  /**
   * 对外部提供的查找对象方法，根据名称、class类型查找
   * 
   * @param name 名称
   * @param clazz 类
   * @return 对外部提供的查找对象方法，根据名称、class类型查找
   */
  public <T> T findByName(String name, Class<T> clazz) {
    for (Entry<String, Object> entry : contextMap.entrySet()) {
      if (entry.getKey().equals(name)) {
        return clazz.cast(entry.getValue());
      }
    }
    return null;
  }

  /**
   * 根据服务名称、实例向服务工厂注册
   * 
   * @param name
   *          服务名称
   * @param object
   *          服务实例
   */
  public void put(String name, Object object) {
    contextMap.put(name, object);
  }

  /**
   * 根据服务名称、类型向服务工厂注册
   * 
   * @param name
   *          服务名称
   * @param clazz
   *          类型
   */
  public void put(String name, Class<?> clazz) {
    contextMap.put(name, ClassUtil.instantiate(clazz));
  }

  public Map<String, Object> getContextMap() {
    return contextMap;
  }

  public void setContextMap(Map<String, Object> contextMap) {
    this.contextMap = contextMap;
  }
}