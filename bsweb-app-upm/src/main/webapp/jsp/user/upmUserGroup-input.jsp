<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script>
		$(document).ready(function(){
			if('${returnMessage}' != ""){
				bootbox.alert("${returnMessage}");
			}
		});
	</script>
</head>
<body>
<div class="container">
	<form action="upmUserGroupAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="upmUserGroupForm" id="upmUserGroupForm">
	<input type="hidden" name="upmUserGroup.id" id="id" value="${id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
	 <input type="hidden"  name="upmUserGroup.parentId" id="parentId"  value="${upmUserGroup.parentId}" />
           
      		<div class="form-group">
			 <label for="userGroupCode">组织机构编码</label>
		 	  <input class="form-control" type="text"  name="upmUserGroup.userGroupCode" id="userGroupCode"  value="${upmUserGroup.userGroupCode}" />
		 	</div>
		 	<div class="form-group">
			 <label for="bussinessCode">业务代码</label>
		 	  <input class="form-control" type="text"  name="upmUserGroup.bussinessCode" id="bussinessCode"  value="${upmUserGroup.bussinessCode}" />
		 	</div>
      		<div class="form-group">
			 <label for="userGroupName">组织机构名称</label>
		 	  <input class="form-control" type="text"  name="upmUserGroup.userGroupName" id="userGroupName"  value="${upmUserGroup.userGroupName}" />
		 	</div>
       
 	  <div class="form-group"> 
                   <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
        </div>	
       
    	</form>
</div>
<script>

		$("#upmUserGroupForm").bootstrapValidator({
			
			fields: {
		 		 "upmUserGroup.userGroupCode": {
					message: '组织机构编码不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '组织机构编码不能为空'  
                        			} 
                        			
                    			}  
				
		       },
		 		 "upmUserGroup.userGroupName": {
					message: '组织机构名称不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '组织机构名称不能为空'  
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
