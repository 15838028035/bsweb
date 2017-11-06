<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>历史任务管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/resource/scripts_all.jsp" %>
    <%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
<script  type="text/javascript">
	$(document).ready(function(){
			     
	     $(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii',//格式化时间,
	             autoclose:true,//日期选择完成后是否关闭选择框
	         });
	});

</script>

</head>
<body>
<div class="container">
<form action="flowTaskHistAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="flowTaskHistForm" id="flowTaskHistForm" role="form">
<input type="hidden" name="flowTaskHist.id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
   
      		<div class="form-group">
			 <label for="taskVefrsion">任务版本</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.taskVefrsion" id="taskVefrsion"  value="${flowTaskHist.taskVefrsion}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="flowOrderId">流程实例ID</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.flowOrderId" id="flowOrderId"  value="${flowTaskHist.flowOrderId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="taskName">任务名称</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.taskName" id="taskName"  value="${flowTaskHist.taskName}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="displayName">显示名称</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.displayName" id="displayName"  value="${flowTaskHist.displayName}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="performType">参与类型</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.performType" id="performType"  value="${flowTaskHist.performType}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="taskType">任务类型</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.taskType" id="taskType"  value="${flowTaskHist.taskType}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="operator">操作者</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.operator" id="operator"  value="${flowTaskHist.operator}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createTime">创建时间</label>
				<input class="form-control" type="text" name="flowTaskHist.createTime" id = "createTime" value="${flowTaskHist.createTime}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="finishTime">完成时间</label>
				<input class="form-control" type="text" name="flowTaskHist.finishTime" id = "finishTime" value="${flowTaskHist.finishTime}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="expireTime">过期时间</label>
				<input class="form-control" type="text" name="flowTaskHist.expireTime" id = "expireTime" value="${flowTaskHist.expireTime}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="expireDate">过期日期</label>
				<input class="form-control" type="text" name="flowTaskHist.expireDate" id = "expireDate" value="${flowTaskHist.expireDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="remindDate">提醒日期</label>
				<input class="form-control" type="text" name="flowTaskHist.remindDate" id = "remindDate" value="${flowTaskHist.remindDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="actionUrl">action_URL</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.actionUrl" id="actionUrl"  value="${flowTaskHist.actionUrl}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="parentTaskId">父ID</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.parentTaskId" id="parentTaskId"  value="${flowTaskHist.parentTaskId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="variable">流程变量</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.variable" id="variable"  value="${flowTaskHist.variable}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createBy">创建人</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.createBy" id="createBy"  value="${flowTaskHist.createBy}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createByUname">建创人姓名</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.createByUname" id="createByUname"  value="${flowTaskHist.createByUname}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createDate">创建日期</label>
				<input class="form-control" type="text" name="flowTaskHist.createDate" id = "createDate" value="${flowTaskHist.createDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="updateBy">更新人</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.updateBy" id="updateBy"  value="${flowTaskHist.updateBy}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="updateByUname">更新人姓名</label>
		 	  <input class="form-control" type="text"  name="flowTaskHist.updateByUname" id="updateByUname"  value="${flowTaskHist.updateByUname}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="updateDate">更新日期</label>
				<input class="form-control" type="text" name="flowTaskHist.updateDate" id = "updateDate" value="${flowTaskHist.updateDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
       
 	   <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
        </div>
       
    
</form>
</div>

<script   type="text/javascript">
		$("#flowTaskHistForm").bootstrapValidator(
				
 		submitHandler: function(validator, form, submitButton) {  
               		 validator.defaultSubmit();  
            	}  
			
		});
		
        $("#backToHomeButton").click(function() {
			window.history.go(-1);
        });
</script>
</body>
</html>
