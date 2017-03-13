package com.lj.app.core.common.flows.task.config;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.util.FileUtil;

public class TaskConfigTest extends FlowBaseTest {
	@Before
	public void before() {
		processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/config/flow1.xml"));
	}
	
	@Test
	public void taskTest()  throws Exception {
		FlowProcess flowProcess  = (FlowProcess) flowEngine.flowProcessService().getProcessById(processId);
		
		assertEquals("config",flowProcess.getFlowName());
		assertEquals("测试预配置参与者",flowProcess.getDisplayName());
		
		FlowOrder order = flowEngine.startInstanceByName("config", null, "2", null);
		System.out.println("order=" + order);
	}
}
