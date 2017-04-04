package com.lj.app.bsweb.upm.role.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.app.bsweb.upm.role.entity.UpmPermission;
import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.pagination.Page;
import com.lj.app.core.common.tree.BootStrapTreeView;
import com.lj.app.core.common.tree.BootStrapTreeViewCheck;
import com.lj.app.core.common.tree.DefaultTreeNode;
import com.lj.app.core.common.tree.SimpleTree;

@Service("upmRoleService")
public class UpmRoleServiceImpl<UpmRole> extends BaseServiceImpl<UpmRole> implements UpmRoleService<UpmRole>{
	
	@Autowired
	private UpmPermissionService<UpmPermission> upmPermissionService;
	
	/**
	 * 分页查找当前登录人可分配的所有角色
	 * 
	 * @param page
	 * @param appId
	 * @return
	 */
	public Page findUpmRolePageByAssignable(Page page, Map<String,Object> condition) throws Exception{
		//TODO:实现查找当前登录人可以分配角色
		return findPageList(page, condition);
	}
	
	/**
	 * 判断是否是自己创建的角色
	 * 
	 * @param roleId
	 * @return
	 */
	public boolean isSelfCreateOfRole(Integer roleId, Integer operatorId) throws Exception{
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("id", roleId);
		condition.put("createBy", operatorId);
		Number result = (Number)this.queryForObject("isSelfCreateOfRole", condition);
		if(null==result || result.intValue()==0){
			return false;
		}
		else{
			return true;
		}
	}
	
	/**
	 * 将权限分配给角色
	 * @param permissions
	 * @param appId
	 * @param uapRole
	 */
	public void addPermissionToRole(String permissions, String appId,Integer roleId) throws Exception{
		this.deletePermissionById(roleId);

		String[] permission = new String[] {};
		if (permissions != null && !"".equals(permissions)) {
			permission = permissions.split(",");
		}
		for (int i = 0; i < permission.length; i++) {
			addPermissionToRole(roleId, appId, permission[i]);
		}
	}
	
	/**
	 * 将权限分配给角色
	 * @param roleId
	 * @param appId
	 * @param permissionId
	 */
	public void addPermissionToRole(Integer roleId, String appId,String permissionId) throws Exception{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("roleId", roleId);
		param.put("appId", appId);
		param.put("permissionId", permissionId);
		this.insertObject("saveRolePermisson",param);
	}
	
	/**
	 * 获取角色树
	 * @param roleId
	 * @param domainId
	 * @return
	 * @throws Exception
	 */
	public String getTreeDataJsonCheckBox(Integer roleId, String appId,Integer operatorId) throws Exception{
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("appId", appId);
		condition.put("operatorId", operatorId);
		condition.put("parentId", operatorId);
		
		List<UpmPermission> list = upmPermissionService.queryForList("findTreeData",condition);
		
		if (null != list && !list.isEmpty()) {
			List<Integer> permissionIds = getRolePermissionIds(roleId);
			List<DefaultTreeNode> treeNodeList = new ArrayList<DefaultTreeNode>();
			for (int i = 0; i < list.size(); i++) {
				UpmPermission up = list.get(i);
				String id = up.getId() + "";
				String text = up.getName();
				int checked = 0;
				for (int j = 0; j < permissionIds.size(); j++) {
					Integer tmpId = permissionIds.get(j);
					if (up.getId().equals(tmpId)) {
						checked = 1;
						break;
					}
				}
				String parentId = up.getParentId().intValue() + "";
				treeNodeList.add(SimpleTree.createNew(id, text, checked,
						parentId));
			}
			Integer rootId = upmPermissionService.findRootPermissionIdByAppId(appId);
					
			SimpleTree simpleTree = SimpleTree.valueOf(treeNodeList, rootId.toString());
					
			if (null != simpleTree) {
				return simpleTree.toJsonString();
			}
		}
		return null;
	}
	
	/**
	 * 查找角色对应的权限
	 * @param roleId
	 * @return
	 */
	public List<Integer> getRolePermissionIds(Integer roleId){
		Map<String,Integer> condition = new HashMap<String,Integer>();
		condition.put("roleId", roleId);
		List<Integer> permissionIds = queryForList("findRolePermissionIds", condition);
		return permissionIds;
	}
	
	/**
	 * 根据ID查找对应的权限
	 * @param treeNodeId
	 * @return
	 */
	public List<UpmPermission> findAllbyTreeNodeId(String treeNodeId){
		return null;
	}
	
	/**
	 * @Description : 查询权限菜单树（没有复选框）
	 * 
	 * @param roleId
	 * @param appId
	 * @return
	 * @throws IOException
	 */
	public String getPermissionTreeDataJson(Integer roleId, String appId,Integer operatorId) throws Exception{
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("appId", appId);
		condition.put("operatorId", operatorId);
		condition.put("parentId", 0);
		List<UpmPermission> list = upmPermissionService.queryForList("findTreeDataNot2", condition);
				
		if (null != list && !list.isEmpty()) {
			List<Integer> permissionIds = getRolePermissionIds(roleId);
			List<BootStrapTreeView> treeNodeList = new ArrayList<BootStrapTreeView>();
			for (int i = 0; i < list.size(); i++) {
				UpmPermission up = list.get(i);
				String id = up.getId() + "";
				String text = up.getName();
				int checked = 0;
				for (int j = 0; j < permissionIds.size(); j++) {
					Integer tmpId = permissionIds.get(j);
					if (up.getId().equals(tmpId)) {
						checked = 1;
						break;
					}
				}
				String parentId = up.getParentId().intValue() + "";
				treeNodeList.add(BootStrapTreeViewCheck.createNew(id, text, parentId));
			}
			
			Integer rootId = upmPermissionService.findRootPermissionIdByAppId(appId);
					
			BootStrapTreeViewCheck simpleTree = BootStrapTreeViewCheck.valueOf(treeNodeList, rootId.toString());
					
			if (null != simpleTree) {
				return simpleTree.toJsonString();
			}
		}
		return null;
	}
	
	/**
	 * 查询当前登录这人员的权限
	 * @param page
	 * @param treeNodeId
	 * @param appId
	 * @return
	 * @throws Exception
	 */
	public Page pageQueryPermission(Page page, String treeNodeId,String appId,Integer operatorId) throws Exception{
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("operatorId", operatorId);
		condition.put("appId", appId);
		condition.put("parentId", treeNodeId);
		return findPageList(page, condition,"pageQueryPermission");
	}

	@Override
	public void delete(Object obj) {
		deletePermissionById(obj);
		delete("delete",obj);
	}
	
	public void deletePermissionById(Object roleId){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("roleId", roleId);
		delete("deleteRolePermissionByRoleId", param);
	}
	
	/**
	 * @Description : 根据系统编号，返回系统管理员的角色id
	 * 
	 * @param domainId
	 *            系统编号
	 * @return
	 */
	public  Integer getSysRoleId(String sysId){
		String rold = "";
		if ("UPM".equals(sysId)) {
			rold = "10000";
		} else if ("CRM".equals(sysId)) {
			rold = "20000";
		} else if ("3".equals(sysId)) {
			rold = "30000";
		} else if ("4".equals(sysId)) {
			rold = "40000";
		}else if ("5".equals(sysId)) {
			rold = "50000";
		}else if ("6".equals(sysId)) {
			rold = "60000";
		}
		return Integer.valueOf(rold);
	}
}
