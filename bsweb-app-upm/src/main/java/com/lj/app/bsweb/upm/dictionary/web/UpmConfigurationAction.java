package com.lj.app.bsweb.upm.dictionary.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.UpmConfiguration;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmConfigurationService;
import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :UpmConfigurationAction.java
 * @description :UpmConfigurationAction
 * @author: userName
 * @date: 2016-04-20
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/dictionary")
@Results({
    @Result(name = AbstractBaseAction.RELOAD,
        location = "/jsp/dictionary/upmConfigurationList.jsp", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT,
        location = "/jsp/dictionary/upmConfiguration-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE,
        location = "upmConfigurationAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST, 
        location = "/jsp/dictionary/upmConfigurationList.jsp", type = AbstractBaseAction.REDIRECT)
    })

@Action("upmConfigurationAction")
public class UpmConfigurationAction extends AbstractBaseUpmAction<UpmConfiguration> {

  protected Logger logger = LoggerFactory.getLogger(UpmConfigurationAction.class);

  @Autowired
  private UpmConfigurationService<UpmConfiguration> upmConfigurationService;

  private UpmConfiguration upmConfiguration;

  /**
   * ID
   */
  private Integer configId;

  public BaseService<UpmConfiguration> getBaseService() {
    return upmConfigurationService;
  }

  public UpmConfiguration getModel() {
    return upmConfiguration;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (configId != null) {
      upmConfiguration = (UpmConfiguration) upmConfigurationService.getInfoByKey(configId);
    } else {
      upmConfiguration = new UpmConfiguration();
    }
  }

  @Override
  public String input() throws Exception {
    return INPUT;
  }

  @Override
  public String save() throws Exception {
    return commonSaveOrUpdate();
  }

  /**
   * 重新加载配置
   * @return json
   * @throws Exception 异常信息
   */
  public String reloadConfigPro() throws Exception {
    returnMessage = "加载成功";
    try {
      upmConfigurationService.reloadConfigPro();
    } catch (Exception e) {
      returnMessage = "加载失败";
      e.printStackTrace();
      throw e;
    }
    AjaxResult ar = new AjaxResult();
    ar.setOpResult(returnMessage);
    Struts2Utils.renderJson(ar);
    return null;
  }

  public UpmConfigurationService<UpmConfiguration> getUpmConfigurationService() {
    return upmConfigurationService;
  }

  public void setUpmConfigurationService(UpmConfigurationService<UpmConfiguration> upmConfigurationService) {
    this.upmConfigurationService = upmConfigurationService;
  }

  public Integer getConfigId() {
    return configId;
  }

  public void setConfigId(Integer configId) {
    this.configId = configId;
  }

  public UpmConfiguration getUpmConfiguration() {
    return upmConfiguration;
  }

  public void setUpmConfiguration(UpmConfiguration upmConfiguration) {
    this.upmConfiguration = upmConfiguration;
  }

}
