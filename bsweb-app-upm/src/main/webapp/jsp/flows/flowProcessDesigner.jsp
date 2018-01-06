<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
		<title>流程展现</title>
		 <%@ include file="/jsp/common/meta.jsp" %>
		<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
		<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
		<link rel="stylesheet" href="${ctx}/scripts/flows/flow.css" type="text/css" />
		<script src="${ctx}/scripts/flows/raphael-min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/dialog.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/CleverTabs/scripts/jquery.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/CleverTabs/scripts/jquery-ui.js" type="text/javascript"></script>
		
		<script src="${ctx}/scripts/flows/snaker.designer.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/snaker.model.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/snaker.editors.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				var json="${flowProcessJson}";
				var model = "";
				if(json) {
					model=eval("(" + json + ")");
				}
				$('#snakerflow').snakerflow({
					basePath : "${ctx}/scripts/flows/",
                    ctxPath : "${ctx}",
					restore : model,
                    formPath : "forms/",
					tools : {
						save : {
							onclick : function(data) {
								saveModel(data);
							}
						}
					}
				});
			});
			
			function saveModel(data) {
			
				alert("提交信息:" + data);
				
				bootbox.confirm("您确认要提交么？",function (result) {  
	                if(result) {  
	                	$.ajax({
	    					type:'POST',
	    					url:"${ctx}/jsp/flows/flowProcessAction!processDeployXml.action",
	    					data:"flowContentStr=" + data + "&id=${id}",
	    					async: false,
	    					globle:false,
	    					error: function(){
	    						alert('数据处理错误!');
	    						return false;
	    					},
	    					success: function(data){
	    						if(data == 'true') {
	    							bootbox.confirm('数据保存成功,您确认要返回流程定义页面吗?',function (result) {  
	    				                if(result) {  
	    				                	window.location.href = "${ctx}/jsp/flows/flowProcessList.jsp";
	    				                }
	    				        	});
	    						} else {
	    							bootbox.alert("数据处理错误！出现异常");
	    						}
	    					}
	    				});
	                }
	        	});
				
			}
		</script>					
</head>
<body>
<div class="container">
<button type="button" id="backToHomeButton"  class="btn btn-primary btn-block">返回</button> 
<div id="toolbox" style="margin-top:50px">
<div id="toolbox_handle">工具集</div>
<div class="node" id="save"><img src="${ctx}/scripts/flows/images/save.gif" />&nbsp;&nbsp;保存</div>
<div>
<hr />
</div>
<div class="node selectable" id="pointer">
    <img src="${ctx}/scripts/flows/images/select16.gif" />&nbsp;&nbsp;Select
</div>
<div class="node selectable" id="path">
    <img src="${ctx}/scripts/flows/images/16/flow_sequence.png" />&nbsp;&nbsp;transition
</div>
<div>
<hr/>
</div>
<div class="node state" id="start" type="start"><img
	src="${ctx}/scripts/flows/images/16/start_event_empty.png" />&nbsp;&nbsp;start</div>
<div class="node state" id="end" type="end"><img
	src="${ctx}/scripts/flows/images/16/end_event_terminate.png" />&nbsp;&nbsp;end</div>
<div class="node state" id="task" type="task"><img
	src="${ctx}/scripts/flows/images/16/task_empty.png" />&nbsp;&nbsp;task</div>
<div class="node state" id="task" type="custom"><img
	src="${ctx}/scripts/flows/images/16/task_empty.png" />&nbsp;&nbsp;custom</div>
<div class="node state" id="task" type="subprocess"><img
	src="${ctx}/scripts/flows/images/16/task_empty.png" />&nbsp;&nbsp;subprocess</div>
<div class="node state" id="fork" type="decision"><img
	src="${ctx}/scripts/flows/images/16/gateway_exclusive.png" />&nbsp;&nbsp;decision</div>
<div class="node state" id="fork" type="fork"><img
	src="${ctx}/scripts/flows/images/16/gateway_parallel.png" />&nbsp;&nbsp;fork</div>
<div class="node state" id="join" type="join"><img
	src="${ctx}/scripts/flows/images/16/gateway_parallel.png" />&nbsp;&nbsp;join</div>
</div>

<div id="properties">
<div id="properties_handle">属性</div>
<table class="properties_all" cellpadding="0" cellspacing="0">
</table>
<div>&nbsp;</div>
</div>

<div id="snakerflow"></div>

</div>

   <script type="text/javascript">
	    $("#backToHomeButton").click(function() {
        	window.history.go(-1);
        });
    </script>
    	
</body>
</html>