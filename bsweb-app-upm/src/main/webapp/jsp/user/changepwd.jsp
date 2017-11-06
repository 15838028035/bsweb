<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>修改密码</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
			<form action="upmUserAction!updateAcctPwd.action" method="post" name="userForm" id="userForm" class="form-horizontal">
						<span class="heading"><h2>修改密码 </h2></span>
			           <div class="form-group">
			              <input  class="form-control" type="password" id="oldPwd" name="oldPwd" class="form-control"placeholder="请输入旧密码"/>
			              </div>
			              
			               <div class="form-group">
			              <input  class="form-control" type="password" id="pwd" name="pwd" class="form-control"placeholder="请输入新密码"/>
			              </div>
			              
			               <div class="form-group">
			              <input  class="form-control" type="password" id="newPwd" name="newPwd" class="form-control"placeholder="请输入确认密码"/>
			              </div>
			              
			                 <div class="form-group">
			               		<button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success btn-lg">保存</button> 
			        		   <button type="button" id="backToHomeButton" class="btn btn-primary btn-lg">返回</button> 
			              </div>
			</form>

</div>
</div>
</div>

<script>
        $("#submitButton").click(function() {
        	$("#userForm").submit();
        	return false;
        })
		
		 $('#userForm').bootstrapValidator({  
	            fields: {  
	            	"oldPwd": {  
	                message: '旧密码不能为空',  
	                validators: {  
	                    notEmpty: {  
	                    message: '旧密码不能为空'  
	                    }  
	                	}
	        		},
	                "pwd": {  
	                    message: '密新密码不能为空',  
	                    validators: {  
	                        notEmpty: {  
	                        message: '密码不不能为空'  
	                        } 
	                       
	                    }  
	                },
	                "newPwd": {  
	                    message: '确认密码不不能为空',  
	                    validators: {  
	                        notEmpty: {  
	                        message: '确认密码不不能为空'  
	                        } 
	                    }  
	                }
	            },
	            
	            submitHandler: function(validator, form, submitButton) {  
	            	// validator.defaultSubmit();  
	            	doChangePwd();
	            }  
	        });  
		 
		 function doChangePwd() {
				var oldPwd = $("#oldPwd").val();
		    	var pwd = $("#pwd").val();
		    	var newPwd = $("#newPwd").val();
		    	
		    	var queryUrl = "${ctx}/jsp/user/upmUserAction!updateAcctPwd.action?oldPwd="+oldPwd+"&pwd="+pwd+"&newPwd="+newPwd;
	            var result = jQuery.ajax({
			      	  url:queryUrl,
			          async:false,
			          cache:false,
			          dataType:"json"
			      }).responseText;
				var obj = eval("("+result+")");
				var optResult = obj.opResult;
				bootbox.alert(optResult);
				
				if(optResult.indexOf("成功")==-1){
					$("#oldPwd").val("");
					$("#pwd").val("");
					$("#newPwd").val("");
				}
			}
		 

	        $("#backToHomeButton").click(function() {
				window.history.go(-1);
	        });
		
</script>
</body>
</html>
