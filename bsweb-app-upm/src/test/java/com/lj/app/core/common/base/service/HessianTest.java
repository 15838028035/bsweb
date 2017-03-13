package com.lj.app.core.common.base.service;

import java.io.InputStream;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lj.app.core.common.flows.service.FlowProcessService;
import com.lj.app.core.common.util.FileUtil;

public class HessianTest {

	 public static void main(String[] args) throws Exception {
    	ClassPathXmlApplicationContext context;
    	 context=new ClassPathXmlApplicationContext("classpath:spring-base.xml");
    	 FlowProcessService flowProcessService = (FlowProcessService)context.getBean("flowProcessService");
         	
         	InputStream inputStream = FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/simple/flow1.xml");
            flowProcessService.deploy(inputStream,"zhangsan");
    }
	 
	 @Test
	 public void junitTest() {
			ClassPathXmlApplicationContext context;
	    	 context=new ClassPathXmlApplicationContext("classpath:spring-base.xml");
	    	 FlowProcessService flowProcessService = (FlowProcessService)context.getBean("flowProcessService");
	         	
	         	InputStream inputStream = FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/simple/flow1.xml");
	            flowProcessService.deploy(inputStream,"zhangsan");
	 }
    
}
