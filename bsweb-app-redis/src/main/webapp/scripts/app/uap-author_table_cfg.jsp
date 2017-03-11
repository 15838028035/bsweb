<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<script>
$(function(){
    var appCode = $("#APP_CODE").val();
    var dataType = $("#DATA_TYPE").val();
    var selectTypeName = $("#SELECT_TYPE_NAME").val();
    var id = $("#id").val();
    initTableList(appCode,id);
    initDataTypeList(dataType,id,appCode,selectTypeName);
    initISQUERY();
    initISXMLTITLE();
    $("#APP_CODE").change(function(){
      appCode = $("#APP_CODE").val();
      initTableList(appCode,id);
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
    $("#save").unbind("click");
	$("#save").click(function(){
		initRadio();
		initCheckBox();
		initMultiCheckBox();
		$("#inputForm").submit();
	});
	jQuery.validator.addMethod("judgeColumnIsExist", function(value, element) {  
			var returnVal = jQuery.ajax({
	          url:"/uap/jsp/app/appauthor/commonappauthormng!judgeIsExistAuthorTableCfg.action?appCode="+appCode+"&id="+id+"&tableName="+$("#TABLE_NAME").val()+"&columnName="+$("#COLUMN_NAME").val(),
	          async:true,
	          cache:false,
	          dataType:"text",
	          async: false
	        }).responseText;
	        if(returnVal == "true"){
				   return false;
				 }else{
				   return true;
				 }
			}, "此应用及表下已存在此字段，请修改！");
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
		  "APP_CODE":{
		   required: true
		  },
		  "COLUMN_NAME":{
		   required:true,
		   judgeColumnIsExist:true
		  }
		},
		messages:{
		}
	});
});
//初始化表名称下拉列表数据
function initTableList(appCode,id){
      jQuery.ajax({
	          url:"/uap/jsp/app/appauthor/commonappauthormng!getAuthorEntityPerCfgTable.action?appCode="+appCode+"&id="+id+"&time="+new Date(),
	          async:true,
	          cache:false,
	          dataType:"json",
	          async: false,
	          success:function(data) {
				  var list = data.list;
				  var value = data.defaultValue;
				  $("#TABLE_NAME").empty();
				  $(list).each(function(i,v){
				      if(value == v){
				         $("#TABLE_NAME").append("<option value='"+v+"' selected>"+v+"</option>");  
				      }else{
				         $("#TABLE_NAME").append("<option value='"+v+"'>"+v+"</option>");
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
    $("#XML_TITLE").parent().parent().show();
  }else{
    $("#XML_TITLE").parent().parent().hide();
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
	    var list = getTreeTypeList("${ctx}",appCode,''); 
	    $("#IS_VARCHAR").parent().parent().hide();
	    $("#SELECT_TYPE_NAME").empty();
	    if(id != ""){
	      	jQuery.ajax({
	          	url:"/uap/jsp/app/appauthor/commonappauthormng!getUapAppAuthorTableCfgById.action?id="+id+"&time="+new Date(),
	          	async:true,
	          	cache:false,
	          	dataType:"json",
	          	async: false,
	          	success:function(data) {
					selectValue = data.selectTypeName;
	        	}
			});
	    }
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