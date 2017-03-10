<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/jsp/common/meta.jsp" %>
<%
	String pwdRuleIdCommon=request.getParameter("pwdRuleIdCommon").toString();
	request.setAttribute("pwdRuleIdCommon",pwdRuleIdCommon);
 %>

<script type="">
	window.location = "${ctx}/jsp/syscfg/pwd/pwdrule!showPwdRuleCommon.action?pwdRuleIdCommon=${pwdRuleIdCommon}";
</script>
</head>