package com.lj.app.core.common.flows.custom;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.util.FileUtil;

public class CustomHandlerTest extends FlowBaseTest {
	@Before
	public void before() {
		processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/custom/flow1.xml"));
	}
	
	@Test
	public void taskTest()  throws Exception {
		FlowProcess flowProcess  = (FlowProcess) flowEngine.flowProcessService().getProcessById(processId);
		
		assertEquals("custom1",flowProcess.getFlowName());
		assertEquals("custom1",flowProcess.getDisplayName());
		assertNotNull(flowProcess.getFlowNo());
		
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("msg", "custom test");
		FlowOrder order = flowEngine.startInstanceById(processId, null, args);
		System.out.println("order=" + order);
		List<FlowTask> tasks =  flowEngine.flowQueryService().getActiveTasks(order.getId());
		for(FlowTask task : tasks) {
			flowEngine.executeTask(task.getId().toString(), null, args);
		}
	}
}
