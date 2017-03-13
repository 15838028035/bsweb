package com.lj.app.core.common.flows.spring;

import java.util.Map;
import java.util.Map.Entry;

import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

import com.lj.app.core.common.flows.Expression;

/**
 * Spring el表达式解析器
 */
public class SpelExpression implements Expression {
	ExpressionParser parser = new SpelExpressionParser();
	
	public <T> T eval(Class<T> T, String expr, Map<String, Object> args) {
		EvaluationContext context = new StandardEvaluationContext();
		for(Entry<String, Object> entry : args.entrySet()) {
			context.setVariable(entry.getKey(), entry.getValue());
		}
		return parser.parseExpression(expr).getValue(context, T);
	}
}
