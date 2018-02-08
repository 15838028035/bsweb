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
      <div>流程名称:${flowProcess.displayName}</div>
      <c:if test="${flowOrder != null }">
      <div>流程编号:${flowOrder.orderNo}</div>
      <div>派单时间:${flowOrder.createDate}</div>
      </c:if>
	    
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
						
						
						if(iscurrent){
							 $("#taskIframe").attr("src",iframeUrl);
						}
						
					}
					
				}
			});
        });
        
    	</script>
    	
    	<iframe src=""  id="taskIframe"
                                  width="100%;" height="auto";>
        </iframe>
                                        
    	<!-- 审批日志信息 -->
    	<flows:flowAuditLog processId="${processId}" orderId="${orderId}" />
    	<!-- 历史任务 -->
    	<flows:flowTaskHist  processId="${processId}"  flowOrderId="${orderId}" />
	</body>
</html>
