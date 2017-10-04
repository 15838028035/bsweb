package com.lj.app.bsweb.upm.role.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.security.CMSecurityContext;
import com.lj.app.core.common.util.StringUtil;

@Service("upmPermissionService")
public class UpmPermissionServiceImpl<UpmPermission> extends BaseServiceImpl<UpmPermission> implements UpmPermissionService<UpmPermission>{

	/**
	 *查看权限树
	 * @return
	 */
	public List<UpmPermission> findUpmPermissionByParentId(Long parentId){
		Map<String,Long> condition = new HashMap<String,Long>();
		condition.put("parentId",  parentId);
		 List<UpmPermission> upmPermissionList=null;
		if(parentId==null){
			upmPermissionList = this.queryForList("findParentIsNull",null);
		}else {
			upmPermissionList = this.queryForList("pagenate",condition);
		}
		return upmPermissionList;
	}
	
	/**
	 * 根据用户id、appcode查找用户权限
	 */
	public List<com.lj.app.bsweb.upm.role.entity.UpmPermission> findPermissionByUserId(int userId, String appId){
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("userId",  userId);
		condition.put("appId",  appId);
		return this.queryForList("findPermissionByUserId",condition);
	}
	
	/**
	 * 根据用户id、appcode、type查找用户权限
	 */
	public List<UpmPermission> findPermissionByUserId(int userId, String appId,String type){
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("userId",  userId);
		condition.put("appId",  appId);
		condition.put("type",  type);
		return this.queryForList("findPermissionByUserId",condition);
	}
	
	public CMSecurityContext getSecurityContext(int userId, String contextPath, String appId) {
		CMSecurityContext securityContext = new CMSecurityContext();
		
		//设置主帐号信息
		securityContext.setMainAcctId(Long.parseLong(String.valueOf(userId)));
		
		CMSecurityContext mainAcct;
		List<com.lj.app.bsweb.upm.role.entity.UpmPermission> permissionList = findPermissionByUserId(userId, appId);

		//设置权限相关的code和url
		Set<String> codeSet = new HashSet<String>();
		Set<String> urlSet = new HashSet<String>();
		for (com.lj.app.bsweb.upm.role.entity.UpmPermission upmPermission : permissionList) {
			//设置菜单，按钮对应的code
			codeSet.add(upmPermission.getCode());
			
			//设置url
			String url =upmPermission.getUrl();
			if(StringUtil.isNotBlank(url)) {
				if(url.indexOf(",") != -1) {
					String[] splitUrls = url.split(",");
					for (int i = 0; i < splitUrls.length; i++) {
						urlSet.add(contextPath + splitUrls[i]);
					}
				} else {
					urlSet.add(contextPath + url);
				}
			}
		}
		securityContext.setUrls(urlSet);
		securityContext.setCodes(codeSet);
		return securityContext;
	}
	
	/**
	 * 根据appId查询permissionId
	 * 
	 * @param appId
	 * @return
	 */
	public Integer findRootPermissionIdByAppId(String appId) throws Exception{
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("appId", appId);
		Integer result = (Integer)queryForObject("findRootPermissionIdByDomainId", condition);
		return result;
	}
	
	/**
	 * 根据appId查询permissionId
	 * 
	 * @param appId
	 * @return
	 */
	public Integer findRootPermissionIdMenuByAppId(String appId) throws Exception{
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("appId", appId);
		Integer result = (Integer)queryForObject("findRootPermissionIdMenuByAppId", condition);
		return result;
	}
	
	/**
	 * @Description : 根据名称查询同级的菜单是否存在聪明
	 * 
	 * @param parentId
	 *            父id
	 * @param name
	 *            菜单名称
	 * @return boolean true 存在重名 ，false 不存在
	 */
	public boolean isExisitPermissionByNameAndParent(String parentId,String name) throws Exception{
		boolean flag = false;
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("parentId", parentId);
		condition.put("name", name);
		Number result = (Number)queryForObject("queryByNameAndParentId", condition);
		if (result != null && result.intValue() > 0) {
			flag = true;
		}
		return flag;
	}
}
