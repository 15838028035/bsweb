package com.lj.app.bsweb.upm.user.web;

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
import com.lj.app.bsweb.upm.user.entity.UpmUserGroup;
import com.lj.app.bsweb.upm.user.service.UpmUserGroupService;
import com.lj.app.core.common.base.entity.BaseEntity;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.exception.BusinessException;
import com.lj.app.core.common.tree.BootStrapTreeView;
import com.lj.app.core.common.tree.BootStrapTreeViewCheck;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

/**
 * 
 * 用户组
 *
 */
@Controller
@Namespace("/jsp/user")
@Results({ 
    @Result(name = AbstractBaseAction.INPUT,
        location = "/jsp/user/upmUserGroup-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE, 
        location = "upmUserGroupAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST, 
        location = "/jsp/user/upmUserGroupList.jsp", type = AbstractBaseAction.REDIRECT) 
      })

@Action("upmUserGroupAction")
public class UpmUserGroupAction extends AbstractBaseUpmAction<UpmUserGroup> {

  private java.lang.Integer id;
  private String userGroupName;
  private java.lang.Integer parentId;

  private Long treeNodeId;
  private Long rootId = 0L;

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

  public UpmUserGroupService getUpmUserGroupService() {
    return upmUserGroupService;
  }

  public void setUpmUserGroupService(UpmUserGroupService upmUserGroupService) {
    this.upmUserGroupService = upmUserGroupService;
  }

  public UpmUserGroup getUpmUserGroup() {
    return upmUserGroup;
  }

  public void setUpmUserGroup(UpmUserGroup upmUserGroup) {
    this.upmUserGroup = upmUserGroup;
  }

  @Autowired
  private UpmUserGroupService<UpmUserGroup> upmUserGroupService;

  private UpmUserGroup upmUserGroup;

  public BaseService<UpmUserGroup> getBaseService() {
    return upmUserGroupService;
  }

  public UpmUserGroup getModel() {
    return upmUserGroup;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (id != null) {
      upmUserGroup = (UpmUserGroup) upmUserGroupService.getInfoByKey(id);
    } else {
      upmUserGroup = new UpmUserGroup();
      upmUserGroup.setParentId(parentId);
    }
  }

  /**
   * 树列表
   * @return json
   * @throws Exception 异常
   */
  public String treeList() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      condition.put("userGroupName", userGroupName);

      String jsonStr = "";

      List<UpmUserGroup> upmUserGroupList = new ArrayList<UpmUserGroup>();

      if (treeNodeId == null) {
        treeNodeId = 0L;
      }

      if (StringUtil.isBlank(userGroupName)) {

        upmUserGroupList = upmUserGroupService.findUpmUserGroupByParentId(treeNodeId);
      } else {
        upmUserGroupList = upmUserGroupService.findUpmUserGroupByGroupName(userGroupName);
      }

      List<BootStrapTreeView> treeNodeList = new ArrayList<BootStrapTreeView>();

      for (UpmUserGroup group : upmUserGroupList) {
        String text = group.getUserGroupName() + "[" + group.getUserGroupCode() + "]" + "[" + group.getBussinessCode()
            + "]";
        treeNodeList.add(
            BootStrapTreeViewCheck.createNew(String.valueOf(group.getId()), text, String.valueOf(group.getParentId())));
      }

      jsonStr = BootStrapTreeViewCheck.valueOfString(treeNodeList, treeNodeId.toString());

      if (StringUtil.isBlank(jsonStr)) {
        jsonStr = BootStrapTreeViewCheck.defaultBootStrapTreeViewCheck(rootId.toString(), "没有匹配节点");
      }
      Struts2Utils.renderText(jsonStr);
      return null;
    } catch (Exception e) {
      e.printStackTrace();
      throw e;
    }
  }

  @Override
  public String input() throws Exception {
    return INPUT;
  }

  @Override
  public String commonSaveOrUpdate() throws Exception {
    try {
      if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT)) {
        BaseEntity entity = (BaseEntity) getModel();
        entity.setUpdateBy(this.getLoginUserId());
        entity.setUpdateByUname(this.getUserName());
        entity.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());

        getBaseService().updateObject(entity);
        returnMessage = UPDATE_SUCCESS;
      } else {
        BaseEntity entity = (BaseEntity) getModel();
        entity.setCreateBy(this.getLoginUserId());
        entity.setCreateByUname(this.getUserName());
        entity.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());

        getBaseService().insertObject(entity);
        returnMessage = CREATE_SUCCESS;
      }

    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      e.printStackTrace();
      throw e;
    }

    return input();
  }

  /**
   * 删除校验
   */
  @Override
  public void multideleteValidate(Integer deleteId) throws BusinessException {
    if (deleteId == null || deleteId == 0) {
      throw new BusinessException("根节点不能进行删除");
    }

    List<UpmUserGroup> list = upmUserGroupService.findUpmUserGroupByParentId(Long.parseLong(String.valueOf(deleteId)));

    if (list != null && list.size() > 0) {
      throw new BusinessException("删除失败,有[" + list.size() + "]个子节点,要解除所有子节点后，才可以进行删除");
    }
  }

  public void setId(java.lang.Integer value) {
    this.id = value;
  }

  public java.lang.Integer getId() {
    return this.id;
  }

  public String getUserGroupName() {
    return userGroupName;
  }

  public void setUserGroupName(String userGroupName) {
    this.userGroupName = userGroupName;
  }

  public java.lang.Integer getParentId() {
    return parentId;
  }

  public void setParentId(java.lang.Integer parentId) {
    this.parentId = parentId;
  }

}
