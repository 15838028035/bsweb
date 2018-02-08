<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp" %>
<%@ attribute name="processId" type="java.lang.String" required="true" description="流程定义ID"%>
<%@ attribute name="flowOrderId" type="java.lang.String" required="false" description="流程实例子ID"%>
<fieldset>
	<legend>流转信息</legend>
	<div id="flowTaskHistList">
		正在加载流转信息...
	</div>
</fieldset>
<script type="text/javascript">
var url="${ctx}//jsp/flows/flowTaskHistViewList.jsp?flowOrderId=${flowOrderId}";

	$.get(url, function(data){
		$("#flowTaskHistList").html(data);
	});
</script>