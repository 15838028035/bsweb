<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

	<!-- modalmessage -->	
	<script src="${ctx}/scripts/modal/modalmsg.jsp" type="text/javascript"></script>
<!-- 	<script src="${ctx}/jsp/common/goldbank.jsp" type="text/javascript"></script> -->
	
	<!-- core -->	
	<script src="${ctx}/scripts/jquery/jquery.min.js" type="text/javascript"></script>

	<!-- ui -->
	<script src="${ctx}/scripts/jquery/jqueryui/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
	<!-- 手风琴效果-->
	<script src="${ctx}/scripts/jquery/jqueryui/ui/jquery.ui.accordion.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jqueryui/ui/jquery.ui.core.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jqueryui/ui/jquery.ui.widget.js" type="text/javascript"></script>
	
	<!-- jqgrid -->
	<link href="${ctx}/scripts/jquery/jqgrid/ui.jqgrid.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/scripts/jquery/jqgrid/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jqgrid/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jqgrid/src/jquery.fmatter.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jqgrid/src/grid.formedit.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jqgrid/src/grid.common.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jqgrid/src/grid.custom.js" type="text/javascript"></script>
    
    <!-- tips -->
	<link href="${ctx}/scripts/jquery/jtip/global.css" type="text/css" rel="stylesheet" />     
   	<script src="${ctx}/scripts/jquery/jtip/jtip.js" type="text/javascript"></script> 
   	
	<!-- tree -->
	<script src="${ctx}/scripts/tree/common-min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/tree/TreePanel.js" type="text/javascript"></script>		
    	
    <!-- dialog -->
    <script src="${ctx}/scripts/jquery/jquery-framedialog.js" type="text/javascript"></script>

	<!-- 渲染 -->
	<script src="${ctx}/scripts/jquery/jquery.bgiframe-2.1.1.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/jquery.tablegrid.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/layout_tradition.js" type="text/javascript"></script>
   	<script src="${ctx}/scripts/control.js" type="text/javascript"></script>
<!-- 	<script src="${ctx}/scripts/control_4A.jsp" type="text/javascript"></script>	 -->
	
	<!-- validate -->
	<link href="${ctx}/scripts/jquery/validate/jquery.validate.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/scripts/jquery/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/validate/messages_cn.js" type="text/javascript"></script>
	<!-- date format -->
	<script src="${ctx}/scripts/jquery/dateformat/jquery.dates.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery/dateformat/jquery.format-1.0.js" type="text/javascript"></script>
	
	<!-- datetime picker -->    
   	<script src="${ctx}/scripts/datePicker/WdatePicker.js" type="text/javascript"></script> 	
	
	<!-- ajax form -->
	<script src="${ctx}/scripts/jquery/jquery.form.js" type="text/javascript"></script>		
	
	<!-- 定时 -->
	<script src="${ctx}/scripts/jquery/jquery.timers-1.2.js" type="text/javascript"></script>
	
	<!-- util  function -->	
	<script src="${ctx}/scripts/common/util.js" type="text/javascript"></script>
	
	<!-- js inne get ctx -->
	<script type="text/javascript">
		if(typeof App == "undefined") {
			App = {};
		}
		App.path = '${ctx}/';
	</script>	

	
	