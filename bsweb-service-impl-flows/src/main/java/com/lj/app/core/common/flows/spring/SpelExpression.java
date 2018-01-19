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

  /**
   * 根据表达式串、参数解析表达式并返回指定类型
   * 
   * @param t
   *          返回类型
   * @param expr
   *          表达式串
   * @param args
   *          参数列表
   * @return T 返回对象
   */
  public <T> T eval(Class<T> t, String expr, Map<String, Object> args) {
    EvaluationContext context = new StandardEvaluationContext();
    for (Entry<String, Object> entry : args.entrySet()) {
      context.setVariable(entry.getKey(), entry.getValue());
    }
    return parser.parseExpression(expr).getValue(context, t);
  }
}
