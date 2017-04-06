<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>flowTask管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script>
		$(document).ready(function(){
			if('${returnMessage}' != ""){
				showModalMessage("${returnMessage}","doUpdateSuccess()");
			}
		});
		function doUpdateSuccess(){
			jQuery.FrameDialog.closeDialog();
		   	parent.location.reload();
		}
	</script>
</head>
<body>
<form action="flowTaskAction!commonSaveOrUpdate.action" method="post" name="flowTaskForm" id="flowTaskForm">
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table>
        <tr>
			 <td align="right">版本<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.taskVefrsion" id="taskVefrsion" value="${flowTask.taskVefrsion}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程实例ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.flowOrderId" id="flowOrderId" value="${flowTask.flowOrderId}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.taskName" id="taskName" value="${flowTask.taskName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">显示名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.displayName" id="displayName" value="${flowTask.displayName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">参与方式（0：普通任务；1：参与者会签任务）<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.performType" id="performType" value="${flowTask.performType}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务类型（0：主办任务；1：协办任务）<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.taskType" id="taskType" value="${flowTask.taskType}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务处理者ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.operator" id="operator" value="${flowTask.operator}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务创建时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTask.createTime" id = "createTime" value="<s:date name='createTime' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务完成时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTask.finishTime" id = "finishTime" value="<s:date name='finishTime' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">期望任务完成时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTask.expireTime" id = "expireTime" value="<s:date name='expireTime' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">期望的完成时间date类型<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTask.expireDate" id = "expireDate" value="<s:date name='expireDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">提醒时间date类型<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTask.remindDate" id = "remindDate" value="<s:date name='remindDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务关联的表单url<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.actionUrl" id="actionUrl" value="${flowTask.actionUrl}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务参与者列表<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.actorIds" id="actorIds" value="${flowTask.actorIds}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">父任务Id<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.parentTaskId" id="parentTaskId" value="${flowTask.parentTaskId}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务附属变量<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.variable" id="variable" value="${flowTask.variable}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">创建人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.createBy" id="createBy" value="${flowTask.createBy}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">创建时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTask.createDate" id = "createDate" value="<s:date name='createDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">更新人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTask.updateBy" id="updateBy" value="${flowTask.updateBy}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">更新时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTask.updateDate" id = "updateDate" value="<s:date name='updateDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
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
        	$("#flowTaskForm").submit();
        	return false;
        })

		$("#flowTaskForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "flowTask.id": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.taskVefrsion": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.flowOrderId": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.taskName": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.displayName": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.performType": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.taskType": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.operator": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.createTime": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.finishTime": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.expireTime": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.expireDate": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.remindDate": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.actionUrl": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.actorIds": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.parentTaskId": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.variable": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.createBy": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.createDate": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.updateBy": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTask.updateDate": {
					required: true,
					minlength:1,
					maxlength:50
		       }
		    }
			
		});
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
