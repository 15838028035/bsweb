<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>流程状态</title>
		 <%@ include file="/jsp/common/meta.jsp" %>
		<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
		<%@ include file="/jsp/common/resource/styles_all.jsp" %>
    	
	</head>
	<body>

       	<button type="button" id="backToHomeButton"  class="btn btn-primary btn-block">返回</button> 
       	<div class="col-sm-12">流程名称:${flowProcess.displayName}</div>
       	<div class="col-sm-12">当前节点:${flowTask.taskName}</div>
          	
      <c:if test="${flowOrder != null }">
      <div class="col-sm-12">流程编号:${flowOrder.orderNo}</div>
      <div class="col-sm-12">派单时间:${flowOrder.createDate}</div>
      </c:if>
					
		<div class="panel-group" id="accordion">
				<div class="panel panel-default">  
				    <div class="panel-heading">  
				      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">当前节点</a></h4>  
				    </div>  
				    <div id="#collapse1" class="panel-collapse collapse in">  
				      <div class="panel-body">
				      <iframe  id="currentNodeIframe" src="" 
  					 width="100%;" height="auto";>
   					 </iframe>
				      </div>  
				    </div>  
				  </div>  
				  
				<div class="panel panel-default">  
				    <div class="panel-heading">  
				      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">转办任务信息</a></h4>  
				    </div>  
				    <div id="#collapse2" class="panel-collapse collapse in">  
				      <div class="panel-body">
				     转办任务信息
				      </div>  
				    </div>  
				  </div>  
				  
				<div class="panel panel-default">  
				    <div class="panel-heading">  
				      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">审批日志</a></h4>  
				    </div>  
				    <div id="#collapse3" class="panel-collapse collapse in">  
				      <div class="panel-body">
				        <iframe src="${ctx}/jsp/flows/flowControllerAction!goToFlowApproveLogList.action?processId=${processId}&orderId=${orderId}&sortName=id&sortOrder=desc" 
  					 width="100%; min-height:400px;" height="auto";>
   					 </iframe>
				      </div>  
				    </div>  
				  </div>  
				    
				  <div class="panel panel-default">  
				    <div class="panel-heading">  
				      <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">流程图</a></h4>  
				    </div>  
				    <div id="#collapse4" class="panel-collapse collapse in">  
				      <div class="panel-body">
				       <iframe src="${ctx}/jsp/flows/flowProcessAction!flowDiagram.action?processId=${processId}&orderId=${orderId}" 
									   width="100%;" height="auto";>
									    </iframe>
				      </div>  
				    </div>  
				  </div>  
			</div>  
	    
	    <script type="text/javascript">
	    $("#backToHomeButton").click(function() {
        	window.history.go(-1);
        });
    	</script>
	</body>
</html>
