
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>借款测试流程</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
</head>

<body>
<form action="flowBorrowTestAction!applySave.action" method="post" name="flowBorrowTestForm" id="flowBorrowTestForm">
<input type="text" name="id" id="id" value="${id}"/>
<input type="text" name="operate" id="operate" value="${operate}" />
<input type="text" name="processId" value="${processId}" />
<input type="text" name="orderId" value="${orderId}" />
<input type="text" name="taskId" value="${taskId}" />
			
    <table>
        
        <tr>
			 <td align="right">ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowBorrowTest.id" id="id"  value="${id}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">申请人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowBorrowTest.operator" id="operator"  value="${flowBorrowTest.operator}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">借款金额<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowBorrowTest.operatorAmount" id="operatorAmount"  value="${flowBorrowTest.operatorAmount}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">操作时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowBorrowTest.operatorTime" id = "operatorTime" value="<s:date name='operatorTime' format='yyyy-MM-dd' />" class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">归还时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowBorrowTest.repayTime" id = "repayTime" value="<s:date name='repayTime' format='yyyy-MM-dd' />" class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
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
						<input type="text" class="input_240" name="S_approveFinc.operator" value="${operator }" />
					</td>
				</tr>
				<tr>
					<td class="td_table_1"><span><font color="red">注意：</font></span></td>
					<td class="td_table_2" colspan="3">
						<font color="red">部门经理、总经理文本框只是用于演示，你可以根据当前用户获取部门经理、总经理标识在后台设置变量<br>也可以直接在文本框中输入系统已经存在的用户[如：sysadmin]作为测试</font>
					</td>
				</tr>
				
        <tr>
            <td>
            </td>
            <td>
 				<div class="window_button marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
		       	<div class="window_button marg_lef10 float_lef"><input type="button" id="backToHomeButton" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="返回主页" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
 $("#submitButton").click(function() {
        	$("#flowBorrowTestForm").submit();
        	return false;
        })
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
