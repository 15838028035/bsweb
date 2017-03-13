package com.lj.app.core.common.flows.service;

import java.io.InputStream;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lj.app.core.common.util.FileUtil;

public class HessianTest {

	ClassPathXmlApplicationContext context;
  public HessianTest(){
     context=new ClassPathXmlApplicationContext("classpath:spring-base.xml");
    }
    
    public static final HessianTest test=new HessianTest();
    
    
    @org.junit.Test
    public void TestIO(){
    	FlowProcessService flowProcessService = (FlowProcessService)test.context.getBean("flowProcessService");
        try {
        	
        	InputStream inputStream = FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/simple/flow1.xml");
        	
           flowProcessService.deploy(inputStream,"zhangsan");
        } catch (Exception  e) {
            e.printStackTrace();
        }
    }
}
