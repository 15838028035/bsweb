package com.lj.app.bsweb.upm.init;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.properties.PropertiesUtil;

public class InitContextListener implements ServletContextListener {
	
	private static Log logger = LogFactory.getLog(InitContextListener.class);
	
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent context) {
		String springProfilesActive = PropertiesUtil.getProperty("spring.profiles.active");
		String upmVersion = PropertiesUtil.getProperty("upmVersion");
		logger.debug("InitContextListener spring.profiles.active= " +springProfilesActive);
		context.getServletContext().setAttribute("springProfilesActive", springProfilesActive);
		context.getServletContext().setAttribute("upmVersion", upmVersion);
	}
}
