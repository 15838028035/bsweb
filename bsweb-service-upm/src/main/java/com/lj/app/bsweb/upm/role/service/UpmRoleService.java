package com.lj.app.bsweb.upm.role.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.lj.app.bsweb.upm.role.entity.UpmPermission;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.pagination.Page;

public interface UpmRoleService<UpmRole> extends BaseService {

	/**
	 * 分页查找当前登录人可分配的所有角色
	 * 
	 * @param page
	 * @param condition
	 * @return
	 */
	public Page findUpmRolePageByAssignable(Page page, Map<String,Object> condition) throws Exception;
	
	/**
	 * 判断是否是自己创建的角色
	 * 
	 * @param roleId
	 * @return
	 */
	public boolean isSelfCreateOfRole(Integer roleId, Integer operatorId) throws Exception;
	
	/**
	 * 将权限分配给角色
	 * @param permissions
	 * @param appId
	 * @param uapRole
	 */
	public void addPermissionToRole(String permissions, String appId,Integer roleId) throws Exception;
	
	/**
	 * 将权限分配给角色
	 * @param roleId
	 * @param appId
	 * @param permissionId
	 */
	public void addPermissionToRole(Integer roleId, String appId,String permissionId) throws Exception;
	
	/**
	 * 获取角色树
	 * @param roleId
	 * @param appId
	 * @return
	 * @throws Exception
	 */
	public String getTreeDataJsonCheckBox(Integer roleId, String appId,Integer operatorId) throws Exception;
	
	/**
	 * 查找角色对应的权限
	 * @param roleId
	 * @return
	 */
	public List<Integer> getRolePermissionIds(Integer roleId);
	
	/**
	 * 根据ID查找对应的权限
	 * @param treeNodeId
	 * @return
	 */
	public List<UpmPermission> findAllbyTreeNodeId(String treeNodeId);
	
	/**
	 * @version : v1.00
	 * @Description : 查询权限菜单树（没有复选框）
	 * 
	 * @param roleId
	 * @param appId
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public String getPermissionTreeDataJson(Integer roleId, String appId,Integer operatorId) throws Exception;
	
	/**
	 * 查询当前登录这人员的权限
	 * @param page
	 * @param treeNodeId
	 * @param appId
	 * @return
	 * @throws Exception
	 */
	public Page pageQueryPermission(Page page, String treeNodeId,String appId,Integer operatorId) throws Exception;
	
	/**
	 * 删减角色和权限关系、删除角色
	 */
	public void delete(Object obj);
	
	/**
	 * 根据角色编号删除权限
	 * @param roleId
	 */
	public void deletePermissionById(Object roleId);
	
	public int getSysRoleId(String appId);
}
