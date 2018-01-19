package com.lj.app.bsweb.upm.user.service;

import java.util.List;

import com.lj.app.core.common.base.service.BaseService;

/**
 * 
 * 用户组服务
 *
 * @param <UpmUserGroup>
 *          用户组对象
 */
public interface UpmUserGroupService<UpmUserGroup> extends BaseService {

  /**
   * 查询用户组数据
   * 
   * @return 用户组列表
   */
  public List<UpmUserGroup> findUpmUserGroupByParentId(Long treeNodeId);

  /**
   * 查询用户组数据
   * 
   * @return 用户组列表
   */
  public List<UpmUserGroup> findUpmUserGroupByGroupName(String userGroupName);

}
