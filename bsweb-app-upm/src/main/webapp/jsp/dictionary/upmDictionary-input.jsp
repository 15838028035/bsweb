<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>数据字典项列表修改</title>
	<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
</head>
<body>
<div class="container">
	<form action="upmDictionaryAction!commonSaveOrUpdate.action" class="form-horizontal"  method="post" name="upmDictionaryForm" id="upmDictionaryForm"  role="form">
	<input type="hidden" name="upmDictionary.id" id="id" value="${id}"/>
	<input type="hidden" name="upmDictionary.nodeId" id="nodeId" value="${upmDictionary.nodeId}" />
	<input type="hidden" name="operate" value="${operate}" />
	        
	        <div class="form-group">  
	         <label for="typeCode">类型编码</label>  
	        <input  class="form-control" type="text" id="typeCode" name="upmDictionary.typeCode" value="${upmDictionary.typeCode}"  />
	 		</div>
	 		<div class="form-group">  
	         <label for="dataCode">数据编码</label>  
	        <input  class="form-control" type="text" id="dataCode" name="upmDictionary.dataCode" value="${upmDictionary.dataCode}"  />
	 		</div>
			 <div class="form-group">  
			         <label for="dataDesc">描述</label>  
			        <textarea  name="upmDictionary.dataDesc" id="dataDesc" class="form-control" rows="3">${upmDictionary.dataDesc}</textarea> 
			 </div>
			 <div class="form-group">  
	         <label for="sortNo">排序编号</label>  
	        <input  class="form-control" type="text" id="sortNo" name="upmDictionary.sortNo" value="${upmDictionary.sortNo}"  />
	 		</div>
	 
	         <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
       		</div>
	</form>
</div>

<script>
		 $('#upmDictionaryForm').bootstrapValidator({  
	            fields: {  
	            	"upmDictionary.dataDesc": {  
	                message: '描述不能为空',  
	                validators: {  
	                    notEmpty: {  
	                    message: '描述不能为空'  
	                    }  
	                	}
	        		},
	                "upmDictionary.sortNo": {  
	                    message: '排序编号不能为空',  
	                    validators: {  
	                        notEmpty: {  
	                        message: '排序编号不能为空'  
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
