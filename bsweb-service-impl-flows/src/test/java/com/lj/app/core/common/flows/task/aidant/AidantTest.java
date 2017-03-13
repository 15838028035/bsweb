package com.lj.app.core.common.flows.task.aidant;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.util.FileUtil;

public class AidantTest extends FlowBaseTest {
	@Before
	public void before() {
		processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/aidant/flow1.xml"));
	}
	
	@Test
	public void taskTest()  throws Exception {
		FlowOrder order = flowEngine.startInstanceByName("aidant", 0);
		System.out.println("order=" + order);
		List<FlowTask> tasks =  flowEngine.flowQueryService().getActiveTasks(order.getId());
		for(FlowTask task : tasks) {
			flowEngine.executeTask(task.getId().toString(), "1");
		}
	}

}
