package com.lj.app.core.common.flows.decision.handler;

import com.lj.app.core.common.flows.DecisionHandler;
import com.lj.app.core.common.flows.core.Execution;

public class TaskHandler  implements DecisionHandler {
	
	public String decide(Execution execution) {
		return (String)execution.getArgs().get("content");
	}

}
