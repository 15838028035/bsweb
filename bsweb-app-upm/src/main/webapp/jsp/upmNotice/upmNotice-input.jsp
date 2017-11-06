
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
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
   
        
      		<div class="form-group">
			 <label for="id">ID</label>
		 	  <input class="form-control" type="text"  name="upmNotice.id" id="id"  value="upmNotice.id" />
		 </div>
		 
      		<div class="form-group">
			 <label for="typeId">类别ID</label>
		 	  <input class="form-control" type="text"  name="upmNotice.typeId" id="typeId"  value="upmNotice.typeId" />
		 </div>
		 
      		<div class="form-group">
			 <label for="content">内容</label>
		 	  <input class="form-control" type="text"  name="upmNotice.content" id="content"  value="upmNotice.content" />
		 </div>
		 
      		<div class="form-group">
			 <label for="paramA">paramA</label>
		 	  <input class="form-control" type="text"  name="upmNotice.paramA" id="paramA"  value="upmNotice.paramA" />
		 </div>
		 
      		<div class="form-group">
			 <label for="paramB"></label>
		 	  <input class="form-control" type="text"  name="upmNotice.paramB" id="paramB"  value="upmNotice.paramB" />
		 </div>
		 
      		<div class="form-group">
			 <label for="sendBeginDate">发送开始时间</label>
				<input class="form-control" type="text" name="upmNotice.sendBeginDate" id = "sendBeginDate" value="upmNotice.sendBeginDate" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="sendEndDate">发送结束日期</label>
				<input class="form-control" type="text" name="upmNotice.sendEndDate" id = "sendEndDate" value="upmNotice.sendEndDate" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="createDateTime">创建日期</label>
				<input class="form-control" type="text" name="upmNotice.createDateTime" id = "createDateTime" value="upmNotice.createDateTime" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="extCode">扩展code</label>
		 	  <input class="form-control" type="text"  name="upmNotice.extCode" id="extCode"  value="upmNotice.extCode" />
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
		 		 "upmNotice.id": {
					message: 'ID不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: 'ID不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: 'ID必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.typeId": {
					message: '类别ID不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '类别ID不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '类别ID必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.content": {
					message: '内容不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '内容不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '内容必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.paramA": {
					message: 'paramA不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: 'paramA不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: 'paramA必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.paramB": {
					message: '不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.sendBeginDate": {
					message: '发送开始时间不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '发送开始时间不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '发送开始时间必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.sendEndDate": {
					message: '发送结束日期不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '发送结束日期不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '发送结束日期必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.createDateTime": {
					message: '创建日期不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '创建日期不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '创建日期必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmNotice.extCode": {
					message: '扩展code不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '扩展code不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '扩展code必须在6到30之间'
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
