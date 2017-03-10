<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>

		<script type="text/javascript">
		$(function(){
			contralEffect.blueButton();
			 var appId=parent.document.getElementById("appId").value;
			//获取权限菜单树
			var jsonData = $.ajax({
				          url:"${ctx}/jsp/permission/upmPermissionAction!getPermissionTree.action?appId="+appId,
				          async:false,
				          cache:false,
				          dataType:"text"
			}).responseText;
			
			var dataObj=eval("("+jsonData+")");
				try{
				tree = new TreePanel({
					renderTo:'treediv',
					'root' :dataObj,
					'iconPath' : "${ctx}/scripts/tree/img/",
					'switchType' : 'client',
					'ajaxAction' : "${ctx}/jsp/permission/upmPermissionAction!getPermissionTree.action"
				});
				tree.render();
			}catch(e){
				tree = null;
				showModalMessage('对不起，你没有权限');
			}
				//树点击事件
				tree.on(function(node){
				var treeNodeId = node.attributes.id;
				//var treeNodeName = node.attributes.text;
				//location.href="${ctx}/jsp/syscfg/permission/permission!getPermissionList.action?domainId"+domainId+"&parentId="+treeNodeId;
				$(parent.LT_main.window.document).find("#perssionParentId").val(treeNodeId);
				parent.LT_main.location = "${ctx}/jsp/permission/permissionData.jsp?appId="+appId+"&parentId="+treeNodeId;
				//parent.LT_main.queryByPermission();
				});
		});
	</script>
	</head>
	<body>
		<div id="treediv"></div>
	</body>

</html>
