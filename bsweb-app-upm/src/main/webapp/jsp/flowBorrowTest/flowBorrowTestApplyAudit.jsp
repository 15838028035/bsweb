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
				var orderId = "124";
				
				$("#testButton").click(function() {
					$.getJSON("${ctx}/jsp/flowBorrowTest/flowBorrowTestAction!viewFlowBorrowTestApplyInfo.action?orderId=" + orderId , function(data){
						 var html= Mustache.render($("#auditTemplate").html(),data);
					});
				});
		});
</script>
</head>

<body>
<div class="container">
	<button type="button" id="testButton"  class="btn btn-default">测试提交</button> 
	<script type="text/template" id="auditTemplate">
		<form action="flowBorrowTestAction!applySave.action"  class="form-horizontal"  method="post" name="flowBorrowTestForm" id="flowBorrowTestForm" >
	
	      <div class="form-group">  
	            <label for="operatorAmount">借款金额</label>  
	           <input  class="form-control" type="text" id="operatorAmount" name="flowBorrowTest.operatorAmount" value="" />
				{{operatorAmount}}
	       </div>
	       
	        <div class="form-group col-sm-12"> 
	       		  <button type="submit" id="submitButton"  class="btn btn-default">提交</button> 
	       		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
	       </div>
				
	</form>
	</script>

</div>
</body>
</html>
