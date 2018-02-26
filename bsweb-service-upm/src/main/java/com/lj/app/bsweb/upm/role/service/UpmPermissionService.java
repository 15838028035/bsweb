package com.lj.app.bsweb.upm.role.service;

import java.util.List;
import java.util.Set;

import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.security.CmSecurityContext;

/**
 * 
 * 权限服务
 *
 * @param <UpmPermission> 权限对象
 */
public interface UpmPermissionService<UpmPermission> extends BaseService {

  /**
   * 查看权限树
   * @param parentId 父节点Id
   * @return 权限列表
   */
  public List<UpmPermission> findUpmPermissionByParentId(Long parentId);

  /**
   * 根据用户id、appId查找用户权限
   * @param userId 用户Id
   * @param appId appId
   * @return 根据用户id、appId查找用户权限
   */
  public List<com.lj.app.bsweb.upm.role.entity.UpmPermission> findPermissionByUserId(Integer userId, String appId);

  /**
   * 根据用户id、appcode、type查找用户权限
   * @param userId 用户ID
   * @param appId appId
   * @param type 权限类型
   * @return 权限列表
   */
  public List<UpmPermission> findPermissionByUserId(int userId, String appId, String type);

  public CmSecurityContext getSecurityContext(int userId, String contextPath, String appId);

  /**
   * 根据appId查询permissionId
   * 
   * @param appId 应用 ID
   * @return 根据appId查询permissionId
   */
  public Integer findRootPermissionIdByAppId(String appId) throws Exception;

  /**
   * 根据appId查询permissionId
   * 
   * @param appId 应用 ID
   * @return 根ID
   */
  public Integer findRootPermissionIdMenuByAppId(String appId) throws Exception;

  /**
   * @Description : 根据名称查询同级的菜单是否存在聪明
   * 
   * @param parentId
   *          父id
   * @param name
   *          菜单名称
   * @return boolean true 存在重名 ，false 不存在
   */
  public boolean isExisitPermissionByNameAndParent(String parentId, String name) throws Exception;

  /**
   * 查找appId有效的权限
   * 
   * @param appId 应用 ID
   * @return 查找appId有效的权限
   */
  public Set<String> findPermissionUrlByAppId(String appId);

  /**
   * 查找appId无效的权限
   * 
   * @param appId 应用 ID
   * @return 查找appId无效的权限
   */
  public Set<String> findDisabledPermissionUrlByAppId(String appId);

  /**
   * 根据用户userId查找用户组织机构
   * @param userId 用户ID
   * @return 组织机构列表
   */
  public List<String> findUserGroupNameByUserId(int userId);

  /**
   * 根据用户userId查找用户组织机构
   * @param userId 用户ID
   * @param appId appId
   * @return 列表
   */
  public List<String> findRoleNameByUserId(int userId, String appId);

}
