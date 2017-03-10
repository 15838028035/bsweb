package com.lj.app.bsweb.upm.sso;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.web.Struts2Utils;

/**
 * 系统资源单点登录
 * 
 */
@Namespace("/jsp/sso/")
@Results( {
		@Result(name = "login", location = "login.jsp"),
		@Result(name = "success", location = "welcome.jsp"),
		@Result(name = "sd-quick-sso", location = "/jsp/sso/sd-quick-sso.jsp"),
		
	})
@Action("sysResSso3")
public class SysResSsoAction extends AbstractBaseUpmAction {
	private static final long serialVersionUID = 4404642301263314505L;
	private static Log log = LogFactory.getLog(SysResSsoAction.class);
	
	/**
	 * 点击单点登录按钮触发的操作
	 * crt
	 * @return
	 */
	public String doSso() throws Exception{
		Struts2Utils.renderText(TRUE);
		return null;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
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
	public String delete() throws Exception {
		return null;
	}

	@Override
	protected void prepareModel() throws Exception {
		
	}

	@Override
	public BaseService getBaseService() {
		// TODO Auto-generated method stub
		return null;
	}
	
}	
