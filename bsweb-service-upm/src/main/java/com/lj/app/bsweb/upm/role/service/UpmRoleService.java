package com.lj.app.bsweb.upm.role.service;

import java.util.List;
import java.util.Map;

import com.lj.app.bsweb.upm.role.entity.UpmPermission;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.pagination.Page;

/**
 * 
 * 角色服务类
 *
 * @param <UpmRole> 角色对象
 */
public interface UpmRoleService<UpmRole> extends BaseService {

  /**
   * 分页查找当前登录人可分配的所有角色
   * 
   * @param page 分页对象
   * @param condition 过滤条件
   * @return 分页对象
   */
  public Page findUpmRolePageByAssignable(Page page, Map<String, Object> condition) throws Exception;

  /**
   * 判断是否是自己创建的角色
   * 
   * @param roleId 角色Id
   * @return 是否
   */
  public boolean isSelfCreateOfRole(Integer roleId, Integer operatorId) throws Exception;

  /**
   * 将权限分配给角色
   * 
   * @param permissions 权限
   * @param appId 应用Id
   * @param roleId 角色Id
   */
  public void addPermissionToRole(String permissions, String appId, Integer roleId) throws Exception;

  /**
   * 将权限分配给角色
   * 
   * @param roleId 角色ID
   * @param appId 应用Id
   * @param permissionId 权限
   */
  public void addPermissionToRole(Integer roleId, String appId, String permissionId) throws Exception;

  /**
   * 获取角色树
   * 
   * @param roleId 角色ID
   * @param appId 应用Id
   * @return 获取角色树
   * @throws Exception 异常
   */
  public String getTreeDataJsonCheckBox(Integer roleId, String appId, Integer operatorId) throws Exception;

  /**
   * 查找角色对应的权限
   * 
   * @param roleId 角色ID
   * @return 权限ID列表
   */
  public List<Integer> getRolePermissionIds(Integer roleId);

  /**
   * @Description : 查询权限菜单树（没有复选框）
   * 
   * @param roleId 角色ID
   * @param appId 应用Id
   * @return 查询权限菜单树
   * @throws Exception 异常
   */
  public String getPermissionTreeDataJson(Integer roleId, String appId, Integer operatorId) throws Exception;

  /**
   * @Description : 查看菜单json
   * 
   * @param appId 应用Id
   * @return 查看菜单json
   * @throws Exception 异常
   */
  public String getPermissionTreeMenuDataJson(String appId, List<UpmPermission> list) throws Exception;

  /**
   * 查询当前登录这人员的权限
   * 
   * @param page 分页
   * @param treeNodeId 树节点Id
   * @param appId 应用Id
   * @return 查询当前登录这人员的权限
   * @throws Exception 异常
   */
  public Page pageQueryPermission(Page page, String treeNodeId, String appId, Integer operatorId) throws Exception;

  /**
   * 删减角色和权限关系、删除角色
   */
  public void delete(Object obj);

  /**
   * 根据角色编号删除权限
   * 
   * @param roleId 角色Id
   */
  public void deletePermissionById(Object roleId);

  public int getSysRoleId(String appId);

  /**
   * 根据权限查找对应的角色信息
   * 
   * @param permissionId
   *          权限ID
   * @return 根据权限查找对应的角色信息
   */
  public List<UpmRole> findRoleByPermisonId(Integer permissionId);
}
