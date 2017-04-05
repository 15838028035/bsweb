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
					<td class="td_table_1">
						<span>部门经理审批结果：</span>
					</td>
					<td class="td_table_2" colspan="3">
						<input type="radio" name="method" value="0" checked="checked" onclick="transfer('1')"/>同意
						<input type="radio" name="method" value="-1" onclick="transfer('-1')"/>不同意
						<input type="radio" name="method" value="1" onclick="transfer('2')"/>转派
					</td>
				</tr>
				<tr>
					<td class="td_table_1">
						<span>部门经理审批意见：</span>
					</td>
					<td class="td_table_2" colspan="3">
						<textarea class="input_textarea_320" id="departmentDesc" name="approveDept.suggest"></textarea>
					</td>
				</tr>
				<tr id="transferDIV" style="display: none">
					<td class="td_table_1">
						<span>转派给：</span>
					</td>
					<td class="td_table_2" colspan="3">
						<input type="hidden" id="nextOperator" name="nextOperator" value="">
						<input type="text" id="nextOperatorName" readonly="readonly" name="nextOperatorName" class="input_520" value="">
						<input type='button' class='button_70px' value='选择部门' id="selectOrgBtn" onclick="selectOrg('${ctx}', 'nextOperator', 'nextOperatorName')"/>
						<!-- <input type="text" class="input_240" id="nextOperator" name="nextOperator" value="${variable_approveDept['nextOperator'] }"/> -->
					</td>
				</tr>
				<tr>
					<td class="td_table_1"><span>抄送给：</span></td>
					<td class="td_table_2" colspan="3">
						<input type="hidden" id="ccOperator" name="ccOperator" value="">
						<input type="text" id="ccOperatorName" readonly="readonly" name="ccOperatorName" class="input_520" value="">
						<input type='button' class='button_70px' value='选择部门' onclick="selectOrg('${ctx}', 'ccOperator', 'ccOperatorName')"/>
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
<script type="text/javascript">
	function transfer(flag) {
		if(flag == '2') {
			document.all['transferDIV'].style.display = "block";
		} else {
			document.all['transferDIV'].style.display = "none";
		}
	}
</script>
	</body>
</html>
