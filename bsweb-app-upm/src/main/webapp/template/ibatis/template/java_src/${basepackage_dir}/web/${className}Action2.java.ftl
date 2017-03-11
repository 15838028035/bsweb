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
 * @title :${table.remarks}
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

	@Autowired
	private ${className}Service ${classNameLower}Service;
	
	private ${className} ${classNameLower};
	
	private ${table.idColumn.javaType} ${table.idColumn.columnNameFirstLower};
	
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

	public void set${className}Service(${className}Service ${classNameLower}Service){
		this.${classNameLower}Service = ${classNameLower}Service;
	}
	
	public void set${className}(${className} ${classNameLower}){
		this.${classNameLower} = ${classNameLower};
	}
	
	public void set${table.idColumn.columnNameFirstUpper}(${table.idColumn.javaType} ${table.idColumn.columnNameFirstLower}){
		this.${table.idColumn.columnNameFirstLower} =  ${table.idColumn.columnNameFirstLower};
	}
	
	
	public ${className}Service get${className}Service(){
		return ${classNameLower}Service;
	}
	
	public ${className} get${className}(){
		return ${classNameLower};
	}
	
	public ${table.idColumn.javaType}  get${table.idColumn.columnNameFirstUpper}(){
		return ${table.idColumn.columnNameFirstLower};
	}
}

