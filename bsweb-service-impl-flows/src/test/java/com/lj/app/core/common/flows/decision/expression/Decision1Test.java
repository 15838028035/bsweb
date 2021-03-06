package com.lj.app.core.common.flows.decision.expression;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.util.FileUtil;
import com.lj.app.core.common.util.JsonUtil;

/**
 * 分子测试
 * 
 */
public class Decision1Test extends FlowBaseTest {
  @Before
  public void before() {
    processId = flowEngine.flowProcessService()
        .deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/decision/expression/flow1.xml"));
  }

  @Test
  public void taskTest() throws Exception {
    FlowProcess flowProcess = (FlowProcess) flowEngine.flowProcessService().getProcessById(processId);

    assertEquals("decision1", flowProcess.getFlowName());
    assertEquals("测试分支流程1", flowProcess.getDisplayName());

    Map<String, Object> args = new HashMap<String, Object>();
    // args.put("task1.operator", new String[]{"1","2"});
    args.put("task2.operator", new String[] { "1" });
    // args.put("task3.operator", new String[]{"1","2"});
    args.put("content", "toTask2");
    FlowOrder order = flowEngine.startInstanceById(processId, "2", args);
    System.out.println(order);

    String mapJson = JsonUtil.toJson(args);
    System.out.println(order.getVariable());
  }

}
