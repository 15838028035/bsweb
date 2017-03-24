package com.lj.app.bsweb.upm.user.web;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.bsweb.upm.role.service.UpmPermissionService;
import com.lj.app.core.common.api.SecurityApiService;
import com.lj.app.core.common.audit.CMCode;
import com.lj.app.core.common.base.entity.UpmUser;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmUserService;
import com.lj.app.core.common.notify.email.MailSender;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.security.CMSecurityContext;
import com.lj.app.core.common.security.SecurityConstants;
import com.lj.app.core.common.util.SessionCode;
import com.lj.app.core.common.util.SpringContextHolder;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.Struts2Utils;

import net.sf.json.JSONObject;

@Controller
@Namespace("/")
@Results( {
		@Result(name = SecurityConstants.LOGIN, location = "/login.jsp"),
		@Result(name = SecurityConstants.INDEX, location = "/index.jsp", type = "redirect"),
		@Result(name = SecurityConstants.NOPERMISSION, location = "/jsp/common/nopermission.jsp"),
		@Result(name = SecurityConstants.SYSERROR, location = "/jsp/common/500.jsp") })

@Action("loginAction")
public class LoginAction extends AbstractBaseUpmAction<UpmUser> {

	private static Log logger = LogFactory.getLog(LoginAction.class);
	private String loginNo;
	private String pwd;
	private String token;
	
	/**
	 * 验证码
	 */
	private String identifyingCodeInput;
	
	@Autowired
	private UpmUserService upmUserService;
	
	@Autowired
	private SecurityApiService securityApiService;
	
	@Autowired
	private MailSender mailSender;

	public   BaseService getBaseService(){
		return upmUserService;
	}
	
	public String login() throws Exception {
		if (StringUtil.isBlank(loginNo)|| StringUtil.isBlank(pwd)) {
			return SecurityConstants.LOGIN;
		}

		UpmUser user = new UpmUser();
		user.setLoginNo(loginNo);
		user.setPwd(pwd);
		
		List<UpmUser> userList = upmUserService.findBaseModeList(user);
				
		UpmUser loginUser = null;
		if (StringUtil.isBlank(loginNo)) {
			logger.debug("no user loginNo:" + userList + " found.");
			return SecurityConstants.LOGIN;
		} else {
			if (userList!=null && userList.size()>0) {
				loginUser = userList.get(0);
			}else {
				logger.debug("no user loginNo:" + userList + " found.");
				return SecurityConstants.LOGIN;
			}
			
			String encryptPwd = pwd;
			//FIXME: DesUtil.encrypt(pwd); 
			String dbpwd = loginUser.getPwd();
			if (!encryptPwd.equals(dbpwd)) {
				logger.info("password wrong!!!");
				return SecurityConstants.LOGIN;
			} else if (StringUtil.isEqual(loginUser.getLockStatus(),"1")) {
				logger
						.info("lockstatus is not 0(common status),so login denied!");
				return SecurityConstants.LOGIN;
			}
		}
		
		// FIXME loginUser.setLastLoginTime(new Date());
		
		HttpSession session2 = Struts2Utils.getSession();// 清空session
		if (session2 != null) {
			session2.invalidate();
		}
		Cookie[] cookies = Struts2Utils.getRequest().getCookies();
		if (cookies != null && cookies.length > 0) {
			cookies[0].setMaxAge(0);
		}

		if (Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT) == null) {
			UpmPermissionService upmPermissionService = SpringContextHolder.getBean(UpmPermissionService.class);
			
			logger.info("needValidateUrlSet load......");
			
			CMSecurityContext securityContext = new CMSecurityContext();
			
			securityContext.setMainAcctId(Long.getLong(String.valueOf(user.getId())));
			
			String contextPath = Struts2Utils
					.getRequest().getContextPath();
			
			 securityContext =	upmPermissionService.getSecurityContext(loginUser.getId(),contextPath , SecurityConstants.APPID_UPM);
			 securityContext.setLoginName(loginUser.getUserName());
			
			Struts2Utils.getSession().setAttribute(SecurityConstants.SECURITY_CONTEXT, securityContext);
			Struts2Utils.getSession().setAttribute(SessionCode.MAIN_ACCT,loginUser);
					
		}
		//FIXME 修改为从配置文件读取
		String isPermissionTree = "Y";
		if (isPermissionTree != null && isPermissionTree.equals("Y")) {
			Struts2Utils.getSession().setAttribute("isPermissionTree",
					isPermissionTree);
		} else {
			Struts2Utils.getSession().setAttribute("isPermissionTree", "N");
		}
		
		Struts2Utils.getSession().setAttribute(SessionCode.MAIN_ACCT,loginUser);
		Struts2Utils.getSession().setAttribute(SessionCode.MAIN_ACCT_ID,loginUser.getId());
		Struts2Utils.getSession().setAttribute(SessionCode.LOGIN_NAME,loginUser.getLoginNo());
		Struts2Utils.getSession().setAttribute(SessionCode.USER_NAME,loginUser.getUserName());
		
		Struts2Utils.getResponse().sendRedirect(Struts2Utils.getRequest().getContextPath() + "/index.jsp");
		return null;
	}
	
	/**
	 * 单点登录系统
	 * @return
	 * @throws Exception
	 */
	public String ssoLogin() throws Exception {
		logger.warn("==token==" + token);
		
		if(StringUtil.isBlank(token)){
			return null;
		}
		
		String mainAcctName = null;
		if (Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT) != null) {
			return SecurityConstants.INDEX;
		}
		
		// 验证token
		if (StringUtil.isNotBlank(token)) {
			mainAcctName = securityApiService.tokenValidate(token);
		}
		
		UpmUser loginUser = new UpmUser();
		loginUser.setLoginNo(mainAcctName);
		
		List<UpmUser> userList = upmUserService.findBaseModeList(loginUser);
		
		if (userList!=null && userList.size() > 0) {
			loginUser = userList.get(0);
		} else {
			return SecurityConstants.SYSERROR;
		}
		
		UpmPermissionService upmPermissionService = SpringContextHolder.getBean(UpmPermissionService.class);
		
		logger.info("needValidateUrlSet load......");
		
		CMSecurityContext securityContext = new CMSecurityContext();
		
		securityContext.setMainAcctId(Long.getLong(String.valueOf(loginUser.getId())));
		
		String contextPath = Struts2Utils.getRequest().getContextPath();
		
		 securityContext =	upmPermissionService.getSecurityContext(loginUser.getId(),contextPath , SecurityConstants.APPID_UPM);
		 securityContext.setLoginName(loginUser.getUserName());
		
		Struts2Utils.getSession().setAttribute(SecurityConstants.SECURITY_CONTEXT, securityContext);
		Struts2Utils.getSession().setAttribute(SessionCode.MAIN_ACCT,loginUser);
		Struts2Utils.getSession().setAttribute(SessionCode.MAIN_ACCT_ID,loginUser.getId());
		Struts2Utils.getSession().setAttribute(SessionCode.LOGIN_NAME,loginUser.getLoginNo());
		Struts2Utils.getSession().setAttribute(SessionCode.USER_NAME,loginUser.getUserName());
		
		Struts2Utils.getResponse().sendRedirect(Struts2Utils.getRequest().getContextPath() + "/index.jsp");
		return null;
		
	}
	
	/***
	 *根据用户名、密码查找用户信息
	 * @return
	 * @throws Exception
	 */
	public String findUserInfoApi() throws Exception {
		if (StringUtil.isBlank(loginNo)|| StringUtil.isBlank(pwd)) {
			return SecurityConstants.LOGIN;
		}
		UpmUser user = new UpmUser();
		user.setLoginNo(loginNo);
		user.setPwd(pwd);
		user.setLockStatus(CMCode.LOCK_SATE_0);
		
		List<UpmUser> userList = upmUserService.findBaseModeList(user);
		
		UpmUser upmUser=null;
		if(userList!=null && userList.size()>0) {
			 upmUser = (UpmUser)userList.get(0);
		}
		JSONObject jsonObj = new JSONObject();
		
		Struts2Utils.renderText(PageTool.jsonObjectToJsonJQGrid(jsonObj.fromObject(upmUser)));
		return null;
	}
	
	public UpmUser getModel() {
		return null;
	}
	
	public boolean identifyingCodeCheck() {
		Integer passwordCheckCount = (Integer) Struts2Utils.getSession()
				.getAttribute(SessionCode.PASSWORD_CHECK_COUNT);
		String rand = (String) Struts2Utils.getSession().getAttribute("rand");
		Integer passwordErrorMaxTimes = (Integer) Struts2Utils.getSession()
				.getServletContext().getAttribute("passwordErrorMaxTimes");
		return upmUserService.identifyingCodeCheck(passwordCheckCount, rand,
				passwordErrorMaxTimes, identifyingCodeInput);
	}
	
	public String passwordCheck() throws Exception{
		HttpSession session2 = Struts2Utils.getSession();// 清空session
		Integer passwordCheckCountInit = (Integer) session2
				.getAttribute(SessionCode.PASSWORD_CHECK_COUNT);
		String rand = (String) session2.getAttribute("rand");
		if (session2 != null) {
			session2.invalidate();
		}
		Cookie[] cookies = Struts2Utils.getRequest().getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if (cookie.getName() != null
						&& cookie.getName().equalsIgnoreCase("JSESSIONID")) {
					cookie.setMaxAge(0);
				}
			}
		}
		Struts2Utils.getSession().setAttribute("StaticPwdCheckForLogin", "Y");
		
		HttpSession session = Struts2Utils.getSession();
		if (passwordCheckCountInit == null) {
			passwordCheckCountInit = 0;
			session.setAttribute(SessionCode.PASSWORD_CHECK_COUNT,
					passwordCheckCountInit);
		} else {
			session.setAttribute(SessionCode.PASSWORD_CHECK_COUNT,
					passwordCheckCountInit);
		}
		if (rand != null) {
			session.setAttribute("rand", rand);
		}
		String smKey = Struts2Utils.getParameter("smKey");
		String dateString = Struts2Utils.getParameter("dateString");
		
		
		UpmUser user = new UpmUser();
		user.setLoginNo(loginNo);
		user.setPwd(pwd);
		user.setLockStatus(CMCode.LOCK_SATE_0);
		
		UpmUser loginUser = null;
		
		List<UpmUser> userList = upmUserService.findBaseModeList(user);
		
		if (userList!=null && userList.size()>0) {
			loginUser = userList.get(0);
		}else {
			logger.debug("no user loginNo:" + userList + " found.");
			return SecurityConstants.LOGIN;
		}
		
		String encryptPwd = pwd;
		//FIXME: DesUtil.encrypt(pwd); 
		String dbpwd = loginUser.getPwd();
		if (!encryptPwd.equals(dbpwd)) {
			logger.info("password wrong!!!");
			Struts2Utils.renderText("pwdError");
		} 
		
		// 检查验证码
		if (identifyingCodeCheck()) {
			Struts2Utils.renderText("success");
		} else {
			Struts2Utils.renderText("NidentifyingCodeCheckError");
		}
		return null;
	}
	
	
	@Override
	public String list() throws Exception {
		return null;
	}


	@Override
	public String input() throws Exception {
		return null;
	}


	@Override
	public String save() throws Exception {
		return null;
	}

	@Override
	protected void prepareModel() throws Exception {
		
	}

	public String getLoginMode() throws Exception {
		String loginMode ="dev";
		logger.warn("==loginMode==" + loginMode);
		if (loginMode != null){
			Struts2Utils.renderText(loginMode);
		}else {
			Struts2Utils.renderText("product");
		}
		return null;
	}

	public String logout() {
		if (Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT) != null) {
			Struts2Utils.getSession().invalidate();
		}

		return SecurityConstants.LOGIN;
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
}
