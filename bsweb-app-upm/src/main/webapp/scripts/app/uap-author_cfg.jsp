<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<script>
$(function(){
    var showType = $("#SHOW_TYPE").val();
    var id = $("#id").val();
    initShowTypeList(showType,id);  
    $("#SHOW_TYPE").change(function(){
     showType = $("#SHOW_TYPE").val();
     initShowTypeList(showType,id);  
    });
    $("#APP_CODE").change(function(){
      initShowTypeList(showType,id); 
    });
    $("#save").unbind("click");
	$("#save").click(function(){
		initRadio();
		initCheckBox();
		initMultiCheckBox();
		$("#inputForm").submit();
	})
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
		  "TYPE_NAME":{
		   required: true
		  },
		  "TABLE_NAME":{
		   required: true
		  },
		   "KEY_COLUMN":{
		   required: true
		  },
		  "APP_KEY_COLUMN":{
		   required: true
		  },
		  "NAME_COLUMN":{
		   required: true
		  }
		},
		messages:{
		}
	});
//初始化表数据的类型结构
function initShowTypeList(showType,id){
	  if(showType == "1"){
	    $("#TREE_ROOT_TYPE").parent().parent().hide();
	    $("#ROOT_P_VALUE").parent().parent().hide();
	    $("#NAVI_TYPE_NAME").parent().parent().hide();
	    $("#NAVI_COLUMN_NAME").parent().parent().hide();
	    $("#IS_USE_ALL").parent().parent().hide();
	  }else if(showType == "2"){
	    $("#TREE_ROOT_TYPE").parent().parent().show();
	    $("#ROOT_P_VALUE").parent().parent().show();
	    $("#NAVI_TYPE_NAME").parent().parent().hide();
	    $("#NAVI_COLUMN_NAME").parent().parent().hide();
	    $("#IS_USE_ALL").parent().parent().show();
	  }else{
	    $("#TREE_ROOT_TYPE").parent().parent().hide();
	    $("#ROOT_P_VALUE").parent().parent().hide();
	    $("#NAVI_TYPE_NAME").parent().parent().show();
	    $("#NAVI_COLUMN_NAME").parent().parent().show();
	    if(showType == "3"){
	    	$("#IS_USE_ALL").parent().parent().hide();
	    }else if(showType == "4"){
	    	$("#IS_USE_ALL").parent().parent().show();
	    }
	      jQuery.ajax({
	          url:"/uap/jsp/app/appauthor/commonappauthormng!getUapAppAuthorNaviTypeCfgById.action?id="+id+"&showType="+showType+"&appCode="+$("#APP_CODE").val()+"&time="+new Date(),
	          async:true,
	          cache:false,
	          dataType:"json",
	          async: false,
	          success:function(data) {
	              var value = data.initValue;
	              var obj = data.list;
	              $("#NAVI_TYPE_NAME").empty();
	              $(obj).each(function(i,v){
	                if(v == value){
	                  $("#NAVI_TYPE_NAME").append("<option value='"+v+"' selected>"+v+"</option>"); 
	                }else{
	                  $("#NAVI_TYPE_NAME").append("<option value='"+v+"'>"+v+"</option>"); 
	                  }
	              });
	        	}
	        });
	  }
}
})
</script>