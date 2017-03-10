<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>角色组管理</title>
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
			
		onSelectRowaction = function(id){
			var s = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
			var sc = s.toString();
			var scindex = sc.indexOf(',');
			
			if(scindex >= 0){
				jQuery("#list").jqGrid('setSelection',sc.substring(0,scindex)); 
			}
		}	
			
	});
	
	jQuery(document).ready(function(){ 
		var lastsel;
		jQuery("#list").jqGrid({
			url:'${ctx}/jsp/role/upmRoleGroupAction!list.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:['ID','角色组编码','应用编码','角色组名称'],
			colModel:[
			 	 {name:'id',index:'id'},
				 {name:'groupCode',index:'groupCode'},
				 {name:'appId',index:'appId',width:100,align:'center'},
				 {name:'groupName',index:'groupName',width:100,align:'center'}
				 ],
	
			pager: '#pager',
			sortable: true,
			rowNum: 10,
			rowList:[10,15,20,50],
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
			height: '100%',
			sortname:'loginNo',
			sortorder:'asc',
			hidegrid: false,
			loadtext: '正在加载,请稍等..',
			scrollrows: true,
			altRows:true,
			altclass:'altclass',
			onSelectRow: onSelectRowaction
		}); 
		$("#cb_list").attr("style", "display:none");
		
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
			            	<span class="marg_lef5">角色组管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class=" marg_lef10 float_lef">
						<input type="button" id="add" class="window_button_centerInput"
						 value="新增" /></div>
						<div class=" marg_lef10 float_lef">
						<input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div>
						<div class=" marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
					<table>
						<tr>
						<td>角色组编码</td>
						<td><input name="groupCodeParam" id = "groupCodeParam" type="text"/></td>
						<td>应用编码</td>
						<td><input name="appIdParam" id = "appIdParam" type="text"/></td>
						<td>角色组名称</td>
						<td><input name="groupNameParam" id = "groupNameParam" type="text" style="width:100px;"/></td>
						<td>		
							<div class=" marg_lef10 float_lef">
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
	    	var groupCode = $("#groupCodeParam").val();
	    	var appId = $("#appIdParam").val();
	    	var groupName = $("#groupNameParam").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			   url:'${ctx}/jsp/role/upmRoleAction!list.action',
				postData : {"groupCode" : groupCode,
							"appId" : appId,
							"groupName" : groupName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/role/upmRoleGroupAction!input.action'
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
        	window.location.href = "${ctx}/jsp/role/upmRoleGroupAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/role/upmRoleGroupAction!multidelete.action?multidelete=" + ids,
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
			   url:'${ctx}/jsp/role/upmRoleGroupAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
