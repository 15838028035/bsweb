<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
</head>

<body>
	<div><h1>登录超时,请重新登录</h1></div>
		<a href="javascript:login()">登录</a>
</body>

<script language="javascript">
		function login() {
			window.parent.location.href="${ctx }/loginAction!login.action";
		}
</script>
</html>
