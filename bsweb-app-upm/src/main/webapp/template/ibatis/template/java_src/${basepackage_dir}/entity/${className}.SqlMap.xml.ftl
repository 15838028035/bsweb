<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" 
    "http://ibatis.apache.org/dtd/sql-map-2.dtd">

<sqlMap namespace="${classNameLower}">

    <typeAlias alias="${classNameLower}" type="${basepackage}.entity.${className}"/>

    <resultMap id="${classNameLower}Result" class="${classNameLower}">
        <#list table.columns as column>
      	<#if !column.fk>	
   	  	<result property="${column.columnNameLower}" column="${column.sqlName}"  <#if column.hasNullValue> nullValue="${column.nullValue}"</#if> />
		<#else>
		<#list table.importedKeys.associatedTables?values as foreignKey>
			<#assign fkSqlTable = foreignKey.sqlTable>
			<#assign primaryKeyColumns = fkSqlTable.primaryKeyColumns>
			<#list primaryKeyColumns as pkCol>
				<#if pkCol == column.sqlName>
					<#assign fkTable = fkSqlTable.className>
					<#assign fkPojoClass = fkSqlTable.className>
					<#assign fkPojoClassVar = fkPojoClass?uncap_first>
   	  	<result property="${fkPojoClassVar}" column="${column.sqlName}" select="${fkPojoClass}.findById"/>
				</#if>
			</#list>
		</#list>		
		</#if>
		</#list>
    </resultMap>

	<sql id="dynamicWhere">
	    <dynamic prepend="WHERE">
	       <#list table.columns as column>
			<#if !column.fk>	
	       <isNotEmpty prepend="AND" property="${column.columnNameLower}">
	             ${column.sqlName} = #${column.columnNameLower}#
	       </isNotEmpty>
	       <#if column.isDateTimeColumn>
	       <isNotEmpty prepend="AND" property="${column.columnNameLower}Begin">
	             <![CDATA[
	             ${column.sqlName} >= str_to_date('#${column.columnNameLower}begin#','%Y-%m-%d') 
	             ]]>
	       </isNotEmpty>
	       <isNotEmpty prepend="AND" property="${column.columnNameLower}End">
	             <![CDATA[
	             ${column.sqlName} <= str_to_date('#${column.columnNameLower}End#','%Y-%m-%d')
	             ]]>
	       </isNotEmpty>
	       </#if>
			<#else>
			<#list table.importedKeys.associatedTables?values as foreignKey>
				<#assign fkSqlTable = foreignKey.sqlTable>
				<#assign primaryKeyColumns = fkSqlTable.primaryKeyColumns>
				<#list primaryKeyColumns as pkCol>
					<#if pkCol == column.sqlName>
						<#assign fkTable = fkSqlTable.className>
						<#assign fkPojoClass = fkSqlTable.className>
						<#assign fkPojoClassVar = fkPojoClass?uncap_first>
	       <isNotEmpty prepend="AND" property="${fkPojoClassVar}">
	             ${column.sqlName} = #${fkPojoClassVar}.${column.columnNameLower}#
	       </isNotEmpty>								
					</#if>
				</#list>				
			</#list>		
			</#if>	       
	       </#list>
	    </dynamic>	
	</sql>

	<sql id="commonSelectColumnsPrefix">
	    <![CDATA[
	    select
        <#list table.columns as column>
        	${column.sqlName} <#if column_has_next>,</#if>
        </#list>
	    ]]>
	</sql>
	
    <insert id="insert" parameterClass="${classNameLower}">
        <selectKey resultClass="int" keyProperty="<#list table.columns as column><#if column.pk>${column.columnNameLower}</#if></#list>"  type="post">
             SELECT LAST_INSERT_ID()
        </selectKey>

	    <![CDATA[
	        INSERT INTO
	        ${table.sqlName} (
	        <#list table.columns as column>
	        	${column.sqlName} <#if column_has_next>,</#if>
	        </#list>
	        ) VALUES (
	        <#list table.columns as column>
				<#if !column.fk>	
				#${column.columnNameLower}# <#if column_has_next>,</#if>
				<#else>
				<#list table.importedKeys.associatedTables?values as foreignKey>
					<#assign fkSqlTable = foreignKey.sqlTable>
					<#assign primaryKeyColumns = fkSqlTable.primaryKeyColumns>
					<#list primaryKeyColumns as pkCol>
						<#if pkCol == column.sqlName>
							<#assign fkTable = fkSqlTable.className>
							<#assign fkPojoClass = fkSqlTable.className>
							<#assign fkPojoClassVar = fkPojoClass?uncap_first>
		   	  	#${fkPojoClassVar}.${column.columnNameLower}# <#if column_has_next>,</#if>
						</#if>
					</#list>					
				</#list>		
				</#if>	       	        
	        </#list>        
	        )
	    ]]>
    </insert>
   
     <update id="update" parameterClass="${classNameLower}">
    <![CDATA[
        UPDATE ${table.sqlName} 
      ]]>
      <dynamic prepend="set"> 
	        <#list table.columns as column>
	        <#if !column.fk>
	        <isNotEmpty prepend="," property="${column.columnNameLower}">
				${column.sqlName} = #${column.columnNameLower}#
			</isNotEmpty>
	        <#else>
			<#list table.importedKeys.associatedTables?values as foreignKey>
				<#assign fkSqlTable = foreignKey.sqlTable>
				<#assign primaryKeyColumns = fkSqlTable.primaryKeyColumns>
				<#list primaryKeyColumns as pkCol>
					<#if pkCol == column.sqlName>
						<#assign fkTable = fkSqlTable.className>
						<#assign fkPojoClass = fkSqlTable.className>
						<#assign fkPojoClassVar = fkPojoClass?uncap_first>
   	  		${column.sqlName} = #${fkPojoClassVar}.${column.columnNameLower}# <#if column_has_next>,</#if>
					</#if>
				</#list>		
		    </#list>		        
	        </#if>
	        </#list>
	        
	   </dynamic>
        WHERE 
        	<#list table.compositeIdColumns as column>
	        ${column.sqlName} = #${column.columnNameLower}# <#if column_has_next>,</#if>
	        </#list>
    </update>

    <delete id="delete" parameterClass="${table.idColumn.javaType}">
    <![CDATA[
        delete from ${table.sqlName} where
        <#list table.compositeIdColumns as column>
        ${column.sqlName} = #${column.columnNameLower}# <#if column_has_next>,</#if>
		</#list>
    ]]>
    </delete>
    
    <select id="select" resultMap="${classNameLower}Result">
    	<include refid="commonSelectColumnsPrefix"/>
	    <![CDATA[
	        from ${table.sqlName} 
	    ]]>
		<include refid="dynamicWhere"/>
    </select>
    
    <select id="getInfoByKey" resultMap="${classNameLower}Result">
	    <include refid="commonSelectColumnsPrefix"/>
	    <![CDATA[
	        from ${table.sqlName} 
	        where 
				<#list table.compositeIdColumns as column>
		        ${column.sqlName} = #${column.columnNameLower}# <#if column_has_next>,</#if>
		        </#list>
	    ]]>
    </select>

 	<select id="pagenate" resultMap="${classNameLower}Result">
    	<include refid="commonSelectColumnsPrefix"/>
	    <![CDATA[
	        from ${table.sqlName} 
	    ]]>
		<include refid="dynamicWhere"/>
		<dynamic prepend="ORDER BY">
			<isNotEmpty property="sortColumns">$sortColumns$</isNotEmpty>
		</dynamic>
    </select>
    
    <select id="pagenate_count" resultClass="long">
    <![CDATA[
        select 
        count(*)
        from ${table.sqlName}
    ]]>
		<include refid="dynamicWhere"/>    
    </select>

</sqlMap>
