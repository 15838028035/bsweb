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
	
		<link rel="stylesheet" href="${ctx}/scripts/flows/flow.css" type="text/css" />
		<script src="${ctx}/scripts/flows/raphael-min.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/dialog.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/snaker.designer.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/snaker.model.js" type="text/javascript"></script>
		<script src="${ctx}/scripts/flows/snaker.editors.js" type="text/javascript"></script>

<script type="text/javascript">
    function addTaskActor(taskName) {
        var url = '${ctx}/snaker/task/actor/add?orderId=${orderId}&taskName=' + taskName;
        var returnValue = window.showModalDialog(url,window,'dialogWidth:1000px;dialogHeight:600px');
        if(returnValue) {
            $('#currentActorDIV').append(',' + returnValue);
        }
    }
	function display(process, state) {
		/** view*/
		$('#snakerflow').snakerflow($.extend(true,{
			basePath : "${ctx}/scripts/flows/",
            ctxPath : "${ctx}",
            orderId : "${orderId}",
			restore : eval("(" + process + ")"),
			editable : false
			},eval("(" + state + ")")
		));
	}
</script>
</head>
	<body>
	<div class="container">
		<div class="row">
	      <div class="col-sm-12">
	      	 <div class="panel-body" style="padding-bottom:0px;">
		        <div class="panel panel-default">
		            <div class="panel-heading">
		            	<button type="button" id="backToHomeButton"  class="btn btn-primary btn-block">返回</button> 
		            </div>
		            <div class="panel-body">
		            	<div id="properties_all" >
						<div id="snakerflow" style="border: 1px solid #d2dde2; margin-top:10px; margin-left:10px; margin-bottom:10px; width:98%;">
						</div>
					</div>
		            </div>
		        </div>
	      </div>
   		</div>
   
	</div>
		<script type="text/javascript">
		  $("#backToHomeButton").click(function() {
	        	window.history.go(-1);
	        });
		  
		$.ajax({
				type:'GET',
				url:"${ctx}/jsp/flows/flowProcessAction!diagramJson.action",
				data:"processId=${processId}&orderId=${orderId}",
				async: false,
				globle:false,
				dataType:'json',
				error: function(){
					alert('数据处理错误！');
					return false;
				},
				success: function(data){
					display(data.process, data.state);
				}
			});
		</script>
	</body>
</html>
