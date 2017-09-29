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
</head>

<body>
<div class="container">
	<form action="flowBorrowTestAction!applySave.action"  class="form-horizontal"  method="post" name="flowBorrowTestForm" id="flowBorrowTestForm" >
	<input type="hidden" name="flowBorrowTest.id" id="id" value="${id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
	<input type="hidden" name="processId" value="${processId}" />
	<input type="hidden" name="orderId" value="${orderId}" />
	<input type="hidden" name="taskId" value="${taskId}" />
	
		<div class="form-group">  
	             <label for="loginNo">申请人</label>  
	           <input  class="form-control" type="text" id="operator" name="flowBorrowTest.operator" value="${flowBorrowTest.operator}"  readonly="readonly" />
	      	</div>
	      <div class="form-group">  
	            <label for="pwd">借款金额</label>  
	           <input  class="form-control" type="text" id="operatorAmount" name="flowBorrowTest.operatorAmount" value="${flowBorrowTest.operatorAmount}" />
	       </div>
	        <div class="form-group">  
	             <label for="userName">操作时间</label>  
	            <input class="form-control" type="text" id="operatorTime" name="flowBorrowTest.operatorTime" value="${flowBorrowTest.operatorTime}"  readonly="readonly"/>
	        </div>
	        <div class="form-group">  
	             <label for="orgDesc">归还时间</label>  
	          <input  class="form-control" type="text" id="repayTime" name="flowBorrowTest.repayTime" value="${flowBorrowTest.repayTime}"  readonly="readonly"/>
	     	</div>
	     	 <div class="form-group">  
              <label for="orgDesc">申请备注</label>  
            	<textarea  name="flowBorrowTest.appMemo" id="appMemo" class="form-control" rows="3">${flowBorrowTest.appMemo}</textarea> 
      		</div>
	       
	        <div class="form-group col-sm-12"> 
	       		  <button type="submit" id="submitButton"  class="btn btn-default">提交</button> 
	       		   <button type="button" id="backToHomeButton"  class="btn btn-default">取消</button> 
	       </div>
				
	</form>

</div>
<script>
        $('#flowBorrowTestForm').bootstrapValidator({  
            fields: {  
                "flowBorrowTest.operatorAmount": {
                    message: '手机号码不能为空',
                    validators: {
                        notEmpty: {
                            message: '借款金额不能为空'
                        },
                        numeric: {
                        	 message: '请输入正确的借款金额,金额为数字'
                        }
                    }
                }
            },
            
            submitHandler: function(validator, form, submitButton) {  
                validator.defaultSubmit();  
            }  
        }); 
		
        $("#backToHomeButton").click(function() {
			window.parent.location.href="${ctx}/index.jsp";
        });
</script>
</body>
</html>
