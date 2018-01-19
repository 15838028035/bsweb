package com.lj.app.bsweb.upm.role.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
 * 
 * 角色管理
 *
 */
public class UpmRole extends BaseEntity {

  /**
   * ID id
   */
  private java.lang.Integer id;

  /**
   * 角色编码 role_code
   */
  private String roleCode;

  /**
   * 角色名称 role_name
   */
  private String roleName;

  /**
   * 角色描述 role_desc
   */
  private String roleDesc;

  /**
   * 用户组角色Id
   */
  private java.lang.Integer userGroupRoleRelId;

  /**
   * 用户组id
   */
  private java.lang.Integer userGroupId;

  public java.lang.Integer getId() {
    return id;
  }

  public void setId(java.lang.Integer id) {
    this.id = id;
  }

  public String getRoleCode() {
    return roleCode;
  }

  public void setRoleCode(String roleCode) {
    this.roleCode = roleCode;
  }

  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

  public java.lang.Integer getUserGroupRoleRelId() {
    return userGroupRoleRelId;
  }

  public void setUserGroupRoleRelId(java.lang.Integer userGroupRoleRelId) {
    this.userGroupRoleRelId = userGroupRoleRelId;
  }

  public java.lang.Integer getUserGroupId() {
    return userGroupId;
  }

  public void setUserGroupId(java.lang.Integer userGroupId) {
    this.userGroupId = userGroupId;
  }

  public String getRoleDesc() {
    return roleDesc;
  }

  public void setRoleDesc(String roleDesc) {
    this.roleDesc = roleDesc;
  }

}
