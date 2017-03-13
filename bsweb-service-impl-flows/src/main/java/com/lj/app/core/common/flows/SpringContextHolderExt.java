package com.lj.app.core.common.flows;

import org.springframework.beans.factory.InitializingBean;

import com.lj.app.core.common.flows.service.ConfigurationService;
import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.util.SpringContextHolder;


public class SpringContextHolderExt extends SpringContextHolder implements InitializingBean{
	
	public void afterPropertiesSet() throws Exception {
		
		ConfigurationService configurationService  = (ConfigurationService)super.getBean("configurationService");
		 FlowEngine flowEngine = (FlowEngine)super.getBean("flowEngine");
		System.out.println("Spring ApplicationContextAware afterPropertiesSet");
		flowEngine = configurationService.buildSnakerEngine();
	}
}
