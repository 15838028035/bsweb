<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>流程定义</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script language="javascript">

	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	     
	     $(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii',//格式化时间,
	             autoclose:true,//日期选择完成后是否关闭选择框
	         });
	});

	var TableInit = function () {
       var oTableInit = new Object();
       //初始化Table
       oTableInit.Init = function () {
           $('#tableList').bootstrapTable({
               url: '${ctx}/jsp/flows/flowProcessAction!bootStrapList.action',         //请求后台的URL（*）
               method: 'post',                     //请求方式（*）
               dataType: "json",
               contentType : "application/x-www-form-urlencoded;charset=UTF-8",
               dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
               totalField: 'total',
               toolbar: '#toolbar',                //工具按钮用哪个容器
               striped: true,                      //是否显示行间隔色
               cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
               pagination: true,                   //是否显示分页（*）
               smartDisplay:false,
               showRefresh:true,
               showColumns:true,
               showExport: true,
               showToggle:true,
               searchOnEnterKey:true,
               showFooter:true,
               search:true,
               sortable: true,                     //是否启用排序
               sortOrder: "asc",                   //排序方式
               singleSelect:false,
               clickToSelect: true,
               smartDisplay:true,
               queryParams: oTableInit.queryParams,//传递参数（*）
               queryParamsType:'',					//  queryParamsType = 'limit' 参数: limit, offset, search, sort, order;
               									//  queryParamsType = '' 参数: pageSize, pageNumber, searchText, sortName, sortOrder.
               sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
               pageNumber:1,                       //初始化加载第一页，默认第一页
               pageSize: 25,                       //每页的记录行数（*）
               pageList: [5,10, 25, 40, 50, 100,'all'],        //可供选择的每页的行数（*）
               showPaginationSwitch:true,
               strictSearch: true,
               clickToSelect: true,                //是否启用点击选中行
               //height: auto,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
               idField:"id",
               uniqueId: "id",                     //每一行的唯一标识，一般为主键列
               cardView: false,                    //是否显示详细视图
               detailView: false,                   //是否显示父子表
               columns: [
                         { field: 'checkStatus', title: '',checkbox:true }, 
                         {field : 'Number', title : '行号',    formatter : function(value, row, index) {return index+1;}  },
                         { field: 'id', title: '编号',sortable:true, visible:false }, 
                         { field: 'flowNo', title: '流程编号',sortable:true, visible:false}, 
                         { field: 'flowName', title: '流程名称',sortable:true, formatter : function(value, row, index) {
                          	var	url ="${ctx}" + row.instanceUrl +"&processId="+row.id +"&flowProcess.processName="+row.flowName;
                         	 return "<a href="+url +">"+row.flowName+"</a>	";
                         	 }
                          
                          },
                         { field: 'displayName', title: '显示名称',sortable:true },
                         { field: 'flowVersion', title: '流程版本' ,sortable:true},
                         { field: 'flowGraph', title: '流程图片', formatter : function(value, row, index) {
                           	var url ="${ctx}/jsp/flows/flowProcessAction!flowDiagram.action?processId=" + row.id;
                          	 return "<a href="+url +">流程图片</a>	";
                          	 }
                           
                           },
                           { field: 'flowXML', title: '流程XML', formatter : function(value, row, index) {
                              	var url ="${ctx}/jsp/flows/flowProcessAction!downloadFlowXml.action?id=" + row.id+"&fileName="+row.flowName+".xml";
                             	 return "<a href="+url +">" + row.flowName+".xml</a>";
                             	 }
                              
                              },
                         { field: 'flowType', title: '流程类型',sortable:true },
                         { field: 'instanceUrl', title: '流程URL',sortable:true, visible:false },
                         { field: 'createByUname', title: '创建人姓名',sortable:true },
                         { field: 'createDate', title: '创建时间',sortable:true },
                         { field: 'updateByUname', title: '修改人',sortable:true, visible:false },
                         { field: 'updateDate', title: '修改时间',sortable:true, visible:false },
                         { field: 'enableFlag', title: '是否有效',sortable:true , visible:false},
                         { field: 'lockStatus', title: '是否加锁',sortable:true , visible:false},
                         {field : 'opt', title : '操作', formatter : function(value, row, index) {
                        	 var retValue="";
                        	 <sec:authorize code="upm_flowProcessList_btn_design" >
                         	var	url ="${ctx}/jsp/flows/flowProcessAction!processDesigner.action?id=" + row.id;
                         	retValue= "<a href="+url +">设计</a> &nbsp;&nbsp";
                        	 </sec:authorize>
                        	 <sec:authorize code="upm_flowProcessList_btn_startflow" >
                          	var	url ="${ctx}" + row.instanceUrl +"&processId="+row.id +"&flowProcess.processName="+row.flowName;
                          	retValue=retValue+ "<a href="+url +">发起流程</a></a> &nbsp;&nbsp";
                         	 </sec:authorize>
                        	 
                        	 return retValue;
                        	 }
                         
                         }
              		 ],
            	formatLoadingMessage: function () {
            		return "请稍等，正在加载中...";
            	},
            	formatNoMatches: function () { //没有匹配的结果
            		return '无符合条件的记录';
            	},
            	onLoadError: function (data) {
            		$('#tableList').bootstrapTable('removeAll');
            	},
            	responseHandler: function (res) {
            	    return {
            	        total: res.total,
            	        rows: res.rows
            	    };
            	}
             
           });
           if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){//如果是移动端
     		  $("#tableList").bootstrapTable("toggleView");
     		}
       };

       //得到查询的参数
       oTableInit.queryParams = function (params) {
 			var flowNo=$("#flowNo").val();
 			var flowName=$("#flowName").val();
 			var createByUname=$("#createByUname").val();
 			var updateByUname=$("#updateByUname").val();

             var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                
                 "page.pageSize":params.pageSize,
                 "page.pageNumber":params.pageNumber,
                 "sortName":this.sortName,
                 "sortOrder":this.sortOrder,
	 			"flowProcess.flowNo":flowNo,
	 			"flowProcess.flowName":flowName,
	 			"flowProcess.createByUname":createByUname,
	 			"flowProcess.updateByUname":updateByUname,
	 			"searchText": params.searchText
             };
             return temp;
         };
         return oTableInit;
   };
		
</script>
	
</head>

<body>
        
        <div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                     <div class="form-group" style="margin-top:15px">
			 	<label class="control-label col-sm-1" for="flowNo">流程编号</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowNo"></div>
			 	<label class="control-label col-sm-1" for="flowName">流程名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowName"></div>
			 	<label class="control-label col-sm-1" for="createByUname">创建人姓名</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="createByUname"></div>
                        
			 	<label class="control-label col-sm-1" for="updateByUname">修改人姓名</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="updateByUname"></div>
                    <div class="col-sm-12" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                    </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
        	<sec:authorize code="upm_flowProcessList_btn_uploadFlowFile" >
	             <button id="btn_uploadFlowFile" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>上传流程文件
	            </button>
            </sec:authorize>
            
        	<sec:authorize code="upm_flowProcessList_btn_design" >
	             <button id="btn_design" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>设计
	            </button>
            </sec:authorize>
            <sec:authorize code="upm_flowProcessList_btn_deploy" >
             <button id="btn_deploy" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>部署
            </button>
            </sec:authorize>
            <sec:authorize code="upm_flowProcessList_btn_redeploy" >
             <button id="btn_redeploy" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>重新部署
            </button>
            </sec:authorize>
            <sec:authorize code="upm_flowProcessList_btn_startflow" >
              <button id="btn_startflow" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>启动流程
            </button>
            </sec:authorize>
            <sec:authorize code="upm_flowProcessList_btn_delete" >
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
            </sec:authorize>
        </div>
        
        <table id="tableList"></table>
    </div>
    </div>

    <script type="text/javascript">
	    var $tableList = $('#tableList');
	    var $btn_design = $('#btn_design');
	    var $btn_deploy = $('#btn_deploy');
	    var $btn_redeploy = $('#btn_redeploy');
	    var $btn_startflow = $('#btn_startflow');
	    var $btn_delete = $('#btn_delete');
	    
	    var $btn_query = $('#btn_query');
	    var $btn_uploadFlowFile=$("#btn_uploadFlowFile");
	    
	    $("#btn_uploadFlowFile").click(function() {
	    	var url =  "${ctx}/jsp/flows/flowProcessUploadFile.jsp";
			$.iframeDialogHeight("上传流程文件",url,refreshGrid,400);
       })
        
        $("#btn_design").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	if(ids == ''|| ids==null){
        		window.location.href = "${ctx}/jsp/flows/flowProcessAction!processDesigner.action";
        		return;
        	}
        	if(ids.length > 1){
        		bootbox.alert('请选择要编辑的记录');
        		return;
        	}
        	window.location.href = "${ctx}/jsp/flows/flowProcessAction!processDesigner.action?id=" + ids;
        })
        
         //部署
        $("#btn_deploy").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	if(ids == ''|| ids==null){
        		bootbox.alert('请选择要编辑的记录');
        		return;
        	}
        	
        	if(ids.length>1){
        		bootbox.alert('请选择一条编辑的记录');
        		return;
        	}
        	
        	var url ="${ctx}/jsp/flows/flowProcessAction!processDeploy.action?id=" + ids;
        	  var result =$.ajax({
		      	  url:url,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);
			refreshGrid();
        })
        
          //部署
        $("#btn_redeploy").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	if(ids == ''|| ids==null){
        		bootbox.alert('请选择要编辑的记录');
        		return;
        	}
        	
        	if(ids.length>1){
        		bootbox.alert('请选择一条编辑的记录');
        		return;
        	}
        		var url ="${ctx}/jsp/flows/flowProcessAction!processReDeploy.action?id=" + ids;
        	  var result = $.ajax({
		      	  url:url,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);
			refreshGrid();
        })
        
        //启动流程
        $("#btn_startflow").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	if(ids == ''|| ids==null){
        		bootbox.alert('请选择要编辑的记录');
        		return;
        	}
        	
        	if(ids.length>1){
        		bootbox.alert('请选择一条编辑的记录');
        		return;
        	}
        	
        	var instanceUrl =  $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.instanceUrl;
            });
        	var flowName = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.flowName;
            });
        	
        	var	url ="${ctx}" + instanceUrl +"&processId="+ids +"&flowProcess.processName="+flowName;
        	window.location.href = url;
        })
          
        $("#btn_delete").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	 
        	if(ids == ""){
        		alert('请选择要删除的记录');
        		return;
        	}
        	
        	bootbox.confirm('确认要删除么?',function (result) {  
                if(result) {  
                	doDelete();
                }
        	});

        })
        
        function doDelete(){
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
            var result = $.ajax({
		      	  url:"${ctx}/jsp/flows/flowProcessAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);
			refreshGrid();
        }
        
        $btn_query.click(function () {
       	 refreshGrid();
       });
       
     	function refreshGrid(){
     		$tableList.bootstrapTable('refresh');
     	}
      	
    </script>


</body>
</html>
