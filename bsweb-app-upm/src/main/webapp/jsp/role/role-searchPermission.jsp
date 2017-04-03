<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<style>
		.TreePanel {
			font-size: 12px;
			color: #666;
			font-family: verdana, geneva, arial, helvetica, sans-serif;
			white-space: nowrap;
			overflow-x:auto;
			overflow-y:auto;
			width:95%;	
			padding: 3px;
		}
		</style>
		<script type="text/javascript">
		var tree;
		$(document).ready(function(){
			contralEffect.contain();
			contralEffect.blueButton();
			try{
				tree = new TreePanel({
					renderTo:'treediv',
					'root' : (${JsonData}=='none')?null:${JsonData},
					'iconPath' : "${ctx}/scripts/tree/img/",
					'switchType' : 'client',
					'ajaxAction' : "${ctx}/jsp/syscfg/role/role!getPermissionTree.action?strRoleId=${uapRole.id}"
				});
				tree.render();
			}catch(e){
				tree = null;
				$("#treediv").hide();
				$("#showErrmsg").show();
			}
			
		});

	</script>
	</head>
	<body>
		<div class="contain_search">
			<div id="treediv">
			</div>
			<div id="showErrmsg" style="display:none" align="center">
				<br/>
					<span style='color:red'><s:text name="noPermission"/></span>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$(".TreePanel").css({"width":"99%","height":"320px"});
			});
	    	$("#returnBtn").click(function(){
	    		window.history.go(-1);
	    	})
	    </script>
	</body>
</html>
