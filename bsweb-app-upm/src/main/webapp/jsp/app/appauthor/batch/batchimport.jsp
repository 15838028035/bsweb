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
			var windowWidth = document.documentElement.clientWidth;
			$(function (){
				contralEffect.contain();
				contralEffect.blueButton();
				
				
				//帐号状态
				showDetail = function(el, cellval, opts) {
					return "<a href='javascript:showBatchDetail(\""+el+"\")'><u>"+el+"</u></a>";
				};
				
				//帐号状态
				formatStatus = function(el, cellval, opts) {
					var status = opts.sheetStatus;
					var desc = "";
					if(status == "0"){
						desc="<s:text name='appauthorbatch.toDo' />";
					}else if(status == "1"){
						desc="<font color='blue'><s:text name='appauthorbatch.verifying' /></font>";
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
					
				jQuery("#list").jqGrid({
					url:"${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!list.action?appCode=${appCode}&adminAcctSeq=${adminAcctSeq}",
					datatype: 'json',
					mtype: 'POST',
					colNames:["<s:text name='appauthorbatch.batchId' />",
							"<s:text name='appauthorbatch.appCode' />",
							"<s:text name='appauthorbatch.batchType' />",
							"<s:text name='appauthorbatch.batchDesc' />",
							"<s:text name='appauthorbatch.sheetStatus' />",
							"<s:text name='appauthorbatch.sheetStatus' />",
							"<s:text name='appauthorbatch.totalCount' />",
							"<s:text name='appauthorbatch.leftCount' />",
							"<s:text name='appauthorbatch.succCount' />",
							"<s:text name='appauthorbatch.failCount' />",
							"<s:text name='appauthorbatch.importTime' />"
						],
					colModel:[
							{name:'batchId',index:'batchId',align:'center',width:150,formatter:showDetail},
							{name:'appCode',index:'appCode',hidden:true,align:'center'},
							{name:'batchType',index:'batchType',align:'center',hidden:true,width:250},
							{name:'batchDesc',index:'batchDesc',align:'center',width:250},
							{name:'sheetStatus',index:'sheetStatus',align:'center',hidden:true,width:100},
							{name:'sheetStatusDesc',index:'sheetStatus',align:'center',width:150,formatter:formatStatus},
							{name:'totalCount',index:'totalCount',align:'center',width:150},
							{name:'leftCount',index:'leftCount',align:'center',width:150},
							{name:'succCount',index:'succCount',align:'center',width:150},
							{name:'failCount',index:'failCount',align:'center',width:150},
							{name:'importTime',index:'importTime',align:'center',width:300}
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
					width: windowWidth * 0.7,
					height: "100%",
					hidegrid: false, 
					loadtext: '<s:text name="common.tips.loading" />',
					caption:'<s:text name="appauthorbatch.history" />',
					scrollrows: true,
					multiselect:false,
					altRows:true,
					altclass:'altclass',
					sortname: 'importTime',
					sortorder: 'desc'
				});
				
				var validateForm = function() {
					var fileName = $('#selfile').val();
				
					if (fileName == "" || fileName == null || fileName == "null") {
						showModalMessage("<img src='${ctx}/images/warning.png' align='absmiddle' /> &nbsp;<font color='red'><s:text name='uploadTemplateNotEmpty'/></font>");
						return false;
					}
					
					var m = parseInt(fileName.toString().lastIndexOf(".")) + 1;
					var extVal = fileName.toString().substr(m);
				
					if (extVal != "xls" && extVal != "xlsx") {
						showModalMessage("<img src='${ctx}/images/warning.png' align='absmiddle' /> &nbsp;<font color='red'><s:text name='templateFileBeXlsFormatter'/></font> ");
						return false;
					}
					
					$(".importButton").prop("disabled",true);
					
				}
				//导入文件
				var uploadOptions = {
					url : '${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!submitImport.action',
					dataType : 'json',
					beforeSubmit : validateForm,
					success : function(responseText) {
						var result = responseText;
						if(result == "FILEERROR"){
							showModalMessage("<s:text name='appauthorbatch.excelReadError' />");
						} else if(result == "ERROR"){
							showModalMessage("<s:text name='appauthorbatch.importError' />");
						}else{
							showModalMessage("<s:text name='appauthorbatch.importSuccTip' />"+responseText);
							refresh();
					    	$(".importButton").prop("disabled",false);
					    }
					},
					resetForm : false
				};
				
				jQuery('#excelImportForm').submit(function() {
					$("#batchDesc").val(encodeURI($("#templateKey").find('option:selected').text()));
					jQuery('#excelImportForm').ajaxSubmit(uploadOptions);
					return false;
				});
			})
			function getTemplate(){
				window.location ="${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!getBatchTemplate.action?appCode=${appCode}&templateKey="+$("#templateKey").val();
			}
			function refresh() {
			 	$("#list").jqGrid().trigger("reloadGrid"); 				
			}
			
			function showBatchDetail(batchId){
				jQuery.FrameDialog.create({
					url: "${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!showBatchDetail.action?batchId="+batchId,
					title: "<s:text name='appauthorbatch.showDetailTitle' />",
					width:"800",
					height: "500",
					hide: 'slide',
					buttons:{}							
				}).bind('dialogclose', function(event, ui) {
					
			    });
			}
		</script>
	</head>

	<body>
		<div class="padd10">
			<div class="contain">
				<div class="contain_search">
					<form action="" id="excelImportForm" name="excelImportForm" enctype="multipart/form-data" method="post">
						<input type="hidden" id="adminAcctSeq" name="adminAcctSeq" value="${adminAcctSeq}" />
						<input type="hidden" id="appCode" name="appCode" value="${appCode}" />
						<input type="hidden" id="batchDesc" name="batchDesc" value="" />
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="20%" align="right">
									<s:text name='appauthorbatch.selectOperateType' />
								</td>
								<td width="80%" align="left">
									<div style="clear: both">
										<div style="float: left;">
											<s:select list="batchOperates" theme="simple" listKey="dataCode" listValue="dataDesc" id="templateKey" name="templateKey">
											</s:select>
										</div>
										<div style="float: left;">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="javascript:getTemplate()"><u><strong><s:text name="batchoperate.mainImportHref" /> </strong> </u> </a>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td width="20%" align="right">
									<s:text name='appauthorbatch.selectExcelToImport' />
								</td>
								<td width="80%" align="left">
									<div style="clear: both">
										<div style="float: left;">
											<input type="file" name="selfile" id="selfile" />
										</div>
										<div class="window_button marg_lef10 float_lef">
											<input type="submit" value="<s:text name="batchoperate.import"></s:text>" class="window_button_centerInput window_button_centerInput1 importButton" />
										</div>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
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