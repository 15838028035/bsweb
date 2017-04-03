<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>角色管理</title>
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
			
		onSelectRowaction = function(id){
			var s = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
			var sc = s.toString();
			var scindex = sc.indexOf(',');
			
			if(scindex >= 0){
				jQuery("#list").jqGrid('setSelection',sc.substring(0,scindex)); 
			}
		}
		
		onSelectRowaction2 = function(id){
			var s = jQuery("#list2").jqGrid('getGridParam','selarrrow'); 
			var sc = s.toString();
			var scindex = sc.indexOf(',');
			
			if(scindex >= 0){
				jQuery("#list2").jqGrid('setSelection',sc.substring(0,scindex)); 
			}
		}	
			
	});
	
	jQuery(document).ready(function(){ 
		var lastsel;
		jQuery("#list").jqGrid({
			url:'${ctx}/jsp/role/upmRoleAction!list.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:['ID','角色编码','应用编码','角色名称'],
			colModel:[
			 	 {name:'id',index:'id'},
				 {name:'roleCode',index:'roleCode'},
				 {name:'appId',index:'appId',width:100,align:'center'},
				 {name:'roleName',index:'roleName',width:100,align:'center'}
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
		
		jQuery("#list2").jqGrid({
			url:'${ctx}/jsp/role/upmRoleAction!findAssignedRoleList.action?userGroupId='+${param.userGroupId},
			datatype: 'json',
			mtype: 'POST',
			colNames:['关联ID','ID','角色编码','应用编码','角色名称'],
			colModel:[
			     {name:'userGroupRoleRelId',index:'userGroupRoleRelId'},
			 	 {name:'id',index:'id'},
				 {name:'roleCode',index:'roleCode'},
				 {name:'appId',index:'appId',width:100,align:'center'},
				 {name:'roleName',index:'roleName',width:100,align:'center'}
				 ],
	
			pager: '#pager2',
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
			onSelectRow: onSelectRowaction2
		}); 
		
		});
		
		function closeDialog(){
		$.FrameDialog.closeDialog();
		parent.window.reloadParent();
		}
		
</script>
</head>

<body>
<input type="hidden"  id = "userGroupId" name="userGroupId"  value="${param.userGroupId}"/>

 <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">角色管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
					<table>
						<tr>
						<td>角色编码</td>
						<td><input name="roleCodeParam" id = "roleCodeParam" type="text"/></td>
						<td>应用编码</td>
						<td><input name="appIdParam" id = "appIdParam" type="text"/></td>
						<td>角色名称</td>
						<td><input name="roleNameParam" id = "roleNameParam" type="text" style="width:100px;"/></td>
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
				
				 <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">已分配角色</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->

				<table id="list2"></table>
				<div id="pager2"></div>
				
				<table width="80%" height="72" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>
							<div class=" float_lef marg_lef10">
								<input type="button" id="button" class="window_button_centerInput" value="分配角色" onclick="batchSave()" />
							</div>
							<div class=" float_lef marg_lef10">
								<input type="button" id="button" class="window_button_centerInput" value="删除已分配角色" onclick="doDelete()" />
							</div>
							<div class=" float_lef marg_lef10">
								<input type="button" class="window_button_centerInput" value="取消" onclick="closeDialog();" />
							</div>
						</td>		
					</tr>
				</table>
				
				
            </div>
        </div>
    </div>

    <script type="text/javascript">
    
	  //查询
	    $("#select").click(function() {
	    	var roleCode = $("#roleCodeParam").val();
	    	var appId = $("#appIdParam").val();
	    	var roleName = $("#roleNameParam").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			   url:'${ctx}/jsp/role/upmRoleAction!list.action',
				postData : {"roleCode" : roleCode,
							"appId" : appId,
							"roleName" : roleName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		 function batchSave(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('请选择一条记录');
        		return;
        	}

        	showModalConfirmation('确认要提交么',"doBatchSave()");
        }
        	
        function doBatchSave(){
            var userGroupId =$("#userGroupId").val();
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/user/upmUserGroupAndRoleRelAction!doBatchSaveRel.action?multiSelected=" + ids+"&userGroupId="+userGroupId,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid2();
        }
        
		//删除
        function mulDelete(){
        	var ids = jQuery("#list2").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('请选择一条记录');
        		return;
        	}

        	showModalConfirmation('确认要删除么',"doDelete()");
        }
        	
        function doDelete(){
        	var ids = jQuery("#list2").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/user/upmUserGroupAndRoleRelAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid2();
        }
        
      	function refreshGrid(){
			jQuery("#list").jqGrid('setGridParam',{
			   url:'${ctx}/jsp/role/upmRoleGroupAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
      	function refreshGrid2(){
      	 var userGroupId =$("#userGroupId").val();
			jQuery("#list2").jqGrid('setGridParam',{
			   url:'${ctx}/jsp/role/upmRoleAction!findAssignedRoleList.action?userGroupId='+userGroupId,
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
