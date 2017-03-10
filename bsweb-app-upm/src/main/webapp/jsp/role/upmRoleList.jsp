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
	});
	
	jQuery(document).ready(function(){ 
		var lastsel;
		jQuery("#list").jqGrid({
			url:'${ctx}/jsp/role/upmRoleAction!jqGridList.action?appId=${appId}',
			datatype: 'json',
			mtype: 'POST',
			colNames:['ID','角色编码','应用编码','角色名称','角色描述'],
			colModel:[
			 	 {name:'id',index:'id'},
				 {name:'roleCode',index:'roleCode'},
				 {name:'appId',index:'appId'},
				 {name:'roleName',index:'roleName'},
				 {name:'roleDesc',index:'roleDesc'}
				 ],
	
			pager: '#pager',
			sortable: true,
			rowNum: 30,
			rowList:[10,15,20,30,50],
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
			sortname:'id',
			sortorder:'asc',
			hidegrid: false,
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
			            	<span class="marg_lef5">角色管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class="marg_lef10 float_lef"><input type="button" id="add" class="window_button_centerInput" value="新增" /></div>
						<div class="marg_lef10 float_lef"><input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div>
						<div class="marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
						
					<table>
						<tr>
						<td>角色编码</td>
						<td><input name="upmRole.roleCode" id = "roleCode" type="text"/></td>
						<td>应用编码</td>
						<td><input name="upmRole.appId" id = "appId" type="text"/></td>
						<td>角色名称</td>
						<td><input name="upmRole.roleName" id = "roleName" type="text" style="width:100px;"/></td>
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
	    	var roleCode = $("#roleCode").val();
	    	var appId = $("#appId").val();
	    	var roleName = $("#roleName").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			   url:'${ctx}/jsp/role/upmRoleAction!jqGridList.action',
				postData : {"upmRole.roleCode" : roleCode,
							"upmRole.appId" : appId,
							"upmRole.roleName" : roleName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/role/upmRoleAction!input.action?appId=${param.appId}';
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
        	//判断修改的是不是自己创建的角色
        	var isCreate = $.ajax({
        		url: "${ctx}/jsp/role/upmRoleAction!isSelfCreateOfRole.action?roleId=" + ids,
        		async: false,
        		cache:false,
        		dataType:"text"
        	}).responseText;
        	
        	//如果是自己创建的
        	if(isCreate=="true"){
	        	//判断修改的是不是自己拥有的角色
	        	var isOperatorUapRole = $.ajax({
	        		url: "${ctx}/jsp/role/upmRoleAction!isOperatorUapRole.action?appId=${param.appId}&roleId=" + ids+"&id="+ids,
	        		async: false,
	        		cache:false,
	        		dataType:"text"
	        	}).responseText;
	        	if(isOperatorUapRole == "true"){
	        		var msg = "编辑角色信息";
				    $("<div id='dialog-confirm'><br><p><span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>"+msg+"</p></div>").dialog({
				        modal: true,
				        dialogClass:'alert',
				        bgiframe:true,
				        position:"center",
				        title:'提示信息',
				        height:180,
				        buttons: {
				            '取消': function() {
				                $(this).dialog('close');
				            },
				            '确定': function() {
				                $(this).dialog('close');
	        					$("#edit").attr("disabled","disabled");
				                window.location.href = "${ctx}/jsp/role/upmRoleAction!input.action?operate=edit&appId=${param.appId}&id=" + ids;
				            }
				        }
				    });
	        	}
	        	else{
	        		$("#edit").attr("disabled","disabled");
	        		window.location.href = "${ctx}/jsp/role/upmRoleAction!input.action?operate=edit&appId=${param.appId}&id=" + ids;
	        	}
        	}
        	else{
	        	//不是自己创建的只允许查看
        		var msg = "编辑角色信息";
			    $("<div id='dialog-confirm'><br><p><span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>"+msg+"</p></div>").dialog({
			        modal: true,
			        dialogClass:'alert',
			        bgiframe:true,
			        position:"center",
			        title:'提示信息',
			        height:180,
			        buttons: {
			            '确定': function() {
			                $(this).dialog('close');
        					$("#edit").attr("disabled","disabled");
			                window.location.href = "${ctx}/jsp/role/upmRoleAction!input.action?operate=edit&appId=${param.appId}&isEnable=false&id=" + ids;
			            }
			        }
			    });
        	}
        	
        	//window.location.href = "${ctx}/jsp/role/upmRoleAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/role/upmRoleAction!multidelete.action?multidelete=" + ids,
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
			   url:'${ctx}/jsp/role/upmRoleAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
