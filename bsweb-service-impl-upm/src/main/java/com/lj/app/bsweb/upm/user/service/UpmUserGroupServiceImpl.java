package com.lj.app.bsweb.upm.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

@Service("upmUserGroupService")
public class UpmUserGroupServiceImpl<UpmUserGroup> extends BaseServiceImpl<UpmUserGroup> implements UpmUserGroupService<UpmUserGroup>{
	/**
	 *查询用户组数据
	 * @return
	 */
	public List<UpmUserGroup> findUpmUserByParentId(Long treeNodeId){
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("userGroupCode",  null);
		condition.put("userGroupName",  null);
		condition.put("parentId",  treeNodeId);
	    List<UpmUserGroup> upmUserGroupList = queryForList("pagenate",condition);

		return upmUserGroupList;
	}
	
}
