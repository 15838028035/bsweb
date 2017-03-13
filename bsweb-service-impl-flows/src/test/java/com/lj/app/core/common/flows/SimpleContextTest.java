package com.lj.app.core.common.flows;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.lj.app.core.common.flows.parser.impl.StartParser;

public class SimpleContextTest {

	@Test
	public void findTest() {
		SimpleContext SimpleContext = new SimpleContext();
		StartParser obj = SimpleContext.findByName("start", StartParser.class);
		assertNotNull(obj);
		
	}

}
