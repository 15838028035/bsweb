
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>flowTask管理</title>
    <meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>

<!--css样式-->
<link href="${ctx}/scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/scripts/bootstrap-table/bootstrap-table.css" rel="stylesheet">
<!--js-->

<script src="${ctx}/scripts/jquery/jquery-3.2.0.min.js"></script>
<script src="${ctx}/scripts/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/scripts/bootstrap-table/bootstrap-table.js"></script>
<script src="${ctx}/scripts/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/scripts/bootstrap-table/extensions/multiple-sort/bootstrap-table-multiple-sort.js"></script>

<script language="javascript"  type="text/javascript">
	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	});

	
	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/flows/flowTaskAction!bootStrapList.action',         //请求后台的URL（*）
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
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [
			 {field:'id',title:'', sortable:true},
			 {field:'taskVefrsion',title:'', sortable:true},
			 {field:'flowOrderId',title:'', sortable:true},
			 {field:'taskName',title:'', sortable:true},
			 {field:'displayName',title:'', sortable:true},
			 {field:'performType',title:'', sortable:true},
			 {field:'taskType',title:'', sortable:true},
			 {field:'operator',title:'', sortable:true},
			 {field:'createTime',title:'', sortable:true},
			 {field:'finishTime',title:'', sortable:true},
			 {field:'expireTime',title:'', sortable:true},
			 {field:'expireDate',title:'', sortable:true},
			 {field:'remindDate',title:'', sortable:true},
			 {field:'actionUrl',title:'', sortable:true},
			 {field:'parentTaskId',title:'', sortable:true},
			 {field:'variable',title:'', sortable:true},
			 {field:'createBy',title:'', sortable:true},
			 {field:'createByUname',title:'', sortable:true},
			 {field:'createDate',title:'', sortable:true},
			 {field:'updateBy',title:'', sortable:true},
			 {field:'updateByUname',title:'', sortable:true},
			 {field:'updateDate',title:'', sortable:true},
			 {field:'flowVersion',title:'', sortable:true},
			 {field:'flowName',title:'', sortable:true},
			 {field:'instanceUrl',title:'', sortable:true},
			 {field:'flowProcessId',title:'', sortable:true},
			 {field:'actorIds',title:'', sortable:true}
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
			var flowVersion=$("#flowVersion").val();
			var flowName=$("#flowName").val();
			var instanceUrl=$("#instanceUrl").val();
			var flowProcessId=$("#flowProcessId").val();
			var actorIds=$("#actorIds").val();

            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                //limit: params.limit, //第几条记录
                //offset: params.offset, //显示一页多少记录
                //maxrows: params.limit,
                //pageindex:params.pageNumber,
                rows:params.rows,
                page:params.page,
                total:params.total,
                pageSize:params.limit,
                offset:params.offset,
                "sortName":this.sortName,
                "sortOrder":this.sortOrder,
		"flowTask.id":id,
		"flowTask.taskVefrsion":taskVefrsion,
		"flowTask.flowOrderId":flowOrderId,
		"flowTask.taskName":taskName,
		"flowTask.displayName":displayName,
		"flowTask.performType":performType,
		"flowTask.taskType":taskType,
		"flowTask.operator":operator,
		"flowTask.createTimeBegin":createTimeBegin,
		"flowTask.createTimeEnd":createTimeEnd,
		"flowTask.finishTimeBegin":finishTimeBegin,
		"flowTask.finishTimeEnd":finishTimeEnd,
		"flowTask.expireTimeBegin":expireTimeBegin,
		"flowTask.expireTimeEnd":expireTimeEnd,
		"flowTask.expireDateBegin":expireDateBegin,
		"flowTask.expireDateEnd":expireDateEnd,
		"flowTask.remindDateBegin":remindDateBegin,
		"flowTask.remindDateEnd":remindDateEnd,
		"flowTask.actionUrl":actionUrl,
		"flowTask.parentTaskId":parentTaskId,
		"flowTask.variable":variable,
		"flowTask.createBy":createBy,
		"flowTask.createByUname":createByUname,
		"flowTask.createDateBegin":createDateBegin,
		"flowTask.createDateEnd":createDateEnd,
		"flowTask.updateBy":updateBy,
		"flowTask.updateByUname":updateByUname,
		"flowTask.updateDateBegin":updateDateBegin,
		"flowTask.updateDateEnd":updateDateEnd,
		"flowTask.flowVersion":flowVersion,
		"flowTask.flowName":flowName,
		"flowTask.instanceUrl":instanceUrl,
		"flowTask.flowProcessId":flowProcessId,
		"flowTask.actorIds":actorIds
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
                      

			 	<label class="control-label col-sm-1" for="id"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="id"></div>
                        
			 	<label class="control-label col-sm-1" for="taskVefrsion"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="taskVefrsion"></div>
                        
			 	<label class="control-label col-sm-1" for="flowOrderId"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowOrderId"></div>
                        
			 	<label class="control-label col-sm-1" for="taskName"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="taskName"></div>
                        
			 	<label class="control-label col-sm-1" for="displayName"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="displayName"></div>
                        
			 	<label class="control-label col-sm-1" for="performType"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="performType"></div>
                        
			 	<label class="control-label col-sm-1" for="taskType"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="taskType"></div>
                        
			 	<label class="control-label col-sm-1" for="operator"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="operator"></div>
                        
			 	<label class="control-label col-sm-1" for="createTime"></label>
			   <div class="col-sm-2">
                            	<input type="text" name="createTimeBegin" id = "createTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="createTimeEnd" id = "createTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="finishTime"></label>
			   <div class="col-sm-2">
                            	<input type="text" name="finishTimeBegin" id = "finishTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="finishTimeEnd" id = "finishTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="expireTime"></label>
			   <div class="col-sm-2">
                            	<input type="text" name="expireTimeBegin" id = "expireTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="expireTimeEnd" id = "expireTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="expireDate"></label>
			   <div class="col-sm-2">
                            	<input type="text" name="expireDateBegin" id = "expireDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="expireDateEnd" id = "expireDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="remindDate"></label>
			   <div class="col-sm-2">
                            	<input type="text" name="remindDateBegin" id = "remindDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="remindDateEnd" id = "remindDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="actionUrl"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="actionUrl"></div>
                        
			 	<label class="control-label col-sm-1" for="parentTaskId"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="parentTaskId"></div>
                        
			 	<label class="control-label col-sm-1" for="variable"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="variable"></div>
                        
			 	<label class="control-label col-sm-1" for="createBy"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="createBy"></div>
                        
			 	<label class="control-label col-sm-1" for="createByUname"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="createByUname"></div>
                        
			 	<label class="control-label col-sm-1" for="createDate"></label>
			   <div class="col-sm-2">
                            	<input type="text" name="createDateBegin" id = "createDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="createDateEnd" id = "createDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="updateBy"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="updateBy"></div>
                        
			 	<label class="control-label col-sm-1" for="updateByUname"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="updateByUname"></div>
                        
			 	<label class="control-label col-sm-1" for="updateDate"></label>
			   <div class="col-sm-2">
                            	<input type="text" name="updateDateBegin" id = "updateDateBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="updateDateEnd" id = "updateDateEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="flowVersion"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowVersion"></div>
                        
			 	<label class="control-label col-sm-1" for="flowName"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowName"></div>
                        
			 	<label class="control-label col-sm-1" for="instanceUrl"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="instanceUrl"></div>
                        
			 	<label class="control-label col-sm-1" for="flowProcessId"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="flowProcessId"></div>
                        
			 	<label class="control-label col-sm-1" for="actorIds"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="actorIds"></div>
                        

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
    
	  //查询
	    $("#select").click(function() {
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
			 	var flowVersion=$("#flowVersion").val();
			 	var flowName=$("#flowName").val();
			 	var instanceUrl=$("#instanceUrl").val();
			 	var flowProcessId=$("#flowProcessId").val();
			 	var actorIds=$("#actorIds").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flowTask/flowTaskAction!list.action',
				postData : {
			 			 	"id":id,
			 			 	"taskVefrsion":taskVefrsion,
			 			 	"flowOrderId":flowOrderId,
			 			 	"taskName":taskName,
			 			 	"displayName":displayName,
			 			 	"performType":performType,
			 			 	"taskType":taskType,
			 			 	"operator":operator,
							"createTimeBegin":createTimeBegin,
							"createTimeEnd":createTimeEnd,
							"finishTimeBegin":finishTimeBegin,
							"finishTimeEnd":finishTimeEnd,
							"expireTimeBegin":expireTimeBegin,
							"expireTimeEnd":expireTimeEnd,
							"expireDateBegin":expireDateBegin,
							"expireDateEnd":expireDateEnd,
							"remindDateBegin":remindDateBegin,
							"remindDateEnd":remindDateEnd,
			 			 	"actionUrl":actionUrl,
			 			 	"parentTaskId":parentTaskId,
			 			 	"variable":variable,
			 			 	"createBy":createBy,
			 			 	"createByUname":createByUname,
							"createDateBegin":createDateBegin,
							"createDateEnd":createDateEnd,
			 			 	"updateBy":updateBy,
			 			 	"updateByUname":updateByUname,
							"updateDateBegin":updateDateBegin,
							"updateDateEnd":updateDateEnd,
			 			 	"flowVersion":flowVersion,
			 			 	"flowName":flowName,
			 			 	"instanceUrl":instanceUrl,
			 			 	"flowProcessId":flowProcessId,
			 			 	"actorIds":actorIds
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/flowTask/flowTaskAction!input.action'
        })
		//编辑
        $("#edit").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要编辑的记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	window.location.href = "${ctx}/jsp/flowTask/flowTaskAction!input.action?operate=edit&id=" + ids;
        })
		//删除
        function mulDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('请选择一条记录');
        		return;
        	}

        	showModalConfirmation('确认要删除么',"doDelete()");
        }	
        function doDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/flowTask/flowTaskAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        }
        
      	function refreshGrid(){
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flowTask/flowTaskAction!list.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
