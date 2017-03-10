package com.lj.app.bsweb.upm.user.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

public class UpmUserGroupAndRoleRel extends BaseEntity{
	
	private java.lang.Integer id;
	private java.lang.Integer userGroupId;
	private java.lang.Integer roleId;

	public UpmUserGroupAndRoleRel(){
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

	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("UserGroupId",getUserGroupId())
			.append("RoleId",getRoleId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getUserGroupId())
			.append(getRoleId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof UpmUserGroupAndRoleRel == false) return false;
		if(this == obj) return true;
		UpmUserGroupAndRoleRel other = (UpmUserGroupAndRoleRel)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getUserGroupId(),other.getUserGroupId())
			.append(getRoleId(),other.getRoleId())
			.isEquals();
	}
}

