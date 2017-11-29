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
	<div class="container">
		<div class="row">
			<div class="panel-body" style="padding-bottom:0px;">
		        <div class="panel panel-default">
		            <div class="panel-heading">
		            	<button type="button" id="backToHomeButton"  class="btn btn-primary btn-block">返回</button> 
		            </div>
		            <div class="panel-body">
		            	<div class="col-sm-12">流程名称:${flowProcess.displayName}</div>
		            	<div class="col-sm-12">当前节点:${flowTask.taskName}</div>
		            	
				      <c:if test="${flowOrder != null }">
				      <div class="col-sm-12">流程编号:${flowOrder.orderNo}</div>
				      <div class="col-sm-12">派单时间:${flowOrder.createDate}</div>
				      </c:if>
					</div>
		            </div>
		        </div>
	      </div>
	      
	   </div>
		<div class="row">	
		    <div class="col-sm-12" style="margin: 0px;">
		    		<div class="panel-body" style="padding-bottom:0px;">
			        	<div class="panel panel-default">
			            <div class="panel-heading">当前节点</div>
			            <div class="panel-body">
			            	<iframe  id="currentNodeIframe" src="" 
	  					 width="100%;" height="auto";>
	   					 </iframe>
						</div>
					</div>
					
	  				<div class="panel-body" style="padding-bottom:0px;">
			        	<div class="panel panel-default">
			            <div class="panel-heading">转办任务信息</div>
			            <div class="panel-body">
							转办任务信息
						</div>
					</div>
					<div class="panel-body" style="padding-bottom:0px;">
			        	<div class="panel panel-default">
			            <div class="panel-heading">审批日志</div>
			            <div class="panel-body">
							  <iframe src="${ctx}/jsp/flows/flowApproveList.jsp?processId=${processId}&orderId=${orderId}" 
	  					 width="100%;" height="auto";>
	   					 </iframe>
						</div>
					</div>
					<div class="panel-body" style="padding-bottom:0px;">
			        	<div class="panel panel-default">
			            <div class="panel-heading">流程图</div>
			            <div class="panel-body">
			              <iframe src="${ctx}/jsp/flows/flowProcessAction!flowDiagram.action?processId=${processId}&orderId=${orderId}" 
						   width="100%;" height="auto";>
						    </iframe>
						</div>
					</div>
		        </div>
		  </div>
	  </div>
	    
	    <script type="text/javascript">
	    $("#backToHomeButton").click(function() {
        	window.history.go(-1);
        });
	    
        var tabs;
        var taskName = "${flowTask.taskName}";
        $(function () {
          
            $.ajax({
				type:'GET',
				url:"${ctx}/jsp/flows/flowControllerAction!flowNodeJson.action",
				data:"processId=${processId}",
				dataType:'json',
				async: false,
				globle:false,
				error: function(){
					bootbox.alert('数据处理错误！');
					return false;
				},
				success: function(data) {
					var curTab;
					var iscurrent = false;
					var currentTabNo = 0;
					
					for(var i = 0; i < data.length; i++) {
						var node = data[i];
						
						//TODO:替换特殊字符 node.form = node.form.replaceAll('#7','&');//替换特殊字符
						
						var indexOfIframe = node.form.indexOf("iframe:");
						var indexOfSpecliA = node.form.indexOf("?");
						
						var isAppNode =  node.form.indexOf("isAppNode");
						
						if(indexOfIframe!=-1 && indexOfSpecliA!=-1){
							 iframeUrl =  node.form + '&processId=${processId}&orderId=${orderId}&taskName=' + encodeURI(encodeURI(node.name));
						}
						
						if(indexOfIframe!=-1 && indexOfSpecliA==-1){
							 iframeUrl =  node.form + '?processId=${processId}&orderId=${orderId}&taskName=' + encodeURI(encodeURI(node.name));
						}
						
						if(indexOfIframe==-1 && indexOfSpecliA!=-1){
							  iframeUrl = '${ctx}' + node.form + '&processId=${processId}&orderId=${orderId}&taskName=' + encodeURI(encodeURI(node.name));
						}
						
						if(indexOfIframe==-1 && indexOfSpecliA==-1){
							  iframeUrl = '${ctx}' + node.form + '?processId=${processId}&orderId=${orderId}&taskName=' + encodeURI(encodeURI(node.name));
						}
					  
						if(taskName == node.name || (taskName == '' && i == 0)) {
							iscurrent = true;
							iframeUrl += '&taskId=${taskId}&readonly=1';
						} else {
							iscurrent = false;
							iframeUrl += '&readonly=0';
						}
						
						
						if(i == 0&& !iscurrent)  {
							$.addtabs.add({"id":"00"+i,"title":node.displayName,"url": iframeUrl,"target": "#tabs"});
						}
						
			            if(iscurrent) {
			            	curTab = tab;
			            	currentTabNo=i;
			            }
					}
					
					
				}
			});
        });
        
    	</script>
	</body>
</html>
