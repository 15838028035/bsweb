
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>运行中的流程</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script src="${ctx}/scripts/bootbox/bootbox.min.js"></script>

<script language="javascript"  type="text/javascript">
	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	     
	     $(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii',//格式化时间,
	             autoclose:true,//日期选择完成后是否关闭选择框
	             //minView: "month",//设置只显示到月份
	             clearBtn:true // 自定义属性,true 显示 清空按钮 false 隐藏 默认:true
	         });
	});

	
	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/flows/flowTaskAction!flowTaskRuntimeList.action',         //请求后台的URL（*）
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
                trimOnSearch:true,
                showFooter:true,
                search:false,
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
               // height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
               idField:"id",
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [  
			{ field: 'checkStatus', title: '',checkbox:true }, 
                           {field : 'Number', title : '行号', formatter : function(value, row, index) {  
                        	   			return index+1;
                           			}  
                           },
			 	{field:'id',title:'ID', sortable:true, visible:false},
			 	{field:'taskVefrsion',title:'任务版本', sortable:true, visible:false},
			 	{field:'flowOrderId',title:'流程实例ID', sortable:true, visible:false},
			 	{field:'taskName',title:'任务名称', sortable:true, visible:false},
			 	{field:'displayName',title:'显示名称', sortable:true, visible:false},
			 	{field:'flowName',title:'流程名称', sortable:true},
			 	{field:'performType',title:'任务参与类型', sortable:true,formatter : function(value, row, index) {  
			 		if(value=="0"){
			 			return "普通任务";
			 		}
			 		if(value=="1"){
			 			return "会签任务";
			 		}
    	   			return "其它";
       			}  
			 	},
			 	{field:'taskType',title:'任务类型', sortable:true,formatter : function(value, row, index) {  
			 		if(value=="0"){
			 			return "主办";
			 		}
			 		if(value=="1"){
			 			return "协办";
			 		}
    	   			return "其它";
       				}  
			 	},
			 	{field:'operator',title:'操作者', sortable:true},
			 	{field:'createTime',title:'创建时间', sortable:true},
			 	{field:'finishTime',title:'完成时间', sortable:true},
			 	{field:'expireTime',title:'过期时间', sortable:true, visible:false},
			 	{field:'expireDate',title:'过期日期', sortable:true},
			 	{field:'remindDate',title:'提醒日期', sortable:true, visible:false},
			 	{field:'actionUrl',title:'实例化URL', sortable:true, visible:false},
			 	{field:'parentTaskId',title:'父ID', sortable:true, visible:false},
			 	{field:'variable',title:'流程变量', sortable:true, visible:false},
			 	{field:'createBy',title:'创建人ID', sortable:true, visible:false},
			 	{field:'createByUname',title:'创建人姓名', sortable:true},
			 	{field:'createDate',title:'创建日期', sortable:true,visible:false},
			 	{field:'updateBy',title:'修改人', sortable:true,visible:false},
			 	{field:'updateByUname',title:'修改人姓名', sortable:true, visible:false},
			 	{field:'updateDate',title:'修改日期', sortable:true, visible:false},
			 	{field:'flowVersion',title:'流程版本', sortable:true, visible:false},
			 	{field:'instanceUrl',title:'实例化URL', sortable:true, visible:false},
			 	{field:'flowProcessId',title:'流程定义ID', sortable:true , visible:false},
			 	{field : 'opt', title : '操作',    formatter : function(value, row, index) {
               	 var retValue="";
               	 <sec:authorize code="upm_flowTaskList_btn_startHandleFlow" >
               	var instanceUrl = row.instanceUrl;
               	var flowProcessId =row.flowProcessId
               	var taskId =row.id;
               	var orderId =row.flowOrderId;
               	
             	var url ="${ctx}" + instanceUrl +"&processId="+flowProcessId +"&orderId="+orderId+"&taskId="+taskId;
                	retValue= "<a href="+url +">代办审批</a> &nbsp;&nbsp";
               	 </sec:authorize>
               	 
               	var url2 ="${ctx}/jsp/flows/flowProcessAction!flowDiagram.action?processId=" + row.flowProcessId+"&orderId="+row.flowOrderId;
                 	retValue=retValue+ "<a href="+url2 +">流程图</a></a> &nbsp;&nbsp";
               	 
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
             		 bootbox.alert("数据加载失败！");
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
			var taskName=$("#taskName").val();
			var displayName=$("#displayName").val();
			var operator = $("#operator").val();
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		 "page.pageSize":params.pageSize,
                     "page.pageNumber":params.pageNumber,
	                "sortName":this.sortName,
	                "sortOrder":this.sortOrder,
					"flowTask.taskName":taskName,
					"flowTask.displayName":displayName,
					"flowTask.operator":operator
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
			 	<label class="control-label col-sm-1" for="taskName">任务名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="taskName"></div>
			 	<label class="control-label col-sm-1" for="operator">操作者</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="operator"></div>
			 	<label class="control-label col-sm-1" for="flowName">流程名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowName"></div>
                     <div class="col-sm-12" style="text-align:left;">
                         <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                     </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
        	<sec:authorize code="upm_flowTaskList_btn_add" >
	            <button id="btn_add" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	            </button>
            </sec:authorize>
            <sec:authorize code="upm_flowTaskList_btn_edit" >
	            <button id="btn_edit" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	            </button>
            </sec:authorize>
            <sec:authorize code="upm_flowTaskList_btn_delete" >
	            <button id="btn_delete" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
	            </button>
            </sec:authorize>
            <sec:authorize code="upm_flowTaskList_btn_startHandleFlow" >
	            <button id="btn_startHandleFlow" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>代办审批
	            </button>
            </sec:authorize>
            
        </div>
        
        <table id="tableList"></table>
    </div>


    <script type="text/javascript">
    	    var $tableList = $('#tableList');
	    var $btn_add = $('#btn_add');
	    var $btn_edit = $('#btn_edit');
	    var $btn_delete = $('#btn_delete');
	    var $btn_query = $('#btn_query');

	
		//新增
        $("#btn_add").click(function() {
        	window.location.href = '${ctx}/jsp/flows/flowTaskAction!input.action'
        })
		//编辑
        $("#btn_edit").click(function() {
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
        	window.location.href = "${ctx}/jsp/flows/flowTaskAction!input.action?operate=edit&id=" + ids;
        })
		//删除
      $("#btn_delete").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	 
        	if(ids == ""){
        		bootbox.alert('请选择要删除的记录');
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
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/flows/flowTaskAction!multidelete.action?multidelete=" + ids,
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
      	
      	 //处理
        $("#btn_startHandleFlow").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
       	if(ids == ''){
       		bootbox.alert('请选择要操作的记录');
       		return;
       	}
       	if(ids.length > 1){
       		bootbox.alert('请选择一条记录');
       		return;
       	}
       	var instanceUrl = $.map($tableList.bootstrapTable('getSelections'), function (row) {
            return row.instanceUrl;
        });
       	var flowProcessId =$.map($tableList.bootstrapTable('getSelections'), function (row) {
            return row.flowProcessId;
        });
       	var taskId =$.map($tableList.bootstrapTable('getSelections'), function (row) {
            return row.id;
        });
       	var orderId =$.map($tableList.bootstrapTable('getSelections'), function (row) {
            return row.flowOrderId;
        });
       	
       	var url ="${ctx}" + instanceUrl +"&processId="+flowProcessId +"&orderId="+orderId+"&taskId="+taskId;
       	window.location.href = url;
       })
      	
    </script>


</body>
</html>
