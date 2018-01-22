package com.lj.app.bsweb.upm.user.web;

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
import com.lj.app.bsweb.upm.user.entity.UpmUserAndUserGroupRel;
import com.lj.app.bsweb.upm.user.service.UpmUserAndUserGroupRelService;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

/**
 * 
 * 用户和用户组关系服务
 *
 */
@Controller
@Namespace("/jsp/user")
@Results({ 
    @Result(name = AbstractBaseAction.INPUT, 
        location = "/jsp/user/upmUserAndUserGroupRel-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE,
        location = "upmUserAndUserGroupRelAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST,
        location = "/jsp/user/upmUserAndUserGroupRelList.jsp", type = AbstractBaseAction.REDIRECT) 
      })
@Action("upmUserAndUserGroupRelAction")
public class UpmUserAndUserGroupRelAction extends AbstractBaseUpmAction<UpmUserAndUserGroupRel> {

  private java.lang.Integer id;
  private java.lang.Integer userId;
  private java.lang.Integer groupId;

  @Autowired
  private UpmUserAndUserGroupRelService upmUserAndUserGroupRelService;

  private UpmUserAndUserGroupRel upmUserAndUserGroupRel;

  public BaseService getBaseService() {
    return upmUserAndUserGroupRelService;
  }

  public UpmUserAndUserGroupRel getModel() {
    return upmUserAndUserGroupRel;
  }

  @Override
  protected void prepareModel() throws Exception {
    upmUserAndUserGroupRel = (UpmUserAndUserGroupRel) upmUserAndUserGroupRelService.getInfoByKey(id);
  }

  /**
   * 批量删除
   * @return json
   * @throws Exception 异常
   */
  public String doBatchSaveRel() throws Exception {

    String returnMessage = "";
    String[] multiSelectedTmp;
    if (multiSelected.indexOf(",") > 0) {
      multiSelectedTmp = multiSelected.split(",");
    } else {
      multiSelectedTmp = new String[] { multiSelected };
    }
    for (int i = 0; i < multiSelectedTmp.length; i++) {
      int selectedId = Integer.parseInt(multiSelectedTmp[i].trim());

      try {

        Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("userId", selectedId);
        condition.put("groupId", groupId);

        List<UpmUserAndUserGroupRel> list = upmUserAndUserGroupRelService.findBaseModeList("select", condition);
        if (list != null && list.size() > 0) {
          upmUserAndUserGroupRel = list.get(0);
          upmUserAndUserGroupRel.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
          upmUserAndUserGroupRelService.updateObject(upmUserAndUserGroupRel);

        } else {
          upmUserAndUserGroupRel = new UpmUserAndUserGroupRel();
          upmUserAndUserGroupRel.setUserId(selectedId);
          upmUserAndUserGroupRel.setGroupId(groupId);

          upmUserAndUserGroupRel.setCreateBy(getLoginUserId());
          upmUserAndUserGroupRel.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
          upmUserAndUserGroupRelService.insertObject(upmUserAndUserGroupRel);
          returnMessage = CREATE_SUCCESS;
        }
      } catch (Exception e) {
        returnMessage = "保存失败";
        e.printStackTrace();
        throw e;
      } 
    }
    AjaxResult ar = new AjaxResult();
    ar.setOpResult(returnMessage);

    Struts2Utils.renderJson(ar);
    return null;
  }

  public java.lang.Integer getId() {
    return id;
  }

  public void setId(java.lang.Integer id) {
    this.id = id;
  }

  public java.lang.Integer getUserId() {
    return userId;
  }

  public void setUserId(java.lang.Integer userId) {
    this.userId = userId;
  }

  public java.lang.Integer getGroupId() {
    return groupId;
  }

  public void setGroupId(java.lang.Integer groupId) {
    this.groupId = groupId;
  }

  public UpmUserAndUserGroupRelService getUpmUserAndUserGroupRelService() {
    return upmUserAndUserGroupRelService;
  }

  public void setUpmUserAndUserGroupRelService(UpmUserAndUserGroupRelService upmUserAndUserGroupRelService) {
    this.upmUserAndUserGroupRelService = upmUserAndUserGroupRelService;
  }

  public UpmUserAndUserGroupRel getUpmUserAndUserGroupRel() {
    return upmUserAndUserGroupRel;
  }

  public void setUpmUserAndUserGroupRel(UpmUserAndUserGroupRel upmUserAndUserGroupRel) {
    this.upmUserAndUserGroupRel = upmUserAndUserGroupRel;
  }

}
