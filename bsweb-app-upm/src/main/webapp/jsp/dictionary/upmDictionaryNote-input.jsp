<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>应用管理</title>
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
<form action="upmDictionaryNoteAction!commonSaveOrUpdate.action" method="post" name="upmDictionaryNoteForm" id="upmDictionaryNoteForm">
<input type="hidden" name="upmDictionaryNote.id" id="id" value="${id}"/>
<input type="hidden" name="upmDictionaryNote.appId" id="appId" value="${upmDictionaryNote.appId}"/>
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
            <td align="right">类型编码<font color="red">*</font> </td>
            <td><input type="text" id="typeCode" name="upmDictionaryNote.typeCode" value="${upmDictionaryNote.typeCode}" maxLength="100" /></td>
        </tr>
          <tr>
            <td align="right">描述<font color="red">*</font></td>
             <td><input type="text" id="typeDesc" name="upmDictionaryNote.typeDesc" value="${upmDictionaryNote.typeDesc}" maxlength="100"/> </td>
        </tr>
        <tr>
            <td>
 				<div class=" marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
		       	<div class=" marg_lef10 float_lef"><input type="button" id="backToHomeButton" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="返回主页" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
        $("#submitButton").click(function() {
        	$("#upmDictionaryNoteForm").submit();
        	return false;
        })

		$("#upmDictionaryNoteForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		       "upmDictionaryNote.typeCode": {
					required: true,
					minlength:2,
					maxlength:100
		       },
		       "upmDictionaryNote.typeDesc": {
					required: true,
					minlength:2,
					maxlength:100,
		       }
		    }
			
		});

        $("#backToHomeButton").click(function() {
			window.history.go(-1);
        });
</script>
</body>
</html>
