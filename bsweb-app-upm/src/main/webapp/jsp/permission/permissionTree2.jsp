<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>

<!--css样式-->
<link href="${ctx}/scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/scripts/bootstrap-table/bootstrap-table.css" rel="stylesheet">
<!--js-->

<script src="${ctx}/scripts/jquery/jquery-3.2.0.min.js"></script>
<script src="${ctx}/scripts/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/scripts/bootstrap-table/bootstrap-table.js"></script>
<script src="${ctx}/scripts/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/scripts/bootstrap-table/extensions/multiple-sort/bootstrap-table-multiple-sort.js"></script>

<script src="${ctx}/scripts/bootstrap-treeview/bootstrap-treeview.min.css"></script>
<script src="${ctx}/scripts/bootstrap-treeview/bootstrap-treeview.min.js"></script>

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
