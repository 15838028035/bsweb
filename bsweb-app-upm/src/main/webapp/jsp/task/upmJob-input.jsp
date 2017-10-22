
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
	<form action="upmJobAction!save.action" class="form-horizontal" method="post" name="upmJobForm" id="upmJobForm">
	<input type="hidden" name="upmJob.id" id="id" value="${id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
           
      		<div class="form-group">
			 <label for="id">ID</label>
		 	  <input class="form-control" type="text"  name="upmJob.id" id="id"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobName">定时任务名称</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobName" id="jobName"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobClass">job执行类</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobClass" id="jobClass"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobFrequency">执行表达式</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobFrequency" id="jobFrequency"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobWeekday">星期</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobWeekday" id="jobWeekday"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobMonthday">月天</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobMonthday" id="jobMonthday"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobHour">小时</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobHour" id="jobHour"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="jobDesc">任务描述</label>
		 	  <input class="form-control" type="text"  name="upmJob.jobDesc" id="jobDesc"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="scheDetailId">调度日志ID</label>
		 	  <input class="form-control" type="text"  name="upmJob.scheDetailId" id="scheDetailId"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="status">状态</label>
		 	  <input class="form-control" type="text"  name="upmJob.status" id="status"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="createBy"></label>
		 	  <input class="form-control" type="text"  name="upmJob.createBy" id="createBy"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="createByUname"></label>
		 	  <input class="form-control" type="text"  name="upmJob.createByUname" id="createByUname"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="createDate"></label>
				<input class="form-control" type="text" name="upmJob.createDate" id = "createDate" value="<s:date name='createDate' format='yyyy-MM-dd' />" class="datetimepicker"  readonly="readonly"/>
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="updateBy"></label>
		 	  <input class="form-control" type="text"  name="upmJob.updateBy" id="updateBy"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="updateByUname"></label>
		 	  <input class="form-control" type="text"  name="upmJob.updateByUname" id="updateByUname"  value="${column.columnNameLower}" />
		 	
		</div>
		 
      		<div class="form-group">
			 <label for="updateDate"></label>
				<input class="form-control" type="text" name="upmJob.updateDate" id = "updateDate" value="<s:date name='updateDate' format='yyyy-MM-dd' />" class="datetimepicker"  readonly="readonly"/>
		 	
		</div>
		 
       
 	  <div class="form-group"> 
                   <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
                  <button type="button" id="backToHomeButton" class="btn btn-success ">保存</button> 
        </div>	
       
    
	</form>
</div>
<script>

		$("#upmJobForm").bootstrapValidator({
			
			fields: {
		 		 "upmJob.id": {
					message: 'id不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'id不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobName": {
					message: 'jobName不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobName不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobClass": {
					message: 'jobClass不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobClass不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobFrequency": {
					message: 'jobFrequency不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobFrequency不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobWeekday": {
					message: 'jobWeekday不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobWeekday不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobMonthday": {
					message: 'jobMonthday不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobMonthday不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobHour": {
					message: 'jobHour不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobHour不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.jobDesc": {
					message: 'jobDesc不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'jobDesc不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.scheDetailId": {
					message: 'scheDetailId不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'scheDetailId不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.status": {
					message: 'status不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'status不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.createBy": {
					message: 'createBy不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'createBy不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.createByUname": {
					message: 'createByUname不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'createByUname不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.createDate": {
					message: 'createDate不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'createDate不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.updateBy": {
					message: 'updateBy不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'updateBy不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.updateByUname": {
					message: 'updateByUname不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'updateByUname不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmJob.updateDate": {
					message: 'updateDate不能为空'
					validators: {  
                       				 notEmpty: {  
                        				message: 'updateDate不能为空'  
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
