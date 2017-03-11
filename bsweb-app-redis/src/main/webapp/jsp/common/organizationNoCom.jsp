﻿﻿﻿﻿﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<s:set	name="mainAcctId"	value="#parameters.mainAcctId[0]"/>
<s:set name="orgName" value="#parameters.orgName[0]" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<script type="text/javascript">
		$(function(){
			contralEffect.blueButton();
			var orgName = encodeURI("${orgName}");
			//生成树
	        root = jQuery.ajax({
	          url:"${ctx}/jsp/syscfg/organization.action?orgName="+orgName ,
	          async:false,
	          cache:false,
	          dataType:"text"
	        }).responseText;
			
			var dataObj=eval("("+root+")");
			
			tree = new TreePanel({
				renderTo:'treediv',
				'root' : dataObj,
				'iconPath' : "${ctx}/scripts/tree/img/",
				'switchType' : 'ajax',
				'ajaxAction' : "${ctx}/jsp/syscfg/organization.action?orgName="+orgName
			});
			tree.render();
			if(orgName!=""){
				tree.expandAll();
			}
			//选择事件
			tree.on(function(node){
				var treeNodeId = node.attributes.id;
				var treeNodeName = node.attributes.text;
				$(parent.document).find("#belongToOrgId").val(treeNodeId);
				$(parent.document).find("#belongToOrgName").val(treeNodeName);
				// parent.LT_main.queryByOrg();
				$.FrameDialog.closeDialog();
			});
			$("#queryOrgByName").click(function(){
				var orgName = $("#orgName").val();
				orgName = orgName.replace(/^\s+|\s+$/g,"");
				var strpattern = /^[^*.#&\/?%\'\"]+$/;
				if(orgName==""){
				
				}else{
					if(!strpattern.test(orgName)){
						alert("<s:text name='common.query.notAllowIncludeSpecial' />");
						return ;	
					}
				}
				window.location.href="${ctx}/jsp/common/organizationNoCom.jsp?orgName="+encodeURI(orgName);
			});
			$(document).keydown(function(){
		        if(event.keyCode==13){
		       		$("#queryOrgByName").click();
		        }
		    });
		});
	
	</script>
	</head>
	<body>
			<div class="contain_s_wrap">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td	width="50%"	align="left">
							<input id="orgName"	type="text"	value="${orgName }"	style="width: 100px" maxlength="30"	title="<s:text name='common.org.query.tips' />"/>
						</td>
						<td	width="50%"	align="left">
							<div class="">
								<input type="button" class="window_button_centerInput window_button_centerInput1" value="<s:text name="common.options.query" />" id="queryOrgByName"/>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="treediv"></div>
	</body>
</html>
