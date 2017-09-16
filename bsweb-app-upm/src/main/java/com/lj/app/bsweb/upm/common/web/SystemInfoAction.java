package com.lj.app.bsweb.upm.common.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.web.AbstractBaseAction;

@Controller
@Namespace("/")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/systemInfo-input.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("systemInfoAction")

public class SystemInfoAction  extends AbstractBaseUpmAction<SystemInfo> {

	private SystemInfo systemInfo;
	
	@Override
	public SystemInfo getModel() {
		return systemInfo;
	}

	@Override
	public BaseService<SystemInfo> getBaseService() {
		return null;
	}

	@Override
	protected void prepareModel() throws Exception {
		getSystemInfo();
	}

	@Override
	public String input() throws Exception {
		return INPUT;
	}

	public SystemInfo getSystemInfo() {
		return systemInfo;
	}

	public void setSystemInfo(SystemInfo systemInfo) {
		this.systemInfo = systemInfo;
	}
	
	
}
