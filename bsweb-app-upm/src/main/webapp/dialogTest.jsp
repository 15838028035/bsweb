<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
		<title>bootstrap3-dialog</title>
		 <%@ include file="/jsp/common/meta.jsp" %>
		<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
		<%@ include file="/jsp/common/resource/styles_all.jsp" %>
		<script src="${ctx}/scripts/flows/dialog.js" type="text/javascript"></script>
						
</head>
<body>
对话框使用:
<button class="btn btn-primary" id="showErr">showErr</button>
<button class="btn btn-primary" id="showConfirm">showConfirm</button>
<button class="btn btn-primary" id="showSuccessTimeout">showSuccessTimeout</button>
<button class="btn btn-primary" id="selectUserTest">selectUserTest</button>

<script type="text/javascript">
		$("#showErr").click(function (){
			$.showErr("错题提示",doCallBack);
		});
		$("#showConfirm").click(function (){
			$.showConfirm("showConfirm",doCallBack);
		});
		$("#showSuccessTimeout").click(function (){
			$.showSuccessTimeout("showSuccessTimeout",doCallBack);
		});
		
		function doCallBack() {
			alert("callack");
		}
		
		$("#selectUserTest").click(function (){
			var url =  "${ctx}/jsp/user/upmUserSelectNew.jsp";
			$.iframeDialog("showSuccessTimeout",url,doCallBack2);
		});
		
		function doCallBack2() {
			var childdoc = document.getElementById("iframeDialog").contentWindow.document;
			var returnValue = childdoc.getElementById("returnValue").value;
		}
		
		</script>	
</body>
</html>