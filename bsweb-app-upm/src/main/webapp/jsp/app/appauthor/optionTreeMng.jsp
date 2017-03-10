<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<s:set name="showExpire" value="#parameters.showExpire[0]"></s:set>
<s:set name="orgName" value="#parameters.orgName[0]"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<script type="text/javascript" src="${ctx}/jsp/app/appauthor/scripts/common-app-author.js"></script>
		<script type="text/javascript" src="${ctx}/scripts/app/tree-validate.js"></script>

		<script type="text/javascript">
		var selectName = "${selectName}";
		$(function(){
			var height = document.documentElement.clientHeight;
			if(height < 350) height = 350;
			var width = document.documentElement.clientWidth;
			if(width < 300) width = 300;
			var isFunction = false;
			if(selectName == null || selectName == ''){
				$("#heightTable").css({"width":width*0.95,"height":height-58-40});
			}else{
				if(selectName.indexOf("javascript:") != -1){
					isFunction = true;
				}
				$("#heightTable").css({"width":width*0.95,"height":height-40});
			}
			contralEffect.contain();
			contralEffect.blueButton();
			$("#appmgmt").click(function(){
					parent.LT_menu.location="/uap/jsp/app/appdirectory/directory.jsp?action=navi";
					parent.LT_main.location="/uap/jsp/app/entity/appentity.jsp";
				});
				$("#rightmgmt").click(function(){
					parent.LT_main.location="${ctx}/jsp/app/appauthor/commonappauthormng!permlist.action?appCode=${appCode}&adminAcctSeq=${adminAcctSeq}&appId=${appId}&adminUserId=${adminUserId}&loginOrgId=${loginOrgId}&realAppId=${realAppId}";
				});
				
			var root = '${jsonString}';
			if(root == null || root == ''){
				alert('<s:text name="appentity.rootNodeLoadFail"/>');
			}else{
				root = eval('(' + root + ')');
				if(selectName == null || selectName == ''){
					loadTreeNode(root.id);
				}
				tree = new TreePanel({
					renderTo:'treediv',
					'root' : root,
					'iconPath' : "${ctx}/scripts/tree/img/",
					'switchType' : 'ajax',
					'ajaxAction' : "${ctx}/jsp/app/appauthor/commonappauthortreemng!list.action?appCode=${appCode}&optype=${optype}&adminAcctSeq=${adminAcctSeq}&appId=${appId}"
				});
				tree.render();
				tree.on(function(node){
					var treeNodeId  = node.attributes.id;
					var treeNodeName  = node.attributes.text;
					if(selectName == null || selectName == ''){
						loadTreeNode(treeNodeId);
					}else{
						if(isFunction){
							confirmselect(treeNodeId);
						}else{
							$(parent.document).find("#"+selectName+"_DESC").val(treeNodeName);
							$(parent.document).find("#"+selectName).val(treeNodeId);
							$.FrameDialog.closeDialog();
						}
					}
				});
			}
			
			$(".buttongrant").click(function(){
				var name = $(this).attr("name");//alert(name);
				var url = $(this).attr("url");//alert(url);
				var urltype = $(this).attr("urltype");//alert(urltype);
				var optype = $(this).attr("optype");//alert(optype);
				var isReverst = $(this).attr("isRev");//alert(isReverst);
				var isBatch = $(this).attr("isBatch");//alert(isBatch);
				var ids = $("#treeNodeId").val(); 
				if(urltype && urltype=="1"){
					if(!url || url == '' || url == null){
						showModalMessage(name+'<s:text name="appentity.urlConfigErr"/>');
						return;
					}
					if(isBatch == "N" && ids.toString().indexOf(",")!=-1 ){
						showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
						return;
					}
					url = getSsoUrl("${ctx}","${adminAcct.appId}","${adminAcctSeq}",url,ids);
					window.parent.jQuery.FrameDialog.create({
						url: url,
						title: name,
						width: window.parent.document.documentElement.clientWidth * 0.8,
						height:window.parent.document.documentElement.clientHeight* 0.95,
						//show: 'slide',
						hide: 'slide',
						buttons:{}							
					}).bind('dialogclose', function(event, ui) {
						
				    });
				}else{
					if( ids == ''|| ids == null ){
						showModalMessage('<s:text name="appentity.selectOneData"/>');
						return;
					}else if(ids == "${appCode}"){
						showModalMessage('<s:text name="appentity.virtualRootNodeNoOption"/>');
						return;
					}
					if(isBatch == "N" && ids.toString().indexOf(",")!=-1 ){
						showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
						return;
					}
					if(!url || url == '' || url == null){
						url = "/jsp/app/appauthor/rel/commonappauthorrel!input.action";
					}
					url = getLocalRelUrl("${appId}","${appCode}","${loginOrgId}","${realAppId}","${adminAcctSeq}","${optype}","${ctx}"+url,$("#selectTreeNodeSeq").val(),optype,isReverst);
					window.parent.jQuery.FrameDialog.create({
						url: url,
						title: name,
						width: window.parent.document.documentElement.clientWidth * 0.8,
						height:window.parent.document.documentElement.clientHeight* 0.95,
						//show: 'slide',
						hide: 'slide',
						buttons:{}							
					}).bind('dialogclose', function(event, ui) {
						
				    });
				}
			});
			
			$(".tabgrant").click(function(){
				var name = $(this).attr("name");//alert(name);
				var url = $(this).attr("url");//alert(url);
				var urltype = $(this).attr("urltype");//alert(urltype);
				var isBatch = $(this).attr("isBatch");//alert(isBatch);
				var ids = $("#treeNodeId").val(); 
				if(urltype && urltype=="1"){
					if(!url || url == '' || url == null){
						showModalMessage(name+'<s:text name="appentity.unSettingUrl"/>');
						return;
					}
					if(isBatch == "N" && ids.toString().indexOf(",")!=-1 ){
						showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
						return;
					}
					url = getSsoUrl("${ctx}","${adminAcct.appId}","${adminAcctSeq}",url,ids);
				}else{
					if( ids == ''|| ids == null ){
						showModalMessage('<s:text name="appentity.selectOneData"/>');
						return;
					}else if(ids == "${appCode}"){
						showModalMessage('<s:text name="appentity.virtualRootNodeNoOption"/>');
						return;
					}
					if(isBatch == "N" && ids.toString().indexOf(",")!=-1 ){
						showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
						return;
					}
					if(!url || url == '' || url == null){
						//tab页入口
						url = "/jsp/app/appauthor/rel/commonappauthorrel!tabs.action";
					}
					url = getLocalRelUrl("${appId}","${appCode}","${loginOrgId}","${realAppId}","${adminAcctSeq}","${optype}","${ctx}"+url,$("#selectTreeNodeSeq").val());
				}
				window.parent.jQuery.FrameDialog.create({
					url: url,
					title: name,
					width: window.parent.document.documentElement.clientWidth * 0.8,
					height:window.parent.document.documentElement.clientHeight* 0.95,
					//show: 'slide',
					hide: 'slide',
					buttons:{}							
				}).bind('dialogclose', function(event, ui) {
					
			    });
			});
		});
		
		function confirmselect(nodeId){
			$.ajax({
				type: "POST",
				url: "${ctx}/jsp/app/appauthor/commonappauthormng!getAuthorEntityValue.action?random="+new Date(),
				data:{
					"appCode":"${appCode}",
					"optype":"${optype}",
					"id":nodeId
	         	},
				dataType: "json",
				async: false,
				cache: false,
				success: function(data){
					// 支持多选节点再保存，还需要循环回填所有子节点?或针对树型后台处理
					var parentColumnName =  $("#parentName").val();
					var UapAppAuthorTableCfgs =  data.list;
				 	if(UapAppAuthorTableCfgs != null && UapAppAuthorTableCfgs!="") {
				 		var object = new Object();
	  					$.each(UapAppAuthorTableCfgs, function(i,item){
	  						var name = item.columnName;
							var value = item.value;
							var descValue = item.descValue;
							object[name] = value;
							object[name + "_DESC"] = descValue;
	  					})
	  					var parentgrid = $(parent.document).find("#"+selectName.substring(11,selectName.length));
						var p_id = parentgrid.jqGrid('getRowData',nodeId)['${uapAppAuthorCfg.appKeyColumn}'];
						if(typeof(p_id) == 'undefined'){
							parentgrid.jqGrid('addRowData', nodeId ,object);
						}else{
							//parentgrid.jqGrid().setSelection(p_id);
						}
	  				}
					$.FrameDialog.closeDialog();
				}
			})
		}
		
		function add(){
			$("#"+$("#appKeyColumn").val()).removeAttr("disabled");
			$("#operateType").val("CREATE");
			$("#"+$("#keyColumn").val()).val("");
			$("#"+$("#appKeyColumn").val()).val("");
			$("#"+$("#parentName").val()).val($("#treeNodeId").val());
			$("#"+$("#parentName").val()+"_DESC").val($("#treeNodeName").val());
			$.ajax({
				type: "POST",
				url: "${ctx}/jsp/app/appauthor/commonappauthormng!getAllColumnList.action?random="+new Date(),
				data:{
					"appCode":"${appCode}",
					"optype":"${optype}"
	         	},
				dataType: "json",
				async: false,
				cache: false,
				success: function(data){
					var modifyList =  data.list;
				 	if(modifyList != null && modifyList!="") {
	  					$.each(modifyList, function(i,item){
		  					var name = item.columnName;
	  						if(name != $("#parentName").val()){
		  						var dataType = item.dataType;
								var value = item.value;
								if(dataType == "1"){
									$("input[type='radio'][name='" + name + "'][value='"+value+"']").attr("checked","checked");
								}else if(dataType == "2"){
									var checkedValue = item.checkedValue;
									if(value == checkedValue){
										$("input[type='checkbox'][name='" + name + "_checkbox']").attr("checked",true);
									}else{
										$("input[type='checkbox'][name='" + name + "_checkbox']").attr("checked",false);
									}
								}else if(dataType == "3"){
									$("input[type='checkbox'][name='" + name + "'][value='"+value+"']").attr("checked","checked");
								}else{
									//下拉框无默认值时，默认选中第一个
									if(dataType == "5" && (value == null || value == '')){
									 	try{
									 		$("#"+name).val($("#"+name).get(0).options[0].value);
									 	}catch(e){
									 		
									 	}
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
	  						}
				  		})
				  	}
				}
			});
		}
		
		function cancle(){
			loadTreeNode($("#treeNodeId").val());
		}
		
		function deleteNode(){
			var ids = $("#selectTreeNodeSeq").val();
			if( ids == ''|| ids == null ){
				showModalMessage('<s:text name="appentity.selectOneNode"/>');
			}else if(ids == "${appCode}"){
				showModalMessage('<s:text name="appentity.virtualRootNodeNoDel"/>');
				return;
			}else {
				var isLeafs = isThisNodeLeaf("${ctx}","${appCode}","${appId}","${optype}","${adminAcctSeq}",ids);
				if(isLeafs != true){
					showModalMessage('<s:text name="appentity.currentNodeHasChildNoDel"/>');
					return;
				}
				if(confirm('<s:text name="appentity.makeSureToDel"/>')){
					var isAuthor  = $.ajax({
					 	type: "POST",
					 	url: "${ctx}/jsp/app/appauthor/commonappauthormng!delete.action",
					 	data: "appCode=${appCode}&optype=${optype}&adminAcctSeq=${adminAcctSeq}&appId=${appId}&ids=" +ids,
					  	dataType: "text",
					  	async:false
					}).responseText;
					if(isAuthor == "true"){
						showModalMessage('<s:text name="appentity.optionSucc"/>',"reload();");
						setTimeout("reload();",3000);
					}else{
						showModalMessage('<s:text name="appentity.optionFail"/>'+isAuthor);
					}
				}
			}
		}
		
		function reload(){
			location.reload();
		}
		
		function loadTreeNode(treeNodeId){
			$("#"+$("#appKeyColumn").val()).attr("disabled",true);
			$("#operateType").val("UPDATE");
			var isKeySame = false;
			if($("#keyColumn").val() == $("#appKeyColumn").val()){
				isKeySame = true;				
			}
			$.ajax({
				type: "POST",
				url: "${ctx}/jsp/app/appauthor/commonappauthormng!getAuthorEntityValue.action?random="+new Date(),
				data:{
					"appCode":"${appCode}",
					"optype":"${optype}",
					"id":treeNodeId
	         	},
				dataType: "json",
				async: false,
				cache: false,
				success: function(data){
					var parentColumnName =  $("#parentName").val();
					var UapAppAuthorTableCfgs =  data.list;
				 	if(UapAppAuthorTableCfgs != null && UapAppAuthorTableCfgs!="") {
	  					$.each(UapAppAuthorTableCfgs, function(i,item){
	  						var name = item.columnName;
	  						var dataType = item.dataType;
							var value = item.value;
							if(dataType == "1"){
								$("input[type='radio'][name='" + name + "'][value='"+value+"']").attr("checked","checked");
							}else if(dataType == "2"){
								var checkedValue = item.checkedValue;
								if(value == checkedValue){
									$("input[type='checkbox'][name='" + name + "_checkbox']").attr("checked",true);
								}else{
									$("input[type='checkbox'][name='" + name + "_checkbox']").attr("checked",false);
								}
							}else if(dataType == "3"){
								$("input[type='checkbox'][name='" + name + "'][value="+value+"]").attr("checked","checked");
							}else{
								$("#"+name).val(value);
								var descValue = item.descValue;
								$("#"+name + "_DESC").val(descValue);
							}
							if(name == $("#keyColumn").val()){
								$("#selectTreeNodeSeq").val(value);
								if(isKeySame){
									$("#treeNodeId").val(value);
								}
							}else if(name == $("#appKeyColumn").val()){
								$("#treeNodeId").val(value);
								if(isKeySame){
									$("#selectTreeNodeSeq").val(value);
								}
							}else if(name == $("#nameColumn").val()){
								$("#treeNodeName").val(value);
							}
				  		})
				  	}
				}
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
					<c:if test="${empty selectName}">
						<div class="contain_title">
							<div class="contain_t_wrap">
								<div class="float_lef contain_t_text">
									<span class=""><img
											src="${ctx}/images/spreadsheet18.gif" align="absmiddle" /> </span>
									<span class="marg_lef5"><a id="appmgmt" href="#"><s:text
												name="appmgmt" /> </a> </span>
									<span class=""><img src="${ctx}/images/next.gif"
											align="absmiddle" /> </span> ${appNameTitle}
									<span class=""><img src="${ctx}/images/next.gif"
											align="absmiddle" /> </span>
									<span class="marg_lef5"><a id="rightmgmt" href="#"><s:text
												name="appentity.rightmgmt" /> </a> </span>
									<span class=""><img src="${ctx}/images/next.gif"
											align="absmiddle" /> </span> ${mngOption.name }
								</div>
							</div>
						</div>
						<c:if test="${!empty mngOption.appAuthorOptionGrantConfigBean.appAuthorOptionGrants || !empty mngOption.operateList}">
						<div class="toolbar">
							<div class="toolbar_wrap">
								<c:forEach var="appAuthorOptionOperate"
									items="${mngOption.operateList}">
									<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appAuthorOptionOperate.code }" required="true">
									<c:choose>
										<c:when test="${appAuthorOptionOperate.type=='add'}">
											<div class="window_button marg_lef10 float_lef operate"
												url="${appAuthorOptionOperate.url }"
												urltype="${appAuthorOptionOperate.urltype }"
												type="${appAuthorOptionOperate.type }">
												<input type="button" onclick="add();"
													class="window_button_centerInput window_button_centerInput1"
													value="${appAuthorOptionOperate.name }" />
											</div>
										</c:when>
										<c:when test="${appAuthorOptionOperate.type=='update' || appAuthorOptionOperate.type=='delete'}">
											
										</c:when>
										<c:otherwise>
											<div class="window_button marg_lef10 float_lef operate"
												url="${appAuthorOptionOperate.url }"
												urltype="${appAuthorOptionOperate.urltype }"
												type="${appAuthorOptionOperate.type }">
												<input type="button" 
													class="window_button_centerInput window_button_centerInput1"
													value="${appAuthorOptionOperate.name }" />
											</div>
										</c:otherwise>
									</c:choose>
									</appsec:authorize>
								</c:forEach>
								<c:if
									test="${mngOption.appAuthorOptionGrantConfigBean.type=='button'}">
									<c:forEach var="appAuthorOptionGrant"
										items="${mngOption.appAuthorOptionGrantConfigBean.appAuthorOptionGrants}">
										<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appAuthorOptionGrant.code }" required="true">
										<c:if test="${appAuthorOptionGrant.isAttr!='Y'}">
											<div class="window_button marg_lef10 float_lef buttongrant"
												url="${appAuthorOptionGrant.url }"
												urltype="${appAuthorOptionGrant.urltype }"
												optype="${appAuthorOptionGrant.optype }"
												isBatch="${appAuthorOptionGrant.isBatch }"
												name="${appAuthorOptionGrant.name }">
												<input type="button"
													class="window_button_centerInput window_button_centerInput1"
													value="${appAuthorOptionGrant.name }" />
											</div>
										</c:if>
										</appsec:authorize>
									</c:forEach>
								</c:if>
								<c:if
									test="${mngOption.appAuthorOptionGrantConfigBean.type=='tab'}">
									<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${mngOption.appAuthorOptionGrantConfigBean.code }" required="true">
									<div class="window_button marg_lef10 float_lef tabgrant"
										url="${mngOption.appAuthorOptionGrantConfigBean.url }"
										urltype="${mngOption.appAuthorOptionGrantConfigBean.urltype }"
										isBatch="${mngOption.appAuthorOptionGrantConfigBean.isBatch }"
										name="${mngOption.appAuthorOptionGrantConfigBean.name }">
										<input type="button" id="usergrant"
											class="window_button_centerInput window_button_centerInput1"
											value="${mngOption.appAuthorOptionGrantConfigBean.name }" />
									</div>
									</appsec:authorize>
								</c:if>
							</div>
						</div>
						</c:if>
					</c:if>
					<div>
						<table width="100%" height="370" id="heightTable" border="1">
							<tr height="100%">
								<td width="25%" height="98%" valign="top">
									<div id="treediv" style="width:100%;height:100%; overflow: auto"></div>
								</td>
								<c:if test="${empty selectName}">
									<td valign="top" height="98%">
										<div class="contain_search" style="width:100%;height:100%;overflow: auto">
											<input type="hidden" id="parentName"
												value="${uapAppAuthorCfg.parentColumn }" />
											<input type="hidden" id="keyColumn"
												value="${uapAppAuthorCfg.keyColumn }" />
											<input type="hidden" id="appKeyColumn"
												value="${uapAppAuthorCfg.appKeyColumn }" />
											<input type="hidden" id="nameColumn"
												value="${uapAppAuthorCfg.nameColumn }" />
											<input type="hidden" id="selectTreeNodeSeq" value="" />
											<input type="hidden" id="treeNodeId" value="" />
											<input type="hidden" id="treeNodeName" value="" />
											<form
												action="${ctx}/jsp/app/appauthor/commonappauthormng!save.action"
												method="post" id="inputForm">
												<table width="95%" cellpadding="0" cellspacing="0"
													border="0">
													<input type="hidden" id="operateType" name="operateType" value=""/>
													<input type="hidden" id="checkboxlist" />
													<input type="hidden" id="multicheckboxlist" />
													<input type="hidden" id="radiolist" />
													<input type="hidden" id="notNullList" />
													<input type="hidden" id="appId" name="appId"
														value="${appId}" />
													<input type="hidden" id="appCode" name="appCode"
														value="${appCode}" />
													<input type="hidden" id="optype" name="optype"
														value="${optype}" />
													<input type="hidden" id="adminAcctSeq" name="adminAcctSeq"
														value="${adminAcctSeq}" />
													<c:forEach var="appAuthorTableConfig" items="${columnList}"
														varStatus="status">
														<c:if
															test="${appAuthorTableConfig.columnName==parentName}">
															<tr>
																<td width="10%" align="right">
																	${appAuthorTableConfig.columnDesc}:
																</td>
																<td>
																	<input id="${appAuthorTableConfig.columnName }_DESC"
																		name="${appAuthorTableConfig.columnName }_DESC"
																		value="${ appAuthorTableConfig.descValue }" disabled />
																</td>
															</tr>
														</c:if>
														<c:choose>
															<c:when
																test="${appAuthorTableConfig.columnName!=parentName && appAuthorTableConfig.isModify =='Y'}">
																<tr>
																	<td width="15%" align="right">
																		<c:if test="${appAuthorTableConfig.dataType !='2'}">
																			${appAuthorTableConfig.columnDesc}:
																			<strong> <font color="red">${appAuthorTableConfig.isNull
																					== 'N' ? '*' : '' }</font> </strong>
																		</c:if>
																	</td>
																	<td>
																		<c:if test="${appAuthorTableConfig.dataType =='1'}">
																			<input type="hidden"
																				id="${appAuthorTableConfig.columnName }" />
																			<c:forEach var="data"
																				items="${appAuthorTableConfig.datalist}">
																				<input type="radio"
																					name="${appAuthorTableConfig.columnName }"
																					value="${data.dataCode }" /> ${data.dataDesc }
																			</c:forEach>
																			<script>
																				addRadio("${appAuthorTableConfig.columnName }");
																				$('input[type=radio][name="${appAuthorTableConfig.columnName }"][value=${appAuthorTableConfig.value}]').attr("checked","checked");
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
																			<input type="text"
																				id="${appAuthorTableConfig.columnName }"
																				name="${appAuthorTableConfig.columnName }"
																				value="${appAuthorTableConfig.value }" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})"/>
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
																	id="${appAuthorTableConfig.columnName }"
																	name="${appAuthorTableConfig.columnName }"
																	value="${ appAuthorTableConfig.value }" />
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<tr>
														<td colspan="2">
															<c:forEach var="appAuthorOptionOperate"
																items="${mngOption.operateList}">
																<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appAuthorOptionOperate.code }" required="true">
																<c:choose>
																	<c:when test="${appAuthorOptionOperate.type=='add'}">
																		<div class="window_button marg_lef10 float_lef">
																			<input type="button" id="save"
																				class="window_button_centerInput window_button_centerInput1"
																				value='<s:text name="appentity.save"/>' />
																		</div>
																		<div class="window_button marg_lef10 float_lef">
																			<input type="button" onclick="cancle();"
																				class="window_button_centerInput window_button_centerInput1"
																				value='<s:text name="appentity.cancel"/>' />
																		</div>
																	</c:when>
																	<c:when test="${appAuthorOptionOperate.type=='delete'}">
																		<div class="window_button marg_lef10 float_lef operate"
																			url="${appAuthorOptionOperate.url }"
																			urltype="${appAuthorOptionOperate.urltype }"
																			type="${appAuthorOptionOperate.type }">
																			<input type="button" onclick="deleteNode()"
																				class="window_button_centerInput window_button_centerInput1"
																				value="${appAuthorOptionOperate.name }" />
																		</div>
																	</c:when>
																	<c:otherwise>
																	
																	</c:otherwise>
																</c:choose>
																</appsec:authorize>
															</c:forEach>
														</td>
													</tr>
												</table>
											</form>
										</div>
									</td>
								</c:if>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
