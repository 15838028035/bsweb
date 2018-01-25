package com.lj.app.bsweb.flows.interceptor;

import java.util.concurrent.Callable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionInvocation;

/**
 * 
 * 超时检查
 *
 */
public class TimeCheckCallable implements Callable<String> {

  private Log logger = LogFactory.getLog(TimeoutInterceptor.class);

  ActionInvocation actionInvocation;
  String sessionId;

  public TimeCheckCallable(ActionInvocation actionInvocation, String sessionId) {
    this.actionInvocation = actionInvocation;
    this.sessionId = sessionId;
  }

  /**
   * 回调
   */
  public String call() throws Exception {

    int i = 0;
    while (i < TimeoutInterceptor.TIMEOUT_SECOND) {
      Thread.sleep(TimeoutInterceptor.ONE_SECOND);
      i++;
      if (actionInvocation.getResultCode() == null
          || !TimeoutInterceptor.CHANGE_RESULT.equals(actionInvocation.getResultCode())) {
        logger.warn("true2-return[sessionId==" + sessionId + "]==========" + actionInvocation.getResultCode());
        return actionInvocation.getResultCode();
      }
      logger.warn("checkTimes[sessionId==" + sessionId + "]======" + i);

    }
    logger.warn("true2-return[sessionId==" + sessionId + "]==========timeout");
    return "timeout";
  }

  public String getSessionId() {
    return sessionId;
  }

  public void setSessionId(String sessionId) {
    this.sessionId = sessionId;
  }

}
