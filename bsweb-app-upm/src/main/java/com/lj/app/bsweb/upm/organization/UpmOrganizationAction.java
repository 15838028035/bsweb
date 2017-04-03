package com.lj.app.bsweb.upm.organization;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.UpmOrganization;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmOrganizationService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :UpmOrganizationAction.java
 * @description :UpmOrganizationAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/upmOrganization")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "upmOrganizationAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/upmOrganization/upmOrganization-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmOrganizationAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/upmOrganization/upmOrganizationList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmOrganizationAction")
public class UpmOrganizationAction extends AbstractBaseUpmAction<UpmOrganization> {
	
	 protected Logger logger = LoggerFactory.getLogger(UpmOrganizationAction.class);
	 
	private Integer orgId;
		
	@Autowired
	private UpmOrganizationService upmOrganizationService;
	
	private UpmOrganization upmOrganization;
	
	public   BaseService getBaseService(){
		return upmOrganizationService;
	}
	
	public UpmOrganization getModel() {
		return upmOrganization;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (orgId != null) {
			upmOrganization = (UpmOrganization)upmOrganizationService.getInfoByKey(orgId);
		} else {
			upmOrganization = new UpmOrganization();
		}
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			page.setFilters(upmOrganization);
			
			if (StringUtil.isNotBlank(this.getSidx())) {
				String orderBy = PageTool.convert(this.getSidx()) + " "+ this.getSord();
				page.setSortColumns(orderBy);
			}
			
			condition.put(CREATE_BY, getLoginUserId());
			
			upmOrganizationService.findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public String input() throws Exception {
		return INPUT;
	}
	
	@Override
	public String save() throws Exception {
		
	try{
			if (operate != null && operate.equals("edit")) {
				upmOrganization.setUpdateBy(getLoginUserId());
				upmOrganization.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				upmOrganizationService.updateObject(upmOrganization);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				upmOrganization.setCreateBy(getLoginUserId());
				upmOrganization.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				upmOrganizationService.insertObject(upmOrganization);
				returnMessage = CREATE_SUCCESS;
			}
			
			return LIST;
		}catch(Exception e){
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}
		
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public UpmOrganizationService getUpmOrganizationService() {
		return upmOrganizationService;
	}

	public void setUpmOrganizationService(
			UpmOrganizationService upmOrganizationService) {
		this.upmOrganizationService = upmOrganizationService;
	}
	
}

