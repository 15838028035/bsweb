package com.lj.app.core.common.flows.expire;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.FileUtil;

/**
 * 
 * 过期测试
 *
 */
public class ExpireTest extends FlowBaseTest {
  private static final String PROCESSNAME = "expire";

  @Before
  public void before() {
    processId = flowEngine.flowProcessService()
        .deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/expire/flow1.xml"));
  }

  @Test
  public void flowTest() throws Exception {
    Map<String, Object> args = new HashMap<String, Object>();
    args.put("task1.operator", new String[] { "1" });
    args.put("task1.expireTime", DateUtil.formatDate("2017-03-15 00:00:00", "yyyy-MM-dd HH:mm:ss"));
    args.put("task1.reminderTime", DateUtil.formatDate("2017-03-15 10:00:00", "yyyy-MM-dd HH:mm:ss"));

    FlowOrder order = flowEngine.startInstanceByName(PROCESSNAME, null, "2", args);
    System.out.println("order=" + order);
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  }
}
