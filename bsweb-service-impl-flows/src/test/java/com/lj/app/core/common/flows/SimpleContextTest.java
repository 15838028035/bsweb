package com.lj.app.core.common.flows;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.lj.app.core.common.flows.parser.impl.StartParser;

/**
 * 上下文
 *
 */
public class SimpleContextTest {

  /**
   * 查询测试
   */
  @Test
  public void findTest() {
    SimpleContext simpleContext = new SimpleContext();
    StartParser obj = simpleContext.findByName("start", StartParser.class);
    assertNotNull(obj);
  }

}
