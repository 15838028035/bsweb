package com.lj.app.bsweb.flows.init;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.properties.PropertiesUtil;
import com.lj.app.core.common.util.StringUtil;

/**
 * 
 * 初始化监听器
 *
 */
public class InitContextListener implements ServletContextListener {

  private static Log logger = LogFactory.getLog(InitContextListener.class);

  public void contextDestroyed(ServletContextEvent arg0) {

  }

  /**
   * 初始化
   */
  public void contextInitialized(ServletContextEvent context) {
    String springProfilesActive = PropertiesUtil.getProperty("spring.profiles.active");
    String version = PropertiesUtil.getProperty("flowsVersion");
    String productName = PropertiesUtil.getProperty("flowProductName");
    String staticFileRootUrl = PropertiesUtil.getProperty("staticFileRootUrl");

    logger.debug("InitContextListener spring.profiles.active= " + springProfilesActive);
    context.getServletContext().setAttribute("springProfilesActive", springProfilesActive);
    context.getServletContext().setAttribute("version", version);
    context.getServletContext().setAttribute("productName", productName);
    context.getServletContext().setAttribute("staticFileRootUrl", staticFileRootUrl);

    String springProfilesActiveShow = "";

    if (StringUtil.isEqual("dev", springProfilesActive)) {
      springProfilesActiveShow = "开发环境";
    } else if (StringUtil.isEqual("test", springProfilesActive)) {
      springProfilesActiveShow = "测试环境";
    } else if (StringUtil.isEqual("pro", springProfilesActive)) {
      springProfilesActiveShow = "生产环境";
    } else {
      springProfilesActiveShow = "未知环境";
    }

    StringBuilder sb = new StringBuilder();
    sb.append("\r\n======================================================================\r\n");
    sb.append("\r\n    欢迎使用 " + productName + "[" + springProfilesActiveShow + "],版本号:" + version + " \r\n");

    sb.append("\r\n======================================================================\r\n");
    
    logger.info(sb.toString());
  }
}
