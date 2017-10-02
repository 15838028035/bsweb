<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>权限树</title>
    <meta name="viewport" content="width=device-width" />
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
	<%@ include file="/jsp/common/resource/styles_all.jsp"%>
	
	</head>
	<body>
		<div id="treediv"></div>
		
		<script   type="text/javascript">
		$(function(){
			 var appId=parent.document.getElementById("appId").value;
			//获取权限菜单树
			var jsonData = $.ajax({
				          url:"${ctx}/jsp/permission/upmPermissionAction!getPermissionTree.action?appId="+appId,
				          async:false,
				          cache:false,
				          dataType:"text"
			}).responseText;
			
			jsonData = "[" + jsonData + "]";
			
			var dataObj=eval("("+jsonData+")");
	        
			 $('#treediv').treeview({
		            data:dataObj,
		            levels: 5,
		            showIcon: true,  
		            multiSelect: false,
		            highlightSelected: true, //是否高亮选中
		            highlightSearchResults:true,
		            showCheckbox:false,
		            showIcon:true,
		            onNodeSelected: function(event, data) {
		            	 var treeNodeId = data.nodeId;
                         $(window.parent.frames["LT_main"].document).find("#perssionParentId").val(treeNodeId);
                         
                         var aa = $(window.parent.frames["LT_main"].document).find("#perssionParentId").val();
                         aa =  $(self.parent.LT_main.window.document).find("#perssionParentId").val();
                         alert("aa=" + aa);
                         
                         parent.LT_main.location = "${ctx}/jsp/permission/permissionData.jsp?appId="+appId+"&parentId="+treeNodeId;
		            }
		        }
			 );
			 
		});
	</script>
	</body>

</html>
