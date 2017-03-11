package com.lj.app.bsweb.upm.role.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

public class UpmPermission extends BaseEntity{
	
	private java.lang.Integer id;
	private String appId;
	private java.lang.Integer parentId;
	private String name;
	private String type;
	private String url;
	private String code;
	private String keyCode;
	private String state;
	private String remark;
	private java.lang.Integer sortNo;
	private String iconPath;
	
	private int rolePermissionId;
	private int roleId;
	private int userId;
	
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public java.lang.Integer getParentId() {
		return parentId;
	}
	public void setParentId(java.lang.Integer parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getKeyCode() {
		return keyCode;
	}
	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public java.lang.Integer getSortNo() {
		return sortNo;
	}
	public void setSortNo(java.lang.Integer sortNo) {
		this.sortNo = sortNo;
	}
	public String getIconPath() {
		return iconPath;
	}
	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

	public int getRolePermissionId() {
		return rolePermissionId;
	}
	public void setRolePermissionId(int rolePermissionId) {
		this.rolePermissionId = rolePermissionId;
	}
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}

