package com.lj.app.bsweb.upm.user.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.bsweb.upm.role.entity.UpmPermission;
import com.lj.app.bsweb.upm.role.service.UpmPermissionService;
import com.lj.app.core.common.api.SecurityApiService;
import com.lj.app.core.common.audit.CMCode;
import com.lj.app.core.common.base.entity.UpmUser;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmUserService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.properties.PropertiesFromTableUtil;
import com.lj.app.core.common.properties.PropertiesUtil;
import com.lj.app.core.common.security.CMSecurityContext;
import com.lj.app.core.common.security.DesUtil;
import com.lj.app.core.common.security.SecurityConstants;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.SessionCode;
import com.lj.app.core.common.util.SpringContextHolder;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

import net.sf.json.JSONObject;

@ParentPackage("timeout")
@InterceptorRefs({
	@InterceptorRef("crudStack"),
	@InterceptorRef("timeoutInterceptor")
})

@Controller
@Namespace("/")
@Results( {
		@Result(name = SecurityConstants.LOGIN, location = "/login.jsp"),
		@Result(name = SecurityConstants.INDEX, location = "/index.jsp",type=AbstractBaseAction.REDIRECT),
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
	private String identifyingCode;
	
	@Autowired
	private UpmUserService<UpmUser> upmUserService;
	
	@Autowired
	private SecurityApiService securityApiService;
	
	@Autowired
	private UpmPermissionService<UpmPermission> upmPermissionService;
	
	private List<UpmPermission> upmPermissionList;//权限列表

	public   BaseService<UpmUser> getBaseService(){
		return upmUserService;
	}
	
	public String goToLogin() throws Exception {
		String upmTeachMobile = PropertiesFromTableUtil.getProperty("upmTeachMobile");
		String upmWeiXinCode = PropertiesFromTableUtil.getProperty("upmWeiXinCode");
		String upmEmailCode = PropertiesFromTableUtil.getProperty("upmEmailCode");
		
		Struts2Utils.getRequest().setAttribute("upmTeachMobile", upmTeachMobile);
		Struts2Utils.getRequest().setAttribute("upmWeiXinCode", upmWeiXinCode);
		Struts2Utils.getRequest().setAttribute("upmEmailCode", upmEmailCode);
		return SecurityConstants.LOGIN;
	}
	
	public String login() throws Exception {
		String method = Struts2Utils.getRequest().getMethod();
		if ("GET".equalsIgnoreCase(method)) {
			addActionError("不支持get请求");
			return SecurityConstants.LOGIN;
		}
		
		String rand = (String) Struts2Utils.getSession().getAttribute("rand");
		if (StringUtil.isBlank(loginNo)|| StringUtil.isBlank(pwd)|| StringUtil.isBlank(identifyingCode) ||StringUtil.isBlank(rand)) {
			addActionError("参数不能为空");
			return SecurityConstants.LOGIN;
		}
		
		if(!identifyingCode.equalsIgnoreCase(rand)){//验证码错误
			addActionError("验证码错误");
			return SecurityConstants.LOGIN;
		}
		
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("conditionWhere", " and  (login_no='" + loginNo+"' or mobile='" + loginNo + "') and lock_status<>'1' ");
		
		List<UpmUser> userList = upmUserService.findBaseModeList(condition);
	
		if (userList==null || userList.size()==0) {
			addActionError("用户不存在");
			return SecurityConstants.LOGIN;
		}
		
		UpmUser loginUser = userList.get(0);
		
		String encryptPwd  = DesUtil.encrypt(pwd); 
		String dbpwd = loginUser.getPwd();
		if (!encryptPwd.equals(dbpwd)) {
			addActionError("密码错误");
			logger.info("password wrong!!!");
			return SecurityConstants.LOGIN;
		} else if (StringUtil.isEqual(loginUser.getLockStatus(),"1")) {
			addActionError("账号被加锁,无法登陆");
			logger
					.info("lockstatus is not 0(common status),so login denied!");
			return SecurityConstants.LOGIN;
		}
		
		
		HttpSession session2 = Struts2Utils.getSession();// 清空session
		if (session2 != null) {
			session2.invalidate();
		}

		if (Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT) == null) {
			UpmPermissionService upmPermissionService = SpringContextHolder.getBean(UpmPermissionService.class);
			
			logger.info("needValidateUrlSet load......");
			
			CMSecurityContext securityContext = new CMSecurityContext();
			
			securityContext.setMainAcctId(Long.getLong(String.valueOf(loginUser.getId())));
			
			String contextPath = Struts2Utils.getRequest().getContextPath();
			
			 securityContext =	upmPermissionService.getSecurityContext(loginUser.getId(),contextPath , SecurityConstants.APPID_UPM);
			 securityContext.setLoginName(loginUser.getUserName());
			
			 upmPermissionList = upmPermissionService.findPermissionByUserId(loginUser.getId(),appId,"MENU");
			 
			Struts2Utils.getSession().setAttribute(SecurityConstants.SECURITY_CONTEXT, securityContext);
			Struts2Utils.getSession().setAttribute(SessionCode.MAIN_ACCT,loginUser);
			Struts2Utils.getSession().setAttribute(SessionCode.APP_MENU_PERMISSION_LIST,upmPermissionList);
					
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
		
		return goToIndex();
	}
	
	public String goToIndex() throws Exception {
		return SecurityConstants.INDEX;
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
		
		return goToIndex();
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

	public String logout()  throws Exception{
		if (Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT) != null) {
			Struts2Utils.getSession().invalidate();
		}

		return goToLogin();
	}
	
	/**
	 * 获得测试验证码
	 * @return
	 */
	public String getRand() {
		String springProfilesActive = PropertiesUtil.getProperty("spring.profiles.active");
		
		if(StringUtil.isBlank(springProfilesActive)){
			AjaxResult ar = new AjaxResult();
			ar.setOpResult("请配置开发模式");
			Struts2Utils.renderJson(ar);
			return null;
		}
		
		if(StringUtil.isEqual(springProfilesActive, "dev")||StringUtil.isEqual(springProfilesActive, "test")){
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

	public UpmPermissionService<UpmPermission> getUpmPermissionService() {
		return upmPermissionService;
	}

	public void setUpmPermissionService(UpmPermissionService<UpmPermission> upmPermissionService) {
		this.upmPermissionService = upmPermissionService;
	}

	public List<UpmPermission> getUpmPermissionList() {
		return upmPermissionList;
	}

	public void setUpmPermissionList(List<UpmPermission> upmPermissionList) {
		this.upmPermissionList = upmPermissionList;
	}

}
