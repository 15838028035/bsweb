<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>请假流程</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	</head>

	<body>
		<form id="inputForm" action="" method="post" target="mainFrame">
			<input type="hidden" name="processId" value="${processId }" />
			<input type="hidden" name="orderId" value="${orderId }" />
			<input type="hidden" name="taskId" value="${taskId }" />
			<c:forEach items="${vars}" var="item">
			<table class="table_all" align="center" border="0" cellpadding="0"
				cellspacing="0" style="margin-top: 0px">
				<tr>
					<td class="td_table_1">
						<span>部门经理审批结果：</span>
					</td>
					<td class="td_table_2" colspan="3">
						&nbsp;${item['method'] == '0' ? '同意' : '' }${item['method'] == '-1' ? '不同意' : '' }
					</td>
				</tr>
				<tr>
					<td class="td_table_1">
						<span>部门经理审批意见：</span>
					</td>
					<td class="td_table_2" colspan="3">
						&nbsp;${item['approveDept.suggest'] }
					</td>
				</tr>
			</table>
			</c:forEach>
		</form>
	</body>
</html>
