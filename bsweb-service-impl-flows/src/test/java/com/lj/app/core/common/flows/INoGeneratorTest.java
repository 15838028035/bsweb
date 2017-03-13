package com.lj.app.core.common.flows;

import org.junit.Test;

import com.lj.app.core.common.flows.model.ProcessModel;


public class INoGeneratorTest {

	@Test
	public void generateTest() {
		INoGenerator DefaultNoGenerator = new DefaultNoGenerator();
		ProcessModel model = new ProcessModel();
		String generatorNo = DefaultNoGenerator.generate(model);
		System.out.println("generatorNo="+generatorNo);
	}
	
	@Test
	public void generateTest2() {
		INoGenerator DefaultNoGenerator = new CustomNoGenerator();
		ProcessModel model = new ProcessModel();
		String generatorNo = DefaultNoGenerator.generate(model);
		System.out.println("generatorNo="+generatorNo);
	}
	
}
