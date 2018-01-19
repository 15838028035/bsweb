package com.lj.app.core.common.container;

import java.io.File;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.ResourceUtils;

/**
 * 
 * @描述: 启动Dubbo服务用的MainClass.
 */
public class DubboProvider {
  public static final String LOG4J_FILE = "classpath:log4j.properties";

  private static Log logger = LogFactory.getLog(DubboProvider.class);

  public static final String SPRING_CONFIG = "dubbo.spring.config";

  public static final String DEFAULT_SPRING_CONFIG = "classpath:spring-base.xml";

  static ClassPathXmlApplicationContext context;

  public static ClassPathXmlApplicationContext getContext() {
    return context;
  }

  /**
   * 启动
   * @throws Exception 异常
   */
  public static void start() throws Exception {
    File file = ResourceUtils.getFile(LOG4J_FILE);
    PropertyConfigurator.configure(file.getAbsolutePath());
    context = new ClassPathXmlApplicationContext(DEFAULT_SPRING_CONFIG.split("[,\\s]+"));
    context.start();
  }

  /**
   * 停止
   */
  public static void stop() {
    try {
      if (context != null) {
        context.stop();
        context.close();
        context = null;
      }
    } catch (Throwable e) {
      logger.error(e.getMessage(), e);
    }
  }

  /**
   * 执行入口
   * @param args 参数
   */
  public static void main(String[] args) {
    try {
      DubboProvider.start();
    } catch (Exception e) {
      logger.error("== DubboProvider context start error:", e);
    }
    synchronized (DubboProvider.class) {
      while (true) {
        try {
          DubboProvider.class.wait();
        } catch (InterruptedException e) {
          logger.error("== synchronized error:", e);
        }
      }
    }
  }

}
