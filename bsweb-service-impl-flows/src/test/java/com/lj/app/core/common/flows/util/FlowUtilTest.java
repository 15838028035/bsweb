package com.lj.app.core.common.flows.util;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.model.ExtTaskModel;
import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.model.TaskModel;

public class FlowUtilTest extends FlowBaseTest{

	/**
	 * 流程基础模型获取测试
	 * @throws Exception
	 */
	@Test
	public void getBaseTest() throws Exception{
		NodeModel node = new TaskModel();
		String str = FlowUtil.getBase(node);
		System.out.println("str="+ str);
		assertTrue(str.contains("type"));
	}
	/**
	 * 自定义任务模型测试
	 * @throws Exception
	 */
	@Test
	public void extTaskModelTest() throws Exception{
		NodeModel node = new ExtTaskModel();
		node.setDisplayName("extTaskModel");
		String str = FlowUtil.getBase(node);
		System.out.println("str="+ str);
		assertTrue(str.contains("task"));
	}

}
