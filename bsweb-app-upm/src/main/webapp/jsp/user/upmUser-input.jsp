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
<form action="upmUserAction!commonSaveOrUpdate.action" method="post" name="userForm" id="userForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="upmUser.id" value="${id}"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
            <td align="right">登录名<font color="red">*</font> </td>
            <td><input type="text" id="loginNo" name="upmUser.loginNo" value="${loginNo}" maxLength="50" /></td>
        </tr>
        <tr>
            <td align="right">密码<font color="red">*</font></td>
            <td><input type="text" id="pwd" name="upmUser.pwd" value="${pwd}" maxlength="200"/> </td>
        </tr>
          <tr>
            <td align="right">用户名<font color="red">*</font></td>
             <td><input type="text" id="userName" name="upmUser.userName" value="${userName}" maxlength="50"/> </td>
        </tr>
         <tr>
            <td align="right">组织机构描述<font color="red">*</font></td>
             <td><input type="text" id="orgDesc" name="upmUser.orgDesc" value="${orgDesc}" maxlength="50"/> </td>
        </tr>
         <tr>
            <td align="right">手机号码 <font color="red">*</font></td>
             <td><input type="text" id="mobile" name="upmUser.mobile" value="${mobile}" maxlength="15"/> </td>
        </tr>
         <tr>
            <td align="right">email<font color="red">*</font></td>
             <td><input type="text" id="mobile" name="upmUser.email" value="${email}" maxlength="15"/> </td>
        </tr>
        
        <tr>
            <td>
            </td>
            <td>
 				<div class=" marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
		       	<div class=" marg_lef10 float_lef"><input type="button" id="backToHomeButton" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="返回主页" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
        $("#submitButton").click(function() {
        	$("#userForm").submit();
        	return false;
        })

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

        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
