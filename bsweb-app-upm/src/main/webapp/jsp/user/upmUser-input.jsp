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
	<script>
		$(document).ready(function(){
			if('${returnMessage}' != ""){
				bootbox.alert("${returnMessage}");
			}
		});
	</script>
</head>
<body>
<form action="upmUserAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="userForm" id="userForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="upmUser.id" value="${id}"/>
<input type="hidden" name="operate" value="${operate}" />
        <div class="form-group">  
              <label for="loginNo">登录名</label>  
            <input  class="form-control" type="text" id="loginNo" name="upmUser.loginNo" value="${loginNo}"  />
       	</div>
       <div class="form-group">  
             <label for="pwd">密码</label>  
            <input  class="form-control" type="text" id="pwd" name="upmUser.pwd" value="${pwd}" />
        </div>
         <div class="form-group">  
              <label for="userName">用户名</label>  
             <input class="form-control" type="text" id="userName" name="upmUser.userName" value="${userName}" />
         </div>
         <div class="form-group">  
              <label for="orgDesc">组织机构描述</label>  
           <input  class="form-control" type="text" id="orgDesc" name="upmUser.orgDesc" value="${orgDesc}"/>
      	</div>
         <div class="form-group">  
              <label for="mobile">手机号码 </label>  
             <input  class="form-control" type="text" id="mobile" name="upmUser.mobile" value="${mobile}" />
        </div>
         <div class="form-group">  
             <label for="email">email</label>  
             <input  class="form-control" type="text" id="email" name="upmUser.email" value="${email}"/>
        </div>
        
        <div class="form-group"> 
        		  <button type="submit" id="save" class="btn btn-success btn-shadow btn-shadow-success ">保存</button> 
        		   <button type="button" id="backToHomeButton" class="btn btn-success ">保存</button> 
        </div>
</form>
<script>
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
                        } ,
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        }
                    }  
                },
                "upmUser.userName": {  
                    message: 'The username is not valid',  
                    validators: {  
                        notEmpty: {  
                        message: 'The username is required and can\'t be empty'  
                        } ,
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
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
