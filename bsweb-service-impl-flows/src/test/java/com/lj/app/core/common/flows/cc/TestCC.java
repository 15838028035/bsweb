package com.lj.app.core.common.flows.cc;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.util.FileUtil;

public class TestCC extends FlowBaseTest {
	@Before
	public void before() {
		processId = flowEngine.flowProcessService().deploy(FileUtil.getResourceAsStream("com/lj/app/core/common/flows/task/simple/flow1.xml"));
	}

	@Test
	public void flowTest() throws Exception {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task1.operator", new String[] { "1" });
		FlowOrder order = flowEngineFacets.startInstanceByName("simple", 0, "2", args);
		flowEngine.flowCcorderService().createCCOrder(order.getId().toString(), "test");
	}
}