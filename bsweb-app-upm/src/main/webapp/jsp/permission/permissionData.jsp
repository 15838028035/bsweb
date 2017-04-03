<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>权限管理</title>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<style>
.altclass {
	background: #E5EFFD;
}

#list tr td {
	width: 200px;
	white-space: nowrap;
	word-break: keep-all;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

		<script language="javascript">
	$(document).ready(function(){
		contralEffect.contain();
		contralEffect.tablelist();
		contralEffect.blueButton();
		var appId=parent.document.getElementById("appId").value;
		var perssionParentId = $("#perssionParentId").val();
		if(perssionParentId==''){
		if(appId=='UPM'){
		perssionParentId=1000000
		}else if(appId=='CRM'){
		perssionParentId=2000000
		}else if(appId==3){
		perssionParentId=3000000
		}else if(appId==4){
		 perssionParentId=4000000
		}else if(appId==5){
		 perssionParentId=5000000
		}else if(appId==6){
		 perssionParentId=6000000
		}
		}
		$("#perssionParentId").val(perssionParentId);
		//设置隐藏域的值
		$("#appId").val(appId)
			//初始化JQGrid列表页面
			jQuery("#list").jqGrid({
				url:'${ctx}/jsp/permission/upmPermissionAction!list.action?appId='+appId+'&parentId='+perssionParentId,
				datatype: 'json',
				mtype: 'POST',
				colNames:['id', 
				'名称',
				'类型',
				'状态',
				'权限编码',
				'url'
				],
				colModel:[
				     {name:'id',index:'id',hidden:true},		
					 {name:'name',index:'name'},
					 {name:'type',index:'type',formatter:formatDesc},
					 {name:'state',index:'state',formatter:stateDesc},
					 {name:'code',index:'code'},
					 {name:'url',index:'url'}
					 ],
				pager: '#pager',
				sortable: true,
				multiboxonly:true,
				rowNum:10,
				multiselect: true, 
				prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
				jsonReader: {     
					root: "rows",   
					repeatitems : false,
					id:"0"        		    
					},
				gridComplete:function(){
				},	
				rowList:[10,15],
				sortname: 'name',
				sortorder: 'asc',
				viewrecords: true,
				caption: '权限管理',
				height: '100%',
				width:'100%',
				hidegrid: false,
				loadtext: '正在加载.....',
				scrollrows: true,
				altRows:true,
				onSelectRow: onSelectRowaction
			}); 
		//执行添加操作
		$("#addButton").click(function(){
			//获取权限菜单树
			var jsonData = $.ajax({
				          url:"${ctx}/jsp/permission/upmPermissionAction!getPermissionTree.action?appId="+appId,
				          async:false,
				          cache:false,
				          dataType:"text"
			}).responseText;
			if(jsonData == ""){
			 showModalMessage('对不起，你没有权限');
			 return;
			}
			window.location = "${ctx}/jsp/permission/upmPermissionAction!input.action?appId="+appId+"&parentId="+perssionParentId;
		});
		//执行修改操作
		$("#editButton").click(function(){
			var ids = $("#list").getGridParam("selarrrow");
				 if(ids == ""){
				 	showModalMessage('请选择一条记录');
				 	return false;
				 };
			//验证只能选择一条数据进行操作
			ids += "";
			var splitId = ids.split(","); 
				if(splitId.length > 1) {
				showModalMessage('请选择一条记录')	
				return false;
				};
			var perssionParentId = $("#perssionParentId").val();
			location.href="${ctx}/jsp/permission/upmPermissionAction!input.action?appId="+appId+"&parentId="+perssionParentId+"&permissionId="+ids;
			
		});
		//停用操作
		$("#cancelButton").click(function(){
		var ids = $("#list").getGridParam("selarrrow");
				 if(ids == ""){
				 	showModalMessage('请选择一条记录');
				 	return false;
				 };
			//验证只能选择一条数据进行操作
			ids += "";
			var splitId = ids.split(","); 
				if(splitId.length > 1) {
				showModalMessage('请选择一条记录')	
				return false;
				};
		var msg  = '停用';
		showModalConfirmation(msg,"checkPwd('cancalPeimission();');");
		});
		//起用操作
		$("#startButton").click(function(){
		var ids = $("#list").getGridParam("selarrrow");
				 if(ids == ""){
				 	showModalMessage('请选择一条记录');
				 	return false;
				 };
			//验证只能选择一条数据进行操作
			ids += "";
			var splitId = ids.split(","); 
				if(splitId.length > 1) {
				showModalMessage('请选择一条记录')	
				return false;
				};
		var msg  = '启用';
		showModalConfirmation(msg,"checkPwd('startPermission();');");
		});

	});
	//点击左侧权限菜单，重新加载菜单列表页面
	function queryByPermission(){
		var perssionParentId = $("#perssionParentId").val();
		$("#list").jqGrid('setGridParam',{
			     url:"${ctx}/jsp/permission/upmPermissionAction!listByJQGrid.action",
			     postData:{
			     	"appId":$("#appId").val(),
			     	"parentId":perssionParentId
			     },
			 	 page:1
			 }).trigger("reloadGrid"); 				
		  	return false;
	}
	    //格式化显示描述
	formatDesc = function(el, cellval, opts) {
				var type = opts.type;
				if(type==1){
				type='菜单'; 
				}else if(type==2){
				type='按钮'; 
				}else if(type==null){
				type='菜单'; 
				}
				return type;
			};
			    //格式化显示描述
	stateDesc = function(el, cellval, opts) {
				var state = opts.state;
				if(state==0 || state==2){
				state='有效';
				}else {
				state='无效';
				}
				return state;
			};
	onSelectRowaction = function(id){
		 var s = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
		 var ret = jQuery("#list").jqGrid('getRowData',s);
		 var state =ret.state;
		 //停用状态屏蔽停用按钮
		 if(state=='停用'){
		 document.getElementById("cancelButton").disabled = true;
		 document.getElementById("startButton").disabled = false;
		 }else {
		 document.getElementById("cancelButton").disabled = false;
		 document.getElementById("startButton").disabled = true;
		 }
	};
	//停用菜单
	function cancalPeimission(){
		if($("#pwdPass").val()=="pass"){
		var ids = $("#list").getGridParam("selarrrow");
				$.ajax({
			 	type: "GET",
			 	url: "${ctx}/jsp/permission/upmPermissionAction!updataStat.action?permissionId="+ids+"&state=1",
			  	dataType: "text",
			  	success: function(msg){
			    	showModalMessage(msg);
			var perssionParentId = $("#perssionParentId").val();
			$("#list").jqGrid('setGridParam',{
			     url:"${ctx}/jsp/permission/upmPermissionAction!listByJQGrid.action",
			     postData:{
			     	"appId":$("#appId").val(),
			     	"parentId":perssionParentId
			     },
			 	 page:1
			 }).trigger("reloadGrid"); 				
		  	return false;
			    }
			 });
			 }
			 $("#pwdPass").val("");
	};
		//启用菜单
		function startPermission(){
		if($("#pwdPass").val()=="pass"){
				var ids = $("#list").getGridParam("selarrrow");
				$.ajax({
			 	type: "GET",
			 	url: "${ctx}/jsp/permission/upmPermissionAction!updataStat.action?permissionId="+ids+"&state=0",
			  	dataType: "text",
			  	success: function(msg){
			   showModalMessage(msg);
		var perssionParentId = $("#perssionParentId").val();
		$("#list").jqGrid('setGridParam',{
			     url:"${ctx}/jsp/permission/upmPermissionAction!listByJQGrid.action",
			     postData:{
			     	"appId":$("#appId").val(),
			     	"parentId":perssionParentId
			     },
			 	 page:1
			 }).trigger("reloadGrid"); 				
		  	return false;
			    }
			 });
		}
		 $("#pwdPass").val("");
		};
	
			//验证主帐号密码
		function checkPwd(fname){
		
	};
</script>
	</head>

	<body>
		<input type="hidden" name="perssionParentId" id="perssionParentId"
			value="${parentId }" />
		<input type="hidden" name="appId" id="appId"
			value="${appId }" />
		<input id="pwdPass" name="pwdPass" type="hidden" value="" />
		<div class="toolbar">
						<div class="toolbar_wrap">
								<div class="marg_lef10 float_lef">
									<input id="addButton" type="button"
										class="window_button_centerInput window_button_centerInput1"
										value="新增" />
								</div>
								<div class="marg_lef10 float_lef">
									<input id="editButton" type="button"
										class="window_button_centerInput window_button_centerInput1"
										value="编辑" />
								</div>
								<div class="marg_lef10 float_lef">
									<input id="cancelButton" type="button"
										class="window_button_centerInput window_button_centerInput1"
										value='停用' />
								</div>
								<div class="marg_lef10 float_lef">
									<input id="startButton" type="button"
										class="window_button_centerInput window_button_centerInput1"
										value='启用' />
								</div>
						</div>
						<!--end toolbar_wrap-->
					</div>
		<table id="list"></table>
		<div id="pager"></div>

	</body>
</html>
