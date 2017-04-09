<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script>
		$(document).ready(function(){
			if('${returnMessage}' != ""){
				showModalMessage("${returnMessage}","doUpdateSuccess()");
			}
		});
		function doUpdateSuccess(){
			jQuery.FrameDialog.closeDialog();
		   	parent.location.reload();
		}
	</script>
</head>
<body>
<form action="upmUserAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="userForm" id="userForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="upmUser.id" value="${id}"/>
<input type="hidden" name="operate" value="${operate}" />
        <div class="form-group">  
             <label class="col-xs-3 control-label">登录名</label>  
            <div class="col-xs-8"><input type="text" id="loginNo" name="upmUser.loginNo" value="${loginNo}"  /></div>
       	</div>
       <div class="form-group">  
             <label class="col-xs-3 control-label">密码</label>  
            <div class="col-xs-8"><input type="text" id="pwd" name="upmUser.pwd" value="${pwd}" maxlength="200"/> </div>
        </div>
         <div class="form-group">  
             <label class="col-xs-3 control-label">用户名</label>  
             <div class="col-xs-8"><input type="text" id="userName" name="upmUser.userName" value="${userName}" maxlength="50"/></div>
         </div>
         <div class="form-group">  
             <label class="col-xs-3 control-label">组织机构描述</label>  
            <div class="col-xs-8"><input type="text" id="orgDesc" name="upmUser.orgDesc" value="${orgDesc}" maxlength="50"/></div>
      	</div>
         <div class="form-group">  
             <label class="col-xs-3 control-label">手机号码 </label>  
             <div class="col-xs-8"><input type="text" id="mobile" name="upmUser.mobile" value="${mobile}" maxlength="15"/> </div>
        </div>
         <div class="form-group">  
             <label class="col-xs-3 control-label">email</label>  
             <div class="col-xs-8"><input type="text" id="mobile" name="upmUser.email" value="${email}" maxlength="15"/> </div>
        </div>
        
        <div  class="modal-footer">  
        		  <button type="submit" class="btn btn-success btn-shadow btn-shadow-success ">保存</button>      
                <button type="button" class="btn btn-default btn-shadow btn-shadow-default ">返回主页</button>  
        </div>
</form>
<script>
		$("#userForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		       "upmUser.loginNo": {
					required: true,
					minlength:1,
					maxlength:50
		       },
		       "upmUser.pwd": {
					required: true,
					minlength:6,
					maxlength:200
		       },
		        "upmUser.userName": {
					required: true,
					minlength:2,
					maxlength:10
		       },
		        "upmUser.orgDesc": {
					required: true,
					maxlength:50
		       },
		        "upmUser.mobile": {
					required: true,
					minlength:11,
					maxlength:15
		       }
		    }
			
		});
        
        $('#userForm').bootstrapValidator({  
            fields: {  
            	"upmUser.loginNo": {  
                message: 'The username is not valid',  
                validators: {  
                    notEmpty: {  
                    message: 'The username is required and can\'t be empty'  
                    }  
                	}
        		},
                "upmUser.pwd": {  
                    message: 'The username is not valid',  
                    validators: {  
                        notEmpty: {  
                        message: 'The username is required and can\'t be empty'  
                        }  
                    }  
                },
                "upmUser.userName": {  
                    message: 'The username is not valid',  
                    validators: {  
                        notEmpty: {  
                        message: 'The username is required and can\'t be empty'  
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
