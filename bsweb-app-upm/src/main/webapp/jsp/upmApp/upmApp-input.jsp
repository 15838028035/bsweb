
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>应用管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
</head>
<body>

<form action="upmAppAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="upmAppForm" id="upmAppForm">
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="upmApp.id" id="appId" value="${upmApp.id}"/>
<input type="hidden" name="upmApp.appId" id="appId" value="${upmApp.appId}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />

			<div class="form-group">
			<label for="appCode">应用ID</label>
		 	  <input class="form-control" type="text"  name="upmApp.appId" id="appId"  value="${upmApp.appId}" />
			</div>
      		<div class="form-group">
			<label for="appCode">应用编码</label>
		 	  <input class="form-control" type="text"  name="upmApp.appCode" id="appCode"  value="${upmApp.appCode}" />
			</div>
		 
      		<div class="form-group">
			<label for="appName">应用名称</label>
		 	  <input class="form-control" type="text"  name="upmApp.appName" id="appName"  value="${upmApp.appName}" />
			</div>
		 
      		<div class="form-group">
			<label for="appUrl">URL</label>
		 	  <input class="form-control" type="text"  name="upmApp.appUrl" id="appUrl"  value="${upmApp.appUrl}" />
		</div>
       
 	  <div class="form-group"> 
        		  <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
        		   <button type="button" id="backToHomeButton" class="btn btn-success ">保存</button> 
        </div>	
       
    
</form>
<script>

		$("#upmAppForm").bootstrapValidator({
			
			fields: {
		 		 "upmApp.appCode": {
					message: '应用编码不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '应用编码不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 2,
                           		 max: 30,
                           			 message: '应用编码必须在2到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmApp.appName": {
					message: '应用名称不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '应用名称不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 2,
                           		 max: 50,
                           			 message: '应用名称必须在2到50之间'
                        		} 
                    			}  
				
		       },
		 		 "upmApp.appUrl": {
					message: 'URL不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: 'URL不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 10,
                           		 max: 1000,
                           			 message: 'URL必须在10到1000之间'
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
