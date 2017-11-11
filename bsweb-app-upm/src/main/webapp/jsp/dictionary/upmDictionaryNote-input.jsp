<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>数据字典</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
</head>
<body>
<div class="container">
	<form action="upmDictionaryNoteAction!commonSaveOrUpdate.action"  class="form-horizontal" method="post" name="upmDictionaryNoteForm" id="upmDictionaryNoteForm" role="form">
	<input type="hidden" name="upmDictionaryNote.id" id="id" value="${id}"/>
	<input type="hidden" name="upmDictionaryNote.appId" id="appId" value="${upmDictionaryNote.appId}"/>
	<input type="hidden" name="operate" value="${operate}" />
	<div class="form-group">  
	         <label for="typeCode">类型编码</label>  
	        <input  class="form-control" type="text" id="typeCode" name="upmDictionaryNote.typeCode" value="${upmDictionaryNote.typeCode}"  />
	 </div>
	 <div class="form-group">  
	         <label for="typeDesc">描述</label>  
	        <textarea  name="upmDictionaryNote.typeDesc" id="typeDesc" class="form-control" rows="3">${upmDictionaryNote.typeDesc}</textarea> 
	 </div>
	   <div class="form-group"> 
        		  <button type="submit" id="save"  class="btn btn-default">保存</button> 
        		   <button type="button" id="backToHomeButton"  class="btn btn-default">返回</button> 
       </div>
         	
	</form>
</div>
<script>
        
        $('#upmDictionaryNoteForm').bootstrapValidator({  
            fields: {  
            	"upmDictionaryNoteForm": {  
                message: '类型编码不能为空',  
                validators: {  
                    notEmpty: {  
                    message: '类型编码不能为空'  
                    }  
                	}
        		},
                "upmDictionaryNote.typeDesc": {  
                    message: '描述不能为空',  
                    validators: {  
                        notEmpty: {  
                        message: '描述不能为空'  
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
