package com.lj.app.bsweb.upm.role.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.bsweb.upm.role.entity.UpmPermission;
import com.lj.app.bsweb.upm.role.entity.UpmRole;
import com.lj.app.bsweb.upm.role.service.UpmPermissionService;
import com.lj.app.bsweb.upm.role.service.UpmRoleService;
import com.lj.app.core.common.base.entity.UpmDictionary;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.DictionaryApiService;
import com.lj.app.core.common.exception.BusinessException;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.JsonUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

import net.sf.json.JSONArray;

/**
 * 
 * 权限管理
 *
 */
@Controller
@Namespace("/jsp/permission")
@Results({ 
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "permission.jsp"),
    @Result(name = AbstractBaseAction.INPUT, 
        location = "permission-input.jsp"),
    @Result(name = "turnToPermissionList", 
        location = "permissionData.jsp"),
    @Result(name = AbstractBaseAction.LIST_RESULT,
    	location = "/jsp/permission/upmPermissionList.jsp")
    })

@Action("upmPermissionAction")
public class UpmPermissionAction extends AbstractBaseUpmAction<UpmPermission> {

  private java.lang.Integer id;

  private java.lang.Integer rolePermissionId;
  private java.lang.Integer roleId;
  private java.lang.Integer userId;

  private Long treeNodeId;
  private Long rootId = 0L;

  /** parentId: 权限菜单树的父节点 */
  private String parentId;

  /** permissionId: 权限菜单编号 */
  private String permissionId;

  /** permissionList: 权限菜单数据集合 */
  private List<UpmPermission> permissionList;

  /** permissionStateList: 权限状态字典 */
  private List<UpmDictionary> permissionStateList;

  /** permissionTypeList:权限类型字典 */
  private List<UpmDictionary> permissionTypeList;

  @Autowired
  private UpmPermissionService<UpmPermission> upmPermissionService;

  private UpmPermission upmPermission;

  @Autowired
  private UpmRoleService<UpmRole> upmRoleService;

  @Autowired
  private DictionaryApiService dictionaryService;
  
  private String extId;

  public BaseService<UpmPermission> getBaseService() {
    return upmPermissionService;
  }

  public UpmPermission getModel() {
    return upmPermission;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (id != null) {
      upmPermission = (UpmPermission) upmPermissionService.getInfoByKey(id);
    } else {
      upmPermission = new UpmPermission();
      upmPermission.setAppId(appId);
    }
  }

  /**
   * 查询用户分配的某个应用的权限
   * 
   * @return json
   * @throws Exception 异常
   */
  public String findPermissionByUserIdApi() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      condition.put("userId", userId);
      condition.put("appId", appId);
      List<UpmPermission> upmPermissionList = upmPermissionService.findPermissionByUserId(userId, appId);
      Struts2Utils.renderText(JSONArray.fromObject(upmPermissionList).toString());
      return null;
    } catch (Exception e) {
      logger.error(e.getMessage(),null);
      throw e;
    }
  }

  /**
   * 查询用户分配的某个应用的权限
   * 
   * @return json
   * @throws Exception 异常
   */
  public String findPermissionMenuByUserIdApi() throws Exception {
    try {
      List<UpmPermission> upmPermissionList = upmPermissionService.findPermissionByUserId(this.getLoginUserId(), appId,
          upmPermission.getType());
      // 根据当前登录人员获取权限菜单树
      String jsonData = upmRoleService.getPermissionTreeMenuDataJson(appId, upmPermissionList);

      if (StringUtil.isBlank(jsonData)) {
        jsonData = "";
      }
      Struts2Utils.renderText(jsonData);

      return null;
    } catch (Exception e) {
      logger.error(e.getMessage(),null);
      throw e;
    }
  }

  /**
   * 判断在同级权限菜单下 是否存在重名的权限菜单
   * 
   */
  public String checkIsExistsPermission() throws Exception {
    // 获取查询参数
    String parentId = Struts2Utils.getParameter("parentId");
    String name = Struts2Utils.getParameter("name");
    // 根据名称查询同级的菜单是否存在存在
    boolean flag = upmPermissionService.isExisitPermissionByNameAndParent(parentId, name);
    Struts2Utils.renderText(String.valueOf(flag));
    return null;
  }

  @Override
  public String input() throws Exception {
    // 获取权限的状态和类型信息
    permissionStateList = dictionaryService.getDicData("powerState");
    permissionTypeList = dictionaryService.getDicData("PowerType");

    permissionId = Struts2Utils.getParameter("permissionId");
    if (permissionId != null && !"".equals(permissionId)) {
      // 根据id查询权限菜单信息
      upmPermission = (UpmPermission) upmPermissionService.getInfoByKey(permissionId);
    } else {  // 执行新建的时候，过滤掉“注销”状态
      for (UpmDictionary o : permissionStateList) {
        if ("1".equals(o.getDataCode())) {
          permissionStateList.remove(o);
          break;
        }
      }
    }
    return INPUT;
  }

  /**
   * @Description : 获取权限菜单树
   * 
   * @return json
   * @throws Exception 异常
   */
  public String getPermissionTree() throws Exception {
    // 根据当前登录人员获取权限菜单树
    String jsonData = upmRoleService.getPermissionTreeDataJson(this.getLoginUserId(), appId, this.getLoginUserId());

    if (StringUtil.isBlank(jsonData)) {
      jsonData = "";
    }
    Struts2Utils.renderText(jsonData);
    return null;
  }

  @Override
  public String commonSaveOrUpdate() throws Exception {
    try {
      if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT_RESULT)) {
        upmPermission.setUpdateBy(getLoginUserId());
        upmPermission.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        upmPermissionService.updateObject(upmPermission);

        returnMessage = UPDATE_SUCCESS;
      } else {
        upmPermission.setCreateBy(getLoginUserId());
        upmPermission.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());

        Integer retKey = upmPermissionService.insertObjectReturnKey(upmPermission);
        returnMessage = CREATE_SUCCESS;

        int sysUserRoleId = upmRoleService.getSysRoleId(upmPermission.getAppId());
        upmRoleService.addPermissionToRole(sysUserRoleId, upmPermission.getParentId().toString(),
            String.valueOf(retKey));
      }

      return "turnToPermissionList";
    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      logger.error(e.getMessage(),null);
      throw e;
    }

  }

  /**
   * 刷新
   * @return 页面
   * @throws Exception 异常
   */
  public String reload() throws Exception {
    this.appId = Struts2Utils.getParameter("appId");
    this.parentId = Struts2Utils.getParameter("parentId");
    return RELOAD;
  }

  /**
   * 跳转到列权限菜单列表页面
   */
  public String turnToPermissionList() throws Exception {
    appId = Struts2Utils.getParameter("appId");
    parentId = Struts2Utils.getParameter("parentId");
    return "turnToPermissionList";
  }

  /**
   * 启用停用菜单
   * 
   * @return json
   */
  public String updataStat() {
    try {
      upmPermissionService.updateObject(upmPermission);
      returnMessage = "操作成功";
    } catch (Exception e) {
      logger.error(e);
      returnMessage = "操作失败";
    }
    AjaxResult ar = new AjaxResult();
    ar.setOpResult(returnMessage);

    Struts2Utils.renderJson(ar);
    return null;
  }

  /**
   * 删除校验
   */
  @Override
  public void multideleteValidate(Integer deleteId) throws BusinessException {
    List<UpmRole> list = upmRoleService.findRoleByPermisonId(deleteId);
    if (list != null && list.size() > 0) {
      throw new BusinessException(
          "删除失败,权限关联了[" + list.size() + "]个角色,要解除所有后，才可以进行删除,其中一个角色名称为:" + list.get(0).getRoleName());
    }
  }

  public String goToList() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			condition.put("appId", appId);
			List<UpmPermission> list = upmPermissionService.findBaseModeList(condition);
			JSONArray jsonArray = JSONArray.fromObject(list);
			
			Struts2Utils.getRequest().setAttribute("list", jsonArray.toString());
			return LIST_RESULT;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	/**
	*json 树数据
	*/
	public String  treeData()  throws Exception{
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("appId", appId);
		List<UpmPermission> list = upmPermissionService.findBaseModeList(condition);
		for (int i=0; i<list.size(); i++){
			UpmPermission e = list.get(i);
			if (StringUtil.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && String.valueOf(e.getParentId()).indexOf(","+extId+",")==-1)){
				Map<String, Object> map =new HashMap<String,Object>();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		
		Struts2Utils.renderJson(mapList);
		return null;
	}
	
  public java.lang.Integer getId() {
    return id;
  }

  public void setId(java.lang.Integer id) {
    this.id = id;
  }

  public String getAppId() {
    return appId;
  }

  public void setAppId(String appId) {
    this.appId = appId;
  }

  public UpmPermissionService<UpmPermission> getUpmPermissionService() {
    return upmPermissionService;
  }

  public void setUpmPermissionService(UpmPermissionService<UpmPermission> upmPermissionService) {
    this.upmPermissionService = upmPermissionService;
  }

  public UpmPermission getUpmPermission() {
    return upmPermission;
  }

  public void setUpmPermission(UpmPermission upmPermission) {
    this.upmPermission = upmPermission;
  }

  public java.lang.Integer getRolePermissionId() {
    return rolePermissionId;
  }

  public void setRolePermissionId(java.lang.Integer rolePermissionId) {
    this.rolePermissionId = rolePermissionId;
  }

  public java.lang.Integer getRoleId() {
    return roleId;
  }

  public void setRoleId(java.lang.Integer roleId) {
    this.roleId = roleId;
  }

  public Long getTreeNodeId() {
    return treeNodeId;
  }

  public void setTreeNodeId(Long treeNodeId) {
    this.treeNodeId = treeNodeId;
  }

  public Long getRootId() {
    return rootId;
  }

  public void setRootId(Long rootId) {
    this.rootId = rootId;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public String getParentId() {
    return parentId;
  }

  public void setParentId(String parentId) {
    this.parentId = parentId;
  }

  public String getPermissionId() {
    return permissionId;
  }

  public void setPermissionId(String permissionId) {
    this.permissionId = permissionId;
  }

  public List<UpmPermission> getPermissionList() {
    return permissionList;
  }

  public void setPermissionList(List<UpmPermission> permissionList) {
    this.permissionList = permissionList;
  }

  public List<UpmDictionary> getPermissionStateList() {
    return permissionStateList;
  }

  public void setPermissionStateList(List<UpmDictionary> permissionStateList) {
    this.permissionStateList = permissionStateList;
  }

  public List<UpmDictionary> getPermissionTypeList() {
    return permissionTypeList;
  }

  public void setPermissionTypeList(List<UpmDictionary> permissionTypeList) {
    this.permissionTypeList = permissionTypeList;
  }

  public UpmRoleService<UpmRole> getUpmRoleService() {
    return upmRoleService;
  }

  public void setUpmRoleService(UpmRoleService<UpmRole> upmRoleService) {
    this.upmRoleService = upmRoleService;
  }

  public DictionaryApiService getDictionaryService() {
    return dictionaryService;
  }

  public void setDictionaryService(DictionaryApiService dictionaryService) {
    this.dictionaryService = dictionaryService;
  }

	public String getExtId() {
		return extId;
	}
	
	public void setExtId(String extId) {
		this.extId = extId;
	}

}
