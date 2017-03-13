package com.lj.app.core.common.flows.task.right;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.util.FileUtil;

public class NotAllowTaskTest extends FlowBaseTest {


	@Before
	public void before() {
		processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/right/flow1.xml"));
	}
	
	@Test
	public void taskTest()  throws Exception {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task1.operator", new String[]{"2"});
		FlowOrder order = flowEngine.startInstanceById(processId,"2", args);
		System.out.println("order=" + order);
		List<FlowTask> tasks =  flowEngine.flowQueryService().getActiveTasks(order.getId());
		for(FlowTask task : tasks) {
			flowEngine.executeTask(task.getId().toString(), FlowEngine.ADMIN, args);
		}
	}

}