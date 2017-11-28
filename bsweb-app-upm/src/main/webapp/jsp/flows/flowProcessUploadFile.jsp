<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>流程定义</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

</head>

<body>
<form id="inputForm" action="${ctx}/jsp/flows/flowProcessAction!processDeployUploadFile.action" method="post" enctype="multipart/form-data" class="form-horizontal" novalidate="novalidate">
		<div class="control-group">
			<label class="control-label">流程文件：</label>
			<div class="controls">
				<input id="templateFile" name="templateFile" class="required form-control" aria-required="true" type="file">
				<span class="help-inline">支持文件格式：xml</span>
			</div>
		</div>
	</form>

<script language="javascript">
$("#templateFile").fileinput();
$(document).ready(function(){
	if('${returnMessage}' != ""){
		bootbox.alert("${returnMessage}");
	}
});
</script>
</body>
</html>
