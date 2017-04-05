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
		<form id="inputForm" action="${ctx }/jsp/flows/flowControllerAction!flowProcess.action" method="post" target="mainFrame">
			<input type="hidden" name="processId" value="${processId }" />
			<input type="hidden" name="orderId" value="${orderId }" />
			<input type="hidden" name="taskId" value="${taskId }" />
			<table class="table_all" align="center" border="0" cellpadding="0"
			cellspacing="0" style="margin-top: 0px">
				<tr>
					<td class="td_table_1"><span>请假人名称：</span></td>
					<td class="td_table_2" colspan="3">
						<input type="text" class="input_240" readonly="readonly" name="S_apply.operator" value="${operator}" />
					</td>
				</tr>
				<tr>
					<td class="td_table_1"><span>请假理由：</span></td>
					<td class="td_table_2" colspan="3">
						<textarea class="input_textarea_320" id="reason" name="S_reason"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_table_1"><span>请假天数：</span></td>
					<td class="td_table_2" colspan="3">
						<input type="text" class="input_240" id="day" name="I_day" value="" />天
					</td>
				</tr>
				<tr>
					<td class="td_table_1"><span>部门经理：</span></td>
					<td class="td_table_2" colspan="3">
						<input type="text" class="input_240" name="S_approveDept.operator" value="${operator }" />
					</td>
				</tr>
				<tr>
					<td class="td_table_1"><span>总经理：</span></td>
					<td class="td_table_2" colspan="3">
						<input type="text" class="input_240" name="S_approveBoss.operator" value="${operator }" />
					</td>
				</tr>
				<tr>
					<td class="td_table_1"><span><font color="red">注意：</font></span></td>
					<td class="td_table_2" colspan="3">
						<font color="red">部门经理、总经理文本框只是用于演示，你可以根据当前用户获取部门经理、总经理标识在后台设置变量<br>也可以直接在文本框中输入系统已经存在的用户[如：snaker、test]作为测试</font>
					</td>
				</tr>
			</table>
			<table align="center" border="0" cellpadding="0"
				cellspacing="0">
				<tr align="left">
					<td colspan="1">
						<input type="submit" class="button_70px" name="submit" value="提交">
						&nbsp;&nbsp;
						<input type="button" class="button_70px" name="reback" value="返回"
							onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
