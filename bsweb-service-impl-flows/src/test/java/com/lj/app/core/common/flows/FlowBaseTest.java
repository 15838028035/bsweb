package com.lj.app.core.common.flows;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lj.app.core.common.flows.service.FlowEngine;
import com.lj.app.core.common.flows.service.FlowEngineFacetsServiceImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:spring-common.xml"})

public class FlowBaseTest   {
	protected String processId;
	@Autowired
	protected  FlowEngineFacetsServiceImpl flowEngineFacets;
	
	@Autowired
	protected  FlowEngine flowEngine;
	
	@Before
	public   void setUpRunEnvNew() {
		//flowEngine = flowEngineFacets.getEngine();
	}
	
}
