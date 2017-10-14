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
<form action="upmUserAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="userForm" id="userForm" role="form">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="upmUser.id" value="${upmUser.id}"/>
<input type="hidden" name="operate" value="${operate}" />
        <div class="form-group">  
              <label for="loginNo">登录名</label>  
            <input  class="form-control" type="text" id="loginNo" name="upmUser.loginNo" value="${upmUser.loginNo}"  />
       	</div>
       <div class="form-group">  
             <label for="pwd">密码</label>  
            <input  class="form-control" type="text" id="pwd" name="upmUser.pwd" value="${upmUser.pwd}" />
        </div>
         <div class="form-group">  
              <label for="userName">用户名</label>  
             <input class="form-control" type="text" id="userName" name="upmUser.userName" value="${upmUser.userName}" />
         </div>
         <div class="form-group">  
              <label for="orgDesc">组织机构描述</label>  
           <input  class="form-control" type="text" id="orgDesc" name="upmUser.orgDesc" value="${upmUser.orgDesc}"/>
      	</div>
         <div class="form-group">  
              <label for="mobile">手机号码 </label>  
             <input  class="form-control" type="text" id="mobile" name="upmUser.mobile" value="${upmUser.mobile}" />
        </div>
         <div class="form-group">  
             <label for="email">email</label>  
             <input  class="form-control" type="text" id="email" name="upmUser.email" value="${upmUser.email}"/>
        </div>
        <div class="form-group"> 
          		<label for="upmUser.lockStatus">锁定状态 </label>  
              <input type="radio" id="lockStatus" name="upmUser.lockStatus" value="0"   <c:if test="${upmUser.lockStatus==0}">checked</c:if>/>否
              <input type="radio" id="lockStatus" name="upmUser.lockStatus" value="1"  <c:if test="${upmUser.lockStatus==1}">checked</c:if>/>是
         </div>
        
        <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">取消</button> 
        </div>
</form>
</div>
<script   type="text/javascript">

        $('#userForm').bootstrapValidator({  
            fields: {  
            	"upmUser.loginNo": {  
                message: '登录账号不能为空',  
                validators: {  
                    notEmpty: {  
                    message: '登录账号不能为空'  
                    }  
                	}
        		},
                "upmUser.pwd": {  
                    message: '密码不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '密码不能为空'  
                        } ,
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码长度必须在6到30之间'
                        }
                    }  
                },
                "upmUser.userName": {  
                    message: '用户名不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '用户名不能为空'  
                        } ,
                        stringLength: {
                            min: 2,
                            max: 30,
                            message: '用户名长度必须在2到30之间'
                        } 
                    }  
                },
                "upmUser.mobile": {
                    message: '手机号码不能为空',
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '请输入11位手机号码'
                        },
                        regexp:{
                            regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                            message: '请输入正确的手机号码'
                        }
                    }
                },
                
                "upmUser.email": {
                    message: '邮箱不能为空',
                    validators: {
                        email: {
                        validators: {
                        emailAddress: {
                        message: '邮箱地址不正确'
                        }
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
