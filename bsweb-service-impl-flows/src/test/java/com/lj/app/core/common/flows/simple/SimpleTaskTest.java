package com.lj.app.core.common.flows.simple;

import static org.junit.Assert.assertTrue;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.util.FileUtil;

/**
 * 
 * 简单流程测试
 *
 */
public class SimpleTaskTest extends FlowBaseTest {
  @Before
  public void before() throws Exception {
    InputStream inputStream = FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/simple/flow1.xml");
    processId = flowEngine.flowProcessService().deploy(inputStream);
  }

  @Test
  public void taskTest() throws Exception {
    Map<String, Object> args = new HashMap<String, Object>();
    args.put("task1.operator", new String[] { "admin管理员" });

    FlowProcess flowProcess = flowEngine.flowProcessService().getProcessById(processId);

    FlowOrder order = flowEngine.startInstanceByName(flowProcess.getFlowName());

    System.out.println("order=" + order);
    List<FlowTask> tasks = flowEngine.flowQueryService().getActiveTasks(order.getId().toString());
    assertTrue(tasks.size() == 1);

    for (FlowTask task : tasks) {
      flowEngine.executeTask(task.getId().toString(), FlowEngine.ADMIN, args);
    }

    List<FlowTask> tasksList = flowEngine.flowQueryService().getActiveTasks(order.getId().toString());
    for (FlowTask task : tasksList) {
      System.out.println("task=" + task);
    }
  }
}
