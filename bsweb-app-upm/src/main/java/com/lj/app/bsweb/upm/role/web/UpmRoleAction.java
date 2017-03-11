package com.lj.app.bsweb.upm.role.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.bsweb.upm.role.entity.UpmPermission;
import com.lj.app.bsweb.upm.role.entity.UpmRole;
import com.lj.app.bsweb.upm.role.service.UpmRoleService;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.security.CMSecurityContext;
import com.lj.app.core.common.security.SecurityConstants;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

import net.sf.json.JSONArray;

@Controller
@Namespace("/jsp/role")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "upmRole-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmRoleAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = "searchpermission", location = "upmRole-searchPermission.jsp"),
		@Result(name = AbstractBaseAction.RELOAD, location = "upmRoleList.jsp"),
		@Result(name = AbstractBaseAction.LIST, location = "upmRoleList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmRoleAction")
public class UpmRoleAction extends AbstractBaseUpmAction<UpmRole> {
	
	private java.lang.Integer id;
	private String roleName;
	
	private java.lang.Integer userGroupId;
	
	//权限树
	private String treeNodeId;
	private String permissions;
	
	private Integer roleId;
	private String strRoleId;

	@Autowired
	private UpmRoleService<UpmRole> upmRoleService;
	
	private UpmRole upmRole;
	
	public   BaseService<UpmRole> getBaseService(){
		return upmRoleService;
	}
	
	public UpmRole getModel() {
		return upmRole;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			upmRole = (UpmRole)upmRoleService.getInfoByKey(id);
		} else {
			upmRole = new UpmRole();
		}
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			page.setFilters(upmRole);
			
			if (StringUtil.isNotBlank(this.getSidx())) {
				String orderBy = PageTool.convert(this.getSidx()) + " "+ this.getSord();
				page.setSortColumns(orderBy);
			}
			
			condition.put("appId", appId);
			upmRoleService.findUpmRolePageByAssignable(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 判断是否是自己创建的角色
	 */
	public void isSelfCreateOfRole() throws Exception{
		boolean result = upmRoleService.isSelfCreateOfRole(roleId, this.getLoginUserId());
		if(result){
			Struts2Utils.renderText("true");
		}
		else{
			Struts2Utils.renderText("false");
		}
	}
	
	public String checkRoleIsExist() throws Exception {
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("roleName", roleName);
		condition.put("appId", appId);
		
		List result = upmRoleService.queryForList("select",condition);

		if (StringUtil.isNotBlank(strRoleId)) {
			upmRole = (UpmRole)upmRoleService.getInfoByKey(strRoleId);
			if (!upmRole.getRoleName().equals(roleName)&& result.size() != 0) {
				Struts2Utils.renderText("false");
			} else {
				Struts2Utils.renderText("true");
			}
		} else {

			if (result != null && result.size() > 0) {
				Struts2Utils.renderText("false");
			} else {
				Struts2Utils.renderText("true");
			}
		}

		return null;
	}
	
	/**
	 * 判断某个角色是否是登录人员拥有的所有角色
	 *
	 */
	public void isOperatorUapRole(){
		String roleId = ServletActionContext.getRequest().getParameter("roleId");
		String appId = ServletActionContext.getRequest().getParameter("appId");
		CMSecurityContext securityContext = (CMSecurityContext) Struts2Utils.getSessionAttribute(SecurityConstants.SECURITY_CONTEXT);
		Long mainAcctId = securityContext.getMainAcctId();
		//List<UpmRole> result = mainAcctPermissionApiService.findAssignedRole(mainAcctId, Integer.parseInt(domainId));
		List<UpmRole> result = null;//FIXME:实现
		try{
			if(null == result || result.size() < 1){
				Struts2Utils.renderText("false");
				return;
			}
			for(int i=0; i<result.size(); i++){
				UpmRole upmRole = result.get(i);
				if(null != upmRole && roleId.equals(upmRole.getId().toString())){
					Struts2Utils.renderText("true");
					return;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String getPermissionTree() throws Exception {
		List<UpmPermission> treeList = upmRoleService.findAllbyTreeNodeId(this.getTreeNodeId());
		List<Integer> permissionIds = upmRoleService.getRolePermissionIds(Integer.parseInt(strRoleId));
		
		JSONArray jSONArray = new JSONArray();
		
		List<Map<String,Object>> childList = new ArrayList<Map<String,Object>>();
		
		for(int i=0;i<treeList.size();i++){
			Map<String,Object> childMap = new HashMap<String,Object>();
			childMap.put("id", treeList.get(i).getId());
			childMap.put("text", treeList.get(i).getName());
			if (permissionIds.contains(treeList.get(i).getId())) {
				childMap.put("checked", "1");
			}else{
				childMap.put("checked", "0");
			}
			
			childList.add(childMap);
		}
		
		String jsonResult = null;
		try {
			jsonResult =jSONArray.fromObject(childList).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Struts2Utils.renderText(jsonResult);
		
		return null;

	}
	
	public String searchpermission() throws Exception {
		/*String appId = ServletActionContext.getRequest().getParameter("appId"); 
		List<UapRole> assignedRole = mainAcctPermissionApiService.findAssignedRole(Long.parseLong(mainAcctId), Integer.parseInt(domainId)); //获得主帐号已分配的角色
		String jsonData = upmRoleService.getTreeDataSearchPermissionJsonCheckBox(assignedRole,Integer.parseInt(domainId),Long.parseLong(mainAcctId));
		jsonData = (jsonData == null)?getText("noPermission"):jsonData;
		Struts2Utils.getRequest().setAttribute("JsonData", jsonData);*/
		return "searchpermission";
	}
	
	@Override
	public String input() throws Exception {
		System.out.println("roleId=" + id + ",appId=" + appId);
		String jsonData = upmRoleService.getTreeDataJsonCheckBox(id,appId,this.getLoginUserId());
		String isEnable = ServletActionContext.getRequest().getParameter("isEnable");
		ServletActionContext.getRequest().setAttribute("isEnable", isEnable);
		Struts2Utils.getRequest().setAttribute("JsonData", jsonData);
		return INPUT;
	}
	
	@Override
	public String save() throws Exception {
		
	try{

		if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT)) {
			upmRole.setUpdateBy(getLoginUserId());
			upmRole.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
			upmRoleService.updateObject(upmRole);
			
			upmRoleService.addPermissionToRole(permissions,appId,upmRole.getId());//为角色添加相关权限处理
			
			returnMessage = UPDATE_SUCCESS;
		}else{
			upmRole.setCreateBy(getLoginUserId());
			upmRole.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
			id = upmRoleService.insertObjectReturnKey(upmRole);
			
			upmRoleService.addPermissionToRole(permissions,appId,id);//为角色添加相关权限处理
			
			returnMessage = CREATE_SUCCESS;
		}
			
		}catch(Exception e){
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}
	
		AjaxResult ar = new AjaxResult();
		ar.setOpResult(returnMessage);
		Struts2Utils.renderJson(ar);
		return null;
	}

	public String forwardToJsp(){
		return AbstractBaseAction.RELOAD;
	}
	
	@Override
	public String delete() throws Exception {
		upmRoleService.delete(id);
		return RELOAD;
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setAppId(String value) {
		this.appId = value;
	}
	
	public String getAppId() {
		return this.appId;
	}
	public void setRoleName(String value) {
		this.roleName = value;
	}
	
	public String getRoleName() {
		return this.roleName;
	}

	public UpmRoleService<UpmRole> getUpmRoleService() {
		return upmRoleService;
	}

	public void setUpmRoleService(UpmRoleService<UpmRole> upmRoleService) {
		this.upmRoleService = upmRoleService;
	}

	public UpmRole getUpmRole() {
		return upmRole;
	}

	public void setUpmRole(UpmRole upmRole) {
		this.upmRole = upmRole;
	}

	public java.lang.Integer getUserGroupId() {
		return userGroupId;
	}

	public void setUserGroupId(java.lang.Integer userGroupId) {
		this.userGroupId = userGroupId;
	}

	public String getTreeNodeId() {
		return treeNodeId;
	}

	public void setTreeNodeId(String treeNodeId) {
		this.treeNodeId = treeNodeId;
	}

	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getStrRoleId() {
		return strRoleId;
	}

	public void setStrRoleId(String strRoleId) {
		this.strRoleId = strRoleId;
	}

}

