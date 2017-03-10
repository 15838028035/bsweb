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
				var isMulti = true;
				var isFunction = false;
				var selectName = "${selectName}";
				if(selectName == null || selectName == ''){
					
				}else{
					if(selectName.indexOf("javascript:") != -1){
						isMulti = true;
						isFunction = true;
					}else{
						isMulti = false;
						$("#confirmselectDiv").hide();
					}
				}
				var selectPara = isMulti?'selarrrow':'selrow';
				
				contralEffect.contain();
				contralEffect.blueButton();
				$("#appmgmt").click(function(){
					parent.LT_menu.location="/uap/jsp/app/appdirectory/directory.jsp?action=navi";
					parent.LT_main.location="/uap/jsp/app/entity/appentity.jsp";
				});
				$("#rightmgmt").click(function(){
					parent.LT_main.location="${ctx}/jsp/app/appauthor/commonappauthormng!permlist.action?appCode=${appCode}&adminAcctSeq=${adminAcctSeq}&appId=${appId}&adminUserId=${adminUserId}&loginOrgId=${loginOrgId}&realAppId=${realAppId}";
				});
				function add(){
				       var s = jQuery("#list").jqGrid('getGridParam',selectPara); 
						jQuery.FrameDialog.create({
							url: "${ctx}/jsp/app/appauthor/commonappauthormng!input.action?appCode=${appCode}&optype=${optype}&adminAcctSeq=${adminAcctSeq}&appId=${appId}&loginOrgId=${loginOrgId}&realAppId=${realAppId}",
							title: "${mngOption.name }",
							width: document.documentElement.clientWidth * 0.8,
							height:document.documentElement.clientHeight* 0.95,
							//show: 'slide',
							hide: 'slide',
							buttons:{}							
						}).bind('dialogclose', function(event, ui) {
							
					    });
				}
				
				function update (){
					var ids = jQuery("#list").jqGrid('getGridParam',selectPara); 
					if( ids == ''|| ids == null ){
						showModalMessage('<s:text name="appentity.selectOneData"/>');
					}else if(ids.toString().indexOf(",")!=-1 ){
						showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
					}else{
						jQuery.FrameDialog.create({
							url: "${ctx}/jsp/app/appauthor/commonappauthormng!input.action?appCode=${appCode}&optype=${optype}&adminAcctSeq=${adminAcctSeq}&appId=${appId}&loginOrgId=${loginOrgId}&realAppId=${realAppId}&id="+ids,
							title: "${mngOption.name }",
							width: document.documentElement.clientWidth * 0.8,
							height:document.documentElement.clientHeight* 0.95,
							//show: 'slide',
							hide: 'slide',
							buttons:{}							
						}).bind('dialogclose', function(event, ui) {
							
					    });
					}
				}
				
				function deleteByIds(){
					var ids = jQuery("#list").jqGrid('getGridParam',selectPara); 
					if( ids == ''|| ids == null){
						showModalMessage('<s:text name="appentity.selectOneData"/>');
					}else{
						if(confirm('<s:text name="appentity.makeSureToDel"/>')){
							var isAuthor  = $.ajax({
							 	type: "POST",
							 	url: "${ctx}/jsp/app/appauthor/commonappauthormng!delete.action",
							 	data: "appCode=${appCode}&optype=${optype}&adminAcctSeq=${adminAcctSeq}&appId=${appId}&ids=" +ids,
							  	dataType: "text",
							  	async:false
							}).responseText;
							if(isAuthor == "true"){
								showModalMessage('<s:text name="appentity.optionSucc"/>');
								reload();
							}else{
								showModalMessage('<s:text name="appentity.optionFail"/>'+isAuthor);
							}
						}
					}
				}
				
				onSelectRowaction_acctview = function(id){
					if(selectName == null || selectName == ''){
					
					}else{
						var s = jQuery("#list").jqGrid('getGridParam',selectPara);
						var ret = jQuery("#list").jqGrid('getRowData',s.toString());
						if(isFunction){
							//调用父页面function，无法传递ret对象
							//var obj = eval('('+ ret +')');
							//var functionName = "parent."+selectName.substring(11,selectName.length)+"('"+ret["${idColumnName}"]+"','"+ret["${nameColumnName}"]+"'," + obj  + ")";
							//eval(functionName);
						}else{
							$(parent.document).find("#"+selectName+"_DESC").val(ret["${nameColumnName}"]);
							$(parent.document).find("#"+selectName).val(ret["${idColumnName}"]);
							$.FrameDialog.closeDialog();
						}
					}
				}
				
				jQuery("#list").jqGrid({
					url:"",
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
					rowList:[<c:if test="${empty selectName}">10,20,50,100</c:if><c:if test="${!empty selectName}">10</c:if>],
					viewrecords: true,
					width: windowWidth * 0.6,
					height: '100%',
					hidegrid: false,
					loadtext: '<s:text name="common.tips.loading" />',
					scrollrows: true,
					multiselect:isMulti,
					altRows:true,
					altclass:'altclass',
					onSelectRow: onSelectRowaction_acctview
				}); 
				
				$(".operate").click(function(){
					var url = $(this).attr("url");
					var urltype = $(this).attr("urltype");
					var type = $(this).attr("type");
					//if(localdefinde !== undefinde)
					//本地方法
					//else 公共
					if(type == 'add'){
						add();
					}else if (type == 'update'){
						update();
					}else if (type == 'delete'){
						deleteByIds();
					}else{
						
					}
				})
				
				$(".buttongrant").click(function(){
					var name = $(this).attr("name");//alert(name);
					var url = $(this).attr("url");//alert(url);
					var urltype = $(this).attr("urltype");//alert(urltype);
					var optype = $(this).attr("optype");//alert(optype);
					var isReverst = $(this).attr("isRev");//alert(isReverst);
					var isBatch = $(this).attr("isBatch");//alert(isBatch);
					var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
					if(urltype && urltype=="1"){
						if(!url || url == '' || url == null){
							showModalMessage(name+'<s:text name="appentity.urlConfigErr"/>');
							return;
						}
						if(isBatch == "N" && ids.toString().indexOf(",")!=-1 ){
							showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
							return;
						}
						url = getSsoUrl("${ctx}","${adminAcct.appId}","${adminAcctSeq}",url,ids.toString());
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
						}
						if(isBatch == "N" && ids.toString().indexOf(",")!=-1 ){
							showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
							return;
						}
						if(!url || url == '' || url == null){
							url = "/jsp/app/appauthor/rel/commonappauthorrel!input.action";
						}
						url = getLocalRelUrl("${appId}","${appCode}","${loginOrgId}","${realAppId}","${adminAcctSeq}","${optype}","${ctx}"+url,ids,optype,isReverst);
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
					var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
					if(urltype && urltype=="1"){
						if(!url || url == '' || url == null){
							showModalMessage(name+'<s:text name="appentity.unSettingUrl"/>');
							return;
						}
						if(isBatch == "N" && ids.toString().indexOf(",")!=-1 ){
							showModalMessage('<s:text name="appentity.onlySelectOneData"/>');
							return;
						}
						url = getSsoUrl("${ctx}","${adminAcct.appId}","${adminAcctSeq}",url,ids.toString());
					}else{
						if( ids == ''|| ids == null ){
							showModalMessage('<s:text name="appentity.selectOneData"/>');
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
						url = getLocalRelUrl("${appId}","${appCode}","${loginOrgId}","${realAppId}","${adminAcctSeq}","${optype}","${ctx}"+url,ids.toString());
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
				
				$("#query").click(function(){
					initRadio();
					initCheckBox();
					initMultiCheckBox();
					reload();
				});
				
				$("#confirmselect").click(function(){
					var parentgrid = $(parent.document).find("#"+selectName.substring(11,selectName.length));
					var ids = jQuery("#list").jqGrid('getGridParam','selarrrow').toString();
					var selectidlist = ids.split(",");
					for (var i = 0; i < selectidlist.length; i++) {
						var selectid = selectidlist[i];
						if (selectid != "") {
							var ret = jQuery("#list").jqGrid('getRowData',selectid);
							var p_id = parentgrid.jqGrid('getRowData',ret["${idColumnName}"])['${idColumnName}'];
							if(typeof(p_id) == 'undefined'){
								parentgrid.jqGrid('addRowData', ret["${idColumnName}"] ,ret);
							}else{
								//parentgrid.jqGrid().setSelection(p_id);
							}
						}
					}
					$.FrameDialog.closeDialog();
				});
			})
			function reload(){
				jQuery("#list").jqGrid('setGridParam',{
				     url:"${ctx}/jsp/app/appauthor/commonappauthorlistmng!list.action?appCode=${appCode}&optype=${optype}&adminAcctSeq=${adminAcctSeq}&appId=${appId}",
				     postData:{
				     	${search}
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

		<c:if test="${optionListJsName!=null && optionListJsName!=''}">
			<jsp:include page="/${optionListJsName}" flush="true"></jsp:include>
		</c:if>
		
		<script>
			$(function (){
				reload();
			})
		</script>
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
					</c:if>
					<div class="contain_search">
						<div class="contain_s_wrap">
							<input type="hidden" id="checkboxlist" />
							<input type="hidden" id="multicheckboxlist" />
							<input type="hidden" id="radiolist" />
							<input type="hidden" id="appId" name="appId" value="${appId}" />
							<input type="hidden" id="appCode" name="appCode"
								value="${appCode}" />
							<input type="hidden" id="optype" name="optype" value="${optype}" />
							<input type="hidden" id="adminAcctSeq" name="adminAcctSeq"
								value="${adminAcctSeq}" />
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="100%">
										<div style="clear: both">
											<c:forEach var="appAuthorTableConfig" items="${searchList}"
												varStatus="status">
												<div style="float: left;">
													${appAuthorTableConfig.columnDesc}:
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
														test="${appAuthorTableConfig.dataType =='4'|| appAuthorTableConfig.dataType =='7'}">
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
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
							</table>
						</div>
					</div>
					<c:if test="${empty selectName}">
					<div class="toolbar">
						<div class="toolbar_wrap">
							<c:forEach var="appAuthorOptionOperate"
								items="${mngOption.operateList}">
								<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appAuthorOptionOperate.code }" required="true">
								<div class="window_button marg_lef10 float_lef operate"
									url="${appAuthorOptionOperate.url }"
									urltype="${appAuthorOptionOperate.urltype }"
									type="${appAuthorOptionOperate.type }">
									<input type="button"
										class="window_button_centerInput window_button_centerInput1"
										value="${appAuthorOptionOperate.name }" />
								</div>
								</appsec:authorize>
							</c:forEach>
							<c:if
								test="${mngOption.appAuthorOptionGrantConfigBean.type=='button'}">
								<c:forEach var="appAuthorOptionGrant"
									items="${mngOption.appAuthorOptionGrantConfigBean.appAuthorOptionGrants}">
									<c:if test="${appAuthorOptionGrant.isAttr!='Y'}">
										<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appAuthorOptionGrant.code }" required="true">
										<div class="window_button marg_lef10 float_lef buttongrant"
											url="${appAuthorOptionGrant.url }"
											urltype="${appAuthorOptionGrant.urltype }"
											optype="${appAuthorOptionGrant.optype }"
											name="${appAuthorOptionGrant.name }"
											isBatch="${appAuthorOptionGrant.isBatch }"
											isRev="${appAuthorOptionGrant.isReverst }">
											<input type="button"
												class="window_button_centerInput window_button_centerInput1"
												value="${appAuthorOptionGrant.name }" />
										</div>
										</appsec:authorize>
									</c:if>
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
					<c:if test="${!empty selectName }">
						<div class="toolbar" id="confirmselectDiv">
							<div class="toolbar_wrap">
								<div class="window_button marg_lef10 float_lef">
									<input type="button" id="confirmselect" class="window_button_centerInput window_button_centerInput1" value="保存" />
								</div>
							</div>
						</div>
					</c:if>
					<table id="list"></table>
					<div id="pager"></div>
				</div>
			</div>
		</div>
	</body>
</html>
