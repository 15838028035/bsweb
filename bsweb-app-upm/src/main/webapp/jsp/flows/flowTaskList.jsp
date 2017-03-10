<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>代办任务</title>
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
			url:'${ctx}/jsp/flows/flowTaskAction!jqGridList.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
			 		'ID',
			 		'版本',
			 		'流程定义 ID',
			 		'流程名称',
			 		'流程实例ID',
			 		'任务名称',
			 		'显示名称',
			 		'参与方式（0：普通任务；1：参与者会签任务）',
			 		'任务类型（0：主办任务；1：协办任务）',
			 		'任务处理者ID',
			 		'任务创建时间',
			 		'任务完成时间',
			 		'期望任务完成时间',
			 		'期望的完成时间date类型',
			 		'提醒时间date类型',
			 		'任务关联的表单url',
			 		'任务参与者列表',
			 		'父任务Id',
			 		'任务附属变量',
			 		'创建人',
			 		'更新人',
			 		'更新时间',
			 		'流程URL'
			],
			colModel:[
			 		{name:'id',index:'id'},
			 		{name:'taskVefrsion',index:'taskVefrsion'},
			 		{name:'flowProcessId',index:'flowProcessId',hidden:true},
			 		{name:'flowName',index:'flowName'},
			 		{name:'flowOrderId',index:'flowOrderId'},
			 		{name:'taskName',index:'taskName'},
			 		{name:'displayName',index:'displayName'},
			 		{name:'performType',index:'performType'},
			 		{name:'taskType',index:'taskType'},
			 		{name:'operator',index:'operator'},
			 		{name:'createTime',index:'createTime'},
			 		{name:'finishTime',index:'finishTime'},
			 		{name:'expireTime',index:'expireTime'},
			 		{name:'expireDate',index:'expireDate'},
			 		{name:'remindDate',index:'remindDate'},
			 		{name:'actionUrl',index:'actionUrl'},
			 		{name:'actorIds',index:'actorIds'},
			 		{name:'parentTaskId',index:'parentTaskId'},
			 		{name:'variable',index:'variable'},
			 		{name:'createByUName',index:'createByUName'},
			 		{name:'updateByUname',index:'updateByUname'},
			 		{name:'updateDate',index:'updateDate'},
			 		{name:'instanceUrl',index:'instanceUrl',hidden:true}
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
			            	<span class="marg_lef5">代办任务</span>
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
			 			<td>流程实例ID</td>
						<td><input name="flowTask.flowOrderId" id = "flowOrderId" type="text"/></td>
			 			<td>任务名称</td>
						<td><input name="flowTask.taskName" id = "taskName" type="text"/></td>
						<td>		
							<div class="window_button marg_lef10 float_lef">
								<input class="window_button_centerInput" name="select" id = "select" type="button" value="查询" /></div>
								<div class="window_button marg_lef10 float_lef"><input type="button" id="startHandleFlow"  class="window_button_centerInput" value="处理" /></div>
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
			 	var taskVefrsion=$("#taskVefrsion").val();
			 	var flowOrderId=$("#flowOrderId").val();
			 	var taskName=$("#taskName").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flows/flowTaskAction!jqGridList.action',
				postData : {
			 			 	"flowTask.flowOrderId":flowOrderId,
			 			 	"flowTask.taskName":taskName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/flows/flowTaskAction!input.action'
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
        	window.location.href = "${ctx}/jsp/flows/flowTaskAction!input.action?operate=edit&id=" + ids;
        })
        
        //处理
         $("#startHandleFlow").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要操作的记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	var row=jQuery("#list").jqGrid('getRowData',ids); 
        	var instanceUrl = row.instanceUrl;
        	var flowProcessId = row.flowProcessId;
        	var taskId = row.id;
        	var orderId = row.flowOrderId;
        	
        	var url ="${ctx}" + instanceUrl +"?processId="+flowProcessId +"&orderId="+orderId+"&taskId="+taskId;
        	window.location.href = url;
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
		      	  url:"${ctx}/jsp/flows/flowTaskAction!multidelete.action?multidelete=" + ids,
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
			    url:'${ctx}/jsp/flows/flowTaskAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
