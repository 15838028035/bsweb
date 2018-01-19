package com.lj.app.bsweb.upm.user.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
 * 
 * 用户组
 *
 */
public class UpmUserGroup extends BaseEntity {

  private java.lang.Integer id;
  private String userGroupCode;
  private String userGroupName;
  private String bussinessCode;
  private java.lang.Integer parentId;

  public java.lang.Integer getId() {
    return id;
  }

  public void setId(java.lang.Integer id) {
    this.id = id;
  }

  public String getUserGroupCode() {
    return userGroupCode;
  }

  public void setUserGroupCode(String userGroupCode) {
    this.userGroupCode = userGroupCode;
  }

  public String getUserGroupName() {
    return userGroupName;
  }

  public void setUserGroupName(String userGroupName) {
    this.userGroupName = userGroupName;
  }

  public String getBussinessCode() {
    return bussinessCode;
  }

  public void setBussinessCode(String bussinessCode) {
    this.bussinessCode = bussinessCode;
  }

  public java.lang.Integer getParentId() {
    return parentId;
  }

  public void setParentId(java.lang.Integer parentId) {
    this.parentId = parentId;
  }

}
