<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>flowApprove管理</title>
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
<form action="${ctx}/jsp/flows/flowControllerAction!doApproval.action" method="post" name="flowApproveForm" id="flowApproveForm" target="mainFrame">
<input type="hidden" name="flowApprove.processId" value="${param.processId}" />
<input type="hidden" name="flowApprove.orderId" value="${param.orderId}" />
<input type="hidden" name="flowApprove.taskId" value="${param.taskId}" />
<input type="hidden" name="flowApprove.taskName" value="${param.taskName}" />

    <table>
        <tr>
			 <td align="right">操作人<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowApprove.operator" id="operator" value="${flowApprove.operator}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">审批结果<font color="red">*</font></td>
			 <td>
		 	  <input type="radio" name="flowApprove.optResult" value="agree" checked="checked"/>同意
			  <input type="radio" name="flowApprove.optResult" value="disagree"/>不同意
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">审批描述:<font color="red">*</font></td>
			 <td>
		 	  <textarea class="input_textarea_320" id="description" name="flowApprove.optContent"></textarea>
		 	  
		 	 </td>
		</tr>
				
        <tr>
            <td>
            </td>
            <td>
 				<div class="window_button marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
            </td>
        </tr>
    </table>
</form>
<script>
 $("#submitButton").click(function() {
        	$("#flowApproveForm").submit();
        	return false;
        })

		$("#flowApproveForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "flowApprove.id": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowApprove.optResult": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowApprove.optContent": {
					required: true,
					minlength:1,
					maxlength:50
		       }
		    }
			
		});
		
        $("#backToHomeButton").click(function() {
			history.back();
        });
</script>
</body>
</html>
