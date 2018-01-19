package com.lj.app.core.common.flows;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.util.FileUtil;

/**
 * 测试实例编号自定义
 *
 */
public class GeneratorTest extends FlowBaseTest {

  @Before
  public void before() throws Exception {
    InputStream inputStream = FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/generator/flow1.xml");
    processId = flowEngine.flowProcessService().deploy(inputStream);
  }

  @Test
  public void generatorTest() throws Exception {
    FlowProcess flowProcess = (FlowProcess) flowEngine.flowProcessService().getProcessById(processId);

    assertEquals("generator", flowProcess.getFlowName());
    assertEquals("测试实例编号自定义", flowProcess.getDisplayName());
    assertNotNull(flowProcess.getFlowNo());

    String flowCustNo = flowProcess.getModel().getGenerator().generate(flowProcess.getModel());
    System.out.println("flowCustNo=" + flowCustNo);

    Map<String, Object> args = new HashMap<String, Object>();
    args.put("task1.operator", new String[] { "1" });
    FlowOrder order = flowEngine.startInstanceById(processId, "2", args);
    System.out.println("order=" + order);
    List<FlowTask> tasks = flowEngine.flowQueryService().getActiveTasks(order.getId());
    for (FlowTask task : tasks) {
      flowEngine.executeTask(task.getId().toString(), "1");
    }
  }
}
