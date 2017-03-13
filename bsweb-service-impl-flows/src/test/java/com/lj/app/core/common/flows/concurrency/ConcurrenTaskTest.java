package com.lj.app.core.common.flows.concurrency;

import java.util.HashMap;
import java.util.Map;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.service.FlowEngine;

public class ConcurrenTaskTest  extends FlowBaseTest {
	
	public static void main(String[] a) throws Exception{
		ConcurrenTaskTest con = new ConcurrenTaskTest();
		FlowProcess process = con.flowEngine.flowProcessService().getProcessById("1");
		for(int i = 0; i < 50; i++) {
			new Thread(new StartProcess(con.flowEngine, process.getId().toString())).start();
		}
	}
}

class StartProcess implements Runnable {
	private FlowEngine engine;
	private String processId;
	public StartProcess(FlowEngine engine, String processId) {
		this.engine = engine;
		this.processId = processId;
	}
	
	public void run() {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task1.operator", new String[]{"1"});
		try{
		engine.startInstanceById(processId, "2", args);//simple流程
		}catch(Exception e) {
		e.printStackTrace();	
		}
	}
	
}
