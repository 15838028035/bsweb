<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>UPM统一用户权限流程管理</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script type="text/javascript">
		
		$(document).ready(function(){
			bootbox.confirm('登录超时,请重新登录,确认登陆么?',function (result) {  
                if(result) {  
                window.location.href = "${ctx }/loginAction!goToLogin.action";
                }
        	});
		});
		
	</script>
	
</head>
<body>
    
</body>

</html>
