package com.lj.app.core.common.flows.task.transfer;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.util.FileUtil;

/**
 * 
 *转派测试
 *
 */
public class TransferTaskTest extends FlowBaseTest {
  @Before
  public void before() {
    processId = flowEngine.flowProcessService()
        .deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/transfer/flow1.xml"));
  }

  @Test
  public void taskTest() throws Exception {
    FlowOrder order = flowEngine.startInstanceByName("transfer", 0);
    System.out.println("order=" + order);
    List<FlowTask> tasks = flowEngine.flowQueryService().getActiveTasks(order.getId());
    for (FlowTask task : tasks) {
      flowEngine.flowTaskServiceApi().createNewTask(task.getId().toString(), 0, "test");
      flowEngine.flowTaskServiceApi().complete(task.getId().toString());
    }
  }

}
