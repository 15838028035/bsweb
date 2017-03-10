<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<script>
$(function(){
    var appCode = $("#APP_CODE").val();
    $("#APP_CODE").change(function(){
      appCode = $("#APP_CODE").val();
      initTableList(appCode,'');
      $("#query").click();
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
				  $("#TABLE_NAME").append("<option value=''>所有</option>");
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
</script>