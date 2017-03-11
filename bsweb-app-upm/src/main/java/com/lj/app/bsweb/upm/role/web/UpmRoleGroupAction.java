package com.lj.app.bsweb.upm.role.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.bsweb.upm.role.entity.UpmRoleGroup;
import com.lj.app.bsweb.upm.role.service.UpmRoleGroupService;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;


@Controller
@Namespace("/jsp/role")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/role/upmRoleGroup-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmRoleGroupAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/role/upmRoleGroupList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmRoleGroupAction")
public class UpmRoleGroupAction extends AbstractBaseUpmAction<UpmRoleGroup> {
	
	private java.lang.Integer id;
	private String groupCode;
	private String appId;
	private String groupName;

	@Autowired
	private UpmRoleGroupService<UpmRoleGroup> upmRoleGroupService;
	
	private UpmRoleGroup upmRoleGroup;
	
	public   BaseService<UpmRoleGroup> getBaseService(){
		return upmRoleGroupService;
	}
	
	public UpmRoleGroup getModel() {
		upmRoleGroup = (UpmRoleGroup)upmRoleGroupService.getInfoByKey(id);
		return upmRoleGroup;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		upmRoleGroup = (UpmRoleGroup)upmRoleGroupService.getInfoByKey(id);
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			condition.put("groupCode",  groupCode);
			condition.put("appId",  appId);
			condition.put("groupName",  groupName);
			upmRoleGroupService.findPageList(page, condition);
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
		  if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT)) {
				upmRoleGroup.setId(id);
				upmRoleGroup.setGroupCode(groupCode);
				upmRoleGroup.setAppId(appId);
				upmRoleGroup.setGroupName(groupName);
				upmRoleGroup.setUpdateBy(getLoginUserId());
				upmRoleGroup.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				upmRoleGroupService.updateObject(upmRoleGroup);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				upmRoleGroup = new UpmRoleGroup();
				upmRoleGroup.setId(id);
				upmRoleGroup.setGroupCode(groupCode);
				upmRoleGroup.setAppId(appId);
				upmRoleGroup.setGroupName(groupName);
				
				upmRoleGroup.setCreateBy(getLoginUserId());
				upmRoleGroup.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				upmRoleGroupService.insertObject(upmRoleGroup);
				returnMessage = CREATE_SUCCESS;
			}
			
			return LIST;
		}catch(Exception e){
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}finally{
		}
		
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setGroupCode(String value) {
		this.groupCode = value;
	}
	
	public String getGroupCode() {
		return this.groupCode;
	}
	public void setAppId(String value) {
		this.appId = value;
	}
	
	public String getAppId() {
		return this.appId;
	}
	public void setGroupName(String value) {
		this.groupName = value;
	}
	
	public String getGroupName() {
		return this.groupName;
	}

	public UpmRoleGroupService<UpmRoleGroup> getUpmRoleGroupService() {
		return upmRoleGroupService;
	}

	public void setUpmRoleGroupService(UpmRoleGroupService<UpmRoleGroup> upmRoleGroupService) {
		this.upmRoleGroupService = upmRoleGroupService;
	}

	public UpmRoleGroup getUpmRoleGroup() {
		return upmRoleGroup;
	}

	public void setUpmRoleGroup(UpmRoleGroup upmRoleGroup) {
		this.upmRoleGroup = upmRoleGroup;
	}

}

