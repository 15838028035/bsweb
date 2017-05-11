package com.lj.app.bsweb.xpplanner;

import java.util.HashMap;
import java.util.Map;

import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;

@SuppressWarnings("serial")
public abstract class AbstractBaseUpmAction<T> extends AbstractBaseAction<T>{

	@Override
	public String list() throws Exception {
		return null;
	}
	
	@Override
	public String save() throws Exception {
		return null;
	}
	
	@Override
	public String input() throws Exception {
		return INPUT;
	}
	
	@Override
	public String delete() throws Exception {
		return null;
	}
	
	/**
	 * 公共bootStrapList查询方法
	 * @return
	 * @throws Exception
	 */
	public String bootStrapList() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			page.setFilters(getModel());
			
			if (StringUtil.isNotBlank(this.getSortName())) {
				String orderBy = PageTool.convert(this.getSortName()) + " "+ this.getSortOrder();
				page.setSortColumns(orderBy);
			}
			
			page = getBaseService().findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
}
}
