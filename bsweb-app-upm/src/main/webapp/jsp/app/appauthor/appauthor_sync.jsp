<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<s:set name="appId" value="#parameters.appId[0]"></s:set>
<s:set name="syncTypes" value="#parameters.syncTypes[0]"></s:set>
<s:set name="adminAcctSeq" value="#parameters.adminAcctSeq[0]"></s:set>
<s:set name="appCode" value="#parameters.appCode[0]"></s:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>

		<script type="text/javascript">

			$(function() {
			//效果渲染
				contralEffect.contain();
				contralEffect.blueButton();
				
				$.ajax({
				 	type: "POST",
				 	url: "${ctx}/jsp/app/appauthor/commonappauthormng!syncAuthor.action?id="+new Date().getTime(),
				 	data:"appCode=${appCode}&appId=${appId}&adminAcctSeq=${adminAcctSeq}&syncTypes=${syncTypes}",
				  	aync:true,
				  	success: function(msg){}
				 });
				 
				$('body').everyTime('5s', 'A', checkSyncStatus, 300);
			});

			function checkSyncStatus(){
			   $.ajax({
				 	type: "GET",
				 	url: "${ctx}/jsp/app/entity/commonappentity!checkSyncStatus.action?id="+new Date().getTime(),
				 	data: "appId=${appId}",
				  	dataType: "text",
				  	success: function(msg){
				    	if(msg == "1"){
				    		//$("#syncAuthorDoing").remove();
				    		//$("#syncAuthorSuc").append("<s:text name='appentity.syncAuthor.success' />").append("<br />");
				    		//$("#syncAuthorButton").attr("value", "<s:text name='common.options.ok' />");
				    		$('body').stopTime();
				    	}
				    	if(msg == "3"){
				    		//$("#syncAuthorDoing").remove();
				    		//$("#syncAuthorSuc").append("<s:text name='appentity.syncAuthor.failure' />").append("<br />");
				    		//$("#syncAuthorButton").attr("value", "<s:text name='common.options.ok' />");
				    		$('body').stopTime();
				    	}
				    }
				});
			}

			function closesyncAuthorWindow(){
				$('body').stopTime();
				$.FrameDialog.closeDialog();
			}

		</script>

	</head>
	<body>

		<div id="syncAuthorDoing">
			<s:text name="app.entity.syncing"></s:text>
			<br />
			<img src="${ctx}/images/jindutiao.gif" />
			<br />
		</div>
		<div id="syncAuthorSuc">
		</div>
		<div class="window_button marg_lef10 float_lef">
			<input id="syncAuthorButton" type="button"
				value="<s:text name="app.entity.lookafter"></s:text>"
				class="window_button_centerInput window_button_centerInput1"
				onclick="closesyncAuthorWindow();" />
		</div>
	</body>
</html>
