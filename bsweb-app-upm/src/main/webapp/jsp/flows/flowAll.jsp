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
		
		<link rel="stylesheet" href="${ctx}/styles/css/style.css" type="text/css" media="all" />
    	<link rel="stylesheet" href="${ctx}/scripts/flows/CleverTabs/context/themes/base/style.css" type="text/css" />
    	<link rel="stylesheet" href="${ctx}/scripts/flows/CleverTabs/context/themes/base/jquery-ui.css" type="text/css" />
    	
	    <script src="${ctx}/scripts/flows/CleverTabs/scripts/jquery.js" type="text/javascript"></script>
	    <script src="${ctx}/scripts/flows/CleverTabs/scripts/jquery-ui.js" type="text/javascript"></script>
	    <script src="${ctx}/scripts/flows/CleverTabs/scripts/jquery.contextMenu.js" type="text/javascript"></script>
	    <script src="${ctx}/scripts/flows/CleverTabs/scripts/jquery.cleverTabs.js" type="text/javascript"></script>
	    <script type="text/javascript">
        var tabs;
        var taskName = "${flowTask.taskName}";
        $(function () {
            tabs = $('#tabs').cleverTabs();
            $(window).bind('resize', function () {
                tabs.resizePanelContainer();
            });
          /*   var diagramTab = tabs.add({
            	url: '${ctx}/jsp/flows/flowProcessAction!flowDiagram.action?processId=${processId}&orderId=${orderId}',
            	label: '流程图',
            	locked: true
            });
            diagramTab.activate(); */
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
					for(var i = 0; i < data.length; i++) {
						var node = data[i];
						var iframeUrl = '${ctx }' + node.form + '?processId=${processId}&orderId=${orderId}&taskName=' + node.name;
						if(taskName == node.name || (taskName == '' && i == 0)) {
							iscurrent = true;
							iframeUrl += '&taskId=${taskId}&readonly=1';
						} else {
							iscurrent = false;
							iframeUrl += '&readonly=0';
						}
			            var tab = tabs.add({
			                url: iframeUrl,
			                label: node.displayName,
			                locked: true
			            });
			            tab.activate();
			            if(iscurrent) {
			            	curTab = tab;
			            	tab.mark();
			            }
					}
					if(curTab) curTab.activate();
				}
			});
        });
    	</script>
	</head>
	<body>
		<table border="0" width=100% align="center">
    		<tr>
        		<td align="center" class="snaker_title">${flowProcess.displayName }
        			<hr width=100% size=2 color="#71B2CF">
        		</td>
    		</tr>
		</table>
		<c:if test="${flowOrder != null }">
		<table border="0" width=98% align="center" style="margin-top:5">
    		<tr>
        		<td align="left">
        			<font color="blue">编号：</font><font color="#800080">${flowOrder.orderNo }</font> &nbsp;
        			<font color="blue">派单时间：</font><font color="#800080">${flowOrder.createDate}</font>&nbsp;
				</td>
			</tr>
		</table>
		</c:if>
	    <div id="tabs" style="margin: 0px;">
	        <ul>
	        </ul>
	    </div>
	    
	    <iframe src="${ctx}/jsp/flows/flowProcessAction!flowDiagram.action?processId=${processId}&orderId=${orderId}" 
	   width="100%;" height="auto";>
	    </iframe>
	</body>
</html>
