package com.lj.app.bsweb.upm.role.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
 * 
 * 角色权限关联关系
 *
 */
public class UpmRoleAndPermissionRel extends BaseEntity {

  private java.lang.Integer id;
  private java.lang.Integer roleId;
  private java.lang.Integer permissionId;

  public UpmRoleAndPermissionRel() {
  }

  public void setId(java.lang.Integer value) {
    this.id = value;
  }

  public java.lang.Integer getId() {
    return this.id;
  }

  public void setRoleId(java.lang.Integer value) {
    this.roleId = value;
  }

  public java.lang.Integer getRoleId() {
    return this.roleId;
  }

  public void setPermissionId(java.lang.Integer value) {
    this.permissionId = value;
  }

  public java.lang.Integer getPermissionId() {
    return this.permissionId;
  }
}
