<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import=" com.lj.app.core.common.properties.PropertiesUtil;"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<s:set name="adminUserId" value="#parameters.adminUserId[0]"></s:set>
<s:set name="loginOrgId" value="#parameters.loginOrgId[0]"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<script type="text/javascript" src="${ctx}/jsp/app/appauthor/scripts/common-app-author.js"></script>
		
		<script type="text/javascript">
			function gotoAppAcctMgmt(){
				URL= "${ctx}/jsp/app/appacct/commonappacct!appacctmgmt.action?adminAcctSeq=${adminAcctSeq}&appId=${appId}&adminUserId=${adminUserId}&loginOrgId=${loginOrgId}&realAppId=${realAppId}";
				parent.parent.LT_main.location =URL;
				parent.parent.LT_menu.location ="${ctx}/jsp/app/appacct/apporg.jsp?action=navi&adminAcctSeq=${adminAcctSeq}&appId=${appId}&adminUserId=${adminUserId}&loginOrgId=${loginOrgId}&realAppId=${realAppId}";
			}
			function checkPwd(fname){
				jQuery.FrameDialog.create({
					url: "${ctx}/jsp/mainacct/mainacct!checkPwdUrl.action",
					title: "<s:text name='appentity.pwdcheck'/>",
					width: 500,
					height: 300,
					hide: 'slide',
					buttons:{}							
				}).bind('dialogclose', function(event, ui) {
					eval(fname);
		    	});
			}
			
			function syncAuthor(types){
				if($("#pwdPass").val()=="pass"){
					syncAuthorPass(types);
				}
			 	$("#pwdPass").val("");
			}
			
			function syncAuthorPass(types){
				jQuery.FrameDialog.create({
					url: "${ctx}/jsp/app/appauthor/appauthor_sync.jsp?appCode=${appCode}&appId=${appId}&adminAcctSeq=${adminAcctSeq}&syncTypes="+types,
					title: '<s:text name="appentity.synchandler"/>',
					width: 600,
					height: 300,
					//show: 'slide',
					hide: 'slide',
					buttons:{}	
				});	
				
			}
			$(function (){
				contralEffect.contain();
				contralEffect.blueButton();
				$("#appmgmt").click(function(){
					parent.LT_menu.location="/uap/jsp/app/appdirectory/directory.jsp?action=navi";
					parent.LT_main.location="/uap/jsp/app/entity/appentity.jsp";
				});
				
				$("#syncButton").click(function(){
					var types = "";
					$("input[type='checkbox'][name='syncAuthor'][checked]").each(function () {
						if (types == "") {
							types = $(this).val();
						} else {
							types = (types + "," + $(this).val());
						}
					});
					if(types == "null" || types == ""){
					 	showModalMessage('<s:text name="appentity.selectEntityOneLeast"/>');
					 	return false;
					}
					
					if($("#provCodeEn").val()!="SHANG_HAI"){
						var msg  ="<s:text name='appentity.syncPermission.alert' />";
						showModalConfirmation(msg,"checkPwd('syncAuthor(\""+types+"\")');");
					}else {
						var msg  ="<s:text name='appentity.init.alert1' />";
						showModalConfirmation(msg,"syncAuthorPass('"+types+"');");
					}
				});
				
				$(".buttongrant").click(function(){
					var name = $(this).attr("name");//alert(name);
					var url = $(this).attr("url");//alert(url);
					var urltype = $(this).attr("urltype");//alert(urltype);
					var optype = $(this).attr("optype");//alert(optype);
					if(urltype && urltype=="1"){
						if(!url || url == '' || url == null){
							showModalMessage(name+'<s:text name="appentity.urlConfigErr"/>');
							return;
						}
						url = getSsoUrl("${ctx}","${appId}","${adminAcctSeq}",url);
						window.parent.jQuery.FrameDialog.create({
							url: url,
							title: name,
							width: 1000,
							height: 620,
							//show: 'slide',
							hide: 'slide',
							buttons:{}							
						}).bind('dialogclose', function(event, ui) {
							
					    });
					}else{
						if(!url || url == '' || url == null){
							url = "/jsp/app/appauthor/commonappauthormng!manager.action";
						}
						url = getLocalUrl("${appId}","${appCode}","${loginOrgId}","${realAppId}","${adminAcctSeq}","${ctx}"+url,optype);
						window.location.href=url;
					}
				});
			})
		</script>
	</head>

	<body>
<!-- 		<div class="padd10"> -->
			<div class="contain">
				<div class="contain_wrap">
					<div class="contain_title">
						<div class="contain_t_wrap">
							<div class="float_lef contain_t_text">
								<span class="">it<img src="${ctx}/images/spreadsheet18.gif"
										align="absmiddle" /> </span>
								<span class="marg_lef5"><a id="appmgmt" href="#">应用管理
											</span>
								<span class=""><img src="${ctx}/images/next.gif"
										align="absmiddle" /> </span> ${c}
								<span class=""><img src="${ctx}/images/next.gif"
										align="absmiddle" /> </span>
								<span class="marg_leshf5">实体管理 </span>
								<sec:authorize code="uap_appacctmgmt" required="false">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="marg_lef5"><a href="javascript:gotoAppAcctMgmt();">
										<font color="blue"><strong><u><s:text name="appentity.subAcctManagement"/></u><strong></font></a></span>
								</sec:authorize>
							</div>
							<div class="float_rig contain_t_check">
								<div class="contain_icon"></div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<input id="pwdPass" name="pwdPass" type="hidden" value="" />
					<input id="provCodeEn" name="provCodeEn" type="hidden"
						value="<%=PropertiesUtil.getValue("provCodeEn")%>" />
					<c:if test="${appCode=='UPM'}">
						<div class="toolbar">
							<div class="toolbar_wrap">
								<c:forEach var="appOption"
									items="${appAuthorConfigBean.options}">
									<div class="window_button marg_lef10 float_lef buttongrant"
										name="${appOption.name}" url="${appOption.url}"
										urltype="${appOption.urltype}" optype="${appOption.type}">
										<input type="button"
											class="window_button_centerInput window_button_centerInput1"
											value="${appOption.name}" />
									</div>
								</c:forEach>
							</div>
						</div>
					</c:if>
					
					<H3>UPM其他应用</H3>
					<c:if test="${appCode=='UPM'}">
						<sec:authorize code="uap_appentity_syncpermission" required="false">
							<div class="toolbar">
								<div class="toolbar_wrap">
									<div class="window_button marg_lef10 float_lef">
										<input type="button" id="syncButton"
											class="window_button_centerInput window_button_centerInput1"
											value='<s:text name="appentity.syndData"/>' />
									</div>
								</div>
							</div>
						</sec:authorize>
						<table class="addMacMode">
							<c:forEach var="appOption" items="${appAuthorConfigBean.options}">
								<appsec:authorize appCode="${appCode}" adminAcctSeq="${adminAcctSeq}" code="${appOption.code}" required="false">
								<tr>
									<td align="right" width="10%">
										<input type="checkbox" name="syncAuthor"
											value="${appOption.type}" />
									</td>
									<td align="left">
										<div class="window_button marg_lef10 float_lef buttongrant"
											name="${appOption.name}" url="${appOption.url }"
											urltype="${appOption.urltype}" optype="${appOption.type}">
											<input type="button"
												class="window_button_centerInput window_button_centerInput1"
												value="${appOption.name}" />
										</div>
									</td>
								</tr>
								</appsec:authorize>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
<!-- 		</div> -->
	</body>
</html>
