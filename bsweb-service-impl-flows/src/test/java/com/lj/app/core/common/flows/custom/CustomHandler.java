package com.lj.app.core.common.flows.custom;

import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.handlers.IHandler;

public class CustomHandler implements IHandler {
	
	public void handle(Execution execution) {
		System.out.println("custom handler");
	}
}
