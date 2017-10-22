
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>用户管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
</head>
<body>
<div class="container">
	<form action="upmJobSechduAction!save.action" class="form-horizontal" method="post" name="upmJobSechduForm" id="upmJobSechduForm">
	<input type="hidden" name="upmJobSechdu.id" id="id" value="${id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
           
      		<div class="form-group">
			 <label for="id">ID</label>
		 	  <input class="form-control" type="text"  name="upmJobSechdu.id" id="id"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobId">任务ID</label>
		 	  <input class="form-control" type="text"  name="upmJobSechdu.jobId" id="jobId"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="startTime">开始时间</label>
				<input class="form-control" type="text" name="upmJobSechdu.startTime" id = "startTime" value="<s:date name='startTime' format='yyyy-MM-dd' />" class="datetimepicker"  readonly="readonly"/>
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="endTime">结束时间</label>
				<input class="form-control" type="text" name="upmJobSechdu.endTime" id = "endTime" value="<s:date name='endTime' format='yyyy-MM-dd' />" class="datetimepicker"  readonly="readonly"/>
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jodStatus">状态</label>
		 	  <input class="form-control" type="text"  name="upmJobSechdu.jodStatus" id="jodStatus"  value="${column.columnNameLower}" />
		 	
		</div>
		 
       
 	  <div class="form-group"> 
                   <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
                  <button type="button" id="backToHomeButton" class="btn btn-success ">保存</button> 
        </div>	
       
    
	</form>
</div>
<script>

		$("#upmJobSechduForm").bootstrapValidator({
			
			fields: {
		 		 "upmJobSechdu.id": {
					message: 'id不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'id不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJobSechdu.jobId": {
					message: 'jobId不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobId不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJobSechdu.startTime": {
					message: 'startTime不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'startTime不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJobSechdu.endTime": {
					message: 'endTime不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'endTime不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJobSechdu.jodStatus": {
					message: 'jodStatus不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jodStatus不能为空'  
                        			} 
                        			
                    			}  
				
		       }
		    }，
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
