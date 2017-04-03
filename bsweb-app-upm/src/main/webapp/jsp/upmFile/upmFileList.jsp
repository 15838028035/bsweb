<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>upmFile管理</title>
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
		var isAlert = '${saveSuc}';
		if(isAlert == "1"){
			showModalMessage("编辑");
		}
	});
	
	jQuery(document).ready(function(){ 
		var lastsel;
		jQuery("#list").jqGrid({
			url:'${ctx}/jsp/upmFile/upmFileAction!list.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
			 		'ID',
			 		'relateId1',
			 		'',
			 		'',
			 		'optdate',
			 		'operator',
			 		'content'
			],
			colModel:[
			 		{name:'id',index:'id'},
			 		{name:'relateId1',index:'relateId1'},
			 		{name:'relateId2',index:'relateId2'},
			 		{name:'name',index:'name'},
			 		{name:'optdate',index:'optdate'},
			 		{name:'operator',index:'operator'},
			 		{name:'content',index:'content'}
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
			sortname:'loginNo',
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
			            	<span class="marg_lef5">upmFile管理</span>
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
			 			<td>ID</td>
						<td><input name="id" id = "id" type="text"/></td>
			 			<td>relateId1</td>
						<td><input name="relateId1" id = "relateId1" type="text"/></td>
			 			<td></td>
						<td><input name="relateId2" id = "relateId2" type="text"/></td>
			 			<td></td>
						<td><input name="name" id = "name" type="text"/></td>
			 			<td>optdate</td>
						<td><input type="text" name="optdateBegin" id = "optdateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="optdateEnd" id = "optdateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>operator</td>
						<td><input name="operator" id = "operator" type="text"/></td>
			 			<td>content</td>
						<td><input name="content" id = "content" type="text"/></td>
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
			 	var id=$("#id").val();
			 	var relateId1=$("#relateId1").val();
			 	var relateId2=$("#relateId2").val();
			 	var name=$("#name").val();
	    		var optdateBegin=$("#optdateBegin").val();
	    		var optdateEnd=$("#optdateEnd").val();
			 	var operator=$("#operator").val();
			 	var content=$("#content").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/upmFile/upmFileAction!list.action',
				postData : {
			 			 	"id":id,
			 			 	"relateId1":relateId1,
			 			 	"relateId2":relateId2,
			 			 	"name":name,
							"optdateBegin":optdateBegin,
							"optdateEnd":optdateEnd,
			 			 	"operator":operator,
			 			 	"content":content
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/upmFile/upmFileAction!input.action'
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
        	window.location.href = "${ctx}/jsp/upmFile/upmFileAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/upmFile/upmFileAction!multidelete.action?multidelete=" + ids,
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
			    url:'${ctx}/jsp/upmFile/upmFileAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
