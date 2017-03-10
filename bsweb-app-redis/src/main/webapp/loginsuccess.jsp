<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			//LoginAction should redirect to this page.			
			window.open("${ctx}/index.jsp",'_new','fullscreen=yes,scrollbars=yes');
			//toolbar=no, location=yes, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=yes
			window.opener=null;
			window.close();			
		});	
	</script>
</head>
<body>
</body>
</html>