package com.lj.app.bsweb.upm.user.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.bsweb.upm.user.entity.UpmUserGroupAndRoleRel;
import com.lj.app.bsweb.upm.user.service.UpmUserGroupAndRoleRelService;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/jsp/user")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/user/upmUserGroupAndRoleRel-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmUserGroupAndRoleRelAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/user/upmUserGroupAndRoleRelList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmUserGroupAndRoleRelAction")
public class UpmUserGroupAndRoleRelAction extends AbstractBaseUpmAction<UpmUserGroupAndRoleRel> {
	
	private java.lang.Integer id;
	private java.lang.Integer userGroupId;
	private java.lang.Integer roleId;

	@Autowired
	private UpmUserGroupAndRoleRelService upmUserGroupAndRoleRelService;
	
	private UpmUserGroupAndRoleRel upmUserGroupAndRoleRel;
	
	public   BaseService<UpmUserGroupAndRoleRelService> getBaseService(){
		return upmUserGroupAndRoleRelService;
	}
	
	public UpmUserGroupAndRoleRel getModel() {
		upmUserGroupAndRoleRel = (UpmUserGroupAndRoleRel)upmUserGroupAndRoleRelService.getInfoByKey(id);
		return upmUserGroupAndRoleRel;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		upmUserGroupAndRoleRel = (UpmUserGroupAndRoleRel)upmUserGroupAndRoleRelService.getInfoByKey(id);
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			condition.put("userGroupId",  userGroupId);
			condition.put("roleId",  roleId);
			upmUserGroupAndRoleRelService.findPageList(page, condition);
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
				upmUserGroupAndRoleRel.setId(id);
				upmUserGroupAndRoleRel.setUserGroupId(userGroupId);
				upmUserGroupAndRoleRel.setRoleId(roleId);
				upmUserGroupAndRoleRel.setUpdateBy(getLoginUserId());
				upmUserGroupAndRoleRel.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				upmUserGroupAndRoleRelService.updateObject(upmUserGroupAndRoleRel);
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				upmUserGroupAndRoleRel = new UpmUserGroupAndRoleRel();
				upmUserGroupAndRoleRel.setId(id);
				upmUserGroupAndRoleRel.setUserGroupId(userGroupId);
				upmUserGroupAndRoleRel.setRoleId(roleId);
				
				upmUserGroupAndRoleRel.setCreateBy(getLoginUserId());
				upmUserGroupAndRoleRel.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				upmUserGroupAndRoleRelService.insertObject(upmUserGroupAndRoleRel);
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

	public String doBatchSaveRel() throws Exception {
		String operateResult = null;//操作结果：1失败，0成功
		
		String returnMessage = "";
		String[] multiSelectedTmp;
		if (multiSelected.indexOf(",") > 0) {
			multiSelectedTmp = multiSelected.split(",");
		}
		else{
			multiSelectedTmp = new String[]{multiSelected};
		}
		for (int i = 0; i < multiSelectedTmp.length; i++) {
			int selectedId = Integer.parseInt(multiSelectedTmp[i].trim());
			
			try{
				
				roleId=selectedId;
				
				Map<String,Object> condition = new HashMap<String,Object>();
				condition.put("userGroupId",  userGroupId);
				condition.put("roleId",  roleId);
				
				List<UpmUserGroupAndRoleRel> list = upmUserGroupAndRoleRelService.findBaseModeList("select", condition);
				if(list!=null&&list.size()>0){
					upmUserGroupAndRoleRel = list.get(0);
					upmUserGroupAndRoleRel.setUpdateBy(getLoginUserId());
					upmUserGroupAndRoleRel.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
					upmUserGroupAndRoleRelService.updateObject(upmUserGroupAndRoleRel);
					returnMessage = UPDATE_SUCCESS;
					
				}else {
					upmUserGroupAndRoleRel = new UpmUserGroupAndRoleRel();
					upmUserGroupAndRoleRel.setUserGroupId(userGroupId);
					upmUserGroupAndRoleRel.setRoleId(roleId);
					
					upmUserGroupAndRoleRel.setCreateBy(getLoginUserId());
					upmUserGroupAndRoleRel.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
					upmUserGroupAndRoleRelService.insertObject(upmUserGroupAndRoleRel);
					returnMessage = CREATE_SUCCESS;
				}
			}catch(Exception e){
				returnMessage = "保存失败";
				e.printStackTrace();
				throw e;
			}finally{
			}
		}
		AjaxResult ar = new AjaxResult();
		ar.setOpResult(returnMessage);
		
		Struts2Utils.renderJson(ar);
		return null;
	}
	
	@Override
	public String delete() throws Exception {
		return null;
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setUserGroupId(java.lang.Integer value) {
		this.userGroupId = value;
	}
	
	public java.lang.Integer getUserGroupId() {
		return this.userGroupId;
	}
	public void setRoleId(java.lang.Integer value) {
		this.roleId = value;
	}
	
	public java.lang.Integer getRoleId() {
		return this.roleId;
	}


}

