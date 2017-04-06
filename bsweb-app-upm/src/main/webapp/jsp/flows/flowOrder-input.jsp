<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>流程实例</title>
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
<form action="flowOrderAction!commonSaveOrUpdate.action" method="post" name="flowOrderForm" id="flowOrderForm">
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table>
        <tr>
			 <td align="right">流程编号<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowOrder.orderNo" id="orderNo" value="${flowOrder.orderNo}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程版本<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowOrder.orderVersion" id="orderVersion" value="${flowOrder.orderVersion}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程定义ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowOrder.flowProcessId" id="flowProcessId" value="${flowOrder.flowProcessId}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">父流程实例ID<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowOrder.parentId" id="parentId" value="${flowOrder.parentId}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">父流程名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowOrder.parentNodeName" id="parentNodeName" value="${flowOrder.parentNodeName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程实例期望完成时间<font color="red">*</font></td>
			 <td>
				<input type="text" name="flowOrder.expireTime" id = "expireTime" value="<s:date name='expireTime' format='yyyy-MM-dd' />" class="datetimepicker" readonly="readonly"/>
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程实例优先级<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowOrder.priority" id="priority" value="${flowOrder.priority}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">流程实例附属变量<font color="red">*</font></td>
			 <td>
		 	  <textarea rows="20" cols="100" name="flowOrder.variable" id="flowContentStr">${flowOrder.variable}</textarea>
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
        	$("#flowOrderForm").submit();
        	return false;
        })

		$("#flowOrderForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "flowOrder.id": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowOrder.orderNo": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowOrder.flowProcessId": {
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
