<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>借款测试流程审批</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
<script type="text/javascript">
		$(document).ready(function() {
			loadData();	
		});
		
		function loadData() {
			var orderId = "124";
			$.getJSON("${ctx}/jsp/flowBorrowTest/flowBorrowTestAction!viewFlowBorrowTestApplyInfo.action?orderId=" + orderId , function(data){
				console.log(data); 
				var template = $('#auditTemplate').html();
				  Mustache.parse(template);   // optional, speeds up future uses
				//var html= Mustache.render($("#auditTemplate").html(),data);
				var html = Mustache.render(template, {appMemo: "appMemoaaaa"});
				console.log(html);
				$('#auditTemplate').html(html);  
				$('#auditTemplate').show();
			});
		}
</script>

</head>

<body>
<div class="container">
	<button type="button" id="testButton"  class="btn btn-default">测试提交</button> 
	<script type="x-tmpl-mustache" id="auditTemplate">
	       <h1>Hello dddddddddddddddddddddddddddddddd {{appMemo}}</h1>
	</script>

</div>

</body>
</html>
