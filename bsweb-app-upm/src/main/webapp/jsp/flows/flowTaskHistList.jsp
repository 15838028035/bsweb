<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>历史任务</title>
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
			url:'${ctx}/jsp/flows/flowTaskHistAction!jqGridList.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
			 		'ID',
			 		'版本',
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
			 		'创建时间',
			 		'更新人',
			 		'更新时间',
			 		'创建人',
			 		'更新人'
			],
			colModel:[
			 		{name:'id',index:'id'},
			 		{name:'taskVefrsion',index:'taskVefrsion'},
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
			 		{name:'createBy',index:'createBy'},
			 		{name:'createDate',index:'createDate'},
			 		{name:'updateBy',index:'updateBy'},
			 		{name:'updateDate',index:'updateDate'},
			 		{name:'createByUname',index:'createByUname'},
			 		{name:'updateByUname',index:'updateByUname'}
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
			            	<span class="marg_lef5">历史任务</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class="window_button marg_lef10 float_lef">
					<table>
						<tr>
			 			<td>流程实例ID</td>
						<td><input name="flowTaskHist.flowOrderId" id = "flowOrderId" type="text"/></td>
			 			<td>任务名称</td>
						<td><input name="flowTaskHist.taskName" id = "taskName" type="text"/></td>
			 			<td>显示名称</td>
						<td><input name="flowTaskHist.displayName" id = "displayName" type="text"/></td>
			 			<td>参与方式（0：普通任务；1：参与者会签任务）</td>
						<td><input name="flowTaskHist.performType" id = "performType" type="text"/></td>
			 			<td>任务类型（0：主办任务；1：协办任务）</td>
						<td><input name="flowTaskHist.taskType" id = "taskType" type="text"/></td>
			 			<td>任务处理者ID</td>
						<td><input name="flowTaskHist.operator" id = "operator" type="text"/></td>
			 			<td>任务创建时间</td>
						<td><input type="text" name="flowTaskHist.createTimeBegin" id = "createTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="flowTaskHist.createTimeEnd" id = "createTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>任务完成时间</td>
						<td><input type="text" name="flowTaskHist.finishTimeBegin" id = "finishTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="flowTaskHist.finishTimeEnd" id = "finishTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>期望任务完成时间</td>
						<td><input type="text" name="flowTaskHist.expireTimeBegin" id = "expireTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="flowTaskHist.expireTimeEnd" id = "expireTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>期望的完成时间date类型</td>
						<td><input type="text" name="flowTaskHist.expireDateBegin" id = "expireDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="flowTaskHist.expireDateEnd" id = "expireDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>提醒时间date类型</td>
						<td><input type="text" name="flowTaskHist.remindDateBegin" id = "remindDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="flowTaskHist.remindDateEnd" id = "remindDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>任务关联的表单url</td>
						<td><input name="flowTaskHist.actionUrl" id = "actionUrl" type="text"/></td>
			 			<td>任务参与者列表</td>
						<td><input name="flowTaskHist.actorIds" id = "actorIds" type="text"/></td>
			 			<td>父任务Id</td>
						<td><input name="flowTaskHist.parentTaskId" id = "parentTaskId" type="text"/></td>
			 			<td>任务附属变量</td>
						<td><input name="flowTaskHist.variable" id = "variable" type="text"/></td>
			 			<td>创建人</td>
						<td><input name="flowTaskHist.createBy" id = "createBy" type="text"/></td>
			 			<td>创建时间</td>
						<td><input type="text" name="flowTaskHist.createDateBegin" id = "createDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="flowTaskHist.createDateEnd" id = "createDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>更新人</td>
						<td><input name="flowTaskHist.updateBy" id = "updateBy" type="text"/></td>
			 			<td>更新时间</td>
						<td><input type="text" name="flowTaskHist.updateDateBegin" id = "updateDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
							<input type="text" name="flowTaskHist.updateDateEnd" id = "updateDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
						</td>
			 			<td>创建人</td>
						<td><input name="flowTaskHist.createByUname" id = "createByUname" type="text"/></td>
			 			<td>更新人</td>
						<td><input name="flowTaskHist.updateByUname" id = "updateByUname" type="text"/></td>
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
			 	var taskVefrsion=$("#taskVefrsion").val();
			 	var flowOrderId=$("#flowOrderId").val();
			 	var taskName=$("#taskName").val();
			 	var displayName=$("#displayName").val();
			 	var performType=$("#performType").val();
			 	var taskType=$("#taskType").val();
			 	var operator=$("#operator").val();
	    		var createTimeBegin=$("#createTimeBegin").val();
	    		var createTimeEnd=$("#createTimeEnd").val();
	    		var finishTimeBegin=$("#finishTimeBegin").val();
	    		var finishTimeEnd=$("#finishTimeEnd").val();
	    		var expireTimeBegin=$("#expireTimeBegin").val();
	    		var expireTimeEnd=$("#expireTimeEnd").val();
	    		var expireDateBegin=$("#expireDateBegin").val();
	    		var expireDateEnd=$("#expireDateEnd").val();
	    		var remindDateBegin=$("#remindDateBegin").val();
	    		var remindDateEnd=$("#remindDateEnd").val();
			 	var actionUrl=$("#actionUrl").val();
			 	var actorIds=$("#actorIds").val();
			 	var parentTaskId=$("#parentTaskId").val();
			 	var variable=$("#variable").val();
			 	var createBy=$("#createBy").val();
	    		var createDateBegin=$("#createDateBegin").val();
	    		var createDateEnd=$("#createDateEnd").val();
			 	var updateBy=$("#updateBy").val();
	    		var updateDateBegin=$("#updateDateBegin").val();
	    		var updateDateEnd=$("#updateDateEnd").val();
			 	var createByUname=$("#createByUname").val();
			 	var updateByUname=$("#updateByUname").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flows/flowTaskHistAction!jqGridList.action',
				postData : {
			 			 	"flowTaskHist.id":id,
			 			 	"flowTaskHist.taskVefrsion":taskVefrsion,
			 			 	"flowTaskHist.flowOrderId":flowOrderId,
			 			 	"flowTaskHist.taskName":taskName,
			 			 	"flowTaskHist.displayName":displayName,
			 			 	"flowTaskHist.performType":performType,
			 			 	"flowTaskHist.taskType":taskType,
			 			 	"flowTaskHist.operator":operator,
							"flowTaskHist.createTimeBegin":createTimeBegin,
							"flowTaskHist.createTimeEnd":createTimeEnd,
							"flowTaskHist.finishTimeBegin":finishTimeBegin,
							"flowTaskHist.finishTimeEnd":finishTimeEnd,
							"flowTaskHist.expireTimeBegin":expireTimeBegin,
							"flowTaskHist.expireTimeEnd":expireTimeEnd,
							"flowTaskHist.expireDateBegin":expireDateBegin,
							"flowTaskHist.expireDateEnd":expireDateEnd,
							"flowTaskHist.remindDateBegin":remindDateBegin,
							"flowTaskHist.remindDateEnd":remindDateEnd,
			 			 	"flowTaskHist.actionUrl":actionUrl,
			 			 	"flowTaskHist.actorIds":actorIds,
			 			 	"flowTaskHist.parentTaskId":parentTaskId,
			 			 	"flowTaskHist.variable":variable,
			 			 	"flowTaskHist.createBy":createBy,
							"flowTaskHist.createDateBegin":createDateBegin,
							"flowTaskHist.createDateEnd":createDateEnd,
			 			 	"flowTaskHist.updateBy":updateBy,
							"flowTaskHist.updateDateBegin":updateDateBegin,
							"flowTaskHist.updateDateEnd":updateDateEnd,
			 			 	"flowTaskHist.createByUname":createByUname,
			 			 	"flowTaskHist.updateByUname":updateByUname
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
      	function refreshGrid(){
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flows/flowTaskHistAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
