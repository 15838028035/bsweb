package com.lj.app.bsweb.upm.user.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

public class UpmUserAndUserGroupRel extends BaseEntity{
	
	private java.lang.Integer id;
	private java.lang.Integer userId;
	private java.lang.Integer groupId;
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	public java.lang.Integer getUserId() {
		return userId;
	}
	public void setUserId(java.lang.Integer userId) {
		this.userId = userId;
	}
	public java.lang.Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(java.lang.Integer groupId) {
		this.groupId = groupId;
	}

}

