<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>freemarkerTemplateConfig管理</title>
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
			url:'${ctx}/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigAction!jqGridList.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
			 		'ID',
			 		'模版编号',
			 		'模版名称',
			 		'模版路径',
			 		'模版内容',
			 		'测试数据',
			 		'测试邮箱',
			 		'备注'
			],
			colModel:[
			 		{name:'id',index:'id'},
			 		{name:'templateNo',index:'templateNo'},
			 		{name:'templateName',index:'templateName'},
			 		{name:'templatePath',index:'templatePath'},
			 		{name:'templateConent',index:'templateConent'},
			 		{name:'testData',index:'testData'},
			 		{name:'testEmail',index:'testEmail'},
			 		{name:'templateRemark',index:'templateRemark'}
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
			sortname:'id',
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
			            	<span class="marg_lef5">freemarkerTemplateConfig管理</span>
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
			 			<td>模版编号</td>
						<td><input name="freemarkerTemplateConfig.templateNo" id = "templateNo" type="text"/></td>
			 			<td>模版名称</td>
						<td><input name="freemarkerTemplateConfig.templateName" id = "templateName" type="text"/></td>
			 			<td>模版路径</td>
						<td><input name="freemarkerTemplateConfig.templatePath" id = "templatePath" type="text"/></td>
			 			<td>测试邮箱</td>
						<td><input name="freemarkerTemplateConfig.testEmail" id = "testEmail" type="text"/></td>
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
			 	var templateNo=$("#templateNo").val();
			 	var templateName=$("#templateName").val();
			 	var templatePath=$("#templatePath").val();
			 	var testEmail=$("#testEmail").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigAction!jqGridList.action',
				postData : {
			 			 	"freemarkerTemplateConfig.templateNo":templateNo,
			 			 	"freemarkerTemplateConfig.templateName":templateName,
			 			 	"freemarkerTemplateConfig.templatePath":templatePath,
			 			 	"freemarkerTemplateConfig.testEmail":testEmail
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigAction!input.action'
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
        	window.location.href = "${ctx}/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigAction!multidelete.action?multidelete=" + ids,
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
			    url:'${ctx}/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
