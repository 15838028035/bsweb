<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>定时任务管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
</head>
<body>
<div class="container">
	<form action="upmJobAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="upmJobForm" id="upmJobForm">
	<input type="hidden" name="upmJob.id" id="id" value="${upmJob.id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
		 
      		<div class="form-group">
			 <label for="jobName">定时任务名称</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobName" id="jobName"  value="${upmJob.jobName}" />
		</div>
		 
      		<div class="form-group">
			 <label for="jobClass">job执行类</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobClass" id="jobClass"  value="${upmJob.jobClass}" />
		</div>
		 
      		<div class="form-group">
			 <label for="jobFrequency">执行表达式</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobFrequency" id="jobFrequency"  value="${upmJob.jobFrequency}" />
		</div>
		 
      		<div class="form-group">
			 <label for="jobDesc">任务描述</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobDesc" id="jobDesc"  value="${upmJob.jobDesc}" />
		 	
		</div>
      		<div class="form-group">
			 <label for="status">状态</label>
		 	  <input class="form-control" type="text"  name="upmJob.status" id="status"  value="${upmJob.status}" />
		</div>
       
 	  <div class="form-group"> 
                   <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
                  <button type="button" id="backToHomeButton" class="btn btn-success ">返回</button> 
        </div>	
    
	</form>
</div>
<script>

		$("#upmJobForm").bootstrapValidator({
			
			fields: {
		 		 "upmJob.jobName": {
					message: 'jobName不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobName不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobClass": {
					message: 'jobClass不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobClass不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobFrequency": {
					message: 'jobFrequency不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobFrequency不能为空'  
                        			} 
                        			
                    			}  
				
		       }
			},
 		submitHandler: function(validator, form, submitButton) {  
               		 validator.defaultSubmit();  
            	}  
			
		});
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
