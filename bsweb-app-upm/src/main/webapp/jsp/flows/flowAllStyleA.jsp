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
		<table border="0" width=100% align="center">
    		<tr>
        		<td align="center" class="snaker_title">${flowProcess.displayName}
        			<hr width=100% size=2 color="#71B2CF">
        		</td>
    		</tr>
		</table>
		<c:if test="${flowOrder != null }">
		<table border="0" width=98% align="center" style="margin-top:5">
    		<tr>
        		<td align="left">
        			<font color="blue">编号：</font><font color="#800080">${flowOrder.orderNo}</font> &nbsp;
        			<font color="blue">派单时间：</font><font color="#800080">${flowOrder.createDate}</font>&nbsp;
				</td>
			</tr>
		</table>
		</c:if>
	    <div id="tabsDiv" style="margin: 0px;">
	         <ul class="nav nav-tabs " id="tabs">
  				</ul>
  				<div class="tab-content "></div>
	    </div>
	    
	    <script type="text/javascript">
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
							 iframeUrl =  node.form + '&processId=${processId}&orderId=${orderId}&taskName=' + node.name;
						}
						
						if(indexOfIframe!=-1 && indexOfSpecliA==-1){
							 iframeUrl =  node.form + '?processId=${processId}&orderId=${orderId}&taskName=' + node.name;
						}
						
						if(indexOfIframe==-1 && indexOfSpecliA!=-1){
							  iframeUrl = '${ctx}' + node.form + '&processId=${processId}&orderId=${orderId}&taskName=' + node.name;
						}
						
						if(indexOfIframe==-1 && indexOfSpecliA==-1){
							  iframeUrl = '${ctx}' + node.form + '?processId=${processId}&orderId=${orderId}&taskName=' + node.name;
						}
					  
						if(taskName == node.name || (taskName == '' && i == 0)) {
							iscurrent = true;
							iframeUrl += '&taskId=${taskId}&readonly=1';
						} else {
							iscurrent = false;
							iframeUrl += '&readonly=0';
						}
						
						var tab;
						
						if(iscurrent){
							$.addtabs.add({"id":"00"+i,"title":node.displayName,"url": iframeUrl,"target": "#tabs"});
						}
						
						if((taskName == '' &&  i == 0) || (!iscurrent && isAppNode==-1) )  {
							//$.addtabs.add({"id":i,"title":node.displayName,"url": iframeUrl,"target": "#tabs"});
						}
						
						if((taskName == '' &&  i == 0) || ((!iscurrent && isAppNode!=-1) )  ){
							
						}
						
						if(i == 0&& !iscurrent)  {
							$.addtabs.add({"id":"00"+i,"title":node.displayName,"url": iframeUrl,"target": "#tabs"});
						}
						
			            if(iscurrent) {
			            	curTab = tab;
			            	currentTabNo=i;
			            }
					}
					
					$.addtabs.add({"id":"8888","title":"审批流水","url": "${ctx}/jsp/flows/flowApproveList.jsp?processId=${processId}&orderId=${orderId}","target": "#tabs"});
					$.addtabs.add({"id":"9999","title":"流程图","url": "${ctx}/jsp/flows/flowProcessAction!flowDiagram.action?processId=${processId}&orderId=${orderId}","target": "#tabs"});
					
					//激活当前流程节点
					$("#tab_tab_00"+currentTabNo).addClass("active");
					$("#tab_00"+currentTabNo).addClass("active");
					
				}
			});
        });
    	</script>
	</body>
</html>
