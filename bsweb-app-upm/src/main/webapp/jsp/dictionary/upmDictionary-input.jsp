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
<form action="upmDictionaryAction!commonSaveOrUpdate.action" method="post" name="upmDictionaryForm" id="upmDictionaryForm">
<input type="hidden" name="upmDictionary.id" id="id" value="${id}"/>
<input type="hidden" name="upmDictionary.nodeId" id="nodeId" value="${upmDictionary.nodeId}" />
<input type="hidden" name="operate" value="${operate}" />
    <table>
        <tr>
            <td align="right">类型编码<font color="red">*</font> </td>
            <td><input type="text" id="typeCode" name="upmDictionary.typeCode" value="${upmDictionary.typeCode}" maxLength="10" /></td>
        </tr>
        <tr>
            <td align="right">数据编码<font color="red">*</font></td>
            <td><input type="text" id="dataCode" name="upmDictionary.dataCode" value="${upmDictionary.dataCode}" maxlength="20"/> </td>
        </tr>
          <tr>
            <td align="right">描述<font color="red">*</font></td>
             <td><input type="text" id="dataDesc" name="upmDictionary.dataDesc" value="${upmDictionary.dataDesc}" maxlength="200"/> </td>
        </tr>
         <tr>
            <td align="right">排序编号<font color="red">*</font></td>
             <td><input type="text" id="sortNo" name="upmDictionary.sortNo" value="${upmDictionary.sortNo}" maxlength="10"/> </td>
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
        	$("#upmDictionaryForm").submit();
        	return false;
        })

		$("#upmDictionaryForm").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		        "upmDictionary.dataDesc": {
					required: true,
					minlength:1,
					maxlength:200
		       },
		       "upmDictionary.sortNo": {
					required: true,
					minlength:1,
					maxlength:10
		       }
		    }
			
		});

        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
