package com.lj.app.bsweb.upm.role.service;

import java.util.List;

import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.security.CMSecurityContext;

public interface UpmPermissionService<UpmPermission> extends BaseService {

	/**
	 *查看权限树
	 * @return
	 */
	public List<UpmPermission> findUpmPermissionByParentId(Long parentId);
	
	/**
	 * 根据用户id、appId查找用户权限
	 */
	public List<com.lj.app.bsweb.upm.role.entity.UpmPermission> findPermissionByUserId(int userId, String appId);
	
	/**
	 * 根据用户id、appcode、type查找用户权限
	 */
	public List<UpmPermission> findPermissionByUserId(int userId, String appId,String type);
	
	public CMSecurityContext getSecurityContext(int userId, String contextPath, String appId) ;
	
	/**
	 * 根据appId查询permissionId
	 * 
	 * @param appId
	 * @return
	 */
	public Integer findRootPermissionIdByAppId(String appId) throws Exception;
	/**
	 * 根据appId查询permissionId
	 * 
	 * @param appId
	 * @return
	 */
	public Integer findRootPermissionIdMenuByAppId(String appId) throws Exception;
	
	/**
	 * @Description : 根据名称查询同级的菜单是否存在聪明
	 * 
	 * @param parentId
	 *            父id
	 * @param name
	 *            菜单名称
	 * @return boolean true 存在重名 ，false 不存在
	 */
	public boolean isExisitPermissionByNameAndParent(String parentId,String name) throws Exception;
}
