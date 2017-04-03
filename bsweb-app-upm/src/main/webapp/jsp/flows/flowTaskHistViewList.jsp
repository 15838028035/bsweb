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
			url:'${ctx}/jsp/flows/flowTaskHistAction!jqGridList2.action?flowTaskHist.flowOrderId=${param.flowOrderId}',
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
					</div>
				</div>
				
				<table id="list"></table>
				<div id="pager"></div>

            </div>
        </div>
    </div>

</body>
</html>
