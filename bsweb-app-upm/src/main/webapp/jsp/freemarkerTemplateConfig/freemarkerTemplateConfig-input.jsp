
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
    <title>freemarker模版管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
</head>
<body>
<div class="container">
	<form action="freemarkerTemplateConfigAction!commonSaveOrUpdate.action" class="form-horizontal"  method="post" name="freemarkerTemplateConfigForm" id="freemarkerTemplateConfigForm">
	<input type="hidden" name="id" id="id" value="${id}"/>
	<input type="hidden" name="freemarkerTemplateConfig.id" id="freemarkerTemplateConfig.id" value="${id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
	    
	        <div class="form-group">  
	              <label for="loginNo">模版编号</label>  
	            <input  class="form-control" type="text" id="templateNo" name="freemarkerTemplateConfig.templateNo" value="${freemarkerTemplateConfig.templateNo}"  />
	       	</div>
	       	<div class="form-group">  
	              <label for="loginNo">模版名称</label>  
	            <input  class="form-control" type="text" id="templateName" name="freemarkerTemplateConfig.templateName" value="${freemarkerTemplateConfig.templateName}"  />
	       	</div>
	       	<div class="form-group">  
	              <label for="loginNo">模版路径</label>  
	            <input  class="form-control" type="text" id="templatePath" name="freemarkerTemplateConfig.templatePath" value="${freemarkerTemplateConfig.templatePath}"  />
	       	</div>
	       	<div class="form-group">  
	              <label for="loginNo">模版内容</label>  
	            <textarea  name="freemarkerTemplateConfig.templateConent" id="templateConent" class="form-control" rows="20">${freemarkerTemplateConfig.templateConent}</textarea> 
	       	</div>
	       	<div class="form-group">  
	              <label for="loginNo">测试数据</label>  
	             <textarea  name="freemarkerTemplateConfig.testData" id="testData" class="form-control" rows="10">${freemarkerTemplateConfig.testData}</textarea> 
	       	</div>
	       		<div class="form-group">  
	              <label for="loginNo">测试邮箱</label>  
	            <input  class="form-control" type="text" id="testEmail" name="freemarkerTemplateConfig.testEmail" value="${freemarkerTemplateConfig.testEmail}"  />
	       	</div>
	       	<div class="form-group">  
	              <label for="loginNo">备注</label>  
	            <textarea  name="freemarkerTemplateConfig.templateRemark" id="templateRemark" class="form-control" rows="3">${freemarkerTemplateConfig.templateRemark}</textarea> 
	       	</div>
	        
	        <div class="form-group"> 
	        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
	        		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
	        </div>
	</form>
</div>
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
			window.history.go(-1);
        });
</script>
</body>
</html>
