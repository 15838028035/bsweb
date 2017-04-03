<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.asiainfo.a4.core.common.properties.PropertiesUtil;"%>

<%
	//200 = HttpServletResponse.SC_OK
    response.setStatus(200); 
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=PropertiesUtil.getMessage("com/asiainfo/a4/core/common/config/commonMessages","403.jsp.1")%></title>
</head>

<body>
<div>
	<div><h1><%=PropertiesUtil.getMessage("com/asiainfo/a4/core/common/config/commonMessages","403.jsp.2")%></h1></div>
</div>
</body>
</html>