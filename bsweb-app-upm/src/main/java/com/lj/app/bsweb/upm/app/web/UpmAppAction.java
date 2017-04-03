package com.lj.app.bsweb.upm.app.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.bsweb.upm.app.entity.UpmApp;
import com.lj.app.bsweb.upm.app.service.UpmAppService;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.web.AbstractBaseAction;

@Controller
@Namespace("/jsp/upmApp")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/upmApp/upmApp-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmAppAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/upmApp/upmAppList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmAppAction")
public class UpmAppAction extends AbstractBaseUpmAction<UpmApp> {
	
	private java.lang.Integer id;

	@Autowired
	private UpmAppService<UpmApp> upmAppService;
	
	private UpmApp upmApp;
	
	public   BaseService<UpmApp> getBaseService(){
		return upmAppService;
	}
	
	public UpmApp getModel() {
		return upmApp;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if(id!=null){
		upmApp = (UpmApp)upmAppService.getInfoByKey(id);
		}else {
			upmApp = new UpmApp();
		}
	}
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public UpmAppService<UpmApp> getUpmAppService() {
		return upmAppService;
	}

	public void setUpmAppService(UpmAppService<UpmApp> upmAppService) {
		this.upmAppService = upmAppService;
	}

	public UpmApp getUpmApp() {
		return upmApp;
	}

	public void setUpmApp(UpmApp upmApp) {
		this.upmApp = upmApp;
	}
}

