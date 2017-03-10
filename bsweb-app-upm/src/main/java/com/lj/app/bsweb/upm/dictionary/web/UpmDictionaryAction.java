package com.lj.app.bsweb.upm.dictionary.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.UpmDictionary;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmDictionaryService;
import com.lj.app.core.common.web.AbstractBaseAction;

@Controller
@Namespace("/jsp/dictionary")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/dictionary/upmDictionary-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmDictionaryAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/dictionary/upmDictionaryList.jsp?nodeId=${nodeId}", type=AbstractBaseAction.REDIRECT)
})

@Action("upmDictionaryAction")
public class UpmDictionaryAction extends AbstractBaseUpmAction<UpmDictionary> {

	private java.lang.Integer id;
	private java.lang.Integer nodeId;
	
	@Autowired
	private UpmDictionaryService<UpmDictionary> upmDictionaryService;
	
	private UpmDictionary upmDictionary;
	
	public   BaseService<UpmDictionary> getBaseService(){
		return upmDictionaryService;
	}
	
	public UpmDictionary getModel() {
		return upmDictionary;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			upmDictionary = (UpmDictionary)upmDictionaryService.getInfoByKey(id);
		}else {
			upmDictionary = new UpmDictionary();
			upmDictionary.setNodeId(nodeId);
		}
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}

	public java.lang.Integer getNodeId() {
		return nodeId;
	}

	public void setNodeId(java.lang.Integer nodeId) {
		this.nodeId = nodeId;
	}

	public UpmDictionaryService<UpmDictionary> getUpmDictionaryService() {
		return upmDictionaryService;
	}

	public void setUpmDictionaryService(
			UpmDictionaryService<UpmDictionary> upmDictionaryService) {
		this.upmDictionaryService = upmDictionaryService;
	}

	public UpmDictionary getUpmDictionary() {
		return upmDictionary;
	}

	public void setUpmDictionary(UpmDictionary upmDictionary) {
		this.upmDictionary = upmDictionary;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

}

