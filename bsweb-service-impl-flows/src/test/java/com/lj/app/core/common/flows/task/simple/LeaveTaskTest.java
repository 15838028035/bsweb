package com.lj.app.core.common.flows.task.simple;

import static org.junit.Assert.assertEquals;

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

public class LeaveTaskTest extends FlowBaseTest {
	@Before
	public void before() throws Exception{
		processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/simple/leaveTest.xml"));
	}
	
	@Test
	public void taskTest()  throws Exception {
		FlowProcess flowProcess  = (FlowProcess) flowEngine.flowProcessService().getProcessById(processId);
		
		assertEquals("leave",flowProcess.getFlowName());
		
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task1.operator", new String[]{"1"});
		FlowOrder order = flowEngine.startInstanceByName("simple", null, "2", args);
		System.out.println("order=" + order);
		List<FlowTask> tasks =  flowEngine.flowQueryService().getActiveTasks(order.getId());
		for(FlowTask task : tasks) {
			flowEngine.executeTask(task.getId().toString(), "1");
		}
	}

}
