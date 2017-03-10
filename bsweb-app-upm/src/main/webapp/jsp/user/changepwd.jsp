<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理-->修改密码</title>
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
<form action="userAction!updateAcctPwd.action" method="post" name="userForm" id="userForm">
    <table>
        <tr>
            <td align="right">旧密码<font color="red">*</font></td>
            <td><input type="password" id="oldPwd" name="oldPwd" maxlength="10"/> </td>
        </tr>
        
        <tr>
            <td align="right">新密码<font color="red">*</font></td>
            <td><input type="password" id="pwd" name="pwd" maxlength="10"/> </td>
        </tr>
        
         <tr>
            <td align="right">确认密码<font color="red">*</font></td>
            <td><input type="password" id="newPwd" name="newPwd" maxlength="10"/> </td>
        </tr>
        
        <tr>
            <td>
            </td>
            <td>
 				<div class=" marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="更改密码"/></div>
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
				showModalConfirmation('确认要修改么',"doChangePwd()");
			},
			rules: {
		       "oldPwd": {
					required: true,
					minlength:6,
					maxlength:10
		       },
		       "pwd": {
					required: true,
					minlength:6,
					maxlength:10
		       },
		        "newPwd": {
					required: true,
					minlength:6,
					maxlength:10
		       }
		    }
			
		});
		
		
		function doChangePwd() {
			var oldPwd = $("#oldPwd").val();
	    	var pwd = $("#pwd").val();
	    	var newPwd = $("#newPwd").val();
	    	
	    	var queryUrl = "${ctx}/jsp/user/userAction!updateAcctPwd.action?oldPwd="+oldPwd+"&pwd="+pwd+"&newPwd="+newPwd;
            var result = jQuery.ajax({
		      	  url:queryUrl,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			var optResult = obj.opResult;
			showModalMessage(optResult);
			
			if(optResult.indexOf("成功")==-1){
				$("#oldPwd").val("");
				$("#pwd").val("");
				$("#newPwd").val("");
			}
		}
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
