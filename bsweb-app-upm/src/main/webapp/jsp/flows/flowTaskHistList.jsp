
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>flowTaskHist管理</title>
    <meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script language="javascript"  type="text/javascript">
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
                url: '${ctx}/jsp/flows/flowTaskHistAction!bootStrapList.action',         //请求后台的URL（*）
                method: 'post',                     //请求方式（*）
                dataType: "json",
                contentType : "application/x-www-form-urlencoded",
                dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
                totalField: 'total',
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                smartDisplay:false,
                showRefresh:true,
                showColumns:true,
                searchOnEnterKey:true,
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
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [  
			{ field: 'checkStatus', title: '',checkbox:true }, 
                           {field : 'Number', title : '行号', formatter : function(value, row, index) {  
                        	   			return index+1;
                           			}  
                           },
			 	{field:'id',title:'ID', sortable:true},
			 	{field:'taskVefrsion',title:'任务版本', sortable:true},
			 	{field:'flowOrderId',title:'流程实例ID', sortable:true},
			 	{field:'taskName',title:'任务名称', sortable:true},
			 	{field:'displayName',title:'显示名称', sortable:true},
			 	{field:'performType',title:'参与类型', sortable:true},
			 	{field:'taskType',title:'任务类型', sortable:true},
			 	{field:'operator',title:'操作者', sortable:true},
			 	{field:'createTime',title:'创建时间', sortable:true},
			 	{field:'finishTime',title:'完成时间', sortable:true},
			 	{field:'expireTime',title:'过期时间', sortable:true},
			 	{field:'expireDate',title:'过期日期', sortable:true},
			 	{field:'remindDate',title:'提醒日期', sortable:true},
			 	{field:'actionUrl',title:'action_URL', sortable:true},
			 	{field:'parentTaskId',title:'父ID', sortable:true},
			 	{field:'variable',title:'流程变量', sortable:true},
			 	{field:'createBy',title:'创建人', sortable:true},
			 	{field:'createByUname',title:'创建人姓名', sortable:true},
			 	{field:'createDate',title:'创建日期', sortable:true},
			 	{field:'updateBy',title:'更新人', sortable:true},
			 	{field:'updateByUname',title:'更新人姓名', sortable:true},
			 	{field:'updateDate',title:'更新日期', sortable:true}
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
            
        };
 
        //得到查询的参数
      oTableInit.queryParams = function (params) {
			var id=$("#id").val();
			var taskVefrsion=$("#taskVefrsion").val();
			var flowOrderId=$("#flowOrderId").val();
			var taskName=$("#taskName").val();
			var displayName=$("#displayName").val();
			var performType=$("#performType").val();
			var taskType=$("#taskType").val();
			var operator=$("#operator").val();
	    		var createTimeBegin=$("#createTimeBegin").val();
	    		var createTimeEnd=$("#createTimeEnd").val();
	    		var finishTimeBegin=$("#finishTimeBegin").val();
	    		var finishTimeEnd=$("#finishTimeEnd").val();
	    		var expireTimeBegin=$("#expireTimeBegin").val();
	    		var expireTimeEnd=$("#expireTimeEnd").val();
	    		var expireDateBegin=$("#expireDateBegin").val();
	    		var expireDateEnd=$("#expireDateEnd").val();
	    		var remindDateBegin=$("#remindDateBegin").val();
	    		var remindDateEnd=$("#remindDateEnd").val();
			var actionUrl=$("#actionUrl").val();
			var parentTaskId=$("#parentTaskId").val();
			var variable=$("#variable").val();
			var createBy=$("#createBy").val();
			var createByUname=$("#createByUname").val();
	    		var createDateBegin=$("#createDateBegin").val();
	    		var createDateEnd=$("#createDateEnd").val();
			var updateBy=$("#updateBy").val();
			var updateByUname=$("#updateByUname").val();
	    		var updateDateBegin=$("#updateDateBegin").val();
	    		var updateDateEnd=$("#updateDateEnd").val();

            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		 "page.pageSize":params.pageSize,
                     "page.pageNumber":params.pageNumber,
	                "sortName":this.sortName,
	                "sortOrder":this.sortOrder,
					"flowTaskHist.id":id,
					"flowTaskHist.taskVefrsion":taskVefrsion,
					"flowTaskHist.flowOrderId":flowOrderId,
					"flowTaskHist.taskName":taskName,
					"flowTaskHist.displayName":displayName,
					"flowTaskHist.performType":performType,
					"flowTaskHist.taskType":taskType,
					"flowTaskHist.operator":operator,
					"flowTaskHist.createTimeBegin":createTimeBegin,
					"flowTaskHist.createTimeEnd":createTimeEnd,
					"flowTaskHist.finishTimeBegin":finishTimeBegin,
					"flowTaskHist.finishTimeEnd":finishTimeEnd,
					"flowTaskHist.expireTimeBegin":expireTimeBegin,
					"flowTaskHist.expireTimeEnd":expireTimeEnd,
					"flowTaskHist.expireDateBegin":expireDateBegin,
					"flowTaskHist.expireDateEnd":expireDateEnd,
					"flowTaskHist.remindDateBegin":remindDateBegin,
					"flowTaskHist.remindDateEnd":remindDateEnd,
					"flowTaskHist.actionUrl":actionUrl,
					"flowTaskHist.parentTaskId":parentTaskId,
					"flowTaskHist.variable":variable,
					"flowTaskHist.createBy":createBy,
					"flowTaskHist.createByUname":createByUname,
					"flowTaskHist.createDateBegin":createDateBegin,
					"flowTaskHist.createDateEnd":createDateEnd,
					"flowTaskHist.updateBy":updateBy,
					"flowTaskHist.updateByUname":updateByUname,
					"flowTaskHist.updateDateBegin":updateDateBegin,
					"flowTaskHist.updateDateEnd":updateDateEnd
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
                      

			 	<label class="control-label col-sm-1" for="id">ID</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="id"></div>
                        
			 	<label class="control-label col-sm-1" for="taskVefrsion">任务版本</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="taskVefrsion"></div>
                        
			 	<label class="control-label col-sm-1" for="flowOrderId">流程实例ID</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowOrderId"></div>
                        
			 	<label class="control-label col-sm-1" for="taskName">任务名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="taskName"></div>
                        
			 	<label class="control-label col-sm-1" for="displayName">显示名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="displayName"></div>
                        
			 	<label class="control-label col-sm-1" for="performType">参与类型</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="performType"></div>
                        
			 	<label class="control-label col-sm-1" for="taskType">任务类型</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="taskType"></div>
                        
			 	<label class="control-label col-sm-1" for="operator">操作者</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="operator"></div>
                        
			 	<label class="control-label col-sm-1" for="createTime">创建时间</label>
			   <div class="col-sm-2">
                            	<input type="text" name="createTimeBegin" id = "createTimeBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="createTimeEnd" id = "createTimeEnd"  class="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="finishTime">完成时间</label>
			   <div class="col-sm-2">
                            	<input type="text" name="finishTimeBegin" id = "finishTimeBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="finishTimeEnd" id = "finishTimeEnd"  cclass="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="expireTime">过期时间</label>
			   <div class="col-sm-2">
                            	<input type="text" name="expireTimeBegin" id = "expireTimeBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="expireTimeEnd" id = "expireTimeEnd"  class="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="expireDate">过期日期</label>
			   <div class="col-sm-2">
                            	<input type="text" name="expireDateBegin" id = "expireDateBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="expireDateEnd" id = "expireDateEnd"  class="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="remindDate">提醒日期</label>
			   <div class="col-sm-2">
                            	<input type="text" name="remindDateBegin" id = "remindDateBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="remindDateEnd" id = "remindDateEnd"  class="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="actionUrl">action_URL</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="actionUrl"></div>
                        
			 	<label class="control-label col-sm-1" for="parentTaskId">父ID</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="parentTaskId"></div>
                        
			 	<label class="control-label col-sm-1" for="variable">流程变量</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="variable"></div>
                        
			 	<label class="control-label col-sm-1" for="createBy">创建人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="createBy"></div>
                        
			 	<label class="control-label col-sm-1" for="createByUname">建创人姓名</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="createByUname"></div>
                        
			 	<label class="control-label col-sm-1" for="createDate">创建日期</label>
			   <div class="col-sm-2">
                            	<input type="text" name="createDateBegin" id = "createDateBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="createDateEnd" id = "createDateEnd" class="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="updateBy">更新人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="updateBy"></div>
                        
			 	<label class="control-label col-sm-1" for="updateByUname">更新人姓名</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="updateByUname"></div>
                        
			 	<label class="control-label col-sm-1" for="updateDate">更新日期</label>
			   <div class="col-sm-2">
                            	<input type="text" name="updateDateBegin" id = "updateDateBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="updateDateEnd" id = "updateDateEnd"  class="datetimepicker" readonly="readonly"/>
                         </div>

                        <div class="col-sm-6" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
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
        	window.location.href = '${ctx}/jsp/flows/flowTaskHistAction!input.action'
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
        	window.location.href = "${ctx}/jsp/flows/flowTaskHistAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/flows/flowTaskHistAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);
			refreshGrid();
        }
        
      	function refreshGrid(){
		$tableList.bootstrapTable('refresh');
      	}
      	
    </script>


</body>
</html>
