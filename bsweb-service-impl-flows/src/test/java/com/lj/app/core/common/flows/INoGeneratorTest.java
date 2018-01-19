package com.lj.app.core.common.flows;

import org.junit.Test;

import com.lj.app.core.common.flows.model.ProcessModel;

/**
 * 测试实例编号自定义
 *
 */
public class INoGeneratorTest {

  /**
   * 测试实例编号自定义
   */
  @Test
  public void generateTest() {
    INoGenerator defaultNoGenerator = new DefaultNoGenerator();
    ProcessModel model = new ProcessModel();
    String generatorNo = defaultNoGenerator.generate(model);
    System.out.println("generatorNo=" + generatorNo);
  }

  /**
   * 测试实例编号自定义
   */
  @Test
  public void generateTest2() {
    INoGenerator defaultNoGenerator = new CustomNoGenerator();
    ProcessModel model = new ProcessModel();
    String generatorNo = defaultNoGenerator.generate(model);
    System.out.println("generatorNo=" + generatorNo);
  }

}
