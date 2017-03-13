package com.lj.app.core.common.flows.service;

import java.util.List;

import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;

public class FlowProcessServiceTest extends FlowBaseTest{

		
	@Test
	public void getFlowContentTest() throws Exception {
		List<com.lj.app.core.common.flows.entity.FlowProcess> list = flowEngine.flowProcessService().queryForList("select",null,0,2);
		
		for(com.lj.app.core.common.flows.entity.FlowProcess process: list) {
			String isoString = new String( process.getFlowContent(),"UTF-8");
			System.out.println(isoString);
		}
	}

}
