package com.lj.app.core.common.flows.custom;

/**
 * 自定义类
 */
public class CustomClass {
	public String execute(String msg) {
		System.out.println("execute:" + msg);
		return "return " + msg;
	}
}