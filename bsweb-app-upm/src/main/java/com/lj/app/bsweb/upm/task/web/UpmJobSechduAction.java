package com.lj.app.bsweb.upm.task.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.task.entity.UpmJobSechdu;
import com.lj.app.core.common.task.service.UpmJobSechduService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :UpmJobSechduAction.java
 * @description :UpmJobSechduAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/upmJobSechdu")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "upmJobSechduAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/task/upmJobSechdu-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmJobSechduAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/task/upmJobSechduList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmJobSechduAction")
public class UpmJobSechduAction extends AbstractBaseUpmAction<UpmJobSechdu> {
	
	 protected Logger logger = LoggerFactory.getLogger(UpmJobSechduAction.class);

	@Autowired
	private UpmJobSechduService upmJobSechduService;
	
	private UpmJobSechdu upmJobSechdu;
	
	public   BaseService getBaseService(){
		return upmJobSechduService;
	}
	
	public UpmJobSechdu getModel() {
		return upmJobSechdu;
	}

	@Override
	protected void prepareModel() throws Exception {
		
	}
	
}

