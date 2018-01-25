package com.lj.app.bsweb.flows.user.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.flows.AbstractBaseFlowsAction;
import com.lj.app.core.common.api.SecurityApiService;
import com.lj.app.core.common.base.entity.UpmUser;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmUserService;
import com.lj.app.core.common.properties.PropertiesUtil;
import com.lj.app.core.common.security.SecurityConstants;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.SessionCode;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

/**
 * 
 * 登陆
 *
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/")
@Results({ 
        @Result(name = SecurityConstants.LOGIN, 
            location = "/login.jsp"),
        @Result(name = SecurityConstants.INDEX, 
            location = "/index.jsp", type = AbstractBaseAction.REDIRECT),
        @Result(name = SecurityConstants.NOPERMISSION, 
            location = "/jsp/common/nopermission.jsp"),
        @Result(name = SecurityConstants.SYSERROR, 
            location = "/jsp/common/500.jsp")
        })
@Action("loginAction")
public class LoginAction extends AbstractBaseFlowsAction<UpmUser> {

  private static Log logger = LogFactory.getLog(LoginAction.class);
  private String loginNo;
  private String pwd;
  private String token;

  /**
   * 验证码
   */
  private String identifyingCode;

  @Autowired
  private UpmUserService<UpmUser> upmUserService;

  @Autowired
  private SecurityApiService securityApiService;

  public BaseService<UpmUser> getBaseService() {
    return upmUserService;
  }

  /**
   * 去登陆
   * @return 页面
   * @throws Exception 异常
   */
  public String goToLogin() throws Exception {
    UpmUser upmUser = (UpmUser) Struts2Utils.getSession().getAttribute(SessionCode.MAIN_ACCT);
    if (upmUser != null) {
      return  goToIndex();
    }
    return SecurityConstants.LOGIN;
  }

  /**
   * 登陆
   * @return 页面
   * @throws Exception 异常
   */
  public String login() throws Exception {
    String method = Struts2Utils.getRequest().getMethod();

    return goToIndex();
  }

  public String goToIndex() throws Exception {
    return SecurityConstants.INDEX;
  }

  public UpmUser getModel() {
    return null;
  }

  @Override
  protected void prepareModel() throws Exception {

  }

  /**
   * 退出
   * @return 页面
   * @throws Exception 异常
   */
  public String logout() throws Exception {
    if (Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT) != null) {
      Struts2Utils.getSession().invalidate();
    }
    return goToLogin();
  }

  /**
   * 获得测试验证码
   * 
   * @return json
   */
  public String getRand() {
    String springProfilesActive = PropertiesUtil.getProperty("spring.profiles.active");

    if (StringUtil.isBlank(springProfilesActive)) {
      AjaxResult ar = new AjaxResult();
      ar.setOpResult("请配置开发模式");
      Struts2Utils.renderJson(ar);
      return null;
    }

    if (StringUtil.isEqual(springProfilesActive, "dev") || StringUtil.isEqual(springProfilesActive, "test")) {
      String rand = (String) Struts2Utils.getSession().getAttribute("rand");
      AjaxResult ar = new AjaxResult();
      ar.setOpResult(rand);
      Struts2Utils.renderJson(ar);
      return null;
    }

    AjaxResult ar = new AjaxResult();
    ar.setOpResult("");
    Struts2Utils.renderJson(ar);
    return null;
  }

  public static Log getLogger() {
    return logger;
  }

  public static void setLogger(Log logger) {
    LoginAction.logger = logger;
  }

  public String getLoginNo() {
    return loginNo;
  }

  public void setLoginNo(String loginNo) {
    this.loginNo = loginNo;
  }

  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public UpmUserService getUpmUserService() {
    return upmUserService;
  }

  public void setUpmUserService(UpmUserService upmUserService) {
    this.upmUserService = upmUserService;
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public String getIdentifyingCode() {
    return identifyingCode;
  }

  public void setIdentifyingCode(String identifyingCode) {
    this.identifyingCode = identifyingCode;
  }

  public SecurityApiService getSecurityApiService() {
    return securityApiService;
  }

  public void setSecurityApiService(SecurityApiService securityApiService) {
    this.securityApiService = securityApiService;
  }

}
