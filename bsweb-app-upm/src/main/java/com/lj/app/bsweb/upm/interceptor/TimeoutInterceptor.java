package com.lj.app.bsweb.upm.interceptor;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.lj.app.core.common.properties.PropertiesUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.opensymphony.xwork2.interceptor.PreResultListener;

/**
 * 
 * 超时拦截器
 *
 */
public class TimeoutInterceptor extends MethodFilterInterceptor implements PreResultListener {

  public static final int ONE_SECOND = 1000;
  private static final int DEFAULT_TIMEOUT_THREAD_SIZE = 50;
  private static final int DEFAULT_TIMEOUT_SECOND = 10;
  private static Log logger = LogFactory.getLog(TimeoutInterceptor.class);
  public static final String CHANGE_RESULT = "timeoutControlChangeResult";
  /**
   * 
   */
  private static final long serialVersionUID = -4165191346477151719L;
  public static final int TIMEOUT_SECOND = PropertiesUtil.getInt("timeoutsecond", DEFAULT_TIMEOUT_SECOND);
  public static final int TIMTOUT_THREAD_SIZE = PropertiesUtil.getInt("timeoutThreadSize", DEFAULT_TIMEOUT_THREAD_SIZE);
  public static final boolean IS_TIMEOUT_OPEN = PropertiesUtil.getBoolean("timeoutOpen", true);

  private static ExecutorService mainPool = null;
  private static ExecutorService checkPool = null;

  static {
    if (IS_TIMEOUT_OPEN) {
      mainPool = Executors.newFixedThreadPool(TIMTOUT_THREAD_SIZE);
      checkPool = Executors.newFixedThreadPool(TIMTOUT_THREAD_SIZE);
    }
  }

  Future<String> futureExe;

  @Override
  public void init() {
    super.init();
  }

  @Override
  protected String doIntercept(ActionInvocation invocation) throws Exception {

    if (!IS_TIMEOUT_OPEN) {
      return invocation.invoke();
    }

    final ActionInvocation invocationa = invocation;
    final ActionContext context = ServletActionContext.getContext();
    final HttpServletRequest request = ServletActionContext.getRequest();

    String sessionid = null;
    try {
      sessionid = ServletActionContext.getRequest().getSession().getId();
    } catch (Exception e) {
      logger.error("getSessionId error!~use randomId~~~~~");
      sessionid = String.valueOf(Math.random());
    }

    logger.warn("------TimeoutInterceptro invoked begin-----[sessionid==" + sessionid + "],url["
        + request.getRequestURI() + "]");

    Thread runThread = new Thread() {
      public void run() {
        try {
          ServletActionContext.setContext(context);
          ServletActionContext.setRequest(request);
          invocationa.invoke();
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    };

    TimeoutInterceptor.mainPool.execute(runThread);

    TimeCheckCallable a = new TimeCheckCallable(invocation, sessionid);
    futureExe = TimeoutInterceptor.checkPool.submit(a);
    invocation.addPreResultListener(this);

    return CHANGE_RESULT;
  }

  private boolean isAjax(HttpServletRequest request) {
    if (request != null && request.getHeader("x-requested-with") != null
        && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
      return true;
    }
    return false;
  }

  /**
   * 前置拦截
   */
  public void beforeResult(ActionInvocation invocation, String resultCode) {
    try {
      if (CHANGE_RESULT.equals(resultCode)) { // 主线程是changeResult状态
        String result = futureExe.get();
        HttpServletRequest request = ServletActionContext.getRequest();
        // 当超时或action结束后，result会改变，如果被改变成timeout表示超时，否则为正常返回(null-ajax;其它为页面跳转返回)
        if (result != null && result.equals("timeout")) {
          if (isAjax(request)) {
            // ajax超时需要重定向到特定的action,往前台写返回值
            String url = request.getRequestURI();
            if (isLoginAction(url)) {
              // 如果是登录的ajax请求，重定向到登录超时提示
              invocation.setResultCode("loginAjaxTimeOut");
            } else {
              // 其它ajax
              invocation.setResultCode("ajaxTimeOut");
            }
          } else {
            // 非ajax超时，直接重定向到超时页面
            invocation.setResultCode("timeout");
          }
        }
      } else {
        // new出来invoke action的线程会进此分支，沉睡至主线程执行完毕后释放
        int i = 0;
        while (i < TIMEOUT_SECOND && !invocation.isExecuted()) {
          Thread.sleep(ONE_SECOND);
          i++;
        }
        logger.warn("thread sleep===" + i);

        resultCode = null;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private boolean isLoginAction(String url) {
    return url.equalsIgnoreCase("/loginAction!login.action");
  }
}
