package com.lj.app.core.common.flows;

import com.lj.app.core.common.flows.model.ProcessModel;

/**
 * 编号生成器接口
 * 流程实例的编号字段使用该接口实现类来产生对应的编号
 */
public interface INoGenerator {
	/**
	 * 生成器方法
	 * @param model
	 * @return String 编号
	 */
	String generate(ProcessModel model);
}