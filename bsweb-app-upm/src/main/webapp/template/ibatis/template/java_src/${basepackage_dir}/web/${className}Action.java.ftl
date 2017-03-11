<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.web;

import ${basepackage}.entity.${className};
import ${basepackage}.service.${className}Service;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.web.AbstractBaseAction;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :${className}Action.java
 * @description :${className}Action
 * @author: ${author}
 * @date: ${now?string("yyyy-MM-dd HH:mm:ss")}
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/${classNameLower}")
@Results({
	    @Result(name = AbstractBaseAction.RELOAD, location = "${classNameLower}Action", type = AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.INPUT, location = "/jsp/${classNameLower}/${classNameLower}-input.jsp"),
		@Result(name = AbstractBaseAction.SAVE, location = "${classNameLower}Action!edit.action",type=AbstractBaseAction.REDIRECT),
		@Result(name = AbstractBaseAction.LIST, location = "/jsp/${classNameLower}/${classNameLower}List.jsp", type=AbstractBaseAction.REDIRECT)
})

@Action("${classNameLower}Action")
public class ${className}Action extends AbstractBaseAction<${className}> {
	
	 protected Logger logger = LoggerFactory.getLogger(${className}Action.class);
	 
<#list table.columns as column>
	<#if !column.fk>
	/**
	 * ${column.remarks}
	 */
	private ${column.javaType} ${column.columnNameLower};
	
	</#if>
</#list>
	
	/**
	*排序列
	*/
	private String sidx;
	
	/**
	*排序方式
	*/
	private String sord;
	
	/**
	*排序列
	*/
	private String sortColumns;

	@Autowired
	private ${className}Service ${classNameLower}Service;
	
	private ${className} ${classNameLower};
	
	public   BaseService getBaseService(){
		return ${classNameLower}Service;
	}
	
	public ${className} getModel() {
		return ${classNameLower};
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			${classNameLower} = (${className})${classNameLower}Service.getInfoByKey(id);
		} else {
			${classNameLower} = new ${className}();
		}
		
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			if (ValidateUtil.isNotEmpty(this.getSidx())) {
				String orderBy = PageTool.convert(this.getSidx()) + " "+ this.getSord();
				sortColumns= orderBy;
				page.setSortColumns(sortColumns);
			}
			
			<#list table.columns as column>
			condition.put("${column.columnNameLower}",  ${column.columnNameLower});
			<#if column.isDateTimeColumn>
			condition.put("${column.columnNameLower}Begin",  Struts2Utils.getParam("${column.columnNameLower}Begin"));
			condition.put("${column.columnNameLower}End",  Struts2Utils.getParam("${column.columnNameLower}End"));
			</#if>
			</#list>
			condition.put(CREATE_BY, getLoginUserId());
			
			${classNameLower}Service.findPageList(page, condition);
			Struts2Utils.renderText(PageTool.pageToJsonJQGrid(this.page),new String[0]);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public String input() throws Exception {
		return INPUT;
	}
	
	@Override
	public String save() throws Exception {
	boolean isSave = true;//是否保存操作
		
	try{
			if (operate != null && operate.equals("edit")) {
				<#list table.columns as column>
				${classNameLower}.set${column.columnName}(${column.columnNameLower});
				</#list>
				${classNameLower}.setUpdateBy(getLoginUserId());
				${classNameLower}.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				${classNameLower}Service.updateObject(${classNameLower});
				
				returnMessage = UPDATE_SUCCESS;
			}else{
				${classNameLower} = new ${className}();
				<#list table.columns as column>
				${classNameLower}.set${column.columnName}(${column.columnNameLower});
				</#list>
				
				${classNameLower}.setCreateBy(getLoginUserId());
				${classNameLower}.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
				${classNameLower}Service.insertObject(${classNameLower});
				returnMessage = CREATE_SUCCESS;
			}
			
			return LIST;
		}catch(Exception e){
			returnMessage = CREATE_FAILURE;
			e.printStackTrace();
			throw e;
		}finally{
		}
		
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	<@generateJavaColumns/>
	
	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}
	
	public String getSortColumns() {
		return sortColumns;
	}

	public void setSortColumns(String sortColumns) {
		this.sortColumns = sortColumns;
	}

<#macro generateJavaColumns>
	<#list table.columns as column>
	public void set${column.columnName}(${column.javaType} value) {
		this.${column.columnNameLower} = value;
	}
	
	public ${column.javaType} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
	</#list>
</#macro>

}

