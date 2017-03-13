package com.lj.app.core.common.flows.concurrency.actorall;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.util.FileUtil;

public class ActorAllTaskTest extends FlowBaseTest{
	
	@Before
	public void before() {
		processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/concurrency/actorall/flow1.xml"));
	}
	
	@Test
	public void taskTest() throws Exception {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task1.operator", new String[]{"1", "2"});
		FlowOrder order = flowEngine.startInstanceById(processId, "2", args);
		System.out.println(order);
	}
}
