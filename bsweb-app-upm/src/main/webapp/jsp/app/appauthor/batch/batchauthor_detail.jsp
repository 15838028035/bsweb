<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<script type="text/javascript" src="${ctx}/jsp/app/appauthor/scripts/common-app-author.js"></script>

		<script type="text/javascript">
			$(function (){
				contralEffect.contain();
				contralEffect.blueButton();
				//状态
				formatStatus = function(el, cellval, opts) {
					var status = opts.rowStatus;
					var desc = "";
					if(status == "1"){
						desc="<font color='blue'><s:text name='appauthorbatch.detail.verifyPass' /></font>";
					}else if(status == "2"){
						desc="<font color='red'><s:text name='appauthorbatch.verifyFail' /></font>";
					}else if(status == "3"){
						desc="<font color='blue'><s:text name='appauthorbatch.doing' /></font>";
					}else if(status == "4"){
						desc="<s:text name='appauthorbatch.success' />";
					}else if(status == "5"){
						desc="<font color='red'><s:text name='appauthorbatch.fail' /></font>";
					}
					return desc;
				};
				//操作类型
				formatModifyType = function(el, cellval, opts) {
					var modifyType = opts.modifyType;
					var desc = "";
					if(modifyType == "ADD"){
						desc="<s:text name='appauthorbatch.modifyType.add' />";
					}else if(modifyType == "UPDATE"){
						desc="<s:text name='appauthorbatch.modifyType.update' />";
					}else if(modifyType == "DELETE"){
						desc="<s:text name='appauthorbatch.modifyType.delete' />";
					}
					return desc;
				};
				formatRowInfo = function(el, cellval, opts) {
					if(el != null && el != ''){
						var desc = el.replace(new RegExp(",","gm"),"<br>");
						return "<a href='javascript:showModalMessageWH(\""+desc+"\",300,300)'><u>"+el+"</u></a>";
					}else{
						return "&nbsp;";
					}
				};
				formatRowDesc = function(el, cellval, opts) {
					if(el != null && el != ''){
						return "<a href='javascript:showModalMessageWH(\""+el+"\",300,300)'><u>"+el+"</u></a>";
					}else{
						return "&nbsp;";
					}
				};
				
				jQuery("#list").jqGrid({
					url:"${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!detailList.action?batchId=${batchId}",
					datatype: 'json',
					mtype: 'POST',
					colNames:["<s:text name='appauthorbatch.detail.detailId' />",
							"<s:text name='appauthorbatch.batchId' />",
							"<s:text name='appauthorbatch.detail.sheetRow' />",
							"<s:text name='appauthorbatch.detail.modifyType' />",
							"<s:text name='appauthorbatch.detail.modifyType' />",
							"<s:text name='appauthorbatch.detail.rowInfo' />",
							"<s:text name='appauthorbatch.detail.rowStatus' />",
							"<s:text name='appauthorbatch.detail.rowStatus' />",
							"<s:text name='appauthorbatch.detail.rowDesc' />"
						],
					colModel:[
							{name:'detailId',index:'detailId',align:'center',width:100},
							{name:'batchId',index:'batchId',align:'center',hidden:true,width:100},
							{name:'sheetRow',index:'sheetRow',align:'center',width:50},
							{name:'modifyType',index:'modifyType',hidden:true,align:'center',width:150},
							{name:'modifyTypeDesc',index:'modifyType',align:'center',width:100,formatter:formatModifyType},
							{name:'rowInfo',index:'rowInfo',align:'center',width:200,formatter:formatRowInfo},
							{name:'rowStatus',index:'rowStatus',align:'center',hidden:true,width:100},
							{name:'rowStatusDesc',index:'rowStatus',align:'center',width:100,formatter:formatStatus},
							{name:'rowDesc',index:'rowDesc',align:'center',width:200,formatter:formatRowDesc}
						],
					pager: '#pager',
					sortable: true,
					rowNum:15,
					rowList:[15,30,50,100],
					prmNames:{rows:"objectPage.pageSize",page:"objectPage.pageNumber",total:"objectPage.totalPages"},     
					jsonReader: {
						root: "rows",
						repeatitems : false,
						id:"0"        		    
						},
					viewrecords: true,
					width: "100%",
					height: "100%",
					hidegrid: false, 
					loadtext: '<s:text name="common.tips.loading" />',
					caption:'<s:text name="appauthorbatch.showDetailTitle" />(id=${batchId})',
					scrollrows: true,
					multiselect:false,
					altRows:true,
					altclass:'altclass',
					sortname: 'sheetRow',
					sortorder: 'asc'
				});
			})
			function refresh() {
			 	 $("#list").jqGrid('setGridParam',{
			     	url:"${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!detailList.action",
				     postData:{
				     	"batchId":"${batchId}"
				     },
			 	 	page:$("#list").jqGrid("getGridParam","page")
			 	}).trigger("reloadGrid"); 			
			}
		</script>
	</head>

	<body>
		<div class="padd10">
			<div class="contain">
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class="window_button marg_lef10 float_lef">
							<input type="button" value="<s:text name='appauthorbatch.refreshStatus' />" onclick="javascirpt:refresh();" class="window_button_centerInput window_button_centerInput1 importButton" />
						</div>
					</div>
				</div>
				<table id="list"></table>
				<div id="pager"></div>
			</div>
		</div>
	</body>
</html>