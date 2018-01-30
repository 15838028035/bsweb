package com.lj.app.bsweb.upm.upmNotice.web;

import java.util.Date;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.BaseEntity;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.notify.entity.UpmNotice;
import com.lj.app.core.common.notify.service.UpmNoticeService;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :通知管理
 * @description :UpmNoticeAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/upmNotice")
@Results({ 
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "upmNoticeAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT, 
        location = "/jsp/upmNotice/upmNotice-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE_RESULT, 
        location = "upmNoticeAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST_RESULT, 
        location = "/jsp/upmNotice/upmNoticeList.jsp", type = AbstractBaseAction.REDIRECT)
      })

@Action("upmNoticeAction")
public class UpmNoticeAction extends AbstractBaseUpmAction<UpmNotice> {

  protected Logger logger = LoggerFactory.getLogger(UpmNoticeAction.class);

  @Autowired
  private UpmNoticeService upmNoticeService;

  private UpmNotice upmNotice;

  public BaseService getBaseService() {
    return upmNoticeService;
  }

  public UpmNotice getModel() {
    return upmNotice;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (upmNotice.getId() != null) {
      upmNotice = (UpmNotice) upmNoticeService.getInfoByKey(upmNotice.getId());
    } else {
      upmNotice = new UpmNotice();
    }
  }

  /**
   * 公共保存或者更新方法
   * 
   * @return 页面
   * @throws Exception 异常
   */
  public String commonSaveOrUpdate() throws Exception {

    try {
      if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT_RESULT)) {
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

        upmNotice.setCreateDateTime(new Date());
        getBaseService().insertObject(entity);
        returnMessage = CREATE_SUCCESS;
      }

      return LIST_RESULT;
    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      e.printStackTrace();
      throw e;
    }
  }

  public UpmNoticeService getUpmNoticeService() {
    return upmNoticeService;
  }

  public void setUpmNoticeService(UpmNoticeService upmNoticeService) {
    this.upmNoticeService = upmNoticeService;
  }

  public UpmNotice getUpmNotice() {
    return upmNotice;
  }

  public void setUpmNotice(UpmNotice upmNotice) {
    this.upmNotice = upmNotice;
  }

}
