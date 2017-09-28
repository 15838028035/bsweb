<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>流程审批管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
</head>
<body>

<form action="${ctx}/jsp/flows/flowControllerAction!doApproval.action" class="form-horizontal" method="post" name="flowApproveForm" id="flowApproveForm" role="form" target="mainFrame">
<input type="hidden" name="flowApprove.processId" id="processId" value="${param.processId}" />
<input type="hidden" name="flowApprove.orderId" id="orderId" value="${param.orderId}" />
<input type="hidden" name="flowApprove.taskId" id="taskId" value="${param.taskId}" />
<input type="hidden" name="flowApprove.taskName" id="taskName" value="${param.taskName}" />

        <div class="form-group">  
              <label for="loginNo">操作人</label>  
            <input  class="form-control" type="text" id="operator" name="flowApprove.operator" value="${flowApprove.operator}"  />
       	</div>
         <div class="form-group">  
              <label for="userName">审批结果</label>  
              <input type="radio" name="flowApprove.optResult" value="agree" checked="checked"/>同意
			  <input type="radio" name="flowApprove.optResult" value="disagree"/>不同意
         </div>
         <div class="form-group">  
              <label for="orgDesc">审批描述</label>  
            <textarea  name="flowApprove.optContent" id="optContent" class="form-control" rows="3">${flowApprove.optContent}</textarea> 
      	</div>
      	<div class="form-group">  
              <label for="orgDesc">添加流程参与者</label>  
             <input  class="form-control" type="text" id="addOperator" name="addOperator" value=""  />
              <button type="button" id="btn_addOperator"  class="btn btn-default" onclick="addActor()">添加</button> 
               <button type="button" id="btn_addOperatorTip"  class="btn btn-default" onclick="addTaskActorJsonTip()">获得参与者</button> 
      	</div>
         
        <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">取消</button> 
        </div>
</form>

<script>

function addActor() {
    var orderId = $("#orderId").val();
    var taskName = $("#taskName").val();
    var operator = $("#addOperator").val();
    var postData = {"orderId":orderId,"taskName":taskName,"operator":operator}
    $.ajax({
        type:'POST',
        url:"${ctx}/jsp/flows/flowTaskAction!addTaskActor.action",
        data:postData,
        async: false,
        globle:false,
        error: function(){
            bootbox.alert("数据处理错误！");
            return false;
        },
        success: function(data){
        	bootbox.alert("操作成功");
        }
    });
}

function addTaskActorJsonTip() {
    var orderId = $("#orderId").val();
    var taskName = $("#taskName").val();
    var operator = $("#addOperator").val();
    var postData = {"orderId":orderId,"taskName":taskName,"operator":operator}
    $.ajax({
        type:'POST',
        url:"${ctx}/jsp/flows/flowTaskAction!addTaskActorJsonTip.action",
        data:postData,
        async: false,
        globle:false,
        dataType:"json",
        error: function(){
            bootbox.alert("数据处理错误！");
            return false;
        },
        success: function(data){
        	$("#addOperator").val(data.actors);
        }
    });
}

	$('#flowApproveForm').bootstrapValidator({  
	    submitHandler: function(validator, form, submitButton) {  
	        validator.defaultSubmit();  
	    }  
	});  
		
       $("#backToHomeButton").click(function() {
		history.back();
       });
       
   	$(document).ready(function(){
   		addTaskActorJsonTip();
	});
</script>
</body>
</html>
