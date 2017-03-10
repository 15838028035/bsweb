<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 

<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${classNameLower}管理</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
<style>
.altclass{background: #E5EFFD ;}
</style>

<script language="javascript">
	$(document).ready(function(){
		contralEffect.contain();
		contralEffect.tablelist();
		contralEffect.blueButton();
	});
	
	jQuery(document).ready(function(){ 
		var lastsel;
		jQuery("#list").jqGrid({
			url:'${r"${ctx}"}/jsp/${classNameLower}/${classNameLower}Action!jqGridList.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
				<#list table.columns as column>
			 		'${column.remarks}'<#if column_has_next>,</#if>
	       		 </#list>
			],
			colModel:[
				 <#list table.columns as column>
			 		{name:'${column.columnNameLower}',index:'${column.columnNameLower}'}<#if column_has_next>,</#if>
	       		 </#list>
				 ],
			pager: '#pager',
			sortable: true,
			rowNum: 20,
			rownumbers:true,
			rowList:[10,20,30,50,100],
			multiboxonly:true,
			multiselect: true,
			prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
			jsonReader: {     
				root: "rows",   
				repeatitems : false,
				id:"0"        		    
				},
			viewrecords: true,
			autowidth:true,
			shrinkToFit:true,
			height: '100%',
			sortname:'${table.idColumn.columnNameFirstLower}',
			sortorder:'asc',
			hidegrid: false,
			gridComplete:function(){},
			loadtext: '正在加载,请稍等..',
			scrollrows: true,
			altRows:true,
			altclass:'altclass'
			
		}); 
		
		});
		
</script>
</head>

<body>

 <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">${classNameLower}管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class="window_button marg_lef10 float_lef">
						<input type="button" id="add" class="window_button_centerInput"
						 value="新增" /></div>
						<div class="window_button marg_lef10 float_lef">
						<input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
					<table>
						<tr>
						<#list table.columns as column>
			 			<td>${column.remarks}</td>
			 			<#if column.isDateTimeColumn>
						<td><input type="text" name="${classNameLower}.${column.columnNameLower}Begin" id = "${column.columnNameLower}Begin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="${classNameLower}.${column.columnNameLower}End" id = "${column.columnNameLower}End"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
						<#else>
						<td><input name="${classNameLower}.${column.columnNameLower}" id = "${column.columnNameLower}" type="text"/></td>
						</#if>
	       				</#list>
						<td>		
							<div class="window_button marg_lef10 float_lef">
								<input class="window_button_centerInput" name="select" id = "select" type="button" value="查询" /></div>
							</div>
						</td>
						</tr>
					</table>
					</div>
				</div>
				
				<table id="list"></table>
				<div id="pager"></div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
    
	  //查询
	    $("#select").click(function() {
	    	<#list table.columns as column>
	    	<#if column.isDateTimeColumn>
	    		var ${column.columnNameLower}Begin=$("#${column.columnNameLower}Begin").val();
	    		var ${column.columnNameLower}End=$("#${column.columnNameLower}End").val();
	    	<#else>
			 	var ${column.columnNameLower}=$("#${column.columnNameLower}").val();
			 </#if>
	       	</#list>
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${r"${ctx}"}/jsp/${classNameLower}/${classNameLower}Action!jqGridList.action',
				postData : {
							<#list table.columns as column>
							<#if column.isDateTimeColumn>
							"${classNameLower}.${column.columnNameLower}Begin":${column.columnNameLower}Begin,
							"${classNameLower}.${column.columnNameLower}End":${column.columnNameLower}End<#if column_has_next>,</#if>
							<#else>
			 			 	"${classNameLower}.${column.columnNameLower}":${column.columnNameLower}<#if column_has_next>,</#if>
			 			 	</#if>
	       				</#list>
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${r"${ctx}"}/jsp/${classNameLower}/${classNameLower}Action!input.action'
        })
		//编辑
        $("#edit").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要编辑的记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	window.location.href = "${r"${ctx}"}/jsp/${classNameLower}/${classNameLower}Action!input.action?operate=edit&id=" + ids;
        })
		//删除
        function mulDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('请选择一条记录');
        		return;
        	}

        	showModalConfirmation('确认要删除么',"doDelete()");
        }	
        function doDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${r"${ctx}"}/jsp/${classNameLower}/${classNameLower}Action!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        }
        
      	function refreshGrid(){
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${r"${ctx}"}/jsp/${classNameLower}/${classNameLower}Action!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
