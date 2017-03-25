package com.lj.app.core.common.container;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 
 * @描述: 启动Dubbo服务用的MainClass.
 */
public class DubboProvider {
	

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context;
		
		try {
			 context = new ClassPathXmlApplicationContext("classpath:spring-base.xml");
			context.start();
		} catch (Exception e) {
			System.out.println("== DubboProvider context start error:" + e.getMessage());
			e.printStackTrace();
		}
		synchronized (DubboProvider.class) {
			while (true) {
				try {
					DubboProvider.class.wait();
				} catch (InterruptedException e) {
					System.out.println("== synchronized error:" + e.getMessage());
				}
			}
		}
		
        
	}
    
}