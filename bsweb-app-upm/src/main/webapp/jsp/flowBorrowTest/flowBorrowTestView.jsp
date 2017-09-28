<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>借款测试流程</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>

<script language="javascript"  type="text/javascript">
$(document).ready(function(){
	 	$(".datetimepicker").datetimepicker({
	       	 language: 'zh-CN',//显示中文
	         format: 'yyyy-mm-dd',//显示格式
	         minView: "month",//设置只显示到月份
	         clearBtn:true,   //加入清空
	         initialDate: new Date(),//初始化当前日期
	         autoclose: true,//选中自动关闭
	         todayBtn: true//显示今日按钮
		         });
	});
</script>

</head>

<body>
<div class="container">
	<form action="flowBorrowTestAction!applySave.action"  class="form-horizontal"  method="post" name="flowBorrowTestForm" id="flowBorrowTestForm">
	<input type="hidden" name="flowBorrowTest.id" id="id" value="${id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
	<input type="hidden" name="processId" value="${processId}" />
	<input type="hidden" name="orderId" value="${orderId}" />
	<input type="hidden" name="taskId" value="${taskId}" />
	
		<div class="form-group">  
	             <label for="loginNo">申请人</label>  
	           <input  class="form-control" type="text" id="operator" name="flowBorrowTest.operator" value="${flowBorrowTest.operator}" readonly="readonly"  />
	      	</div>
	      <div class="form-group">  
	            <label for="pwd">借款金额</label>  
	           <input  class="form-control" type="text" id="operatorAmount" name="flowBorrowTest.operatorAmount" value="${flowBorrowTest.operatorAmount}"   readonly="readonly"/>
	       </div>
	        <div class="form-group">  
	             <label for="userName">操作时间</label>  
	            <input class="form-control "  type="text" id="operatorTime" name="flowBorrowTest.operatorTime" value="<s:date name="flowBorrowTest.operatorTime"  format="yyyy-MM-dd  HH:mm:ss" />"   readonly="readonly"/>
	       
	        </div>
	        <div class="form-group">  
	             <label for="orgDesc">归还时间</label>  
	          <input  class="form-control" type="text" id="repayTime" name="flowBorrowTest.repayTime" value="<s:date name="flowBorrowTest.repayTime"  format="yyyy-MM-dd HH:mm:ss" />" readonly="readonly"/>
	     	</div>
	     	 <div class="form-group">  
              <label for="orgDesc">申请备注</label>  
            	<textarea  name="flowBorrowTest.appMemo" id="appMemo" class="form-control" rows="3" disabled="disabled">${flowBorrowTest.appMemo}</textarea> 
      		</div>
				
	</form>
</div>

</body>
</html>
