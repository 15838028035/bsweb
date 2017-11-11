<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<title>UPM用户权限管理系统--用户登录</title>

<style type="text/css">
.form-bg{
    background: #00b4ef;
}
.form-horizontal{
    background: #fff;
    padding-bottom: 40px;
    border-radius: 15px;
    text-align: center;
}
.form-horizontal .heading{
    display: block;
    font-size: 35px;
    font-weight: 700;
    padding: 35px 0;
    border-bottom: 1px solid #f0f0f0;
    margin-bottom: 30px;
}
.form-horizontal .form-group{
    padding: 0 30px;
    margin: 0 0 20px 0;
    position: relative;
}
.form-horizontal .form-control{
    background: #f0f0f0;
    border: none;
    border-radius: 20px;
    box-shadow: none;
    padding: 0 20px 0 45px;
    height: 40px;
    transition: all 0.3s ease 0s;
}
.form-horizontal .form-control:focus{
    background: #e0e0e0;
    box-shadow: none;
    outline: 0 none;
}
.form-horizontal .form-group i{
    position: absolute;
    top: 12px;
    left: 60px;
    font-size: 17px;
    color: #c8c8c8;
    transition : all 0.5s ease 0s;
}
.form-horizontal .form-control:focus + i{
    color: #00b4ef;
}

.form-horizontal .text{
    float: left;
    margin-left: 7px;
    line-height: 20px;
    padding-top: 5px;
    text-transform: capitalize;
}
.form-horizontal .btn{
    float: right;
    font-size: 14px;
    color: #fff;
    background: #00b4ef;
    border-radius: 30px;
    padding: 10px 25px;
    border: none;
    text-transform: capitalize;
    transition: all 0.5s ease 0s;
}
	</style>
	
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <form class="form-horizontal" action="${ctx}/loginAction!login.action" method="post" name="loginForm" id="loginForm">
                <span class="heading"><h3> 
                <c:if test="${springProfilesActive == 'dev'}">[开发环境]</c:if>
                <c:if test="${springProfilesActive == 'test'}">[测试环境]</c:if>
                <c:if test="${springProfilesActive == 'pro'}">[生产环境]</c:if>
                [${upmVersion}]
                </h3>UPM用户登录</span>
                <s:if test="hasActionErrors()">
		   			<div class="alert alert-warning" style="list-style:none">
		     			 <s:actionerror/>
		   			</div>
				</s:if>
               
                <div class="form-group">
                    <input type="text" class="form-control fa fa-user" id="loginNo" name="loginNo" placeholder="登陆账号或手机号码">
                </div>
                
                 <c:if test="${springProfilesActive == 'dev' || springProfilesActive == 'test'}">
	                <div class="form-group">
	                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="密码" value="123456">
	                </div>
	                 <div class="form-group">
                    <input type="text" class="form-control" id="identifyingCode" name="identifyingCode" placeholder="验证码" value="" maxLength="4">
                	</div>
                	 <div class="form-group">
                    <img id="identifyingCodeImg"   src="${ctx}/identifyingcode!getIdentifyingCodeNew.action"/>
                    <a id="identifyingCodeChange" href="javascript:" class="aBlue">看不清</a>
               		 </div>
                </c:if>
                
                <c:if test="${springProfilesActive == 'pro'}">
	                <div class="form-group">
	                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="密码">
	                </div>
	                 <div class="form-group">
                    <input type="text" class="form-control" id="identifyingCode" name="identifyingCode" placeholder="验证码" maxLength="4">
               		 </div>
               		  <div class="form-group">
                    <img id="identifyingCodeImg"   src="${ctx}/identifyingcode!getIdentifyingCodeNew.action"/>
                    <a id="identifyingCodeChange" href="javascript:" class="aBlue">看不清</a>
               		 </div>
                </c:if>
                
               
                <div class="form-group">
                    <button type="submit" class="btn btn-default btn-block" >登录</button>
                </div>
            </form>
           
        </div>
    </div>
    <div class="row">
    	<div class="footer">
    		<div class="alert alert-info">Copyright ©版权所有2017-2019 <br/>
    		 技术支持:${upmTeachMobile} <br/>
    		 微信号码:${upmWeiXinCode} <br/>
    		  邮箱号码:${upmEmailCode} <br/>
    		</div>
    	</div>
    </div>
</div>
<script type="text/javascript">

		$(document).ready(function(){
		     var result = jQuery.ajax({
		      	  url:"${ctx}/loginAction!getRand.action",
		          async:false,
		          cache:false,
		          dataType:"json",
		          method:"post"
		      }).responseText;
			var obj = eval("("+result+")");
			$("#identifyingCode").val(obj.opResult);
		});
			
			
$("#loginForm").bootstrapValidator({
	fields: {
 		 "loginNo": {
			message: '登陆账号或手机号码不能为空',
			validators: {  
               				 notEmpty: {  
                				message: '登陆账号或手机号码不能为空'  
                			} 
                			
            			}  
		
       },
 		 "pwd": {
			message: '密码不能为空',
			validators: {  
               				 notEmpty: {  
                				message: '密码不能为空'  
                			} 
                			
            			}  
		
       },
 		 "identifyingCode": {
			message: '验证码不能为空',
			validators: {  
               				 notEmpty: {  
                				message: '验证码不能为空'  
                			} 
                			
            			}  
		
       }
	},
	submitHandler: function(validator, form, submitButton) {  
       		 validator.defaultSubmit();  
    	}  
	
});
		 
		 $("#identifyingCodeChange").click(function(){
			 $("#identifyingCodeImg").attr("src",'${ctx}/identifyingcode!getIdentifyingCodeNew.action?nocache='+new Date().getTime());
		 }
		);
	</script>
</body>
</html>