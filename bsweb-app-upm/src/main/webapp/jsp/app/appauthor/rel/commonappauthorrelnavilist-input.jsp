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
			var tree;
			var rootId ;
			var selectedIds = "";
			$(function (){
				contralEffect.contain();
				contralEffect.blueButton();
				
				var root = '${jsonDate}';
				if(root == null || root == ''){
					//alert("树根节点加载失败，请联系管理员");
				}else{
					root = eval('(' + root + ')');
					dirChange(root.id,root.text);
					try{
						var treeType = root.optype;
						rootId = root.id;
						tree = new TreePanel({
							renderTo:'treediv',
							'root' : root,
							'iconPath' : "${ctx}/scripts/tree/img/",
							'switchType' : 'ajax',
							'ajaxAction' : "${ctx}/jsp/app/appauthor/commonappauthortreemng!list.action?appCode=${appCode}&optype="+treeType+"&adminAcctSeq=${adminAcctSeq}&appId=${appId}"
						});
						tree.render();
					}catch(e){
						tree = null;
					}
					
					tree.on(function(node){
						dirChange(node.attributes.id,node.getPath("text"));
						reload();
					});
				}
				function dirChange(dirId,dirText){
					$("#treeNodeId").val(dirId);
					$("#dirId").val(dirId);
					$("#dirText").html(dirText);
				}
				
				function initSelected(){
					if("${isBatch}" == "true"){
						return;
					}
					selectedIds = "";
					var queryType = $("#queryType").val();
					if(!queryType || queryType == "2"){
						return;
					}
					$.each(
						$("#list").jqGrid('getDataIDs'),
						function(i, data) {
							var ret = jQuery("#list").jqGrid('getRowData',data);
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
									"id":ret["${idColumnName}"]
					         	},
								dataType: "json",
								async: false,
								cache: false,
								success: function(mng){
									var selectedAcctExtValue =  mng.relExtList;
									var modifySeq =  mng.modifySeq;
									$("#modifySeq").val(modifySeq);
									if(modifySeq && modifySeq != null && modifySeq != "") {
										$("#list").jqGrid().setSelection(data, true);
					        			$("#list").setCell(data,'isselect','true', '', '');
					        			jQuery("#list").jqGrid('setCell',data,'OPERATE',"<a href='javascript:doupdate(\""+data+"\",\""+ret["${idColumnName}"]+"\",\""+modifySeq+"\")'><u><s:text name='appentity.edit'/></u></a>");
					        			selectedIds += (","+ret["${idColumnName}"]+",");
									}
								}
							});
						}
					)
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
				$("#heightTable").css({"width":width*0.98,"height":tableHeight });
				
				jQuery("#list").jqGrid({
					url:'',
					datatype: 'json',
					mtype: 'POST',
					colNames:${colNames},
					colModel:${colModel},
					pager: '#pager',
					sortable: true,
					rowNum:10,
					prmNames:{rows:"objectPage.pageSize",page:"objectPage.pageNumber",total:"objectPage.totalPages"},     
					jsonReader: {
						root: "rows",
						repeatitems : false,
						id:"0"
						},
					rowList:[10,20,50,100],
					viewrecords: true,
					width: windowWidth * 0.6,
					height: tableHeight - 150,
					hidegrid: false,
					loadtext: '<s:text name="common.tips.loading" />',
					scrollrows: true,
					multiselect:true,
					altRows:true,
					altclass:'altclass',
					gridComplete:function(){
						initSelected();
					}
				}); 
				
				$("#saveRel").click(function(){
					var isRev = "${isRevGrant}";
					var ids = jQuery("#list").jqGrid('getGridParam','selarrrow');
					var selectids = ids.toString();
					var selectidlist = selectids.split(",");
					var addIds = "";
					for (var i = 0; i < selectidlist.length; i++) {
						var selectid = selectidlist[i];
						if (selectid != "") {
							var ret = jQuery("#list").jqGrid('getRowData',selectid);
							var thisid = ret["${idColumnName}"];
							if(selectedIds.indexOf(","+thisid+",") > -1){
								
							}else{
								addIds += (","+thisid);
							}
						}
					}
					//alert("111=="+addIds);
					var delIds = "";
					var selectedIdlist = selectedIds.split(",");
					for (var i = 0; i < selectedIdlist.length; i++) {
						var selectedId = selectedIdlist[i];
						if(selectedId != ""){
							var exist = false;
							for (var j = 0; j < selectidlist.length; j++) {
								var selectid = selectidlist[j];
								if(selectid != ""){
									var ret = jQuery("#list").jqGrid('getRowData',selectid);
									var thisid = ret["${idColumnName}"];
									if(selectedId == thisid){
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
					if(delIds == '' && addIds == ''){
						showModalMessage('<s:text name="appentity.noChange"/>');
						return;
					}
					var validateFlag = true;
					if(typeof validateFuntionForNaviListSave !='undefined' && validateFuntionForNaviListSave instanceof Function ){
						validateFlag = 	validateFuntionForNaviListSave(addIds,delIds);
					}
					if(validateFlag != true){
						return;
					}
					var  result1 = "true";
					//alert("delIds==="+delIds);
					if(delIds != ''){
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
					var  result2 = "true";
					//alert("addIds==="+addIds);
					if(addIds != ''){
						initRadio();
						initCheckBox();
						initMultiCheckBox();
						var notNullValidateResult = notNullValidate();
						if(notNullValidateResult != true){
							return;
						}
						result2 = jQuery.ajax({
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
					}else if(result1 == "true" && result2 != "true"){
						showModalMessage('<s:text name="appentity.optionFail"/>'+result2);
					}else if(result1 != "true" && result2 == "true"){
						showModalMessage('<s:text name="appentity.optionFail"/>'+result1);
					}else{
						showModalMessage('<s:text name="appentity.optionFail"/>'+ "<br>" + result1 + "<br>" + result2);
					}
					if("${isBatch}" == "true"){
						var ids = jQuery("#list").jqGrid('getGridParam','selarrrow');
						selectedIds = ids.toString();
					}else{
						reload();
					}
				})
				
				$("#query").click(function(){
					if(!$("input[type='checkbox'][name='isUnionNaviQuery']").is(":checked")){
						$("#treeNodeId").val("");
					}else{
						$("#treeNodeId").val($("#dirId").val());
					}
					initRadio();
					initCheckBox();
					initMultiCheckBox();
					reload();
				});
				
				$("#queryType").change(function(){
					$("#query").click();
				})
			});
			
			function doupdate(data,id,seq){
				if(selectedIds.indexOf(","+id+",") > 0){
					$("#list").jqGrid().setSelection(data, true);
					$("#list").setCell(data,'isselect','true', '', '');
				}else{
					$("#list").jqGrid().setSelection(data, false);
					$("#list").setCell(data,'isselect','false', '', '');
				}
				jQuery.FrameDialog.create({
					url: "${ctx}/jsp/app/appauthor/rel/commonappauthorrel!toupdate.action?&appCode=${appCode}&mainAuthorType=${mainAuthorType}&grantAppKey=${grantAppKey}&optype=${optype}&isRevGrant=${isRevGrant}&adminAcctSeq=${adminAcctSeq}&id="+id+"&modifySeq="+seq+"&random="+new Date(),
					title: '<s:text name="appentity.editAttr"/>',
					width: document.documentElement.clientWidth * 0.6,
					height:document.documentElement.clientHeight* 0.8,
					//show: 'slide',
					hide: 'slide',
					buttons:{}
				}).bind('dialogclose', function(event, ui) {
					
			    });
			}
			function reload(){
				var queryType = $("#queryType").val();
				
				var mainAuthorType = "${mainAuthorType}";
				var grantAppKey = "${grantAppKey}";
				var isRevGrant = "${isRevGrant}";
				if(!queryType || queryType == "0"){
					mainAuthorType = "";
					grantAppKey = "";
					isRevGrant = "";
				}
				
				jQuery("#list").jqGrid('setGridParam',{
				     url:"${ctx}/jsp/app/appauthor/commonappauthornavilistmng!list.action?appCode=${appCode}&optype=${optype}&adminAcctSeq=${adminAcctSeq}&appId=${appId}",
				     postData:{
				     	${search},
				     	treeNodeId:$("#treeNodeId").val(),
				     	mainAuthorType:mainAuthorType,
						grantAppKey:grantAppKey,
						isRevGrant:isRevGrant,
						queryType:queryType
				     },
				 	 page:1
				 }).trigger("reloadGrid"); 
			}
			$(document).keydown(function(){
		        if(event.keyCode==13){
		        	$("#query").click();
		        }
		    });
		</script>

		<c:if test="${authorValidateJsName!= '' && authorValidateJsName != null}">
			<jsp:include page="/${authorValidateJsName}" flush="true"></jsp:include>
		</c:if>

		<script>
			$(function (){
				reload();
			})
		</script>
	</head>
	<body>
		<div class="padd10">
			<div class="contain_search">
				<div class="contain_s_wrap">
					<input type="hidden" id="multicheckboxlist" />
					<input type="hidden" id="checkboxlist" />
					<input type="hidden" id="radiolist" />
					<input type="hidden" id="notNullList" />
					<input type="hidden" id="dirId" name="dirId" />
					<input type="hidden" id="treeNodeId" name="treeNodeId" />
					<input type="hidden" id="appId" name="appId" value="${appId}" />
					<input type="hidden" id="appCode" name="appCode" value="${appCode}" />
					<input type="hidden" id="optype" name="optype" value="${optype}" />
					<input type="hidden" id="adminAcctSeq" name="adminAcctSeq"
						value="${adminAcctSeq}" />
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
											<c:forEach var="appAuthorTableConfig" items="${grantObj}" varStatus="status">
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
					<br>
					</c:if>
					</div>
					</c:if>
					<c:if test="${!empty appAuthorRelExtList}">
					<div id="relExtList">
						<fieldset width="100%">
							<legend>
								<s:text name="appentity.authorizeAttrEffectiveSelected"/>
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
																name="relExt_${appAuthorRelExt.columnName }" value="${appAuthorRelExt.value }"/>
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
			<div id ="beGrantObj">
			<table width="100%" height="400" id="heightTable" border="1">
				<tr height="100%">
					<c:if test="${!empty jsonDate}">
						<td width="30%"  height="100%" valign="top">
							<div id="treediv" style="width:100%;height: 100%; overflow: auto"></div>
						</td>
						<td width="70%" valign="top" height="100%">
					</c:if>
					<c:if test="${empty jsonDate}">
						<td width="100%" valign="top" height="100%">
					</c:if>
					<div class="contain_search">
						<div class="contain_s_wrap">
							<input type="hidden" id="multicheckboxlist" />
							<input type="hidden" id="checkboxlist" />
							<input type="hidden" id="radiolist" />
							<input type="hidden" id="notNullList" />
							<input type="hidden" id="treeNodeId" name="treeNodeId" />
							<input type="hidden" id="appId" name="appId" value="${appId}" />
							<input type="hidden" id="appCode" name="appCode"
								value="${appCode}" />
							<input type="hidden" id="optype" name="optype" value="${optype}" />
							<input type="hidden" id="adminAcctSeq" name="adminAcctSeq"
								value="${adminAcctSeq}" />
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td>
										<div style="clear: both">
											<c:if test="${isBatch != 'true'}">
											<div style="float: left;">
												<s:text name="appentity.queryType"/>
												<select id="queryType" name="queryType">
													<option value="0">
														<s:text name="appentity.all"/>
													</option>
													<option value="1">
														<s:text name="appentity.distributed"/>
													</option>
													<option value="2">
														<s:text name="appentity.unDistribute"/>
													</option>
												</select>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											</c:if>
											<c:forEach var="appAuthorTableConfig" items="${searchList}"
												varStatus="status">
												<div style="float: left;">
													<c:if test="${appAuthorTableConfig.dataType !='2'}">
														${appAuthorTableConfig.columnDesc}:
													</c:if>
													<c:if test="${appAuthorTableConfig.dataType =='1'}">
														<script>
															addRadio("${appAuthorTableConfig.columnName }");
														</script>
														<input type="hidden"
															id="${appAuthorTableConfig.columnName }" />
														<c:forEach var="data"
															items="${appAuthorTableConfig.datalist}">
															<input type="radio"
																name="${appAuthorTableConfig.columnName }"
																value="${data.dataCode }" /> ${data.dataDesc }
														</c:forEach>
													</c:if>
													<c:if test="${appAuthorTableConfig.dataType =='2'}">
														<script>
															addCheckBox("${appAuthorTableConfig.columnName }");
														</script>
														<input type="hidden"
															id="${appAuthorTableConfig.columnName }"
															name="${appAuthorTableConfig.columnName }" />
														<input type="checkbox"
															name="${appAuthorTableConfig.columnName }_checkbox"
															${appAuthorTableConfig.value== appAuthorTableConfig.checkedValue ? "checked" : "" }/>${appAuthorTableConfig.columnDesc}
													</c:if>
													<c:if test="${appAuthorTableConfig.dataType =='3'}">
														<script>
															addMultiCheckBox("${appAuthorTableConfig.columnName }");
														</script>
														<input type="hidden"
															id="${appAuthorTableConfig.columnName }" />
														<c:forEach var="data"
															items="${appAuthorTableConfig.datalist}">
															<input type="checkbox"
																name="${appAuthorTableConfig.columnName }"
																value="${data.dataCode }" /> ${data.dataDesc }
														</c:forEach>
													</c:if>
													<c:if
														test="${appAuthorTableConfig.dataType =='4'||appAuthorTableConfig.dataType =='7'}">
														<input type="text"
															id="${appAuthorTableConfig.columnName }"
															name="${appAuthorTableConfig.columnName }" value="" />
													</c:if>
													<c:if test="${appAuthorTableConfig.dataType =='6'}">
														<input type="text"
															id="${appAuthorTableConfig.columnName }"
															name="${appAuthorTableConfig.columnName }" value=""
															class="Wdate"
															onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})" />
													</c:if>
													<c:if test="${appAuthorTableConfig.dataType =='5'}">
														<c:choose>
															<c:when test="${!empty appAuthorTableConfig.dataSource}">
																<select id="${appAuthorTableConfig.columnName }"
																	name="${appAuthorTableConfig.columnName }">
																	<option value="-1">
																		<s:text name="appentity.all"/>
																	</option>
																	<c:forEach var="data"
																		items="${appAuthorTableConfig.datalist}">
																		<option value="${data.dataCode }">
																			${data.dataDesc }
																		</option>
																	</c:forEach>
																</select>
															</c:when>
															<c:otherwise>
																<input type="text"
																	id="${appAuthorTableConfig.columnName }"
																	name="${appAuthorTableConfig.columnName }" value="" />
															</c:otherwise>
														</c:choose>
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
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</div>
											</c:forEach>
											<div style="float: left;">
												<div class="window_button marg_lef10 float_lef">
													<input type="button" id="query"
														class="window_button_centerInput window_button_centerInput1"
														value='<s:text name="appentity.query"/>' />
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<c:if test="${!empty jsonDate}">
										<td colspan="4">
											<input type="checkbox" name="isUnionNaviQuery"
												name="isUnionNaviQuery" checked />
												<s:text name="appentity.connNativeNodeQuery"/>
											<span id="dirText"></span><s:text name="appentity.rightQuot"/>
										</td>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					<div class="toolbar">
						<div class="toolbar_wrap">
							<div class="window_button marg_lef10 float_lef tabgrant">
								<input type="button" id="saveRel"
									class="window_button_centerInput window_button_centerInput1"
									value='<s:text name="appentity.save"/>' />
							</div>
						</div>
					</div>
					<table id="list"></table>
					<div id="pager"></div>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</body>
</html>