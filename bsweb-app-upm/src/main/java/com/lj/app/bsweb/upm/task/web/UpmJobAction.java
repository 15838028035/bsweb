package com.lj.app.bsweb.upm.task.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.task.entity.UpmJob;
import com.lj.app.core.common.task.entity.UpmJobSechdu;
import com.lj.app.core.common.task.service.UpmJobSechduService;
import com.lj.app.core.common.task.service.UpmJobService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :UpmJobAction.java
 * @description :UpmJobAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/task")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "upmJobAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/task/upmJob-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmJobAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/task/upmJobList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmJobAction")
public class UpmJobAction extends AbstractBaseUpmAction<UpmJob> {
	
	 protected Logger logger = LoggerFactory.getLogger(UpmJobAction.class);

	@Autowired
	private UpmJobService upmJobService;
	@Autowired
	private UpmJobSechduService<UpmJobSechdu> upmJobSechduService;
	
	private UpmJob upmJob;
	private java.lang.Integer id;
	
	public   BaseService getBaseService(){
		return upmJobService;
	}
	
	public UpmJob getModel() {
		return upmJob;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			upmJob = (UpmJob)upmJobService.getInfoByKey(id);
		} else {
			upmJob = new UpmJob();
		}
	}

	public String isProcessJobStatus() throws Exception {
		boolean result = upmJobSechduService.isProcessJobStatus(this.getId());
		Struts2Utils.renderText(String.valueOf(result));
		return null;
	}
	
	public String handScheduler() throws Exception {
		try {
			upmJobSechduService.runJob(this.getId());
			Struts2Utils.renderText("执行成功");
		} catch (Exception e) {
			Struts2Utils.renderText("执行失败");
		}
		return null;
	}
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
}

