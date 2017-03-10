<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>配置管理</title>
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
<form action="upmConfigurationAction!commonSaveOrUpdate.action" method="post" name="upmConfigurationForm" id="upmConfigurationForm">
<input type="hidden"  name="configId" id="configId"  value="${configId}" />
<input type="hidden"  name="upmConfiguration.configId" id="configId"  value="${configId}" />
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table>
        <tr>
			 <td align="right">置配项KEY<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="upmConfiguration.cfgKey" id="cfgKey" value="${upmConfiguration.cfgKey}"  />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">置配项值<font color="red">*</font></td>
			 <td>
		 	  <input type="text"  name="upmConfiguration.cfgValue" id="cfgValue"  value="${upmConfiguration.cfgValue}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">置配项描述<font color="red">*</font></td>
			 <td>
		 	  <textarea rows="3" cols="50" name="upmConfiguration.cfgDesc"  id="cfgDesc">${upmConfiguration.cfgDesc}</textarea>
										
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
        	$("#upmConfigurationForm").submit();
        	return false;
        })

		$("#upmConfigurationForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "upmConfiguration.cfgKey": {
					required: true,
					minlength:1,
					maxlength:200
		       },
		 		 "upmConfiguration.cfgValue": {
					required: true,
					minlength:1,
					maxlength:400
		       },
		 		 "upmConfiguration.cfgDesc": {
					required: false,
					minlength:1,
					maxlength:1024
		       }
		    }
			
		});
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
