package com.lj.app.bsweb.upm.upmNotice.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.notify.entity.UpmNotice;
import com.lj.app.core.common.notify.service.UpmNoticeService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :通知管理
 * @description :UpmNoticeAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/upmNotice")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "upmNoticeAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/upmNotice/upmNotice-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmNoticeAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/upmNotice/upmNoticeList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmNoticeAction")
public class UpmNoticeAction extends AbstractBaseUpmAction<UpmNotice> {
	
	 protected Logger logger = LoggerFactory.getLogger(UpmNoticeAction.class);

	@Autowired
	private UpmNoticeService upmNoticeService;
	
	private UpmNotice upmNotice;
	
	public   BaseService getBaseService(){
		return upmNoticeService;
	}
	
	public UpmNotice getModel() {
		return upmNotice;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (upmNotice.getId() != null) {
			upmNotice = (UpmNotice)upmNoticeService.getInfoByKey(upmNotice.getId());
		} else {
			upmNotice = new UpmNotice();
		}
	}

	public UpmNoticeService getUpmNoticeService() {
		return upmNoticeService;
	}

	public void setUpmNoticeService(UpmNoticeService upmNoticeService) {
		this.upmNoticeService = upmNoticeService;
	}

	public UpmNotice getUpmNotice() {
		return upmNotice;
	}

	public void setUpmNotice(UpmNotice upmNotice) {
		this.upmNotice = upmNotice;
	}
	
}

