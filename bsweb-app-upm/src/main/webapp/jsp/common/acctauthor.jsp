<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/jsp/common/meta.jsp" %>
<%
	String resAcctId=request.getParameter("resAcctId").toString();
	String resKind=request.getParameter("resKind").toString();
	String resEntityId=request.getParameter("resEntityId").toString();
	request.setAttribute("resAcctId",resAcctId);
	request.setAttribute("resKind",resKind);
	request.setAttribute("resEntityId",resEntityId);
 %>

<script type="">
	window.location = "${ctx}/jsp/common/acctauthor!commonShow.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}";
</script>
</head>
