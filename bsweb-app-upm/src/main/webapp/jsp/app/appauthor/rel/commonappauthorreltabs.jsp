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
				var height = window.parent.document.documentElement.clientHeight * 0.9;
				var mainGrantObj = $("#mainGrantObj").css("height");
				var mainGrantObjHeight = Number(mainGrantObj.substr(0,mainGrantObj.length-2)) + 40;
				var tableHeight = height - mainGrantObjHeight - 50;
				$("#tabs").css({"height":tableHeight});
				$("#tabs").tabs();
				showFirstIframe();
			})
			
			function showFirstIframe(){
				var iframes = document.getElementsByTagName("iframe");
				for (var i = 0; i < iframes.length; i++) {
					var id = iframes[i].id ;
					changeTab(id.substr("iframe-".length-1));
					return;
				}
			}
			
			function changeTab(count){
				var obj = $("#frame-"+count);
				var name = obj.attr("name");//alert(name);
				var url = obj.attr("url");//alert(url);
				var urltype = obj.attr("urltype");//alert(urltype);
				var optype = obj.attr("optype");//alert(optype);
				var isReverst = obj.attr("isRev");//alert(isReverst);
				if(urltype && urltype=="1"){
					if(!url || url == '' || url == null){
						showModalMessage(name+'<s:text name="appentity.urlConfigErr"/>');
						return;
					}
					url = getSsoUrl("${ctx}","${adminAcct.appId}","${adminAcctSeq}",url,"${grantAppKey}");
				}else{
					if(obj.attr("src")!=''){
						return;
					}
					if(!url || url == '' || url == null){
						url = "/jsp/app/appauthor/rel/commonappauthorrel!input.action";
					}
					url = getLocalRelUrl("${appId}","${appCode}","${loginOrgId}","${realAppId}","${adminAcctSeq}","${mainAuthorType}","${ctx}"+url,"${grantId}",optype,isReverst);
				}
				url += "&isTab=1";
				obj.attr("src",url);
		    }
		</script>
	</head>
	<body>
		<div class="padd10">
			<div class="contain">
				<div class="contain_wrap">
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
												<s:text name="appentity.belongOrg"/>
											</td>
											<td width="45%" align="left">
												${uapAppAcct.orgName }
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="appAuthorTableConfig" items="${grantObj}"
											varStatus="status">
											<input type="hidden"
													id="mainGrantObj_${appAuthorTableConfig.columnName }"
													name="mainGrantObj_${appAuthorTableConfig.columnName }"
													value="${appAuthorTableConfig.value }" />
											<c:choose>
												<c:when test="${appAuthorTableConfig.isModify =='Y'}">
													<tr>
														<td>
															${appAuthorTableConfig.columnDesc } :
															<c:choose>
																<c:when test="${appAuthorTableConfig.dataType =='4' || appAuthorTableConfig.dataType =='6' || appAuthorTableConfig.dataType =='7'}">
																	${appAuthorTableConfig.value }
																</c:when>
																<c:when test="${appAuthorTableConfig.dataType =='8'}">
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
														</td>
													</tr>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
							</c:if>
							</div>
						</div>
					</div>
					<div class="contain_search">
						<div class="contain_s_wrap">
							<c:choose>
								<c:when test="${mainAuthorType == 'USER'}">
									<div id="tabs" style="margin: 2px;">
										<ul>
											<c:forEach var="appUserGrant"
												items="${appAuthorConfigBean.appUserGrantConfigBean.appUserGrants}"
												varStatus="status">
												<c:if test="${appUserGrant.isAttr!='Y' && (isBatch != 'true' || appUserGrant.isBatch == 'Y')}">
													<li>
														<a href="#tabs-${status.count}"
															onclick="changeTab(${status.count});">${appUserGrant.name
															} </a>
													</li>
												</c:if>
											</c:forEach>
										</ul>
										<c:forEach var="appUserGrant"
											items="${appAuthorConfigBean.appUserGrantConfigBean.appUserGrants}"
											varStatus="status">
											<c:if test="${appUserGrant.isAttr!='Y' && (isBatch != 'true' || appUserGrant.isBatch == 'Y')}">
												<div id="tabs-${status.count}">
													<iframe id="frame-${status.count}"
														url="${appUserGrant.url}"
														urltype="${appUserGrant.urltype}"
														name="${appUserGrant.name}"
														optype="${appUserGrant.optype}"
														isRev="${appUserGrant.isReverst}" name="frame"
														width="100%" height="90%" frameBorder=0 scrolling='auto'
														src="">
													</iframe>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</c:when>
								<c:otherwise>
									<div id="tabs" style="margin: 2px;">
										<ul>
											<c:forEach var="appAuthorOptionGrant"
												items="${mngOption.appAuthorOptionGrantConfigBean.appAuthorOptionGrants}"
												varStatus="status">
												<c:if test="${appAuthorOptionGrant.isAttr!='Y' && (isBatch != 'true' || appAuthorOptionGrant.isBatch == 'Y')}">
													<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appAuthorOptionGrant.code }" required="true">
													<li>
														<a href="#tabs-${status.count}"
															onclick="changeTab(${status.count});">${appAuthorOptionGrant.name
															} </a>
													</li>
													</appsec:authorize>
												</c:if>
											</c:forEach>
										</ul>
										<c:forEach var="appAuthorOptionGrant"
											items="${mngOption.appAuthorOptionGrantConfigBean.appAuthorOptionGrants}"
											varStatus="status">
											<c:if test="${appAuthorOptionGrant.isAttr!='Y' && (isBatch != 'true' || appAuthorOptionGrant.isBatch == 'Y')}">
												<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appAuthorOptionGrant.code }" required="true">
												<div id="tabs-${status.count}">
													<iframe id="frame-${status.count}"
														url="${appAuthorOptionGrant.url}"
														urltype="${appAuthorOptionGrant.urltype}"
														name="${appAuthorOptionGrant.name}"
														optype="${appAuthorOptionGrant.optype}"
														isRev="${appAuthorOptionGrant.isReverst}" name="frame"
														width="100%" height="425px" frameBorder=0 scrolling='auto'
														src="">
													</iframe>
												</div>
												</appsec:authorize>
											</c:if>
										</c:forEach>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
