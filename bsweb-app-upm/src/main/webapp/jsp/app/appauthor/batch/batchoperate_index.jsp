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
			var windowWidth = window.parent.document.documentElement.clientWidth;
			$(function (){
				contralEffect.contain();
				contralEffect.blueButton();
				var selectLength = $("select[@name='authorTypes'] option").length;
				if(selectLength == 1 ){
					$("#authorTypesDiv").hide();
				}else{
					$("#authorTypesDiv").show();
				}
				jQuery("#list").jqGrid({
					url:"",
					datatype: 'json',
					mtype: 'POST',
					colNames:${colNames},
					colModel:${colModel},
					sortable: false,
					rowNum:1000,
					prmNames:{rows:"objectPage.pageSize",page:"objectPage.pageNumber",total:"objectPage.totalPages"},     
					jsonReader: {
						root: "rows",
						repeatitems : false,
						id:"0"        		    
						},
					viewrecords: true,
					width: windowWidth * 0.7,
					height: "150",
					hidegrid: false, 
					loadtext: '<s:text name="common.tips.loading" />',
					scrollrows: true,
					multiselect:true,
					altRows:true,
					altclass:'altclass'
				}); 
				
				var notExsitBegin = "notExist-";
				var notExsitIndex = 1;
						    	
				$("#queryButton").click(function(){
					var inputText = $("#inputText").val();
					if(inputText == ''){
						showModalMessage("<s:text name='common.tips.cannotnull' />");
						return ;
					}
					$(".mainTypeOperateButton").prop("disabled",true);
					$.getJSON("${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!dealInput.action",{
							"mainAuthorTypeName":"${mainAuthorTypeName}",
							"adminAcctSeq":"${adminAcctSeq}",
							"appId":"${appId}",
							"appCode":"${appCode}",
							"inputText":encodeURI(inputText)
						},function(data) {
							if(typeof(data) == "string" && data.substring(0,6)=="error:"){
						    	showModalMessage(data.substring(data,result.length));
						    }else{
								$.each(data, function(i,item){
									var thisid = item['${appKeyColumn}'];
									if(thisid != null && thisid != ''){
										var oldid= jQuery("#list").jqGrid('getRowData',thisid)['${appKeyColumn}'];
										if(typeof(oldid) == 'undefined'){
											jQuery("#list").jqGrid('addRowData', thisid ,item);
										}else{
											// $("#list").jqGrid().setSelection(oldid);
										}
									}else{
										jQuery("#list").jqGrid('addRowData', notExsitBegin + notExsitIndex ,item);
										notExsitIndex ++ ;
									}
								});
							}
							$(".mainTypeOperateButton").prop("disabled",false);
						}
					);
				});
					
				$("#queryDetail").click(function(){
					var name = $("#name").val();
					if(name == ''){
						showModalMessage("<s:text name='common.tips.cannotnull' />");
						return ;
					}
					if($("#detaillist")[0]){
						$("#detaillist").clearGridData();
					}
					var beAuthorTypeName = $("#authorTypes").val();
					if(beAuthorTypeName == null || beAuthorTypeName == ''){
						showModalMessage("<s:text name='batchoperate.queryAuthorTypeNotNull' />");
						return;
					}
					$(".beTypeOperateButton").prop("disabled",true);
					//$("#loadAuthorDetail").html('<s:text name="batchoperate.iframe.loading" />');
					$("#loadAuthorDetail").load("${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!showDetail.action",{
						"mainAuthorTypeName":"${mainAuthorTypeName}",
						"adminAcctSeq":"${adminAcctSeq}",
						"appId":"${appId}",
						"appCode":"${appCode}",
						"beAuthorTypeName":$("#authorTypes").val(),
						"operate":$("#operate").val(),
						"name":encodeURI(name)
					},function(){
						var typeDesc = $("#authorTypes").find('option:selected').text();
						$("#removeAuthor").val($("#removeAuthor").attr("btnTip") + typeDesc);
						$("#addAuthor").val($("#addAuthor").attr("btnTip") + typeDesc);
						$("#buttonTable").show();
						document.documentElement.scrollTop  = document.documentElement.scrollHeight;
						$(".beTypeOperateButton").prop("disabled",false);
					});
				})
				
				$("#removeSelect").click(function(){
					var ids = jQuery("#list").jqGrid('getGridParam','selarrrow').toString();
					var selectidlist = ids.split(",");
					for (var i = 0; i < selectidlist.length; i++) {
						var selectid = selectidlist[i];
						if (selectid != "") {
							jQuery("#list").jqGrid('delRowData',selectid);
						}
					}
					//alert($("#list").jqGrid('getDataIDs'));
				})
				$("#removeUnAvailable").click(function(){
					$.each(
						$("#list").jqGrid('getDataIDs'),
						function(i, id) {
							var ret = jQuery("#list").jqGrid('getRowData',id);
							var isAvailable = ret.isAvailable;
							if(typeof(isAvailable) !== 'undefined' && isAvailable != "1"){
								jQuery("#list").jqGrid('delRowData',id);
							}
						}
					)
				})
				
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
					
					$(".mainTypeOperateButton").prop("disabled",true);
					
				}
				//导入文件
				var uploadOptions = {
					url : '${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!dealInputByExcel.action',
					dataType : 'json',
					beforeSubmit : validateForm,
					success : function(responseText) {
						var result = responseText;
						if(typeof(result) == "string" && result.substring(0,6)=="error:"){
					    	showModalMessage(result.substring(result,result.length));
					    }else{
					      	$.each(result, function(i,item){
								var thisid = item['${appKeyColumn}'];
								if(thisid != null && thisid != ''){
									var oldid= jQuery("#list").jqGrid('getRowData',thisid)['${appKeyColumn}'];
									if(typeof(oldid) == 'undefined'){
										jQuery("#list").jqGrid('addRowData', thisid ,item);
									}else{
										// $("#list").jqGrid().setSelection(oldid);
									}
								}else{
									jQuery("#list").jqGrid('addRowData', notExsitBegin + notExsitIndex ,item);
									notExsitIndex ++ ;
								}
							});
					    }
					    $(".mainTypeOperateButton").prop("disabled",false);
					},
					resetForm : false
				};
				
				jQuery('#excelImportForm').submit(function() {
					jQuery('#excelImportForm').ajaxSubmit(uploadOptions);
					return false;
				});
			})
			function getTemplate(){
				window.location ="${ctx}/jsp/app/appauthor/batch/commonappauthorbatch!getTemplate.action?appCode=${appCode}&mainAuthorTypeName=${mainAuthorTypeName}";
			}
		</script>
		
		<c:if test="${includePage!= '' && includePage != null}">
			<jsp:include page="/${includePage}" flush="true"></jsp:include>
		</c:if>
		
	</head>

	<body>
		<div class="padd10">
			<div class="contain">
				<div class="contain_search">
					<fieldset>
						<legend>
							<s:text name="batchoperate.fieldset.top.add"></s:text>${inputTip }
						</legend>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="15%" align="right">
									<span id="mainAuthorDesc">${inputTip }</span> :
								</td>
								<td width="30%" align="left">
									<div style="clear: both">
										<div style="float: left;">
											<input type="text" name="inputText" id="inputText" onkeydown="if(event.keyCode==13) $('#queryButton').click();" />
										</div>
										<div class="window_button marg_lef10 float_lef">
											<input id="queryButton" type="button" value="<s:text name='common.tips.query' />" class="window_button_centerInput window_button_centerInput1 mainTypeOperateButton" />
										</div>
									</div>
								</td>
								<td width="55%" align="left">
									<s:text name="batchoperate.mainLeft" />${inputTip }<s:text name="batchoperate.mainRight" />
									<s:text name="batchoperate.mainAttention" />
									<font color="red">${inputTip }<s:text name="batchoperate.mainInputTips" /></font>
								</td>
							</tr>
							<tr>
								<td align="right">
									<s:text name="batchoperate.import" />${inputTip }:
								</td>
								<td align="left">
									<div style="clear: both">
										<form action="" id="excelImportForm" name="excelImportForm" enctype="multipart/form-data" method="post">
											<input type="hidden" id="mainAuthorTypeName" name="mainAuthorTypeName" value="${mainAuthorTypeName}" />
											<input type="hidden" id="adminAcctSeq" name="adminAcctSeq" value="${adminAcctSeq}" />
											<input type="hidden" id="appId" name="appId" value="${appId}" />
											<input type="hidden" id="appCode" name="appCode" value="${appCode}" />
											<div style="float: left;">
												<input type="file" name="selfile" id="selfile" />
											</div>
											<div class="window_button marg_lef10 float_lef">
												<input type="submit" value="<s:text name="batchoperate.import"></s:text>" class="window_button_centerInput window_button_centerInput1 mainTypeOperateButton" />
											</div>
										</form>
									</div>
								</td>
								<td width="55%" align="left">
									<s:text name="batchoperate.mainLeft" /><s:text name="batchoperate.import" />${inputTip }<s:text name="batchoperate.mainRight" />
									<s:text name="batchoperate.mainAttention" />
									<font color="red"><s:text name="batchoperate.mainImportTips" /></font><a href="javascript:getTemplate()"><u><font color="red"><strong><s:text name="batchoperate.mainImportHref"/></strong></font></u></a>
								</td>
							</tr>
						</table>
					</fieldset>
					<fieldset>
						<legend>
							<s:text name="batchoperate.fieldset.top.validate"></s:text>${inputTip }
							<font color="red"><s:text name="batchoperate.validateTips"></s:text></font>
						</legend>
						<table id="list"></table>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="center" width="20%">
								</td>
								<td align="right" width="60%">
									<div style="clear: both">
										<div class="window_button marg_lef10 float_lef" style="float: left;">
											<input id="removeSelect" type="button" value="<s:text name='batchoperate.removeSelect' />${inputTip }" class="window_button_centerInput window_button_centerInput1 mainTypeOperateButton" />
										</div>
										<div class="window_button marg_lef10 float_lef" style="float: left;">
											<input id="removeUnAvailable" type="button" value="<s:text name='batchoperate.removeAllUnavaliable' />${inputTip }" class="window_button_centerInput window_button_centerInput1 mainTypeOperateButton" />
										</div>
									</div>
								</td>
								<td align="center" width="20%">
								</td>
							</tr>
						</table>
					</fieldset>
					<fieldset>
						<legend>
							<s:text name="batchoperate.copy"></s:text>${inputTip }<s:text name="batchoperate.copy.desc"></s:text>
						</legend>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="right" width="20%">
								</td>
								<td align="left" width="80%">
									<div style="clear: both">
										<div style="float: left;">
											&nbsp;&nbsp;${inputTip }:&nbsp;&nbsp;
											<input type="text" name="name" id="name" onkeydown="if(event.keyCode==13) $('#queryDetail').click();" />
										</div>
										<div style="float: left;" id="authorTypesDiv" style="display: none" >
											&nbsp;&nbsp;<s:text name="batchoperate.authortypeselect"></s:text>&nbsp;
											<select id="authorTypes" name="authorTypes">
												<c:forEach var="authorCfg" items="${authorList}" varStatus="status">
													<option value='${authorCfg.typeName }'>
														${authorCfg.typeDesc }
													</option>
												</c:forEach>
											</select>
											&nbsp;
										</div>
										<div class="window_button marg_lef10 float_lef" style="float: left;">
											<input id="queryDetail" type="button" value="<s:text name='common.tips.query' />" class="window_button_centerInput window_button_centerInput1 beTypeOperateButton" />
										</div>
									</div>
								</td>
							</tr>
						</table>
					</fieldset>
					<fieldset>
						<legend>
							<s:text name="batchoperate.authorgrantedshow"></s:text>
						</legend>
						<div id="loadAuthorDetail">
						</div>
					</fieldset>
					<jsp:include page="/jsp/app/appauthor/batch/batchoperate_foot.jsp" flush="true"></jsp:include>
				</div>
			</div>
		</div>
	</body>
</html>