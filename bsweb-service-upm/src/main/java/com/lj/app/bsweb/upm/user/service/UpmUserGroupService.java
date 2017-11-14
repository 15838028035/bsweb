package com.lj.app.bsweb.upm.user.service;

import java.util.List;

import com.lj.app.core.common.base.service.BaseService;

public interface UpmUserGroupService<UpmUserGroup> extends BaseService {

	/**
	 *查询用户组数据
	 * @return
	 */
	public List<UpmUserGroup> findUpmUserGroupByParentId(Long treeNodeId);
	
	/**
	 *查询用户组数据
	 * @return
	 */
	public List<UpmUserGroup> findUpmUserGroupByGroupName(String userGroupName);
	
}
