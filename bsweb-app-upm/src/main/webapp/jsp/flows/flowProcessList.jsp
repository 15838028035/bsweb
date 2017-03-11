<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>流程定义</title>
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
			url:'${ctx}/jsp/flows/flowProcessAction!jqGridList.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
			 		'ID',
			 		'流程编号',
			 		'流程名称',
			 		'显示名称',
			 		'流程版本',
			 		'流程类型',
			 		'流程URL',
			 		'创建人',
			 		'创建时间',
			 		'更新人',
			 		'更新时间',
			 		'是否有效',
			 		'是否加锁'
			],
			colModel:[
			 		{name:'id',index:'id',hidden:true},
			 		{name:'flowNo',index:'flowNo'},
			 		{name:'flowName',index:'flowName'},
			 		{name:'displayName',index:'displayName'},
			 		{name:'flowVersion',index:'flowVersion'},
			 		{name:'flowType',index:'flowType'},
			 		{name:'instanceUrl',index:'instanceUrl'},
			 		{name:'createByUName',index:'createByUName'},
			 		{name:'createDate',index:'createDate'},
			 		{name:'updateByUname',index:'updateByUname'},
			 		{name:'updateDate',index:'updateDate'},
			 		{name:'enableFlag',index:'enableFlag'},
			 		{name:'lockStatus',index:'lockStatus',formatter:lockStatus}
			 			
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
			sortorder:'desc',
			hidegrid: false,
			gridComplete:function(){},
			loadtext: '正在加载,请稍等..',
			scrollrows: true,
			altRows:true,
			altclass:'altclass'
			
		}); 
		
		});
		
	
	lockStatus = function(el, cellval, opts) {
		if(opts.lockStatus=="1") {
			return "否";
		}else {
			return "是";
		}
	}
	
</script>
</head>

<body>

 <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">流程定义</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar" sytle="height:200px;">
					<div class="toolbar_wrap" sytle="height:200px;">
						<!-- <div class="window_button marg_lef10 float_lef">
						<input type="button" id="add" class="window_button_centerInput"
						 value="新增" /></div> -->
						<!-- 	<div class="window_button marg_lef10 float_lef">
					<input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div> -->
						<div class="window_button marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="processDesigner"  class="window_button_centerInput" value="设计" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="processDeploy"  class="window_button_centerInput" value="部署" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="processDeploy2"  class="window_button_centerInput" value="重新部署" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="startFlow"  class="window_button_centerInput" value="启动流程" /></div>
						
					<table>
						<tr>
			 			<td>流程编号</td>
						<td><input name="flowProcess.flowNo" id = "flowNo" type="text"/></td>
			 			<td>流程名称</td>
						<td><input name="flowProcess.flowName" id = "flowName" type="text"/></td>
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
			 	var flowNo=$("#flowNo").val();
			 	var flowName=$("#flowName").val();
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flows/flowProcessAction!jqGridList.action',
				postData : {
			 			 	"flowProcess.flowNo":flowNo,
			 			 	"flowProcess.flowName":flowName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/flows/flowProcessAction!input.action'
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
        	window.location.href = "${ctx}/jsp/flows/flowProcessAction!input.action?operate=edit&id=" + ids;
        })
        
        $("#processDesigner").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		window.location.href = "${ctx}/jsp/flows/flowProcessAction!processDesigner.action";
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	window.location.href = "${ctx}/jsp/flows/flowProcessAction!processDesigner.action?id=" + ids;
        })
        
         //部署
        $("#processDeploy").click(function() {
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
        	var rowId = row.id;
        	var url ="${ctx}/jsp/flows/flowProcessAction!processDeploy.action?id=" + rowId;
        	  var result = jQuery.ajax({
		      	  url:url,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        })
        
          //部署
        $("#processDeploy2").click(function() {
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
        	var rowId = row.id;
        		var url ="${ctx}/jsp/flows/flowProcessAction!processReDeploy.action?id=" + rowId;
        	  var result = jQuery.ajax({
		      	  url:url,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        })
        
        //启动流程
        $("#startFlow").click(function() {
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
        	var rowId = row.id;
        	var flowName = row.flowName;
        	
        	var url ="${ctx}" + instanceUrl +"?processId="+rowId +"&flowProcess.processName="+flowName;
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
		      	  url:"${ctx}/jsp/flows/flowProcessAction!multidelete.action?multidelete=" + ids,
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
			    url:'${ctx}/jsp/flows/flowProcessAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
