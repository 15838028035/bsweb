<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<script type="text/javascript" src="${ctx}/jsp/app/appauthor/scripts/common-app-author.js"></script>
		<script type="text/javascript" src="${ctx}/scripts/app/list-validate.js"></script>

		<script type="text/javascript">
			$(function (){
				contralEffect.contain();
				contralEffect.blueButton();
				var operateType = $("#operateType").val();
				if(operateType == "UPDATE"){
					$("#${appKeyColumn}").attr("disabled",true);
				}
			})
		</script>

		<c:if test="${authorValidateJsName!=null && authorValidateJsName!=''}">
			<jsp:include page="/${authorValidateJsName}" flush="true"></jsp:include>
		</c:if>

	</head>
	<body>
		<form action="${ctx}/jsp/app/appauthor/commonappauthormng!save.action"
			method="post" id="inputForm">
			<input type="hidden" id="multicheckboxlist" />
			<input type="hidden" id="checkboxlist" />
			<input type="hidden" id="radiolist" />
			<input type="hidden" id="notNullList" />
			<input type="hidden" id="appKeyColumn" name="appKeyColumn" value="${appKeyColumn }" />
			<input type="hidden" id="appCode" name="appCode" value="${appCode}" />
			<input type="hidden" id="appId" name="appId" value="${appId}" />
			<input type="hidden" id="optype" name="optype" value="${optype}" />
			<input type="hidden" id="adminAcctSeq" name="adminAcctSeq"
				value="${adminAcctSeq}" />
			<input type="hidden" id="id" value="${id}" />
			<input type="hidden" id="operateType" name="operateType" value="${(id == null || id == '')?'CREATE':'UPDATE'}" />
			<input type="hidden" id="dirId" name="dirId" value="${dirId}" />
			<div class="padd10">
				<div class="contain">
					<div class="contain_wrap">
						<div class="contain_title">
							<div class="contain_t_wrap">
								<div class="float_lef contain_t_text">
									<span class=""><img src="${ctx}/images/plus.png"
											align="absmiddle" /> </span>
									<span class="marg_lef5"> <a
										href="${ctx}/jsp/app/appauthor/commonappauthormng!manager.action?appCode=${appCode}&optype=${optype }&adminAcctSeq=${adminAcctSeq}&appId=${appId}">
											${mngOption.name } </a> </span>
									<span class="marg_lef5"><img
											src="${ctx}/images/next.gif" align="absmiddle" /> </span>
									<span class="marg_lef5"> <s:if
											test="#request.id == null || request.id=='' ">
											<s:text name="common.options.create" />
										</s:if> <s:else>
											<s:text name="common.options.edit" />
										</s:else> </span>
								</div>
							</div>
						</div>
						<div class="contain_search">
							<div class="contain_s_wrap">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<c:forEach var="appAuthorTableConfig" items="${columnList}"
										varStatus="status">
										<c:choose>
											<c:when test="${appAuthorTableConfig.isModify =='Y'}">
												<tr>
													<td align="right" width="30%">
														<c:if test="${appAuthorTableConfig.dataType !='2'}">
															${appAuthorTableConfig.columnDesc}:
															<strong> <font color="red">${appAuthorTableConfig.isNull
																	== 'N' ? '*' : '' }</font> </strong>
														</c:if>
													</td>
													<td align="left" width="70%">
														<c:if test="${appAuthorTableConfig.dataType =='1'}">
															<input type="hidden"
																id="${appAuthorTableConfig.columnName }" />
															<c:forEach var="data"
																items="${appAuthorTableConfig.datalist}">
																<input type="radio"
																	name="${appAuthorTableConfig.columnName }"
																	value="${data.dataCode }" /> ${data.dataDesc}
															</c:forEach>
															<script>
																addRadio("${appAuthorTableConfig.columnName }");
																$('input[type=radio][name="${appAuthorTableConfig.columnName }"][value="${appAuthorTableConfig.value}"]').attr("checked","checked");
															</script>
														</c:if>
														<c:if test="${appAuthorTableConfig.dataType =='2'}">
															<input type="hidden"
																id="${appAuthorTableConfig.columnName }"
																name="${appAuthorTableConfig.columnName }" />
															<input type="checkbox"
																name="${appAuthorTableConfig.columnName }_checkbox"
																${appAuthorTableConfig.value== appAuthorTableConfig.checkedValue ? "checked" : "" }/>${appAuthorTableConfig.columnDesc}
															<script>
																addCheckBox("${appAuthorTableConfig.columnName }");
															</script>
														</c:if>
														<!-- 
														<c:if test="${appAuthorTableConfig.dataType =='3'}">
															<input type="hidden"
																id="${appAuthorTableConfig.columnName }" />
															<c:forEach var="data"
																items="${appAuthorTableConfig.datalist}">
																<input type="checkbox"
																	name="${appAuthorTableConfig.columnName }"
																	value="${data.dataCode }" /> ${data.dataDesc }
															</c:forEach>
															<script>
																addMultiCheckBox("${appAuthorTableConfig.columnName }");
																$('input[type=checkbox][name="${appAuthorTableConfig.columnName }"][value=${appAuthorTableConfig.value}]').attr("checked","checked");
															</script>
														</c:if>
														-->
														<c:if test="${appAuthorTableConfig.dataType =='4'}">
															<input type="text"
																id="${appAuthorTableConfig.columnName }"
																name="${appAuthorTableConfig.columnName }"
																value="${appAuthorTableConfig.value }" />
														</c:if>
														<c:if test="${appAuthorTableConfig.dataType =='6'}">
															<input type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})"
																id="${appAuthorTableConfig.columnName }"
																name="${appAuthorTableConfig.columnName }"
																value="${appAuthorTableConfig.value }" />
														</c:if>
														<c:if test="${appAuthorTableConfig.dataType =='7'}">
															<textarea id="${appAuthorTableConfig.columnName }"
																name="${appAuthorTableConfig.columnName }" cols="30"
																rows="2">${appAuthorTableConfig.value }</textarea>
														</c:if>
														<c:if test="${appAuthorTableConfig.dataType =='8'}">
															<input type="hidden"
																id="${appAuthorTableConfig.columnName }"
																name="${appAuthorTableConfig.columnName }"
																value="${appAuthorTableConfig.value }" />
															<input type="text" readonly
																id="${appAuthorTableConfig.columnName }_DESC"
																name="${appAuthorTableConfig.columnName }_DESC"
																value="${appAuthorTableConfig.descValue }"
																onclick="openSelectDialog('${appAuthorTableConfig.columnName }','${appAuthorTableConfig.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');" />
															<img src="${ctx }/images/icon2_030.gif"
																class="CA_4A_select cursor_pointer"
																id="${appAuthorTableConfig.columnName }_DESC_IMG"
																onclick="openSelectDialog('${appAuthorTableConfig.columnName }','${appAuthorTableConfig.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');"
																style='padding: 2px 3px; cursor: pointer;' />
														</c:if>
														<c:if
															test="${appAuthorTableConfig.dataType =='5' || appAuthorTableConfig.dataType =='3'}">
															<select id="${appAuthorTableConfig.columnName }"
																name="${appAuthorTableConfig.columnName }">
																<c:forEach var="data"
																	items="${appAuthorTableConfig.datalist}">
																	<c:choose>
																		<c:when
																			test="${data.dataCode == appAuthorTableConfig.value }">
																			<option value="${data.dataCode }" selected>
																				${data.dataDesc }
																			</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${data.dataCode }">
																				${data.dataDesc }
																			</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
														</c:if>
														<script>
															addNotNullList("${appAuthorTableConfig.isNull }","${appAuthorTableConfig.columnName }","${appAuthorTableConfig.columnDesc }");
														</script>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<input type="hidden"
													name="${appAuthorTableConfig.columnName }"
													value="${ appAuthorTableConfig.value }" />
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<tr>
										<td></td>
										<td>
											<div class="window_button marg_lef10 float_lef">
												<input type="button" id="save"
													class="window_button_centerInput window_button_centerInput1"
													value='<s:text name="appentity.save"/>' />
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
