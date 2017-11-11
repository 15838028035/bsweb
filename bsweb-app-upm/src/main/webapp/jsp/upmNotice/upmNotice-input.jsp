
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>upmNotice管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/resource/scripts_all.jsp" %>
    <%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
<script  type="text/javascript">
	$(document).ready(function(){
			     
	     $(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii',//格式化时间,
	             autoclose:true,//日期选择完成后是否关闭选择框
	         });
	});

</script>

</head>
<body>
<div class="container">
<form action="upmNoticeAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="upmNoticeForm" id="upmNoticeForm" role="form">
<input  type="hidden"  name="upmNotice.id" id="id"  value="${upmNotice.id}" />
<input type="hidden" name="operate" id="operate" value="${operate}" />
        
      		<div class="form-group">
			 <label for="typeId">类别ID</label>
		 	  <input class="form-control" type="text"  name="upmNotice.typeId" id="typeId"  value="${upmNotice.typeId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="content">内容</label>
		 	  <input class="form-control" type="text"  name="upmNotice.content" id="content"  value="${upmNotice.content}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="paramA">参数A</label>
		 	  <input class="form-control" type="text"  name="upmNotice.paramA" id="paramA"  value="${upmNotice.paramA}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="paramB">参数B</label>
		 	  <input class="form-control" type="text"  name="upmNotice.paramB" id="paramB"  value="${upmNotice.paramB}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="extCode">扩展code</label>
		 	  <input class="form-control" type="text"  name="upmNotice.extCode" id="extCode"  value="${upmNotice.extCode}" />
		 </div>
       
 	 	<div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
        </div>
    
</form>
</div>
<script>

		$("#upmNoticeForm").bootstrapValidator({
			fields: {
		 		 "upmNotice.typeId": {
					message: '类别ID不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '类别ID不能为空'  
                        				} 
                    			}  
				
		       },
		 		 "upmNotice.content": {
					message: '内容不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '内容不能为空'  
                        				} 
                    			}  
				
		       },
		 		 "upmNotice.paramA": {
					message: 'paramA不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: 'paramA不能为空'  
                        				} 
                    			}  
				
		       }
		    },
 		submitHandler: function(validator, form, submitButton) {  
               		 validator.defaultSubmit();  
            	}  
			
		});
		
        $("#backToHomeButton").click(function() {
			window.history.go(-1);
        });
</script>
</body>
</html>
