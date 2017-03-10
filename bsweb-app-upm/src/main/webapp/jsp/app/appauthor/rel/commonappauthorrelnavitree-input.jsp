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
			var tree;
			$(function (){
				contralEffect.contain();
				contralEffect.blueButton();
				
				var root = '${jsonDate}';
				if(root == null || root == ''){
					alert('<s:text name="appentity.rootNodeLoadFail"/>');
				}else{
					root = eval('(' + root + ')');
					try{
						tree = new TreePanel({
							renderTo:'treediv',
							'root' : root,
							'iconPath' : "${ctx}/scripts/tree/img/",
							'switchType' : 'client'
						});
						tree.render();
					}catch(e){
						tree = null;
					}
					
					tree.on(function(node){
						//alert($("#selectedInfo").html());
						if($("#selectedInfo").html() != null){
							var treeNode = node.attributes.id;
							var treeNodeId = treeNode;
							if(treeNode.indexOf("-") > 0){
								treeNodeId = treeNode.substr(treeNode.indexOf("-")+1,treeNode.length);
							}
							var treeNodeName  = node.attributes.text;
							var optype  = node.attributes.optype;
							if(optype == "${optype}"){
								var oldValue = $("#beGrantId").val();
								$("#beGrantId").val(treeNodeId);
								
								var checkvalue = node.checked;
								if(checkvalue != "1"){
									$("#selectedInfo").hide();
									return false;
								}
								
								if(oldValue != treeNodeId){
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
											"id":treeNodeId
							         	},
										dataType: "json",
										async: false,
										cache: false,
										success: function(data){
											var selectedAcctExtValue =  data.relExtList;
											var modifySeq =  data.modifySeq;
											$("#modifySeq").val(modifySeq);
										 	if(selectedAcctExtValue != null && selectedAcctExtValue!="") {
												$("#selectedInfo").show();
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
								}
							}
						}
					});
				}
				
				var height = document.documentElement.clientHeight;
				var width = document.documentElement.clientWidth;
				var mainGrantObj = 50;
				var mainGrantObjHeight = 35;
				if($("#mainGrantObj")[0]){
					 mainGrantObj = $("#mainGrantObj").css("height");
					 mainGrantObjHeight = Number(mainGrantObj.substr(0,mainGrantObj.length-2)) + 50;
				}
				var relExtList = 50;
				var relExtListHeight = 35;
				if($("#relExtList")[0]){
					 relExtList = $("#relExtList").css("height");
					 relExtListHeight = 50 + Number(relExtList.substr(0,relExtList.length-2));
				}
				var tableHeight = height - mainGrantObjHeight - relExtListHeight - 15;
				$("#heightTable").css({"width":width*0.95,"height":tableHeight });
				
				var selectIds = tree.getCheckedWhichAttrEqualValue("id","optype","${optype}");
				selectIds = selectIds.toString();
				$("#saveRel").click(function(){
					var isRev = "${isRevGrant}";
					var ids = tree.getCheckedWhichAttrEqualValue("id","optype","${optype}");
					if( ids.toString() == selectIds.toString()){
						showModalMessage('<s:text name="appentity.noChange"/>');
					}else{
						var isUseAll = "${uapAppAuthorCfg.isUseAll}";
						var addIds = "";
						var delIds = "";
						if(isUseAll && isUseAll == "N"){
							selectIds = ","+selectIds+",";
							var selectidlist = ids.toString().split(",");
							for (var i = 0; i < selectidlist.length; i++) {
								var selectid = selectidlist[i];
								if (selectid != "") {
									if(selectIds.indexOf(","+selectid+",") > -1){
										
									}else{
										addIds += (","+selectid);
									}
								}
							}
							var selectedIdlist = selectIds.split(",");
							for (var i = 0; i < selectedIdlist.length; i++) {
								var selectedId = selectedIdlist[i];
								if(selectedId != ""){
									var exist = false;
									for (var j = 0; j < selectidlist.length; j++) {
										var selectid = selectidlist[j];
										if(selectid != ""){
											if(selectedId == selectid){
												exist = true;
												break;
											}
										}
									}
									if(exist == false){
										delIds += (","+selectedId);
									}
								}
							}
						}else{
							addIds = ids.toString();
						}
						//alert("addIds=="+addIds);
						//alert("delIds=="+delIds);
						
						var  result1 = "true";
						if(delIds != ''){
							delIds = dealIds(delIds);
							var validateFlag = true;
							if(typeof validateFuntionForNaviTreeDelete !='undefined' && validateFuntionForNaviTreeDelete instanceof Function ){
								validateFlag = 	validateFuntionForNaviTreeDelete(delIds);
							}
							if(validateFlag != true){
								return;
							}
							result1 =  jQuery.ajax({
					          url:"${ctx}/jsp/app/appauthor/rel/commonappauthorrel!delete.action?id="+new Date(),
					          data:{
								"appCode":"${appCode}",
								"mainAuthorType":"${mainAuthorType}",
								"grantAppKey":"${grantAppKey}",
								"optype":"${optype}",
								"isRevGrant":"${isRevGrant}",
								"adminAcctSeq":"${adminAcctSeq}",
								"ids":delIds
					          },
					          type:"post",
					          async:false,
					          dataType:"json"
					        }).responseText;
						}
						
						var result2 = "true";
						if(result1 == "true" && (typeof(isUseAll) =='undefined' || isUseAll != "N" || addIds != '')){
							initRadio();
							initCheckBox();
							initMultiCheckBox();
							var notNullValidateResult = notNullValidate();
							if(notNullValidateResult != true){
								return;
							}
							addIds = dealIds(addIds);
							var validateFlag = true;
							if(typeof validateFuntionForNaviTreeSave !='undefined' && validateFuntionForNaviTreeSave instanceof Function ){
								validateFlag = 	validateFuntionForNaviTreeSave(addIds);
							}
							if(validateFlag != true){
								return;
							}
							result2 =  jQuery.ajax({
					          url:"${ctx}/jsp/app/appauthor/rel/commonappauthorrel!save.action?id="+new Date(),
					          data:{
					            ${extPostString}
								"appCode":"${appCode}",
								"mainAuthorType":"${mainAuthorType}",
								"grantAppKey":"${grantAppKey}",
								"optype":"${optype}",
								"isRevGrant":"${isRevGrant}",
								"adminAcctSeq":"${adminAcctSeq}",
								"ids":addIds
					          },
					          type:"post",
					          async:false,
					          dataType:"json"
					        }).responseText;
				        }
				        
				        if(result1 == "true" && result2 == "true"){
							showModalMessage('<s:text name="appentity.optionSucc"/>');
							selectIds = tree.getCheckedWhichAttrEqualValue("id","optype","${optype}");
							selectIds = selectIds.toString();
						}else if(result1 == "true" && result2 != "true"){
							showModalMessage('<s:text name="appentity.optionFail"/>'+result2);
						}else if(result1 != "true" && result2 == "true"){
							showModalMessage('<s:text name="appentity.optionFail"/>'+result1);
						}else{
							showModalMessage('<s:text name="appentity.optionFail"/>'+ "<br>" + result1 + "<br>" + result2);
						}
			        }
				})
				
				$("#updateRel").click(function(){
					var ids = $("#beGrantId").val(); 
					//alert(ids);
					if( ids == ''|| ids == null){
						showModalMessage('<s:text name="appentity.selectOneNode"/>');
					}else{
						initRadio(true);
						initCheckBox(true);
						initMultiCheckBox(true);
						var notNullValidateResult = notNullValidate(true);
						if(notNullValidateResult != true){
							return;
						}
						ids = dealIds(ids);
						var validateFlag = true;
						if(typeof validateFuntionForNaviTreeUpdate !='undefined' && validateFuntionForNaviTreeUpdate instanceof Function ){
							validateFlag = 	validateFuntionForNaviTreeUpdate(ids);
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
							showModalMessage('<s:text name="operateOk"/>');
						}else{
							showModalMessage('<s:text name="appentity.optionFail"/>'+result);
						}
					}
				})
			});
			function dealIds(ids){
				var s = ids.split(",");
				var ok = "";
				for(var i=0;i<s.length;i++){
					var thisId = s[i];
					if(thisId.indexOf("-") > 0){
						thisId = thisId.substr(thisId.indexOf("-")+1,thisId.length);
					}
					if (ok == "") {
						ok = thisId;
					}else{
						ok = ok + "," + thisId;
					}
				}
				return ok;
			}
		</script>

		<c:if test="${authorValidateJsName!= '' && authorValidateJsName != null}">
			<jsp:include page="/${authorValidateJsName}" flush="true"></jsp:include>
		</c:if>

	</head>
	<body>
		<div class="padd10">
			<div class="contain">
				<div class="contain_wrap">
					<div class="contain_search">
						<div class="contain_s_wrap">
							<input type="hidden" id="multicheckboxlist" />
							<input type="hidden" id="checkboxlist" />
							<input type="hidden" id="radiolist" />
							<input type="hidden" id="notNullList" />
							<c:if test="${isTab != '1'}">
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
												<s:text name="appentity.belongOrg"/>
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
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</div>
														</c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<br>
							</c:if>
							</div>
							</c:if>
							<c:if test="${!empty appAuthorRelExtList}">
							<div id="relExtList">
								<fieldset width="100%" height="600">
									<legend>
										<s:text name="appentity.authorizeAttrEffectiveAllAttr"/>
									</legend>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<div style="clear: both">
													<c:forEach var="appAuthorRelExt"
														items="${appAuthorRelExtList}" varStatus="status">
														<div style="float: left;">
															<c:if test="${appAuthorRelExt.dataType !='2'}">
																${appAuthorRelExt.columnDesc}:
																<strong> <font color="red">${appAuthorRelExt.isNull
																		== 'N' ? '*' : '' }</font> </strong>
															</c:if>
															<c:choose>
																<c:when test="${appAuthorRelExt.dataType =='4'}">
																	<input type="text" id="relExt_${appAuthorRelExt.columnName }"
																		name="relExt_${appAuthorRelExt.columnName }" value="${appAuthorRelExt.value }" />
																</c:when>
																<c:when test="${appAuthorRelExt.dataType =='6'}">
																	<input type="text" id="relExt_${appAuthorRelExt.columnName }"
																		name="relExt_${appAuthorRelExt.columnName }" class="Wdate"
																		onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})" />
																</c:when>
																<c:when test="${appAuthorRelExt.dataType =='7'}">
																	<textarea id="relExt_${appAuthorRelExt.columnName }"
																		name="relExt_${appAuthorRelExt.columnName }" cols="30" rows="2">${appAuthorRelExt.value }</textarea>
																</c:when>
																<c:when test="${appAuthorRelExt.dataType =='8'}">
																	<input type="hidden" id="relExt_${appAuthorRelExt.columnName }"
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
																</c:when>
																<c:when test="${appAuthorRelExt.dataType =='5'}">
																	<select id="relExt_${appAuthorRelExt.columnName }"
																		name="relExt_${appAuthorRelExt.columnName }">
																		<c:forEach var="data"
																			items="${appAuthorRelExt.datalist}">
																			<option value="${data.dataCode }" ${appAuthorRelExt.value== data.dataCode ? "selected" : ""}>
																				${data.dataDesc }
																			</option>
																		</c:forEach>
																	</select>
																</c:when>
																<c:when test="${appAuthorRelExt.dataType =='3'}">
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
																</c:when>
																<c:when test="${appAuthorRelExt.dataType =='1'}">
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
																</c:when>
																<c:when test="${appAuthorRelExt.dataType =='2'}">
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
																</c:when>
															</c:choose>
															<script>
																addNotNullList("${appAuthorRelExt.isNull }","relExt_${appAuthorRelExt.columnName }","${appAuthorRelExt.columnDesc }");
															</script>
															&nbsp;&nbsp;&nbsp;
														</div>
													</c:forEach>
												</div>
											</td>
										</tr>
									</table>
								</fieldset>
							</div>
							</c:if>
						</div>
					</div>
					<table width="100%" height="400" id="heightTable" align="center" border="0">
						<tr height="100%">
							<c:if test="${!empty appAuthorRelExtList}">
							<td align="left" width="50%" height="100%">
								<table width="100%" height="100%">
									<tr height="100%">
										<td align="left" width="100%" height="100%" valign="top">
											<div id="treediv" style="width:100%;height: 100%; overflow: auto"></div>
										</td>
									</tr>
								</table>
							</td>
							<td width="50%" id="relExtList_modify">
								<input type="hidden" id="multicheckboxlist_modify" />
								<input type="hidden" id="checkboxlist_modify" />
								<input type="hidden" id="radiolist_modify" />
								<input type="hidden" id="notNullList_modify" />
								<form
									action="${ctx}/jsp/app/appauthor/rel/commonappauthorrel!update.action">
									<input type="hidden" id="modifySeq" name="modifySeq" />
									<input type="hidden" id="appCode" name="appCode"
										value="${appCode}" />
									<input type="hidden" id="mainAuthorType" name="mainAuthorType"
										value="${mainAuthorType}" />
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
																				<textarea id="${appAuthorRelExt.columnName }_MODIFY"
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
							</c:if>
							<c:if test="${empty appAuthorRelExtList}">
								<td align="left" width="100%"  height="100%" valign="top">
									<div style="width:100%;height: 100%; overflow: auto" id="treediv"></div>
								</td>
							</c:if>
						</tr>
						<tr>
							<td>
								<div class="window_button marg_lef10 float_lef">
									<input type="button" id="saveRel"
										class="window_button_centerInput window_button_centerInput1"
										value='<s:text name="appentity.save"/>' />
								</div>
							</td>
						</tr>					
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
