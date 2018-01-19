package com.lj.app.core.common.flows;

import org.springframework.beans.factory.InitializingBean;

import com.lj.app.core.common.flows.service.ConfigurationService;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.util.SpringContextHolder;

/**
 * 
 * spring上下文
 *
 */
public class SpringContextHolderExt extends SpringContextHolder implements InitializingBean {

  /**
   * 重写
   */
  public void afterPropertiesSet() throws Exception {

    ConfigurationService configurationService = (ConfigurationService) super.getBean("configurationService");
    FlowEngine flowEngine = (FlowEngine) super.getBean("flowEngine");
    System.out.println("Spring ApplicationContextAware afterPropertiesSet");
    flowEngine = configurationService.buildSnakerEngine();
  }
}
