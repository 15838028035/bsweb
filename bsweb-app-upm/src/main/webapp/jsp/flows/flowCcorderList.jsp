
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>抄送实例管理</title>
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
			url:'${ctx}/jsp/flows/flowTaskAction!activeCCList.action',
			datatype: 'json',
			mtype: 'POST',
			colNames:[
			 		'ID',
			 		'流程实例编号',
			 		'执行人',
			 		'建创人',
			 		'创建时间',
			 		'完成时间',
			 		'状态'
			],
			colModel:[
			 		{name:'id',index:'id'},
			 		{name:'orderId',index:'orderId'},
			 		{name:'actorId',index:'actorId'},
			 		{name:'creator',index:'creator'},
			 		{name:'createTime',index:'createTime'},
			 		{name:'finishTime',index:'finishTime'},
			 		{name:'status',index:'status'}
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
			            	<span class="marg_lef5">抄送管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						</div>
					<table>
						<tr>
			 			<td>流程实例编号</td>
						<td><input name="flowCcorder.orderId" id = "orderId" type="text"/></td>
			 			<td>执行人</td>
						<td><input name="flowCcorder.actorId" id = "actorId" type="text"/></td>
						<td>		
							<div class="window_button marg_lef10 float_lef">
								<input class="window_button_centerInput" name="select" id = "select" type="button" value="查询" /></div>
								<div class="window_button marg_lef10 float_lef"><input type="button" id="ccRead"  class="window_button_centerInput" value="阅读" /></div>
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
			 	var orderId=$("#orderId").val();
			 	var actorId=$("#actorId").val();
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flows/flowTaskAction!activeCCList.action',
				postData : {
			 			 	"flowCcorder.orderId":orderId,
			 			 	"flowCcorder.actorId":actorId
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    });
	    
	    $("#ccRead").click(function() {
		 	var id=$("#id").val();
		jQuery("#list").jqGrid('setGridParam',{
		    url:'${ctx}/jsp/flows/flowCcorderAction!ccread.action',
			postData : {
		 			 	"flowCcorder.id":id,
		 			 	"flowCcorder.status":"0"
			}, 
		 	page:1
		}).trigger("reloadGrid");
    });
        
         	function refreshGrid(){
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flows/flowTaskAction!activeCCList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
	  
        
    </script>


</body>
</html>
