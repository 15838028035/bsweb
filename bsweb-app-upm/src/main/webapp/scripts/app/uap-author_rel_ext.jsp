<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<script>
$(function(){
    var appCode = $("#APP_CODE").val();
    var dataType = $("#DATA_TYPE").val();
    var selectTypeName = $("#SELECT_TYPE_NAME").val();
    var id = $("#id").val();
    //主被授权实体类型名称
    var listObj;
    initMainAuthorList(appCode,id);
    initDataTypeList(dataType,id,appCode,selectTypeName);
    initISQUERY();
    initISXMLTITLE();
    $("#APP_CODE").change(function(){
      appCode = $("#APP_CODE").val();
      initMainAuthorList(appCode,id);
      dataType = $("#DATA_TYPE").val();
      initDataTypeList(dataType,id,appCode,selectTypeName);
    });
    $("#DATA_TYPE").change( function(){
      dataType = $("#DATA_TYPE").val();
      initDataTypeList(dataType,id,appCode,selectTypeName);
    });
    $("input[name='IS_QUERY_checkbox']").click(function(){
      initISQUERY();
    });
     $("input[name='IS_XMLSEND_checkbox']").click(function(){
      initISXMLTITLE();
    });
    jQuery.validator.addMethod("judgeMainAndBeIsSame", function(value, element) {
            var mainAuthor = $("#MAIN_AUTHOR_TYPE_NAME").val();
			var beAuthor = $("#BE_AUTHOR_TYPE_NAME").val();
	         if(mainAuthor == beAuthor){
				   return false;
		      }else{
				   return true;
				 }
			}, "主授权实体类型名称和被授权授权实体类型名称不能相同，请修改！");
	$("#save").unbind("click");			
	$("#save").click(function(){
		initRadio();
		initCheckBox();
		initMultiCheckBox();
		$("#inputForm").submit();
	});
	$('#inputForm').validate({
		submitHandler:function(form){
			jQuery(form).ajaxSubmit({
				beforeSubmit : function(){
					$("#save").attr("disabled","true");
				},
			 	success: function(responseText) {
			 		$("#save").removeAttr("disabled");
			 		if(responseText == "ok"){
				 		alert("操作成功");
					    parent.reload();
						$.FrameDialog.closeDialog();
					}else{
					   alert("操作失败："+responseText);
					}
		    	} 
			});
		},
		rules:{
		  "BE_AUTHOR_TYPE_NAME":{
		   judgeMainAndBeIsSame: true
		  }
		},
		messages:{
		}
	});
});
//初始化表名称下拉列表数据
function initMainAuthorList(appCode,id){
      jQuery.ajax({
	          url:"/uap/jsp/app/appauthor/commonappauthormng!getMainAuthorTableName.action?appCode="+appCode+"&id="+id+"&time="+new Date(),
	          async:true,
	          cache:false,
	          dataType:"json",
	          async: false,
	          success:function(data) {
	              listObj = data;
				  var list = data.list;
				  var mainAuthor = data.mainAuthor;
				  var beAuthor = data.beAuthor;
				  $("#MAIN_AUTHOR_TYPE_NAME").empty();
				  $("#BE_AUTHOR_TYPE_NAME").empty();
				  $(list).each(function(i,v){
				      if(mainAuthor == v){
				         $("#MAIN_AUTHOR_TYPE_NAME").append("<option value='"+v+"' selected>"+v+"</option>");  
				      }else{
				         $("#MAIN_AUTHOR_TYPE_NAME").append("<option value='"+v+"'>"+v+"</option>");
				      }
				      if(v != "USER"){
					      if(beAuthor == v){
					         $("#BE_AUTHOR_TYPE_NAME").append("<option value='"+v+"' selected>"+v+"</option>");  
					      }else{
					         $("#BE_AUTHOR_TYPE_NAME").append("<option value='"+v+"'>"+v+"</option>");
					      }
					  }
				  });
	        	}
	        });
}
//初始化是否作为查询条件
function initISQUERY(){
  if($("input[name='IS_QUERY_checkbox']").is(":checked")){
    $("input[name='QUERY_TYPE']").parent().parent().show();
  }else{
    $("input[name='QUERY_TYPE']").parent().parent().hide();
  }
}
//初始化是否作为查询条件
function initISXMLTITLE(){
  if($("input[name='IS_XMLSEND_checkbox']").is(":checked")){
    $("#XMLTITLE").parent().parent().show();
  }else{
    $("#XMLTITLE").parent().parent().hide();
  }
}
//根据数据类型显示是否属性
function initDataTypeList(dataType,id,appCode,selectValue){
	  if(dataType == "2"){
	    $("#UN_CHECKED_VALUE").parent().parent().show();
	    $("#CHECKED_VALUE").parent().parent().show();
	    $("#DATA_SOURCE").parent().parent().hide();
	    $("#SELECT_TYPE_NAME").parent().parent().hide();
	    $("#IS_VARCHAR").parent().parent().hide();
	    if(id != ""){
	      jQuery.ajax({
	          url:"/uap/jsp/app/appauthor/commonappauthormng!getUapAppAuthorRelExtById.action?id="+id+"&time="+new Date(),
	          async:true,
	          cache:false,
	          dataType:"json",
	          async: false,
	          success:function(data) {
				  $("#UN_CHECKED_VALUE").val(data.unCheckedValue);
	              $("#CHECKED_VALUE").val(data.checkedValue);
	        	}
	        });
	    }
	  }else if(dataType == "1" || dataType == "3" || dataType == "5"){
	    $("#UN_CHECKED_VALUE").parent().parent().hide();
	    $("#CHECKED_VALUE").parent().parent().hide();
	    $("#DATA_SOURCE").parent().parent().show();
	    $("#SELECT_TYPE_NAME").parent().parent().hide();
	    $("#IS_VARCHAR").parent().parent().hide();
	  }else if(dataType == "6"){
	    $("#UN_CHECKED_VALUE").parent().parent().hide();
	    $("#CHECKED_VALUE").parent().parent().hide();
	    $("#DATA_SOURCE").parent().parent().hide();
	    $("#SELECT_TYPE_NAME").parent().parent().hide();
	    $("#IS_VARCHAR").parent().parent().show();
	  }else if(dataType == "8"){
	  	$("#UN_CHECKED_VALUE").parent().parent().hide();
	    $("#CHECKED_VALUE").parent().parent().hide();
	    $("#DATA_SOURCE").parent().parent().hide();
	    $("#IS_VARCHAR").parent().parent().hide();
	    var list = getTreeTypeList("/uap",appCode,''); 
	    $("#SELECT_TYPE_NAME").empty();
	  	$(list).each(function(i,v){
	    	if(selectValue == v){
	         	$("#SELECT_TYPE_NAME").append("<option value='"+v+"' selected>"+v+"</option>");  
	      	}else{
	         	$("#SELECT_TYPE_NAME").append("<option value='"+v+"'>"+v+"</option>");
	      	}
	  	});
	  	$("#SELECT_TYPE_NAME").parent().parent().show();
	  }else{
	     $("#UN_CHECKED_VALUE").parent().parent().hide();
	     $("#CHECKED_VALUE").parent().parent().hide();
	     $("#DATA_SOURCE").parent().parent().hide();
	     $("#SELECT_TYPE_NAME").parent().parent().hide();
	     $("#IS_VARCHAR").parent().parent().hide();
	  }
}
</script>