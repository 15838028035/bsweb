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
				
				$("#save").click(function(){
					initRadio(true);
					initCheckBox(true);
					initMultiCheckBox(true);
					$("#inputForm").submit();
				})
				$('#inputForm').validate({
					submitHandler:function(form){
						jQuery(form).ajaxSubmit({
							beforeSubmit : function(){
								$("#save").attr("disabled","true");
								var notNullValidateResult = notNullValidate(true);
								if(notNullValidateResult != true){
									$("#save").removeAttr("disabled");
									return false;
								}
								var validateFlag = true;
								if(typeof validateFuntionForUpdatePage !='undefined' && validateFuntionForUpdatePage instanceof Function ){
									validateFlag = 	validateFuntionForUpdatePage();
								}
								if(validateFlag != true){
									return false;
								}else{
									return true;
								}
							},
							
						 	success: function(responseText) {
						 		$("#save").removeAttr("disabled");
						 		if(responseText=="true"){
									showModalMessage('<s:text name="appentity.optionSucc"/>',"reload();");
									setTimeout("reload();",3000);
								}else{
									showModalMessage('<s:text name="appentity.optionFail"/>'+responseText);
								}
					    	} 
						});
					},
					rules:{
					}
				});
			})
			function reload(){
				$.FrameDialog.closeDialog();
			}
		</script>

		<c:if test="${authorValidateJsName!= '' && authorValidateJsName != null}">
			<jsp:include page="/${authorValidateJsName}" flush="true"></jsp:include>
		</c:if>

	</head>
	<body>
		<div class="padd10">
			<div class="contain">
				<div class="contain_search">
					<div class="contain_wrap">
						<input type="hidden" id="multicheckboxlist_modify" />
						<input type="hidden" id="checkboxlist_modify" />
						<input type="hidden" id="radiolist_modify" />
						<input type="hidden" id="notNullList_modify" />
						<form
							action="${ctx}/jsp/app/appauthor/rel/commonappauthorrel!update.action"
							id="inputForm">
							<input type="hidden" id="modifySeq" name="modifySeq"
								value="${modifySeq }" />
							<input type="hidden" id="appCode" name="appCode"
								value="${appCode}" />
							<input type="hidden" id="mainAuthorType" name="mainAuthorType"
								value="${mainAuthorType}" />
							<input type="hidden" id="grantAppKey" name="grantAppKey"
								value="${grantAppKey}" />
							<input type="hidden" id="optype" name="optype" value="${optype}" />
							<input type="hidden" id="isRevGrant" name="isRevGrant"
								value="${isRevGrant}" />
							<input type="hidden" id="adminAcctSeq" name="adminAcctSeq"
								value="${adminAcctSeq}" />
							<input type="hidden" id="ids" name="ids" value="${id}" />
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top" width="100%">
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<c:forEach var="appAuthorRelExt"
												items="${appAuthorRelExtList}" varStatus="status">
												<tr>
													<td width="100%">
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
															<tr>
																<c:if test="${appAuthorRelExt.dataType !='2'}">
																	<td width="20%" align="right">
																		${appAuthorRelExt.columnDesc}:
																		<strong> <font color="red">${appAuthorRelExt.isNull
																				== 'N' ? '*' : '' }</font> </strong>
																	</td>
																</c:if>
																<c:choose>
																	<c:when test="${appAuthorRelExt.dataType =='4'}">
																		<td width="80%" align="left">
																			<input type="text"
																				id="${appAuthorRelExt.columnName }_MODIFY"
																				name="${appAuthorRelExt.columnName }_MODIFY" 
																				value="${appAuthorRelExt.value }"/>
																		</td>
																	</c:when>
																	<c:when test="${appAuthorRelExt.dataType =='6'}">
																		<td width="80%" align="left">
																			<input type="text"
																				id="${appAuthorRelExt.columnName }_MODIFY"
																				name="${appAuthorRelExt.columnName }_MODIFY"
																				value="${appAuthorRelExt.value }"
																				class="Wdate"
																				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})" />
																		</td>
																	</c:when>
																	<c:when test="${appAuthorRelExt.dataType =='7'}">
																		<td width="80%" align="left">
																			<textarea
																				id="${appAuthorRelExt.columnName }_MODIFY"
																				name="${appAuthorRelExt.columnName }_MODIFY"
																				cols="30" rows="2">${appAuthorRelExt.value }</textarea>
																		</td>
																	</c:when>
																	<c:when test="${appAuthorRelExt.dataType =='8'}">
																		<td width="80%" align="left">
																			<input type="hidden"
																				id="${appAuthorRelExt.columnName }_MODIFY"
																				name="${appAuthorRelExt.columnName }_MODIFY"
																				value="${appAuthorRelExt.value }" />
																			<input type="text" readonly
																				id="${appAuthorRelExt.columnName }_MODIFY_DESC"
																				name="${appAuthorRelExt.columnName }_MODIFY_DESC"
																				value="${appAuthorRelExt.descValue }"
																				onclick="openSelectDialog('${appAuthorRelExt.columnName }_MODIFY','${appAuthorRelExt.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');" />
																			<img src="${ctx }/images/icon2_030.gif"
																				id="${appAuthorRelExt.columnName }_MODIFY_DESC_IMG"
																				class="CA_4A_select cursor_pointer"
																				onclick="openSelectDialog('${appAuthorRelExt.columnName }_MODIFY','${appAuthorRelExt.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');"
																				style='padding: 2px 3px; cursor: pointer;' />
																		</td>
																	</c:when>
																	<c:when test="${appAuthorRelExt.dataType =='5'}">
																		<td width="80%" align="left">
																			<select id="${appAuthorRelExt.columnName }_MODIFY"
																				name="${appAuthorRelExt.columnName }_MODIFY">
																				<c:forEach var="data"
																					items="${appAuthorRelExt.datalist}">
																					<option value="${data.dataCode }" ${appAuthorRelExt.value== data.dataCode ? "selected" : ""}>
																						${data.dataDesc }
																					</option>
																				</c:forEach>
																			</select>
																		</td>
																	</c:when>
																	<c:when test="${appAuthorRelExt.dataType =='3'}">
																		<td width="80%" align="left">
																			<script>
																				addMultiCheckBox("${appAuthorRelExt.columnName }_MODIFY",true);
																			</script>
																			<input type="hidden"
																				id="${appAuthorRelExt.columnName }_MODIFY" />
																			<c:forEach var="data"
																				items="${appAuthorRelExt.datalist}">
																				<input type="checkbox"
																					name="${appAuthorRelExt.columnName }_MODIFY"
																					value="${data.dataCode }" 
																					${appAuthorRelExt.value== data.dataCode ? "checked" : ""} /> ${data.dataDesc }
																			</c:forEach>
																		</td>
																	</c:when>
																	<c:when test="${appAuthorRelExt.dataType =='1'}">
																		<td width="80%" align="left">
																			<script>
																				addRadio("${appAuthorRelExt.columnName }_MODIFY",true);
																			</script>
																			<input type="hidden"
																				id="${appAuthorRelExt.columnName }_MODIFY" />
																			<c:forEach var="data"
																				items="${appAuthorRelExt.datalist}">
																				<input type="radio"
																					name="${appAuthorRelExt.columnName }_MODIFY"
																					value="${data.dataCode }"  
																					${appAuthorRelExt.value== data.dataCode ? "checked" : ""} /> ${data.dataDesc }
																			</c:forEach>
																		</td>
																	</c:when>
																	<c:when test="${appAuthorRelExt.dataType =='2'}">
																		<td width="20%"></td>
																		<td width="80%" align="left">
																			<script>
																				addCheckBox("${appAuthorRelExt.columnName }_MODIFY",true);
																			</script>
																			<input type="hidden"
																				id="${appAuthorRelExt.columnName }_MODIFY"
																				name="${appAuthorRelExt.columnName }_MODIFY" />
																			<input type="checkbox"
																				id="${appAuthorRelExt.columnName }_MODIFY_checkbox"
																				name="${appAuthorRelExt.columnName }_MODIFY_checkbox" 
																				${appAuthorRelExt.value== appAuthorRelExt.checkedValue ? "checked" : ""} /> ${data.dataDesc }
																			${appAuthorRelExt.columnDesc }
																		</td>
																	</c:when>
																</c:choose>
																<script>
																	addNotNullList("${appAuthorRelExt.isNull }","${appAuthorRelExt.columnName }_MODIFY","${appAuthorRelExt.columnDesc }",true);
																</script>
															<tr>
														</table>
													</td>
												</tr>
											</c:forEach>
											<tr>
												<td align="left">
													<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="10%" align="right">
															</td>
															<td>
																<div class="window_button marg_lef10 float_lef">
																	<input type="button" id="save"
																		class="window_button_centerInput window_button_centerInput1"
																		value='<s:text name="appentity.save"/>' />
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>