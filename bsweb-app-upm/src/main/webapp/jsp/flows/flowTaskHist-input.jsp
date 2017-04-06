
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>flowTaskHist管理</title>
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
<form action="flowTaskHistAction!commonSaveOrUpdate.action" method="post" name="flowTaskHistForm" id="flowTaskHistForm">
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table>
        
        <tr>
			 <td align="right">ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.id" id="id" value="${flowTaskHist.id}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">版本<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.taskVefrsion" id="taskVefrsion" value="${flowTaskHist.taskVefrsion}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程实例ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.flowOrderId" id="flowOrderId" value="${flowTaskHist.flowOrderId}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.taskName" id="taskName" value="${flowTaskHist.taskName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">显示名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.displayName" id="displayName" value="${flowTaskHist.displayName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">参与方式（0：普通任务；1：参与者会签任务）<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.performType" id="performType" value="${flowTaskHist.performType}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务类型（0：主办任务；1：协办任务）<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.taskType" id="taskType" value="${flowTaskHist.taskType}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务处理者ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.operator" id="operator" value="${flowTaskHist.operator}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务创建时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTaskHist.createTime" id = "createTime" value="<s:date name='createTime' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务完成时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTaskHist.finishTime" id = "finishTime" value="<s:date name='finishTime' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">期望任务完成时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTaskHist.expireTime" id = "expireTime" value="<s:date name='expireTime' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">期望的完成时间date类型<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTaskHist.expireDate" id = "expireDate" value="<s:date name='expireDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">提醒时间date类型<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTaskHist.remindDate" id = "remindDate" value="<s:date name='remindDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务关联的表单url<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.actionUrl" id="actionUrl" value="${flowTaskHist.actionUrl}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务参与者列表<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.actorIds" id="actorIds" value="${flowTaskHist.actorIds}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">父任务Id<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.parentTaskId" id="parentTaskId" value="${flowTaskHist.parentTaskId}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">任务附属变量<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.variable" id="variable" value="${flowTaskHist.variable}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">创建人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.createBy" id="createBy" value="${flowTaskHist.createBy}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">创建时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTaskHist.createDate" id = "createDate" value="<s:date name='createDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">更新人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.updateBy" id="updateBy" value="${flowTaskHist.updateBy}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">更新时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowTaskHist.updateDate" id = "updateDate" value="<s:date name='updateDate' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">创建人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.createByUname" id="createByUname" value="${flowTaskHist.createByUname}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">更新人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowTaskHist.updateByUname" id="updateByUname" value="${flowTaskHist.updateByUname}" />
		 	  
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
        	$("#flowTaskHistForm").submit();
        	return false;
        })

		$("#flowTaskHistForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "flowTaskHist.id": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.taskVefrsion": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.flowOrderId": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.taskName": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.displayName": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.performType": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.taskType": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.operator": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.createTime": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.finishTime": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.expireTime": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.expireDate": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.remindDate": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.actionUrl": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.actorIds": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.parentTaskId": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.variable": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.createBy": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.createDate": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.updateBy": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.updateDate": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.createByUname": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowTaskHist.updateByUname": {
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
