package com.lj.app.bsweb.upm.interceptor;

import java.util.Date;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.lj.app.core.common.base.entity.UpmSysLog;
import com.lj.app.core.common.base.service.UpmSysLogService;
import com.lj.app.core.common.util.SessionCode;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 
 * 日志拦截
 *
 */
public class SysLogInterceptor extends AbstractInterceptor {

  private static final long serialVersionUID = 276741467699160227L;

  public  final String[] excludeActionClassNames = new String[] {};// 需要排除的Action类名称
  public  final String[] excludeActionMethodNames = new String[] {};// 需要排除的Action方法名称

  @Autowired
  private UpmSysLogService upmSysLogService;

  @Override
  public String intercept(ActionInvocation invocation) throws Exception {
    // invocation.invoke();
    String result = invocation.invoke();
    Object action = invocation.getAction();

    String actionClassName = action.getClass().getName();
    String actionMethodName = invocation.getProxy().getMethod();
    if (ArrayUtils.contains(excludeActionClassNames, actionClassName)) {
      return null;
    }
    if (ArrayUtils.contains(excludeActionMethodNames, actionMethodName)) {
      return null;
    }

    StringBuffer sb = new StringBuffer();

    Map<String, Object> map = invocation.getInvocationContext().getParameters();
    Set<String> keys = map.keySet();
    sb.append("");
    for (String key : keys) {
      sb.append(key + "=" + ((Object[]) map.get(key))[0] + "&");
    }
    sb.append(" ");

    // String ip = IPUtil.getIPAddr(ServletActionContext.getRequest());
    UpmSysLog upmSysLog = new UpmSysLog();
    upmSysLog.setUserName((String) Struts2Utils.getSessionAttribute(SessionCode.LOGIN_NAME));
    upmSysLog.setOperation(actionClassName);
    upmSysLog.setMethod(actionMethodName);
    upmSysLog.setParams(sb.toString());
    // upmSysLog.setIp(ip);
    upmSysLog.setReateDate(new Date());

    upmSysLogService.insertObject(upmSysLog);
    return result;
  }

}
