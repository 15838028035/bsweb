<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>流程任务管理</title>
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
<form action="flowTaskAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="flowTaskForm" id="flowTaskForm" role="form">
<input type="hidden" name="flowTask.id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
		 
      		<div class="form-group">
			 <label for="taskVefrsion">任务版本</label>
		 	  <input class="form-control" type="text"  name="flowTask.taskVefrsion" id="taskVefrsion"  value="${flowTask.taskVefrsion}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="flowOrderId">流程实例ID</label>
		 	  <input class="form-control" type="text"  name="flowTask.flowOrderId" id="flowOrderId"  value="${flowTask.flowOrderId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="taskName">任务名称</label>
		 	  <input class="form-control" type="text"  name="flowTask.taskName" id="taskName"  value="${flowTask.taskName}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="displayName">显示名称</label>
		 	  <input class="form-control" type="text"  name="flowTask.displayName" id="displayName"  value="${flowTask.displayName}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="performType">任务参与类型</label>
		 	  <input class="form-control" type="text"  name="flowTask.performType" id="performType"  value="${flowTask.performType}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="taskType">任务类型</label>
		 	  <input class="form-control" type="text"  name="flowTask.taskType" id="taskType"  value="${flowTask.taskType}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="operator">操作者</label>
		 	  <input class="form-control" type="text"  name="flowTask.operator" id="operator"  value="${flowTask.operator}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createTime">创建时间</label>
				<input class="form-control" type="text" name="flowTask.createTime" id = "createTime" value="${flowTask.createTime}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="finishTime">完成时间</label>
				<input class="form-control" type="text" name="flowTask.finishTime" id = "finishTime" value="${flowTask.finishTime}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="expireTime">过期时间</label>
				<input class="form-control" type="text" name="flowTask.expireTime" id = "expireTime" value="${flowTask.expireTime}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="expireDate">过期日期</label>
				<input class="form-control" type="text" name="flowTask.expireDate" id = "expireDate" value="${flowTask.expireDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="remindDate">提醒日期</label>
				<input class="form-control" type="text" name="flowTask.remindDate" id = "remindDate" value="${flowTask.remindDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="actionUrl">实例化URL</label>
		 	  <input class="form-control" type="text"  name="flowTask.actionUrl" id="actionUrl"  value="${flowTask.actionUrl}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="parentTaskId">父ID</label>
		 	  <input class="form-control" type="text"  name="flowTask.parentTaskId" id="parentTaskId"  value="${flowTask.parentTaskId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="variable">流程变量</label>
		 	  <input class="form-control" type="text"  name="flowTask.variable" id="variable"  value="${flowTask.variable}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createBy">创建人</label>
		 	  <input class="form-control" type="text"  name="flowTask.createBy" id="createBy"  value="${flowTask.createBy}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createByUname">创建人姓名</label>
		 	  <input class="form-control" type="text"  name="flowTask.createByUname" id="createByUname"  value="${flowTask.createByUname}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createDate">创建日期</label>
				<input class="form-control" type="text" name="flowTask.createDate" id = "createDate" value="${flowTask.createDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="updateBy">更新人</label>
		 	  <input class="form-control" type="text"  name="flowTask.updateBy" id="updateBy"  value="${flowTask.updateBy}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="updateByUname">更新人姓名</label>
		 	  <input class="form-control" type="text"  name="flowTask.updateByUname" id="updateByUname"  value="${flowTask.updateByUname}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="updateDate">更新日期</label>
				<input class="form-control" type="text" name="flowTask.updateDate" id = "updateDate" value="${flowTask.updateDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="flowVersion">流程版本</label>
		 	  <input class="form-control" type="text"  name="flowTask.flowVersion" id="flowVersion"  value="${flowTask.flowVersion}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="flowName">流程名称</label>
		 	  <input class="form-control" type="text"  name="flowTask.flowName" id="flowName"  value="${flowTask.flowName}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="instanceUrl">实例化URL</label>
		 	  <input class="form-control" type="text"  name="flowTask.instanceUrl" id="instanceUrl"  value="${flowTask.instanceUrl}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="flowProcessId">流程定义ID</label>
		 	  <input class="form-control" type="text"  name="flowTask.flowProcessId" id="flowProcessId"  value="${flowTask.flowProcessId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="actorIds">流程参与者</label>
		 	  <input class="form-control" type="text"  name="flowTask.actorIds" id="actorIds"  value="${flowTask.actorIds}" />
		 </div>
       
 	  <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
        </div>
        
</form>
</div>

<script   type="text/javascript">

		$("#flowTaskForm").bootstrapValidator({
		 		 "flowTask.taskName": {
					message: '任务名称不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '任务名称不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 1,
                           		 max: 300,
                           			 message: '任务名称必须在1到300之间'
                        		} 
                    			}  
		 		
		    },
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
