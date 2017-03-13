package com.lj.app.core.common.flows.spring;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.Expression;

public class SpelExpressionTest {

	private Expression expression;
	
	@Before
	public void setUp(){
		expression = new SpelExpression();
	}
	
	@Test
	public void evalTest1() throws Exception {
		String expr ="${content}";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task2.operator", new String[]{"1"});
		args.put("content", "toTask2");
		String value = expression.eval(String.class, expr, args);
		assertEquals("toTask2",value);
	}
	
	@Test
	public void evalTest2() throws Exception {
		String expr ="${content == 200}";
		
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task2.operator", new String[]{"1"});
		args.put("content", "toTask2");
		String value = expression.eval(String.class, expr, args);
		assertEquals("toTask2",value);
	}

	
	@Test
	public void evalTest3() throws Exception {
		String expr ="${content}";
		
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task2.operator", new String[]{"1"});
		args.put("content", "toTask2");
		String value = expression.eval(String.class, expr, args);
		assertEquals("toTask2",value);
	}
}
