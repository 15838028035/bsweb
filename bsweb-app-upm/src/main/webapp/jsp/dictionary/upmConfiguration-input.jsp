<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>upmConfiguration管理</title>
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
<form action="upmConfigurationAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="upmConfigurationForm" id="upmConfigurationForm" role="form">
<input type="hidden" name="id" id="id" value="${id}"/>
<input type="hidden" name="upmConfiguration.configId" id="configId" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
   
      		<div class="form-group">
			 <label for="cfgKey">置配项KEY</label>
		 	  <input class="form-control" type="text"  name="upmConfiguration.cfgKey" id="cfgKey"  value="${upmConfiguration.cfgKey}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="cfgValue">置配项值</label>
		 	  <input class="form-control" type="text"  name="upmConfiguration.cfgValue" id="cfgValue"  value="${upmConfiguration.cfgValue}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="cfgDesc">置配项描述</label>
		 	  <input class="form-control" type="text"  name="upmConfiguration.cfgDesc" id="cfgDesc"  value="${upmConfiguration.cfgDesc}" />
		 </div>
       
 	  <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">取消</button> 
        </div>
</form>

</div>

<script   type="text/javascript">

		$("#upmConfigurationForm").bootstrapValidator({
			
			fields: {
		 		 "upmConfiguration.cfgKey": {
					message: '置配项KEY不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '置配项KEY不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 1,
                           		 max: 50,
                           			 message: '置配项KEY必须在1到50之间'
                        		} 
                    			}  
				
		       },
		 		 "upmConfiguration.cfgValue": {
					message: '置配项值不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '置配项KEY不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 1,
                           		 max: 30,
                           			 message: '置配项值必须在1到30之间'
                        		} 
                    			}  
				
		       },
		 		 "upmConfiguration.cfgDesc": {
					message: '置配项描述不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '置配项KEY不能为空'  
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
