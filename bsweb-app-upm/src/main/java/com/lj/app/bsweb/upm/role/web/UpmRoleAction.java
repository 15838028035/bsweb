package com.lj.app.bsweb.upm.role.web;

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
import com.lj.app.bsweb.upm.role.entity.UpmRole;
import com.lj.app.bsweb.upm.role.service.UpmRoleService;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

/**
 * 
 * 角色管理
 *
 */
@Controller
@Namespace("/jsp/role")
@Results({ 
    @Result(name = AbstractBaseAction.INPUT, 
        location = "upmRole-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE, 
        location = "upmRoleAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "upmRoleList.jsp"),
    @Result(name = AbstractBaseAction.LIST, 
        location = "upmRoleList.jsp", type = AbstractBaseAction.REDIRECT)
    })

@Action("upmRoleAction")
public class UpmRoleAction extends AbstractBaseUpmAction<UpmRole> {

  private java.lang.Integer id;
  private String roleName;

  private java.lang.Integer userGroupId;

  // 权限树
  private String treeNodeId;
  private String permissions;

  private Integer roleId;
  private String strRoleId = "0";

  @Autowired
  private UpmRoleService<UpmRole> upmRoleService;

  private UpmRole upmRole;

  public BaseService<UpmRole> getBaseService() {
    return upmRoleService;
  }

  public UpmRole getModel() {
    return upmRole;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (id != null) {
      upmRole = (UpmRole) upmRoleService.getInfoByKey(id);
    } else {
      upmRole = new UpmRole();
      upmRole.setAppId(appId);
      upmRole.setId(0);
    }
  }

  /**
   * 判断是否是自己创建的角色
   */
  public void isSelfCreateOfRole() throws Exception {
    boolean result = upmRoleService.isSelfCreateOfRole(roleId, this.getLoginUserId());
    if (result) {
      Struts2Utils.renderText("true");
    } else {
      Struts2Utils.renderText("false");
    }
  }

  /**
   * 检测角色是否存在
   * @return json
   * @throws Exception 异常
   */
  public String checkRoleIsExist() throws Exception {
    Map<String, Object> condition = new HashMap<String, Object>();
    condition.put("roleName", roleName);
    condition.put("appId", appId);

    List result = upmRoleService.queryForList("select", condition);

    if (StringUtil.isNotBlank(strRoleId)) {
      upmRole = (UpmRole) upmRoleService.getInfoByKey(strRoleId);
      if (!upmRole.getRoleName().equals(roleName) && result.size() != 0) {
        Struts2Utils.renderText("{\"valid\":false}");
      } else {
        Struts2Utils.renderText("{\"valid\":true}");
      }
    } else {

      if (result != null && result.size() > 0) {
        Struts2Utils.renderText("{\"valid\":false}");
      } else {
        Struts2Utils.renderText("{\"valid\":true}");
      }
    }

    return null;
  }

  /**
   *  权限树
   * @return json
   * @throws Exception 异常
   */
  public String getPermissionTree() throws Exception {
    // 根据当前登录人员获取权限菜单树
    if (StringUtil.isBlank(strRoleId)) {
      strRoleId = "0";
    }
    String jsonData = upmRoleService.getPermissionTreeDataJson(Integer.valueOf(strRoleId), getAppId(),
        this.getLoginUserId());

    if (StringUtil.isBlank(jsonData)) {
      jsonData = "";
    }
    Struts2Utils.renderText(jsonData);
    return null;
  }

  @Override
  public String input() throws Exception {
    System.out.println("roleId=" + id + ",appId=" + appId);
    String jsonData = upmRoleService.getTreeDataJsonCheckBox(id, appId, this.getLoginUserId());
    String isEnable = ServletActionContext.getRequest().getParameter("isEnable");
    ServletActionContext.getRequest().setAttribute("isEnable", isEnable);
    Struts2Utils.getRequest().setAttribute("JsonData", jsonData);
    return INPUT;
  }

  @Override
  public String save() throws Exception {

    try {

      if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT)) {
        upmRole.setUpdateBy(getLoginUserId());
        upmRole.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        upmRoleService.updateObject(upmRole);

        upmRoleService.addPermissionToRole(permissions, appId, upmRole.getId());// 为角色添加相关权限处理

        returnMessage = UPDATE_SUCCESS;
      } else {
        upmRole.setCreateBy(getLoginUserId());
        upmRole.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        id = upmRoleService.insertObjectReturnKey(upmRole);

        upmRoleService.addPermissionToRole(permissions, appId, id);// 为角色添加相关权限处理

        returnMessage = CREATE_SUCCESS;
      }

    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      e.printStackTrace();
      throw e;
    }

    AjaxResult ar = new AjaxResult();
    ar.setOpResult(returnMessage);
    Struts2Utils.renderJson(ar);
    return null;
  }

  public String forwardToJsp() {
    return AbstractBaseAction.RELOAD;
  }

  @Override
  public String delete() throws Exception {
    upmRoleService.delete(id);
    return RELOAD;
  }

  /**
   * 查找已经分配的角色列表
   * 
   * @return json
   * @throws Exception 异常
   */
  public String findAssignedRoleList() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      page.setFilters(getModel());
      condition.put("userGroupId", userGroupId);

      if (StringUtil.isNotBlank(this.getSortName())) {
        String orderBy = PageTool.convert(this.getSortName()) + " " + this.getSortOrder();
        page.setSortColumns(orderBy);
      }

      page = getBaseService().findPageList(page, condition, "findAssignedRoleList");
      Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page), new String[0]);
      return null;
    } catch (Exception e) {
      e.printStackTrace();
      throw e;
    }
  }

  public void setId(java.lang.Integer value) {
    this.id = value;
  }

  public java.lang.Integer getId() {
    return this.id;
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
