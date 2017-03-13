package com.lj.app.core.common.flows.model;

/**
 * 工作元素
 */
public abstract class WorkModel extends NodeModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 761102386160546149L;
	/**
	 * form
	 */
	private String form;
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
}