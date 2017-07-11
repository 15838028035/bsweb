<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>系统信息</title>
    <%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/resource/scripts_all.jsp" %>
    <%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
<script  type="text/javascript">
</script>

</head>
<body>
	<h3>系统信息</h3>
	${systemInfo}
</body>
</html>