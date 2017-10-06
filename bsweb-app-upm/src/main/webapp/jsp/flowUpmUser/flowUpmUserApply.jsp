<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>用户申请流程管理</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
</head>

<body>
<div class="container">
	<form action="flowUpmUserAction!applySave.action"  class="form-horizontal"  method="post" name="flowUpmUserForm" id="flowUpmUserForm" >
	<input type="hidden" name="flowUpmUser.id" id="id" value="${flowUpmUser.id}"/>
	<input type="hidden" name="operate" id="operate" value="${operate}" />
	<input type="hidden" name="processId" value="${processId}" />
	<input type="hidden" name="orderId" value="${orderId}" />
	<input type="hidden" name="taskId" value="${taskId}" />
	
				<div class="form-group">  
	             <label for="loginNo">申请人</label>  
	           <input  class="form-control" type="text" id="operator" name="flowUpmUser.operator" value="${flowUpmUser.operator}"  readonly="readonly" />
	      	</div>
             <div class="form-group"> 
	      	 <label  for="flowUpmUser.applyType">申请类别 </label>  
              <input type="radio" id="applyType" name="flowUpmUser.applyType" value="1"   <c:if test="${flowUpmUser.applyType==1}">checked</c:if>/>申请
              <input type="radio" id="applyType" name="flowUpmUser.applyType" value="2"  <c:if test="${flowUpmUser.applyType==2}">checked</c:if>/>加锁
              <input type="radio" id="applyType" name="flowUpmUser.applyType" value="3"  <c:if test="${flowUpmUser.applyType==3}">checked</c:if>/>角色变更
              <input type="radio" id="applyType" name="flowUpmUser.applyType" value="4"  <c:if test="${flowUpmUser.applyType==4}">checked</c:if>/>组织机构变更
              <input type="radio" id="applyType" name="flowUpmUser.applyType" value="9"  <c:if test="${flowUpmUser.applyType==9}">checked</c:if>/>其它
             </div>
              
	        <div class="form-group">  
	             <label for="userName">操作时间</label>  
	            <input class="form-control" type="text" id="operatorTime" name="flowUpmUser.operatorTime" value="<s:date name="flowUpmUser.operatorTime"  format="yyyy-MM-dd  HH:mm:ss" />"  readonly="readonly"/>
	        </div>
	     	 <div class="form-group">  
              <label for="orgDesc">申请备注</label>  
            	<textarea  name="flowUpmUser.appMemo" id="appMemo" class="form-control" rows="3">${flowUpmUser.appMemo}</textarea> 
      		</div>
	       
	        <div class="form-group col-sm-12"> 
	       		  <button type="submit" id="submitButton"  class="btn btn-default">提交</button> 
	       		   <button type="button" id="backToHomeButton"  class="btn btn-default">取消</button> 
	       </div>
				
	</form>

</div>
<script>
        $('#flowUpmUserForm').bootstrapValidator({  
            fields: {  
                "flowUpmUser.appMemo": {
                    message: '申请备注不能为空',
                    validators: {
                        notEmpty: {
                            message: '申请备注不能为空'
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
