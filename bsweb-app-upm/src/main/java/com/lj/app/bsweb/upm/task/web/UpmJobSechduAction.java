package com.lj.app.bsweb.upm.task.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.task.entity.UpmJobSechdu;
import com.lj.app.core.common.task.service.UpmJobSechduService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :UpmJobSechduAction.java
 * @description :UpmJobSechduAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/upmJobSechdu")
@Results({
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "upmJobSechduAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT, 
        location = "/jsp/task/upmJobSechdu-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE,
        location = "upmJobSechduAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST, 
        location = "/jsp/task/upmJobSechduList.jsp", type = AbstractBaseAction.REDIRECT)
    })

@Action("upmJobSechduAction")
public class UpmJobSechduAction extends AbstractBaseUpmAction<UpmJobSechdu> {

  protected Logger logger = LoggerFactory.getLogger(UpmJobSechduAction.class);

  @Autowired
  private UpmJobSechduService upmJobSechduService;

  private UpmJobSechdu upmJobSechdu;

  private Integer jobId;

  public BaseService getBaseService() {
    return upmJobSechduService;
  }

  public UpmJobSechdu getModel() {
    return upmJobSechdu;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (upmJobSechdu.getId() != null) {
      upmJobSechdu = (UpmJobSechdu) upmJobSechduService.getInfoByKey(upmJobSechdu.getId());
    } else {
      upmJobSechdu = new UpmJobSechdu();
    }
  }

  /**
   * 公共bootStrapList查询方法
   * 
   * @return json
   * @throws Exception 异常
   */
  public String bootStrapList() throws Exception {
    Map<String, Object> condition = new HashMap<String, Object>();
    condition.put("jobId", jobId);
    return bootStrapListCommon(condition);
  }

  public UpmJobSechduService getUpmJobSechduService() {
    return upmJobSechduService;
  }

  public void setUpmJobSechduService(UpmJobSechduService upmJobSechduService) {
    this.upmJobSechduService = upmJobSechduService;
  }

  public UpmJobSechdu getUpmJobSechdu() {
    return upmJobSechdu;
  }

  public void setUpmJobSechdu(UpmJobSechdu upmJobSechdu) {
    this.upmJobSechdu = upmJobSechdu;
  }

  public Integer getJobId() {
    return jobId;
  }

  public void setJobId(Integer jobId) {
    this.jobId = jobId;
  }

}
