package com.lj.app.bsweb.upm.sys.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.UpmSysLog;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmSysLogService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :系统日志
 * @description :UpmSysLogAction
 * @author: userName
 * @date: 2017-12-07 10:37:38
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/sys")
@Results({ 
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "upmSysLogAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST_RESULT, 
        location = "/jsp/sys/upmSysLogList.jsp", type = AbstractBaseAction.REDIRECT)
    })

@Action("upmSysLogAction")
public class UpmSysLogAction extends AbstractBaseUpmAction<UpmSysLog> {

  protected Logger logger = LoggerFactory.getLogger(UpmSysLogAction.class);

  @Autowired
  private UpmSysLogService upmSysLogService;

  private UpmSysLog upmSysLog;

  public BaseService getBaseService() {
    return upmSysLogService;
  }

  public UpmSysLog getModel() {
    return upmSysLog;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (upmSysLog.getId() != null) {
      upmSysLog = (UpmSysLog) upmSysLogService.getInfoByKey(upmSysLog.getId());
    } else {
      upmSysLog = new UpmSysLog();
    }
  }

  public void setUpmSysLog(UpmSysLog upmSysLog) {
    this.upmSysLog = upmSysLog;
  }

  public UpmSysLog getUpmSysLog() {
    return upmSysLog;
  }

}
