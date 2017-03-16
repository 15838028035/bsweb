package com.lj.app.core.common.flows.spring;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.junit.Before;
import org.junit.Test;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

import com.lj.app.core.common.flows.Expression;

public class SpelExpressionTest {

	private Expression expression;
	
	@Before
	public void setUp(){
		expression = new SpelExpression();
	}
	
	@Test
	public void evalTest0() throws Exception {
		ExpressionParser parser = new SpelExpressionParser();  
        //------------使用SpEL创建数组-----------  
		org.springframework.expression.Expression exp=parser.parseExpression("new String[]{'Struts2','Hibernate','Spring'}");  
        System.out.println(exp.getValue(String.class));  
        // 创建二维数组  
        exp = parser.parseExpression(  "new int[2][4]");  
        System.out.println(exp.getValue(int.class));
        
        
        String expr ="#content";
        
    	Map<String, Object> args = new HashMap<String, Object>();
		args.put("content", "toTask2");
        
    	EvaluationContext context = new StandardEvaluationContext();
		for(Entry<String, Object> entry : args.entrySet()) {
			context.setVariable(entry.getKey(), entry.getValue());
		}
		
		 parser.parseExpression(expr).getValue(context,String.class);
		 
		 Expression e = new SpelExpression();  
		           // String
		 expr = "#a > #b ? '11111111' : '2222222222'";  
		            Map<String, Object> params = new HashMap<String, Object>();  
		            params.put("a", 34);  
		            params.put("b", 35);  
		            System.out.println(e.eval(String.class, expr, params));  
		 
	}
	
	@Test
	public void evalTest1() throws Exception {
		String expr ="#a > 20 ? '1':'2'";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("a", 5);
		expression.eval(String.class, expr, args);
	}
	
	@Test
	public void evalTest2() throws Exception {
		String expr ="#content == 200";
		
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("task2.operator", new String[]{"1"});
		args.put("content", 400);
		expression.eval(Boolean.class, expr, args);
	}

	
	@Test
	public void evalTest3() throws Exception {
		String expr ="#content";
		
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("content", "toTask2");
		String value = expression.eval(String.class, expr, args);
		assertEquals("toTask2",value);
	}
}
