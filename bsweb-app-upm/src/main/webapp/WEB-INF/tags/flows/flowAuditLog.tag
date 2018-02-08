<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp" %>
<%@ attribute name="processId" type="java.lang.String" required="true" description="流程定义ID"%>
<%@ attribute name="orderId" type="java.lang.String" required="false" description="流程实例子ID"%>
<fieldset>
	<legend>审批日志</legend>
	<div id="flowAuditLogList">
		正在加载审批日志信息...
	</div>
</fieldset>
<script type="text/javascript">
var url="${ctx}/jsp/flows/flowControllerAction!goToFlowApproveLogList.action?processId=${processId}&orderId=${orderId}&sortName=id&sortOrder=desc";

	$.get(url, function(data){
		$("#flowAuditLogList").html(data);
	});
</script>