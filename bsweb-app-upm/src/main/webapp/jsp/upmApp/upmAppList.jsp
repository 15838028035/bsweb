<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>应用管理</title>
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
			url:'${ctx}/jsp/upmApp/upmAppAction!jqGridList.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:['ID','应用ID','应用编号','应用名称','应用url'],
			colModel:[
			 	 {name:'id',index:'id'},
				 {name:'appId',index:'appId'},
				 {name:'appCode',index:'appCode',width:100},
				 {name:'appName',index:'appName',width:100},
				 {name:'appUrl',index:'appUrl',width:240}
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
			            	<span class="marg_lef5">应用管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class=" marg_lef10 float_lef"><input type="button" id="add" class="window_button_centerInput" value="新增" /></div>
						<div class=" marg_lef10 float_lef"><input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div>
						<div class=" marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
						<div class=" marg_lef10 float_lef"><input type="button" id="appUserPerMgmt" class="window_button_centerInput" value="账号、角色、权限管理" /></div>
						
					<table>
						<tr>
						<td>应用ID</td>
						<td><input name="upmApp.appId" id = "appId" type="text"/></td>
						<td>应用编号</td>
						<td><input name="upmApp.appCode" id = "appCode" type="text"/></td>
						<td>应用名称</td>
						<td><input name="upmApp.appName" id = "appName" type="text" style="width:100px;"/></td>
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
	    	var appId = $("#appId").val();
	    	var appCode = $("#appCode").val();
	    	var appName = $("#appName").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/upmApp/upmAppAction!jqGridList.action',
				postData : {"upmApp.appId":appId,
			 			 	"upmApp.appCode":appCode,
			 			 	"upmApp.appName":appName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/upmApp/upmAppAction!input.action'
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
        	window.location.href = "${ctx}/jsp/upmApp/upmAppAction!input.action?operate=edit&id=" + ids;
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
        
        
         $("#appUserPerMgmt").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	
        	var s = $("#list").jqGrid('getRowData', ids);
        	
        	var appId = s.appId;
        	var appCode = s.appCode;
        	
        	var url= "${ctx}/jsp/app/commoniframe/commoniframe!rightmgmt.action?appId="+appId+"&appCode="+appCode;
        	// 新版 URL= "${ctx}/jsp/app/appauthor/commonappauthormng!permlist.action?appCode="+appCode+"&adminAcctSeq="+adminAcctSeq+"&appId="+appId+"&adminUserId="+adminUserId+"&loginOrgId="+loginOrgId+"&realAppId="+realAppId;
        	
        	//var url= "${ctx}/jsp/app/appauthor/commonappauthormng!permlist.action?appId="+appId+"&appCode="+appCode;
        	window.location.href = url;
        })
        	
        function doDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/upmApp/upmAppAction!multidelete.action?multidelete=" + ids,
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
			   url:'${ctx}/jsp/upmApp/upmAppAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
