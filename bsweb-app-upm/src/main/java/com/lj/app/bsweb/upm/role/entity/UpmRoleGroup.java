package com.lj.app.bsweb.upm.role.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

public class UpmRoleGroup extends BaseEntity{
	
	private java.lang.Integer id;
	private String groupCode;
	private String appId;
	private String groupName;
	
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

}

