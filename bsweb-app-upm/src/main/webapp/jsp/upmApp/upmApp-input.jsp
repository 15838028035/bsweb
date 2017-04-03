<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>应用管理</title>
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
<form action="upmAppAction!commonSaveOrUpdate.action" method="post" name="upmAppForm" id="upmAppForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="upmApp.id" id="id" value="${id}"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
            <td align="right">应用ID<font color="red">*</font> </td>
            <td><input type="text" id="appId" name="upmApp.appId" value="${upmApp.appId}" maxLength="10" /></td>
        </tr>
        <tr>
            <td align="right">应用编号<font color="red">*</font></td>
            <td><input type="text" id="appCode" name="upmApp.appCode" value="${upmApp.appCode}" maxlength="20"/> </td>
        </tr>
          <tr>
            <td align="right">应用名称<font color="red">*</font></td>
             <td><input type="text" id="appName" name="upmApp.appName" value="${upmApp.appName}" maxlength="200"/> </td>
        </tr>
         <tr>
            <td align="right">应用url<font color="red">*</font></td>
             <td><input type="text" id="appUrl" name="upmApp.appUrl" value="${upmApp.appUrl}" style="width:600px;" maxlength="2000"/> </td>
        </tr>
        <tr>
            <td>
 				<div class=" marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
		       	<div class=" marg_lef10 float_lef"><input type="button" id="backToHomeButton" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="返回主页" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
        $("#submitButton").click(function() {
        	$("#upmAppForm").submit();
        	return false;
        })

		$("#upmAppForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		       "appId": {
					required: true,
					minlength:2,
					maxlength:10
		       },
		       "appCode": {
					required: true,
					minlength:6,
					maxlength:50
		       },
		        "appName": {
					required: true,
					minlength:2,
					maxlength:200
		       },
		        "appUrl": {
					required: true,
					minlength:16,
					maxlength:2000
		       }
		    }
			
		});

        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
