package com.lj.app.bsweb.upm.user.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
 * 
 * 用户组合角色关系
 *
 */
public class UpmUserGroupAndRoleRel extends BaseEntity {

  private java.lang.Integer id;
  private java.lang.Integer userGroupId;
  private java.lang.Integer roleId;

  public UpmUserGroupAndRoleRel() {
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
