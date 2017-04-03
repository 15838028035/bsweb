
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>freemarkerTemplateConfig管理</title>
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
<form action="freemarkerTemplateConfigAction!commonSaveOrUpdate.action" method="post" name="freemarkerTemplateConfigForm" id="freemarkerTemplateConfigForm">
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
    <table>
        <tr>
			 <td align="right">模版编号<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="templateNo" name="freemarkerTemplateConfig.templateNo" value="${freemarkerTemplateConfig.templateNo}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">模版名称<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="templateName" name="freemarkerTemplateConfig.templateName" value="${freemarkerTemplateConfig.templateName}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">模版路径<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="templatePath" name="freemarkerTemplateConfig.templatePath" value="${freemarkerTemplateConfig.templatePath}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">模版内容<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="templateConent" name="freemarkerTemplateConfig.templateConent" value="${freemarkerTemplateConfig.templateConent}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">测试数据<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="testData" name="freemarkerTemplateConfig.testData" value="${freemarkerTemplateConfig.testData}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">测试邮箱<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="testEmail" name="freemarkerTemplateConfig.testEmail" value="${freemarkerTemplateConfig.testEmail}" />
		 	 </td>
		 </tr>
        <tr>
			 <td align="right">备注<font color="red">*</font></td>
			 <td>
		 	  <input type="text" id="templateRemark" name="freemarkerTemplateConfig.templateRemark" value="${freemarkerTemplateConfig.templateRemark}" />
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
        	$("#freemarkerTemplateConfigForm").submit();
        	return false;
        })

		$("#freemarkerTemplateConfigForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		 		 "freemarkerTemplateConfig.templateNo": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "freemarkerTemplateConfig.templateName": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "freemarkerTemplateConfig.templatePath": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "freemarkerTemplateConfig.templateConent": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "freemarkerTemplateConfig.testData": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "freemarkerTemplateConfig.testEmail": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		 		 "freemarkerTemplateConfig.templateRemark": {
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
