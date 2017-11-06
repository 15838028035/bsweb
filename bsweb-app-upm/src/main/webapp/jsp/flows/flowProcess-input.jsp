<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>流程定义</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<style type="text/css">
	.input-disabled{
		border:none;
	}
	</style>
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
<form action="flowProcessAction!commonSaveOrUpdate.action" method="post" name="flowProcessForm" id="flowProcessForm">
<input type="hidden" name="flowProcess.id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table style="width:100%; height:100%; ">
        <tr>
			 <td align="right">流程编号<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowProcess.flowNo" id="flowNo" value="${flowProcess.flowNo}" readonly="readonly" class="input-disabled" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程版本<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowProcess.flowVersion" id="flowVersion" value="${flowProcess.flowVersion}"  readonly="readonly" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowProcess.flowName" id="flowName" value="${flowProcess.flowName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">显示名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowProcess.displayName" id="displayName" value="${flowProcess.displayName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程类型<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowProcess.flowType" id="flowType" value="${flowProcess.flowType}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程内容<font color="red">*</font></td>
			 <td>
		 	  <textarea rows="200" cols="200" name="flowProcess.flowContentStr" id="flowContentStr">${flowProcess.flowContentStr}</textarea>
		 	 </td>
		 </tr>
		  <tr>
			 <td align="right">流程URL<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowProcess.instanceUrl" id="instanceUrl" value="${flowProcess.model.instanceUrl}" size="200px" style="width:200px;" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">是否加锁<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowProcess.lockStatus" id="lockStatus" value="${flowProcess.lockStatus}" />
		 	  
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
        	$("#flowProcessForm").submit();
        	return false;
        })

		$("#flowProcessForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "flowProcess.flowName": {
					required: true,
					minlength:1,
					maxlength:200
		       },
		 		 "flowProcess.displayName": {
					required: true,
					minlength:1,
					maxlength:200
		       },
		 		 "flowProcess.flowType": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowProcess.flowContentStr": {
					required: true,
					minlength:1,
					maxlength:5000
		       },
		 		 "flowProcess.enableFlag": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowProcess.lockStatus": {
					required: true,
					minlength:1,
					maxlength:50
		       }
		    }
			
		});
		
        $("#backToHomeButton").click(function() {
			window.history.go(-1);
        });
</script>
</body>
</html>
