<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>请假流程</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
</head>

	<body>
	
<div class="container">
<button type="button" id="backToHomeButton"  class="btn btn-primary btn-block">返回</button> 
<form action="${ctx }/jsp/flows/flowControllerAction!flowProcess.action" class="form-horizontal" method="post" name="inputForm" id="inputForm" role="form" target="mainFrame">
	
			<input type="hidden" name="processId" value="${processId }" />
			<input type="hidden" name="orderId" value="${orderId }" />
			<input type="hidden" name="taskId" value="${taskId }" />
			
			<div class="form-group">  
              <label for="S_apply.operator">请假人名称</label>  
            <input  class="form-control" type="text" id="S_apply.operator" name="S_apply.operator" value="${operator}"  />
        </div>
        <div class="form-group">  
              <label for="loginNo">请假理由</label>  
            <input  class="form-control" type="text" id="reason" name=S_reason value="${reason}"  />
        </div>
        <div class="form-group">  
              <label for="loginNo">请假天数</label>  
            <input  class="form-control" type="text" id="day" name="I_day" value="${I_day}"  />
        </div>
        <div class="form-group">  
              <label for="loginNo">请假理由</label>  
            <input  class="form-control" type="text" id="reason" name=S_reason value="${reason}"  />
        </div>
        
         <div class="form-group"> 
                  <button type="submit" id="submit"  class="btn btn-primary btn-block btn-lg btn-parsley">提交</button> 
        </div>
        
		</form>
		
	</div>
	
	</body>
</html>
