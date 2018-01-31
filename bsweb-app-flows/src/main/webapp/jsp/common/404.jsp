<%@ page contentType="text/html;charset=UTF-8" %>

<%
	//200 = HttpServletResponse.SC_OK
    response.setStatus(200); 
 %>

<!DOCTYPE html>
<html>
<head>
	<title>404 - 页面不存在</title>
</head>

<body>
<div>
	<div><h1>页面不存在.</h1></div>
	<div><a href="${pageContext.request.contextPath}">返回首页</a></div>
</div>
</body>
</html>