<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>组织机构管理</title>
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
<form action="upmUserGroupAction!save.action" method="post" name="upmUserForm" id="upmUserForm">
<input type="hidden" name="id" value="${id}"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
            <td align="right">组织机构编码<font color="red">*</font> </td>
            <td><input type="text" id=userGroupCode name="userGroupCode" value="${userGroupCode}" maxLength="200" /></td>
        </tr>
          <tr>
            <td align="right">组织机构名称<font color="red">*</font></td>
             <td><input type="text" id="userGroupName" name="userGroupName" value="${userGroupName}" maxlength="200"/> </td>
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
        	$("#upmUserForm").submit();
        	return false;
        })

		$("#upmUserForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		       "userGroupCode": {
					required: true,
					minlength:2,
					maxlength:200
		       },
		        "userGroupName": {
					required: true,
					minlength:2,
					maxlength:200
		       }
		    }
			
		});

        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
