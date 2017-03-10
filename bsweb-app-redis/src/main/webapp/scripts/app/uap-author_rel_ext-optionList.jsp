<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<script>
$(function(){
    var appCode = $("#APP_CODE").val();
    var dataType = $("#DATA_TYPE").val();
    var selectTypeName = $("#SELECT_TYPE_NAME").val();
    var id = '';
    $("#APP_CODE").change(function(){
      appCode = $("#APP_CODE").val();
      initMainAuthorList(appCode,id);
      $("#query").click();
    });
    $("#MAIN_AUTHOR_TYPE_NAME,#BE_AUTHOR_TYPE_NAME").change(function(){
      $("#query").click();
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
				  var list = data.list;
				  var mainAuthor = data.mainAuthor;
				  var beAuthor = data.beAuthor;
				  $("#MAIN_AUTHOR_TYPE_NAME").empty();
				  $("#MAIN_AUTHOR_TYPE_NAME").append("<option value=''>所有</option>");
				  $("#BE_AUTHOR_TYPE_NAME").empty();
				  $("#BE_AUTHOR_TYPE_NAME").append("<option value=''>所有</option>");
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
</script>