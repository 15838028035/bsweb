
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>权限管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/resource/scripts_all.jsp" %>
    <%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
<script  type="text/javascript">
	$(document).ready(function(){
			     
	      $(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii:ss',//格式化时间,
	             autoclose:true,//日期选择完成后是否关闭选择框
	             //minView: "month",//设置只显示到月份
	             clearBtn:true // 自定义属性,true 显示 清空按钮 false 隐藏 默认:true
	         });
	});

</script>

</head>
<body>
<div class="container">
<form action="upmPermissionAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="upmPermissionForm" id="upmPermissionForm" role="form">
<input type="hidden" name="upmPermission.id" id="id" value="${upmPermission.id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />

<input type="hidden" name="upmPermission.appId" id="appId" value="${upmPermission.appId}">
<input type="hidden" name="upmPermission.parentId" id="parentId" value="${parentId}">
<input type="hidden" name="oldName" id="oldName" value="${upmPermission.name }">
        
		 
      		<div class="form-group">
			 <label for="name">名称</label>
		 	  <input class="form-control" type="text"  name="upmPermission.name" id="name"  value="${upmPermission.name}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="type">类型</label>
		 	  <input class="form-control" type="text"  name="upmPermission.type" id="type"  value="${upmPermission.type}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="url">URL</label>
		 	  <input class="form-control" type="text"  name="upmPermission.url" id="url"  value="${upmPermission.url}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="code">code</label>
		 	  <input class="form-control" type="text"  name="upmPermission.code" id="code"  value="${upmPermission.code}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="keyCode">key_code</label>
		 	  <input class="form-control" type="text"  name="upmPermission.keyCode" id="keyCode"  value="${upmPermission.keyCode}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="state">状态(0:启用，1停用)</label>
		 	  <input class="form-control" type="text"  name="upmPermission.state" id="state"  value="${upmPermission.state}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="remark">备注</label>
		 	  <input class="form-control" type="text"  name="upmPermission.remark" id="remark"  value="${upmPermission.remark}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="sortNo">排序</label>
		 	  <input class="form-control" type="text"  name="upmPermission.sortNo" id="sortNo"  value="${upmPermission.sortNo}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="iconPath">图片路径</label>
		 	  <input class="form-control" type="text"  name="upmPermission.iconPath" id="iconPath"  value="${upmPermission.iconPath}" />
		 </div>
       
 	<div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton" onclick="window.location='${ctx}/jsp/permission/upmPermissionAction!turnToPermissionList.action?appId=${appId}&parentId=${parentId }'" class="btn btn-default">返回</button> 
        </div>	
    
</form>

</div>

<script   type="text/javascript">

		$("#upmPermissionForm").bootstrapValidator({
			
			fields: {
		 		 "upmPermission.appId": {
					message: '应用ID不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '应用ID不能为空'  
                        				} 
                    			}  
				
		       }
		 		 
		    },
 		submitHandler: function(validator, form, submitButton) {  
               		 validator.defaultSubmit();  
            	}  
			
		});
		
</script>
</body>
</html>
