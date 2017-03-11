<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
*${table.tableAlias}
*/
public class ${className} extends BaseEntity{
	
<#list table.columns as column>
	<#if !column.fk>
	/**
	 * ${column.remarks}  ${column.sqlName}
	 */
	private ${column.javaType} ${column.columnNameLower};
	
	 <#if column.isDateTimeColumn>
	 /**
	 * ${column.remarks}Begin
	 */
	private String  ${column.columnNameLower}Begin;
	/**
	 * ${column.remarks}End
	 */
	private String ${column.columnNameLower}End;
	</#if>
	</#if>
</#list>

<#list table.importedKeys.associatedTables?values as foreignKey>
	<#assign fkSqlTable = foreignKey.sqlTable>
	<#assign fkTable    = fkSqlTable.className>
	<#assign fkPojoClass = fkSqlTable.className>
	<#assign fkPojoClassVar = fkPojoClass?uncap_first>
	private ${fkPojoClass} ${fkPojoClassVar};
	
	public void set${fkPojoClass}(${fkPojoClass} ${fkPojoClassVar}){
		this.${fkPojoClassVar} = ${fkPojoClassVar};
	}
	
	public ${fkPojoClass} get${fkPojoClass}() {
		return ${fkPojoClassVar};
	}
</#list>

<@generateJavaColumns/>

	public String toString() {
		return new ToStringBuilder(this)
		<#list table.columns as column>
			<#if !column.fk>
			.append("${column.columnName}",get${column.columnName}())
			</#if>
		</#list>
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
		<#list table.columns as column>
		<#if !column.fk>
			.append(get${column.columnName}())
		</#if>
		</#list>
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof ${className} == false) return false;
		if(this == obj) return true;
		${className} other = (${className})obj;
		return new EqualsBuilder()
			<#list table.columns as column>
			<#if !column.fk>
			.append(get${column.columnName}(),other.get${column.columnName}())
			</#if>
			</#list>
			.isEquals();
	}
}

<#macro generateJavaColumns>
	<#list table.columns as column>
	<#if !column.fk>
	public void set${column.columnName}(${column.javaType} value) {
		this.${column.columnNameLower} = value;
	}
	
	public ${column.javaType} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
	</#if>
	</#list>
</#macro>

