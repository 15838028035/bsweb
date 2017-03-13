package com.lj.app.core.common.flows;

import com.lj.app.core.common.flows.model.ProcessModel;

public class CustomNoGenerator implements INoGenerator {
	
	public String generate(ProcessModel model) {
		return java.util.UUID.randomUUID().toString().replace("-", "");
	}
}
