<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
  </head>
  <script>
  </script>
  <body>
  <input type="hidden" name="appId" id="appId" value="${param.appId}">
	 <table width="100%"  hight="100%" cellpadding="0" cellspacing="0" border="0">
	    <tr>
	    	 	<td width="20%" valign="top">
			    	<iframe id="LT_menu" src="${ctx}/jsp/permission/permissionTree.jsp" scrolling="auto" width="100%" height="600" frameborder="0"></iframe>
			    </td>
			    <td width="80%" valign="top">
				       <iframe id="LT_main" src="${ctx}/jsp/permission/upmPermissionAction!turnToPermissionList.action?appId=${param.appId}&parentId=0" scrolling="auto" width="100%" height="600" frameborder="0" allowTransparency="true" style="overflow-x:hidden;"></iframe>
			    </td>
	    </tr>
    </table>
  </body>
</html>
