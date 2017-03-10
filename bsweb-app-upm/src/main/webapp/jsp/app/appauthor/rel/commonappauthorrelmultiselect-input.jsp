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
				$("#saveNewRel").click(function(){
					var ids = "";
					var selectedOption = $("#selectableList").find("option:selected");
					$.each(selectedOption, function(){
						ids += (this.value + ",");
					});
					//alert(ids);
					if( ids == ''|| ids == null){
						showModalMessage('<s:text name="appentity.selectOneData"/>');
					}else{
						initRadio();
						initCheckBox();
						initMultiCheckBox();
						var notNullValidateResult = notNullValidate();
						if(notNullValidateResult != true){
							return;
						}
						var validateFlag = true;
						if(typeof validateFuntionForMultiSave !='undefined' && validateFuntionForMultiSave instanceof Function ){
							validateFlag = 	validateFuntionForMultiSave(ids);
						}
						if(validateFlag != true){
							return;
						}
						var  result =  jQuery.ajax({
				          url:"${ctx}/jsp/app/appauthor/rel/commonappauthorrel!save.action?id="+new Date(),
				          data:{
				            ${extPostString}
							"appCode":"${appCode}",
							"mainAuthorType":"${mainAuthorType}",
							"grantAppKey":"${grantAppKey}",
							"optype":"${optype}",
							"isRevGrant":"${isRevGrant}",
							"adminAcctSeq":"${adminAcctSeq}",
							"ids":ids
				          },
				          type:"post",
				          async:false,
				          dataType:"json"
				        }).responseText;
				        
						if(result == "true"){
							moveSelectableToSelected();
							showModalMessage('<s:text name="appentity.optionSucc"/>');
						}else{
							showModalMessage('<s:text name="appentity.optionFail"/>'+result);
						}
			        }
				})
				
				$("#delRel").click(function(){
					var ids = "";
					var selectedOption = $("#selectedList").find("option:selected");
					$.each(selectedOption, function(){
						ids += (this.value + ",");
					});
					if( ids == ''|| ids == null){
						showModalMessage('<s:text name="appentity.selectOneData"/>');
					}else{
						var validateFlag = true;
						if(typeof validateFuntionForMultiDelete !='undefined' && validateFuntionForMultiDelete instanceof Function ){
							validateFlag = 	validateFuntionForMultiDelete(ids);
						}
						if(validateFlag != true){
							return;
						}
						var  result =  jQuery.ajax({
				          url:"${ctx}/jsp/app/appauthor/rel/commonappauthorrel!delete.action?id="+new Date(),
				          data:{
							"appCode":"${appCode}",
							"mainAuthorType":"${mainAuthorType}",
							"grantAppKey":"${grantAppKey}",
							"optype":"${optype}",
							"isRevGrant":"${isRevGrant}",
							"adminAcctSeq":"${adminAcctSeq}",
							"ids":ids
				          },
				          type:"post",
				          async:false,
				          dataType:"json"
				        }).responseText;
				        
				        if(result == "true"){
							moveSelectedToSelectable();
							$("#selectedInfo").hide();
							showModalMessage('<s:text name="appentity.optionSucc"/>');
						}else{
							showModalMessage('<s:text name="appentity.optionFail"/>'+result);
						}
					}
				})
				
				$("#updateRel").click(function(){
					var ids = "";
					var selectedOption = $("#selectedList").find("option:selected");
					$.each(selectedOption, function(){
						ids += (this.value + ",");
					});
					if( ids == ''|| ids == null){
						showModalMessage('<s:text name="appentity.selectOneData"/>');
					}else{
						initRadio(true);
						initCheckBox(true);
						initMultiCheckBox(true);
						var notNullValidateResult = notNullValidate(true);
						if(notNullValidateResult != true){
							return;
						}
						var validateFlag = true;
						if(typeof validateFuntionForMultiUpdate !='undefined' && validateFuntionForMultiUpdate instanceof Function ){
							validateFlag = 	validateFuntionForMultiUpdate(ids);
						}
						if(validateFlag != true){
							return;
						}
						var  result =  jQuery.ajax({
				          url:"${ctx}/jsp/app/appauthor/rel/commonappauthorrel!update.action?id="+new Date(),
				          data:{
				          	${modifyExtPostString}
							"appCode":"${appCode}",
							"mainAuthorType":"${mainAuthorType}",
							"grantAppKey":"${grantAppKey}",
							"optype":"${optype}",
							"isRevGrant":"${isRevGrant}",
							"adminAcctSeq":"${adminAcctSeq}",
							"modifySeq":$("#modifySeq").val(),
							"ids":ids
				          },
				          type:"post",
				          async:false,
				          dataType:"json"
				        }).responseText;
				        
				        if(result == "true"){
							showModalMessage('<s:text name="appentity.optionSucc"/>');
						}else{
							showModalMessage('<s:text name="appentity.optionFail"/>'+result);
						}
					}
				})
				
				
			})
			
			function showSelectedInfo(){
				$("#selectedInfo").show();
				var oldValue = $("#beGrantId").val();
				var selectedOption = $("#selectedList").find("option:selected");
				var length = selectedOption.length;
			 	if(length == 1) {
					$.each(selectedOption, function(){
						if(oldValue!=this.value){
							$.ajax({
								type: "POST",
								url: "${ctx}/jsp/app/appauthor/rel/commonappauthorrel!getRelExtValues.action?random="+new Date(),
								data:{
									"appCode":"${appCode}",
									"appId":"${appId}",
									"mainAuthorType":"${mainAuthorType}",
									"grantAppKey":"${grantAppKey}",
									"optype":"${optype}",
									"isRevGrant":"${isRevGrant}",
									"adminAcctSeq":"${adminAcctSeq}",
									"id":this.value
					         	},
								dataType: "json",
								async: false,
								cache: false,
								success: function(data){
									var selectedAcctExtValue =  data.relExtList;
									var modifySeq =  data.modifySeq;
									$("#modifySeq").val(modifySeq);
								 	if(selectedAcctExtValue != null && selectedAcctExtValue!="") {
   					  					$.each(selectedAcctExtValue, function(i,item){
   					  						var name = item.columnName + "_MODIFY";
   					  						var dataType = item.dataType;
											var value = item.value;
											//alert(name+"==="+value);
											if(dataType == "1"){
												$("input[type='radio'][name='" + name + "'][value='"+value+"']").attr("checked","checked");
											}else if(dataType == "2"){
												var checkedValue = item.checkedValue;
												if(value == checkedValue){
													$("input[type='checkbox'][name='" + name + "']").attr("checked",true);
												}else{
													$("input[type='checkbox'][name='" + name + "']").attr("checked",false);
												}
											}else if(dataType == "3"){
												$("input[type='checkbox'][name='" + name + "'][value='"+value+"']").attr("checked","checked");
											}else{
												//下拉框无默认值时，默认选中第一个
												if(dataType == "5" && (value == null || value == '')){
												 	$("#"+name).val($("#"+name).get(0).options[0].value);
												}else{
													$("#"+name).val(value);
													if($("#"+name+"_DESC")){
														var descValue = item.descValue;
														if(descValue != null){
															$("#"+name+"_DESC").val(descValue);
														}else{
															$("#"+name+"_DESC").val("");
														}
													}
												}
											}
   					  					})
   					  				}
								}
							});
							$("#beGrantId").val(this.value);
						}
					});
			 	}
			}
			
			function moveSelectableToSelected(ids){
				var selectedOption = $("#selectableList").find("option:selected");
				$.each(selectedOption, function(){
					selectedOption.remove();
					$("#selectedList").append("<option value='" + this.value + "'>" + this.text + "</option>");
				});
			}
			
			function moveSelectedToSelectable(ids){
				var selectedOption = $("#selectedList").find("option:selected");
				$.each(selectedOption, function(){
					selectedOption.remove();
					$("#selectableList").append("<option value='" + this.value + "'>" + this.text + "</option>");
				});
			}
			
		</script>

		<c:if test="${authorTreeJsName!= '' && authorTreeJsName != null}">
			<jsp:include page="/${authorTreeJsName}" flush="true"></jsp:include>
		</c:if>

	</head>
	<body>
		<div class="padd10">
			<div class="contain">
				<div class="contain_wrap">
					<input type="hidden" id="multicheckboxlist" />
					<input type="hidden" id="checkboxlist" />
					<input type="hidden" id="radiolist" />
					<input type="hidden" id="notNullList" />
					<c:if test="${isTab != '1'}">
					<div class="contain_search">
						<div class="contain_s_wrap">
							<div id="mainGrantObj">
							<c:if test="${isBatch == 'true'}">
								<table width="95%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="15%" align="right">
											<pre><s:text name="app.permission.selectObjs"/><s:text name="appentity.colon"/></pre>
										</td>
										<td width="85%" align="left">
											<pre>${grantName }</pre>
										</td>
									</tr>
								</table>
							</c:if>
							<c:if test="${isBatch != 'true'}">
							<table width="95%" cellpadding="0" cellspacing="0" border="0">
								<c:choose>
									<c:when test="${mainAuthorType == 'USER'}">
										<tr>
											<td width="7%" align="right">
												<s:text name="common.app.acct.login.name"/><s:text name="appentity.colon"/>
											</td>
											<td width="13%" align="left">
												${uapAppAcct.userName }
											</td>
											<td width="7%" align="right">
												<s:text name="appentity.loginName"/><s:text name="appentity.colon"/>
											</td>
											<td width="13%" align="left">
												${uapAppAcct.loginAcct }
											</td>
											<td width="15%" align="right">
												<s:text name="appentity.belongOrg"/><s:text name="appentity.colon"/>
											</td>
											<td width="45%" align="left">
												${uapAppAcct.orgName }
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td width="100%">
												<div style="clear: both">
													<c:forEach var="appAuthorTableConfig" items="${grantObj}"
														varStatus="status">
														<input type="hidden"
														id="mainGrantObj_${appAuthorTableConfig.columnName }"
														name="mainGrantObj_${appAuthorTableConfig.columnName }"
														value="${appAuthorTableConfig.value }" />
														<c:if test="${appAuthorTableConfig.isModify =='Y' && appAuthorTableConfig.isShow =='Y'}">
															<div style="float: left;">
																${appAuthorTableConfig.columnDesc } :
																<c:choose>
																	<c:when
																		test="${appAuthorTableConfig.dataType =='4' || appAuthorTableConfig.dataType =='6' || appAuthorTableConfig.dataType =='7'}">
																		${appAuthorTableConfig.value }
																	</c:when>
																	<c:when test="${appAuthorTableConfig.dataType =='8' || appAuthorTableConfig.dataType =='2'}">
																		${appAuthorTableConfig.descValue }
																	</c:when>
																	<c:otherwise>
																		<c:forEach var="data"
																			items="${appAuthorTableConfig.datalist}">
																			<c:choose>
																				<c:when
																					test="${data.dataCode == appAuthorTableConfig.value}">
																					${data.dataDesc }
																				</c:when>
																			</c:choose>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</div>
														</c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							</c:if>
							</div>
						</div>
					</div>
					</c:if>
					<div class="contain_search">
						<div class="contain_s_wrap">
							<table width="100%" align="center" border="0">
								<tr>
									<td class="font_wei" align="center" width="20%">
										<s:text name="appentity.selectableList"/>
									</td>
									<td width="28%"></td>
									<td class="font_wei" align="center" width="22%">
										<s:text name="appentity.selectedList"/>
									</td>
									<td width="28%"></td>
								</tr>
								<tr>
									<td align="center" width="22%">
										<select multiple="multiple" id="selectableList"
											style="height: 300px; width: 200px">
											<c:forEach var="appAuthorTableConfig"
												items="${selectableList}" varStatus="status">
												<option value="${appAuthorTableConfig[idColumnName]}">
													${appAuthorTableConfig[nameColumnName] }
												</option>
											</c:forEach>
										</select>
									</td>
									<td width="28%" id="relExtList">
										<c:if test="${!empty appAuthorRelExtList}">
											<fieldset>
												<legend>
													<s:text name="appentity.authorizeAttr"/>
												</legend>
												<table cellpadding="0" cellspacing="0" border="0">
													<c:forEach var="appAuthorRelExt"
														items="${appAuthorRelExtList}" varStatus="status">
														<tr>
															<td>
																<table cellpadding="0" cellspacing="0" border="0">
																	<c:if test="${appAuthorRelExt.dataType !='2'}">
																		<tr>
																			<td>
																				${appAuthorRelExt.columnDesc}:
																				<strong> <font color="red">${appAuthorRelExt.isNull
																						== 'N' ? '*' : '' }</font> </strong>
																			</td>
																		<tr>
																	</c:if>
																	<c:choose>
																		<c:when test="${appAuthorRelExt.dataType =='4'}">
																			<tr>
																				<td>
																					<input type="text"
																						id="relExt_${appAuthorRelExt.columnName }"
																						name="relExt_${appAuthorRelExt.columnName }" 
																						value="${appAuthorRelExt.value }" />
																				</td>
																			</tr>
																		</c:when>
																		<c:when test="${appAuthorRelExt.dataType =='6'}">
																			<tr>
																				<td>
																					<input type="text"
																						id="relExt_${appAuthorRelExt.columnName }"
																						name="relExt_${appAuthorRelExt.columnName }"
																						class="Wdate"
																						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})" />
																				</td>
																			</tr>
																		</c:when>
																		<c:when test="${appAuthorRelExt.dataType =='7'}">
																			<tr>
																				<td>
																					<textarea id="relExt_${appAuthorRelExt.columnName }"
																						name="relExt_${appAuthorRelExt.columnName }" cols="30"
																						rows="2">${appAuthorRelExt.value }</textarea>
																				</td>
																			</tr>
																		</c:when>
																		<c:when test="${appAuthorRelExt.dataType =='8'}">
																			<tr>
																				<td>
																					<input type="hidden"
																						id="relExt_${appAuthorRelExt.columnName }"
																						name="relExt_${appAuthorRelExt.columnName }"
																						value="${appAuthorRelExt.value }" />
																					<input type="text" readonly
																						id="relExt_${appAuthorRelExt.columnName }_DESC"
																						name="relExt_${appAuthorRelExt.columnName }_DESC"
																						value="${appAuthorRelExt.descValue }"
																						onclick="openSelectDialog('relExt_${appAuthorRelExt.columnName }','${appAuthorRelExt.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');" />
																					<img src="${ctx }/images/icon2_030.gif"
																						id="relExt_${appAuthorRelExt.columnName }_DESC_IMG"
																						class="CA_4A_select cursor_pointer"
																						onclick="openSelectDialog('relExt_${appAuthorRelExt.columnName }','${appAuthorRelExt.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');"
																						style='padding: 2px 3px; cursor: pointer;' />
																				</td>
																			</tr>
																		</c:when>
																		<c:when test="${appAuthorRelExt.dataType =='5'}">
																			<tr>
																				<td>
																					<select id="relExt_${appAuthorRelExt.columnName }"
																						name="relExt_${appAuthorRelExt.columnName }">
																						<c:forEach var="data"
																							items="${appAuthorRelExt.datalist}">
																							<option value="${data.dataCode }" ${appAuthorRelExt.value== data.dataCode ? "selected" : ""}>
																								${data.dataDesc }
																							</option>
																						</c:forEach>
																					</select>
																				</td>
																			</tr>
																		</c:when>
																		<c:when test="${appAuthorRelExt.dataType =='3'}">
																			<tr>
																				<td>
																					<script>
																						addMultiCheckBox("relExt_${appAuthorRelExt.columnName }");
																					</script>
																					<input type="hidden"
																						id="relExt_${appAuthorRelExt.columnName }" />
																					<c:forEach var="data"
																						items="${appAuthorRelExt.datalist}">
																						<input type="checkbox"
																							name="relExt_${appAuthorRelExt.columnName }"
																							value="${data.dataCode }" 
																							${appAuthorRelExt.value== data.dataCode ? "checked" : ""} /> ${data.dataDesc }
																					</c:forEach>
																				</td>
																			</tr>
																		</c:when>
																		<c:when test="${appAuthorRelExt.dataType =='1'}">
																			<tr>
																				<td>
																					<script>
																						addRadio("relExt_${appAuthorRelExt.columnName }");
																					</script>
																					<input type="hidden"
																						id="relExt_${appAuthorRelExt.columnName }" />
																					<c:forEach var="data"
																						items="${appAuthorRelExt.datalist}">
																						<input type="radio"
																							name="relExt_${appAuthorRelExt.columnName }"
																							value="${data.dataCode }" 
																							${appAuthorRelExt.value== data.dataCode ? "checked" : ""} /> ${data.dataDesc }
																					</c:forEach>
																				</td>
																			</tr>
																		</c:when>
																		<c:when test="${appAuthorRelExt.dataType =='2'}">
																			<tr>
																				<td colspan="2">
																					<script>
																						addCheckBox("relExt_${appAuthorRelExt.columnName }");
																					</script>
																					<input type="hidden"
																						id="relExt_${appAuthorRelExt.columnName }"
																						name="relExt_${appAuthorRelExt.columnName }" />
																					<input type="checkbox"
																						id="relExt_${appAuthorRelExt.columnName }_checkbox"
																						name="relExt_${appAuthorRelExt.columnName }_checkbox"
																						${appAuthorRelExt.value== appAuthorRelExt.checkedValue ? "checked" : ""} />
																					${appAuthorRelExt.columnDesc }
																				</td>
																			</tr>
																		</c:when>
																	</c:choose>
																	<script>
																		addNotNullList("${appAuthorRelExt.isNull }","relExt_${appAuthorRelExt.columnName }","${appAuthorRelExt.columnDesc }");
																	</script>
																</table>
															</td>
														</tr>
													</c:forEach>
												</table>
											</fieldset>
										</c:if>
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="100%" align="center">
													<img src="${ctx}/images/drag_rig.gif" id="saveNewRel" />
												</td>
											</tr>
											<tr>
												<td width="100%" align="center">
													<img src="${ctx}/images/drag_lef.gif" id="delRel" />
												</td>
											</tr>
										</table>
									</td>
									<td align="left" width="22%">
										<select multiple="multiple" id="selectedList"
											style="height: 300px; width: 200px"
											onclick="showSelectedInfo();">
											<c:forEach var="appAuthorTableConfig" items="${selectedList}"
												varStatus="status">
												<option value="${appAuthorTableConfig[idColumnName] }">
													${appAuthorTableConfig[nameColumnName] }
												</option>
											</c:forEach>
										</select>
									</td>
									<td width="28%" id="relExtList_modify">
										<input type="hidden" id="multicheckboxlist_modify" />
										<input type="hidden" id="checkboxlist_modify" />
										<input type="hidden" id="radiolist_modify" />
										<input type="hidden" id="notNullList_modify" />
										<form
											action="${ctx}/jsp/app/appauthor/rel/commonappauthorrel!update.action">
											<input type="hidden" id="modifySeq" name="modifySeq" />
											<input type="hidden" id="appCode" name="appCode"
												value="${appCode}" />
											<input type="hidden" id="mainAuthorType"
												name="mainAuthorType" value="${mainAuthorType}" />
											<input type="hidden" id="grantAppKey" name="grantAppKey"
												value="${grantAppKey}" />
											<input type="hidden" id="optype" name="optype"
												value="${optype}" />
											<input type="hidden" id="beGrantId" name="beGrantId" value="" />
											<c:if test="${!empty appAuthorRelExtList}">
												<fieldset style="display: none" id="selectedInfo">
													<legend>
														<s:text name="appentity.editAuthorizaAttr"/>
													</legend>
													<table cellpadding="0" cellspacing="0" border="0">
														<c:forEach var="appAuthorRelExt"
															items="${appAuthorRelExtList}" varStatus="status">
															<tr>
																<td>
																	<table cellpadding="0" cellspacing="0" border="0">
																		<c:if test="${appAuthorRelExt.dataType !='2'}">
																			<tr>
																				<td>
																					${appAuthorRelExt.columnDesc}:
																					<strong> <font color="red">${appAuthorRelExt.isNull
																							== 'N' ? '*' : '' }</font> </strong>
																				</td>
																			<tr>
																		</c:if>
																		<c:choose>
																			<c:when test="${appAuthorRelExt.dataType =='4'}">
																				<tr>
																					<td>
																						<input type="text"
																							id="${appAuthorRelExt.columnName }_MODIFY"
																							name="${appAuthorRelExt.columnName }_MODIFY" />
																					</td>
																				</tr>
																			</c:when>
																			<c:when test="${appAuthorRelExt.dataType =='6'}">
																				<tr>
																					<td>
																						<input type="text"
																							id="${appAuthorRelExt.columnName }_MODIFY"
																							name="${appAuthorRelExt.columnName }_MODIFY"
																							class="Wdate"
																							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})" />
																					</td>
																				</tr>
																			</c:when>
																			<c:when test="${appAuthorRelExt.dataType =='7'}">
																				<tr>
																					<td>
																						<textarea
																							id="${appAuthorRelExt.columnName }_MODIFY"
																							name="${appAuthorRelExt.columnName }_MODIFY"
																							cols="30" rows="2">${appAuthorRelExt.value }</textarea>
																					</td>
																				</tr>
																			</c:when>
																			<c:when test="${appAuthorRelExt.dataType =='8'}">
																				<tr>
																					<td>
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
																				</tr>
																			</c:when>
																			<c:when test="${appAuthorRelExt.dataType =='5'}">
																				<tr>
																					<td>
																						<select id="${appAuthorRelExt.columnName }_MODIFY"
																							name="${appAuthorRelExt.columnName }_MODIFY">
																							<c:forEach var="data"
																								items="${appAuthorRelExt.datalist}">
																								<option value="${data.dataCode }" >
																									${data.dataDesc }
																								</option>
																							</c:forEach>
																						</select>
																					</td>
																				</tr>
																			</c:when>
																			<c:when test="${appAuthorRelExt.dataType =='3'}">
																				<tr>
																					<td>
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
																				</tr>
																			</c:when>
																			<c:when test="${appAuthorRelExt.dataType =='1'}">
																				<tr>
																					<td>
																						<script>
																							addRadio("${appAuthorRelExt.columnName }_MODIFY",true);
																						</script>
																						<input type="hidden"
																							id="${appAuthorRelExt.columnName }_MODIFY" />
																						<c:forEach var="data"
																							items="${appAuthorRelExt.datalist}">
																							<input type="radio"
																								name="${appAuthorRelExt.columnName }_MODIFY"
																								value="${data.dataCode }"  /> ${data.dataDesc }
																						</c:forEach>
																					</td>
																				</tr>
																			</c:when>
																			<c:when test="${appAuthorRelExt.dataType =='2'}">
																				<tr>
																					<td colspan="2">
																						<script>
																							addCheckBox("${appAuthorRelExt.columnName }_MODIFY",true);
																						</script>
																						<input type="hidden"
																							id="${appAuthorRelExt.columnName }_MODIFY"
																							name="${appAuthorRelExt.columnName }_MODIFY" />
																						<input type="checkbox"
																							id="${appAuthorRelExt.columnName }_MODIFY_checkbox"
																							name="${appAuthorRelExt.columnName }_MODIFY_checkbox" />
																						${appAuthorRelExt.columnDesc }
																					</td>
																				</tr>
																			</c:when>
																		</c:choose>
																		<script>
																			addNotNullList("${appAuthorRelExt.isNull }","${appAuthorRelExt.columnName }_MODIFY","${appAuthorRelExt.columnDesc }",true);
																		</script>
																	</table>
																</td>
															</tr>
														</c:forEach>
														<tr>
															<td>
																<div class="window_button marg_lef10 float_lef">
																	<input type="button" id="updateRel"
																		class="window_button_centerInput window_button_centerInput1"
																		value='<s:text name="appentity.changeAttr"/>' />
																</div>
															</td>
														</tr>
													</table>
												</fieldset>
											</c:if>
										</form>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
