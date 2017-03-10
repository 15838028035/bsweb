package com.lj.app.bsweb.upm.role.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

public class UpmRoleAndPermissionRel extends BaseEntity{
	
	private java.lang.Integer id;
	private java.lang.Integer roleId;
	private java.lang.Integer permissionId;

	public UpmRoleAndPermissionRel(){
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

	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("RoleId",getRoleId())
			.append("PermissionId",getPermissionId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getRoleId())
			.append(getPermissionId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof UpmRoleAndPermissionRel == false) return false;
		if(this == obj) return true;
		UpmRoleAndPermissionRel other = (UpmRoleAndPermissionRel)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getRoleId(),other.getRoleId())
			.append(getPermissionId(),other.getPermissionId())
			.isEquals();
	}
}

