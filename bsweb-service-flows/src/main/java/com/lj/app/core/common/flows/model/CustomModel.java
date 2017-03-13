package com.lj.app.core.common.flows.model;

import java.lang.reflect.Method;
import java.util.Map;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.flows.handlers.IHandler;
import com.lj.app.core.common.util.ClassUtil;
import com.lj.app.core.common.util.ReflectUtil;
import com.lj.app.core.common.util.StringUtil;


/**
 * 自定义模型
 */
public class CustomModel extends WorkModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8796192915721758769L;

	/**
	 * 需要执行的class类路径
	 */
	private String clazz;
	/**
	 * 需要执行的class对象的方法名称
	 */
	private String methodName;
	/**
	 * 执行方法时传递的参数表达式变量名称
	 */
	private String args;
	/**
	 * 执行的返回值变量
	 */
	private String var;
	/**
	 * 加载模型时初始化的对象实例
	 */
	private Object invokeObject;
	
	public void exec(Execution execution) {
		if(invokeObject == null) {
			invokeObject = ClassUtil.newInstance(clazz);
		}
		if(invokeObject == null) {
			throw new FlowException("自定义模型[class=" + clazz + "]实例化对象失败");
		}
		
		if(invokeObject instanceof IHandler) {
			IHandler handler = (IHandler)invokeObject;
			handler.handle(execution);
		} else {
			Method method = ReflectUtil.findMethod(invokeObject.getClass(), methodName);
			if(method == null) {
				throw new FlowException("自定义模型[class=" + clazz + "]无法找到方法名称:" + methodName);
			}
			Object[] objects = getArgs(execution.getArgs(), args);
			Object returnValue = ReflectUtil.invoke(method, invokeObject, objects);
			if(StringUtil.isNotBlank(var)) {
				execution.getArgs().put(var, returnValue);
			}
		}
		//execution.getEngine().task().history(execution, this);
		runOutTransition(execution);
	}
	
	/**
	 * 根据传递的执行参数、模型的参数列表返回实际的参数对象数组
	 * @param execArgs 运行时传递的参数数据
	 * @param args 自定义节点需要的参数
	 * @return 调用自定义节点类方法的参数数组
	 */
	private Object[] getArgs(Map<String, Object> execArgs, String args) {
		Object[] objects = null;
		if(StringUtil.isNotBlank(args)) {
			String[] argArray = args.split(",");
			objects = new Object[argArray.length];
			for(int i = 0; i < argArray.length; i++) {
				objects[i] = execArgs.get(argArray[i]);
			}
		}
		return objects;
	}
	
	public String getClazz() {
		return clazz;
	}
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}
	public String getMethodName() {
		return methodName;
	}
	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	public String getArgs() {
		return args;
	}
	public void setArgs(String args) {
		this.args = args;
	}
	public String getVar() {
		return var;
	}
	public void setVar(String var) {
		this.var = var;
	}
}