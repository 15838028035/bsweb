
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>flowFormTable管理</title>
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
<form action="flowFormTableAction!commonSaveOrUpdate.action" method="post" name="flowFormTableForm" id="flowFormTableForm">
<input type="hidden" name="flowFormTable.id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table>
        <tr>
			 <td align="right">名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowFormTable.name" id="name" value="${flowFormTable.name}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">显示名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowFormTable.displayName" id="displayName" value="${flowFormTable.displayName}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">类型<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowFormTable.type" id="type" value="${flowFormTable.type}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">HTML<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowFormTable.originHtml" id="originHtml" value="${flowFormTable.originHtml}" />
		 	  
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">HTML<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="flowFormTable.parseHtml" id="parseHtml" value="${flowFormTable.parseHtml}" />
		 	  
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
        	$("#flowFormTableForm").submit();
        	return false;
        })

		$("#flowFormTableForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "flowFormTable.name": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowFormTable.displayName": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowFormTable.type": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowFormTable.originHtml": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "flowFormTable.parseHtml": {
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
