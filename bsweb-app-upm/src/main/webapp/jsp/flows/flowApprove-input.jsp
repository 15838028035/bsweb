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
	<script src="${ctx}/scripts/flows/dialog.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
	<form action="${ctx}/jsp/flows/flowControllerAction!doApproval.action" class="form-horizontal" method="post" name="flowApproveForm" id="flowApproveForm" role="form" target="mainFrame">
	<input type="hidden" name="flowApprove.processId" id="processId" value="${param.processId}" />
	<input type="hidden" name="flowApprove.orderId" id="orderId" value="${param.orderId}" />
	<input type="hidden" name="flowApprove.taskId" id="taskId" value="${param.taskId}" />
	<input type="hidden" name="flowApprove.taskName" id="taskName" value="${taskName}" />
	
	<input type="hidden" name="processId" value="${processId }" />
	<input type="hidden" name="orderId" value="${orderId }" />
	<input type="hidden" name="taskId" value="${taskId }" />
			
	
        <div class="form-group">  
             <label for="flowApprove.optResult">审批意见</label>  
             <input type="radio" name="flowApprove.optResult" value="0" checked="checked" onclick="transfer('1')"/>同意
		    <input type="radio"  name="flowApprove.optResult" value="-1" onclick="transfer('-1')"/>不同意
		     <input type="radio" name="flowApprove.optResult" value="1" onclick="transfer('2')"/>转派
        </div>
        <div class="form-group">  
             <label for="flowApprove.optContent">审批描述</label>  
           <textarea  name="flowApprove.optContent" id="optContent" class="form-control" rows="3">${flowApprove.optContent}</textarea> 
     	</div>
     	<div class="form-group">  
             <label for="addOperator">当前审批参与者</label>  
            <input  class="form-control" type="text" id="addOperator" name="addOperator" value=""  />
             <button type="button" id="btn_addOperator"  class="btn btn-default" onclick="addActor()">添加会审参与者</button> 
              <button type="button" id="btn_addOperatorTip"  class="btn btn-default" onclick="addTaskActorJsonTip()">查看当前审批参与者</button> 
     	</div>
     	
		<div class="form-group" id="transferDIV" style="display: none">  
             <label for="ccOperatorName">转派</label>  
             <input type="hidden" id="nextOperator" name="nextOperator" value="" />
             <input  class="form-control" type="text" id="nextOperatorName" name="nextOperatorName" value=""   readonly="readonly"  />
             <input type='button' class='btn btn-default' value='选择转派人员' onclick="selectOrg('${ctx}', 'nextOperator', 'nextOperatorName')"/>
     	</div>
     			
     	<div class="form-group">  
             <label for="ccOperatorName">抄送</label>  
             <input type="hidden" id="ccOperator" name="ccOperator" value="" />
             <input  class="form-control" type="text" id="ccOperatorName" name="ccOperatorName" value=""   readonly="readonly"  />
             <input type='button' class='btn btn-default' value='选择抄送人员' onclick="selectOrg('${ctx}', 'ccOperator', 'ccOperatorName')"/>
     	</div>
      
       <div class="form-group"> 
       		  <button type="submit" id="save"  class="btn btn-default">提交</button> 
       </div>
	</form>
</div>
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
     
	function transfer(flag) {
		if(flag == '2') {
			document.all['transferDIV'].style.display = "block";
		} else {
			document.all['transferDIV'].style.display = "none";
		}
	}
	
   	$(document).ready(function(){
   		addTaskActorJsonTip();
	});
</script>
</body>
</html>
