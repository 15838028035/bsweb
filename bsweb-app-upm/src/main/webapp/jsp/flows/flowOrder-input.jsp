
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>flowOrder管理</title>
    <%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/resource/scripts_all.jsp" %>
    <%@ include file="/jsp/common/resource/styles_all.jsp" %>
	
<script  type="text/javascript">
	$(document).ready(function(){
			     
	     $(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii',//格式化时间,
	             autoclose:true,//日期选择完成后是否关闭选择框
	         });
	});

</script>

</head>
<body>
<div class="container">
<form action="flowOrderAction!commonSaveOrUpdate.action" class="form-horizontal" method="post" name="flowOrderForm" id="flowOrderForm" role="form">
<input type="hidden" name="flowOrder.id" id="id" value="${id}"/>
<input type="hidden" name="operate" id="operate" value="${operate}" />
   
      		<div class="form-group">
			 <label for="orderNo">流程编号</label>
		 	  <input class="form-control" type="text"  name="flowOrder.orderNo" id="orderNo"  value="${flowOrder.orderNo}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="orderVersion">版本号</label>
		 	  <input class="form-control" type="text"  name="flowOrder.orderVersion" id="orderVersion"  value="${flowOrder.orderVersion}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="flowProcessId">流程定义ID</label>
		 	  <input class="form-control" type="text"  name="flowOrder.flowProcessId" id="flowProcessId"  value="${flowOrder.flowProcessId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="parentId">父ID</label>
		 	  <input class="form-control" type="text"  name="flowOrder.parentId" id="parentId"  value="${flowOrder.parentId}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="parentNodeName">父节点名称</label>
		 	  <input class="form-control" type="text"  name="flowOrder.parentNodeName" id="parentNodeName"  value="${flowOrder.parentNodeName}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="expireTime">过期时间</label>
				<input class="form-control" type="text" name="flowOrder.expireTime" id = "expireTime" value="${flowOrder.expireTime}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="priority">优先级</label>
		 	  <input class="form-control" type="text"  name="flowOrder.priority" id="priority"  value="${flowOrder.priority}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="variable">流程变量</label>
		 	  <input class="form-control" type="text"  name="flowOrder.variable" id="variable"  value="${flowOrder.variable}" />
		 </div>
		 
      		<div class="form-group">
			 <label for="createBy">创建人</label>
		 	  <input class="form-control" type="text"  name="flowOrder.createBy" id="createBy"  value="${flowOrder.createBy}" readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="createByUname">创建人姓名</label>
		 	  <input class="form-control" type="text"  name="flowOrder.createByUname" id="createByUname"  value="${flowOrder.createByUname}" readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="createDate">创建日期</label>
				<input class="form-control" type="text" name="flowOrder.createDate" id = "createDate" value="${flowOrder.createDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="updateBy">更新人</label>
		 	  <input class="form-control" type="text"  name="flowOrder.updateBy" id="updateBy"  value="${flowOrder.updateBy}" readonly="readonly" />
		 </div>
		 
      		<div class="form-group">
			 <label for="updateByUname">更新人</label>
		 	  <input class="form-control" type="text"  name="flowOrder.updateByUname" id="updateByUname"  value="${flowOrder.updateByUname}" readonly="readonly"/>
		 </div>
		 
      		<div class="form-group">
			 <label for="updateDate">更新日期</label>
				<input class="form-control" type="text" name="flowOrder.updateDate" id = "updateDate" value="${flowOrder.updateDate}" class="datetimepicker"  readonly="readonly"/>
		 </div>
		 
       
 	   <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
        </div>
    
</form>

</div>

<script>

		$("#flowOrderForm").bootstrapValidator({
			
			fields: {
		 		 "flowOrder.orderNo": {
					message: '流程编号不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '流程编号不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 6,
                           		 max: 30,
                           			 message: '流程编号必须在6到30之间'
                        		} 
                    			}  
				
		       },
		 		 "flowOrder.flowProcessId": {
					message: '流程定义ID不能为空',
					validators: {  
                       				 notEmpty: {  
                        				message: '流程定义ID不能为空'  
                        				} ,
                        			stringLength: {
                          			  min: 1,
                           		 max: 100,
                           			 message: '流程定义ID必须在1到100之间'
                        		} 
                    			}  
				
		       }
		    },
 		submitHandler: function(validator, form, submitButton) {  
               		 validator.defaultSubmit();  
            	}  
			
		});
		
        $("#backToHomeButton").click(function() {
			window.history.go(-1);
        });
</script>
</body>
</html>
