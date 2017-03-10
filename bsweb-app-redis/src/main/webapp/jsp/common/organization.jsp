﻿﻿﻿﻿﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<s:set	name="mainAcctId"	value="#parameters.mainAcctId[0]"/>

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
				$(parent.LT_main.window.document).find("#belongOrg").val(treeNodeId);
				$(parent.LT_main.window.document).find("#orgId").val(treeNodeId);
				if($(parent.LT_main.window.document).find("#isSelectOrgObj").prop("checked") == true){
						$(parent.LT_main.window.document).find("#orgIdObj").val(treeNodeId);
				}
				parent.LT_main.queryByOrg();
			});
		})
	
	</script>
	</head>
	<body>
			<div id="treediv"></div>
	</body>
</html>
