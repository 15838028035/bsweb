package com.lj.app.bsweb.upm.dictionary.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.UpmDictionaryNote;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmDictionaryNoteService;
import com.lj.app.core.common.web.AbstractBaseAction;

@Controller
@Namespace("/jsp/dictionary")
@Results({
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/dictionary/upmDictionaryNote-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "upmDictionaryNoteAction!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/dictionary/upmDictionaryNoteList.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("upmDictionaryNoteAction")
public class UpmDictionaryNoteAction extends AbstractBaseUpmAction<UpmDictionaryNote> {
	private java.lang.Integer id;
	@Autowired
	private UpmDictionaryNoteService<UpmDictionaryNote> upmDictionaryNoteService;
	private UpmDictionaryNote upmDictionaryNote;
	
	public   BaseService<UpmDictionaryNote> getBaseService(){
		return upmDictionaryNoteService;
	}
	
	public UpmDictionaryNote getModel() {
		return upmDictionaryNote;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			upmDictionaryNote = (UpmDictionaryNote)upmDictionaryNoteService.getInfoByKey(id);
		} else {
			upmDictionaryNote = new UpmDictionaryNote();
		}
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}

	public UpmDictionaryNoteService<UpmDictionaryNote> getUpmDictionaryNoteService() {
		return upmDictionaryNoteService;
	}

	public void setUpmDictionaryNoteService(
			UpmDictionaryNoteService<UpmDictionaryNote> upmDictionaryNoteService) {
		this.upmDictionaryNoteService = upmDictionaryNoteService;
	}

	public UpmDictionaryNote getUpmDictionaryNote() {
		return upmDictionaryNote;
	}

	public void setUpmDictionaryNote(UpmDictionaryNote upmDictionaryNote) {
		this.upmDictionaryNote = upmDictionaryNote;
	}
	
}

