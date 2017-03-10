package com.lj.app.bsweb.upm.dictionary.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.FreemarkerTemplateConfig;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.FreemarkerTemplateConfigService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :reemarker模版配置
 * @description :FreemarkerTemplateConfigAction
 * @author: liujie
 * @date: 2016-10-16 09:31:49
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/freemarkerTemplateConfig")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "freemarkerTemplateConfigAction", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/freemarkerTemplateConfig/freemarkerTemplateConfig-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "freemarkerTemplateConfigAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("freemarkerTemplateConfigAction")
public class FreemarkerTemplateConfigAction extends AbstractBaseUpmAction<FreemarkerTemplateConfig> {
	
	 protected Logger logger = LoggerFactory.getLogger(FreemarkerTemplateConfigAction.class);

	@Autowired
	private FreemarkerTemplateConfigService<FreemarkerTemplateConfig> freemarkerTemplateConfigService;
	
	private FreemarkerTemplateConfig freemarkerTemplateConfig;
	
	private java.lang.Integer id;
	
	public   BaseService<FreemarkerTemplateConfig> getBaseService(){
		return freemarkerTemplateConfigService;
	}
	
	public FreemarkerTemplateConfig getModel() {
		return freemarkerTemplateConfig;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			freemarkerTemplateConfig = (FreemarkerTemplateConfig)freemarkerTemplateConfigService.getInfoByKey(id);
		} else {
			freemarkerTemplateConfig = new FreemarkerTemplateConfig();
		}
	}

	public void setFreemarkerTemplateConfig(FreemarkerTemplateConfig freemarkerTemplateConfig){
		this.freemarkerTemplateConfig = freemarkerTemplateConfig;
	}
	
	public void setId(java.lang.Integer id){
		this.id =  id;
	}
	
	public FreemarkerTemplateConfigService<FreemarkerTemplateConfig> getFreemarkerTemplateConfigService() {
		return freemarkerTemplateConfigService;
	}

	public void setFreemarkerTemplateConfigService(
			FreemarkerTemplateConfigService<FreemarkerTemplateConfig> freemarkerTemplateConfigService) {
		this.freemarkerTemplateConfigService = freemarkerTemplateConfigService;
	}

	public FreemarkerTemplateConfig getFreemarkerTemplateConfig() {
		return freemarkerTemplateConfig;
	}

	public java.lang.Integer  getId(){
		return id;
	}
}

