<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
  </head>
  <script>
  	$(document).ready(function(){
		contralEffect.contain();
		contralEffect.tablelist();
		contralEffect.blueButton();
		});
  </script>
  <body>
  <input type="hidden" name="appId" id="appId" value=${param.appId}>
	 <table width="100%"  hight="100%" cellpadding="0" cellspacing="0" border="0">
	    <tr>
	    	 	<td width="20%" valign="top">
			    	<iframe id="LT_menu" src="${ctx}/jsp/permission/permissionTree.jsp" scrolling="auto" width="100%" height="600" frameborder="0"></iframe>
			    </td>
			    <td width="80%" valign="top">
				       <iframe id="LT_main" src="${ctx}/jsp/permission/permissionData.jsp" scrolling="auto" width="100%" height="600" frameborder="0" allowTransparency="true" style="overflow-x:hidden;"></iframe>
			    </td>
	    </tr>
    </table>
  </body>
</html>
