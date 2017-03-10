<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 

<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${classNameLower}管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<script>
		$(document).ready(function(){
			if('${r"${returnMessage}"}' != ""){
				showModalMessage("${r"${returnMessage}"}","doUpdateSuccess()");
			}
		});
		function doUpdateSuccess(){
			jQuery.FrameDialog.closeDialog();
		   	parent.location.reload();
		}
	</script>
</head>
<body>
<form action="${classNameLower}Action!commonSaveOrUpdate.action" method="post" name="${classNameLower}Form" id="${classNameLower}Form">
<input type="hidden" name="id" id="id" value="${r"${id}"}"/>
<input type="hidden" name="operate" id="operate" value="${r"${operate}"}" />
    <table>
        
        <#list table.columns as column>
        <tr>
			 <td align="right">${column.remarks}<font color="red">*</font></td>
			 <td>
			  <#if column.isDateTimeColumn>
				<input type="text" name="${classNameLower}.${column.columnNameLower}" id = "${column.columnNameLower}" value="<s:date name='${column.columnNameLower}' format='yyyy-MM-dd' />" class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
		 	 <#else>
		 	  <input type="text"  name="${classNameLower}.${column.columnNameLower}" id="${column.columnNameLower}" value="${r"${"}${classNameLower}.${column.columnNameLower}}" />
		 	  
		 	 </#if>
		 	 </td>
		 </tr>
    	</#list>
        <tr>
            <td>
            </td>
            <td>
 				<div class="window_button marg_lef10 float_lef"><input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1" value="保存"/></div>
		       	<div class="window_button marg_lef10 float_lef"><input type="button" id="backToHomeButton" class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="返回主页" /></div>
            </td>
        </tr>
    </table>
</form>
<script>
 $("#submitButton").click(function() {
        	$("#${classNameLower}Form").submit();
        	return false;
        })

		$("#${classNameLower}Form").validate({
			submitHandler: function(form){
				form.submit();
				$('#submitButton').prop('disabled',true);
			},
			rules: {
		       <#list table.columns as column>
		 		 "${classNameLower}.${column.columnNameLower}": {
					required: true,
					minlength:1,
					maxlength:50
		       }<#if column_has_next>,</#if>
    	</#list>
		    }
			
		});
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${r"${ctx}"}/index.jsp";
        });
</script>
</body>
</html>
