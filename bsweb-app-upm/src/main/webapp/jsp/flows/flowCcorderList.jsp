
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>flowCcorder管理</title>
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
                url: '${ctx}/jsp/flows/flowCcorderAction!bootStrapList.action',         //请求后台的URL（*）
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
						 {field:'id',title:'', sortable:true},
						 {field:'orderId',title:'流程实例编号', sortable:true},
						 {field:'actorId',title:'执行人', sortable:true},
						 {field:'creator',title:'建创人', sortable:true},
						 {field:'createTime',title:'创建时间', sortable:true},
						 {field:'finishTime',title:'完成时间', sortable:true},
						 {field:'status',title:'', sortable:true}
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
			var orderId=$("#orderId").val();
			var actorId=$("#actorId").val();
			var creator=$("#creator").val();
	    		var createTimeBegin=$("#createTimeBegin").val();
	    		var createTimeEnd=$("#createTimeEnd").val();
	    		var finishTimeBegin=$("#finishTimeBegin").val();
	    		var finishTimeEnd=$("#finishTimeEnd").val();
			var status=$("#status").val();

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
		"flowCcorder.id":id,
		"flowCcorder.orderId":orderId,
		"flowCcorder.actorId":actorId,
		"flowCcorder.creator":creator,
		"flowCcorder.createTimeBegin":createTimeBegin,
		"flowCcorder.createTimeEnd":createTimeEnd,
		"flowCcorder.finishTimeBegin":finishTimeBegin,
		"flowCcorder.finishTimeEnd":finishTimeEnd,
		"flowCcorder.status":status
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
                        
			 	<label class="control-label col-sm-1" for="orderId">流程实例编号</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="orderId"></div>
                        
			 	<label class="control-label col-sm-1" for="actorId">执行人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="actorId"></div>
                        
			 	<label class="control-label col-sm-1" for="creator">建创人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="creator"></div>
                        
			 	<label class="control-label col-sm-1" for="createTime">创建时间</label>
			   <div class="col-sm-2">
                            	<input type="text" name="createTimeBegin" id = "createTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="createTimeEnd" id = "createTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="finishTime">完成时间</label>
			   <div class="col-sm-2">
                            	<input type="text" name="finishTimeBegin" id = "finishTimeBegin"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
				<input type="text" name="finishTimeEnd" id = "finishTimeEnd"  class="Wdate" onClick="WdatePicker()" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="status"></label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="status"></div>
                        

                        <div class="col-sm-6" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_ccRead" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
        </div>
        
        <table id="tableList"></table>
    </div>


    <script type="text/javascript">
    var $tableList = $('#tableList');
    var $btn_query = $('#btn_query');
    var $btn_ccRead = $('#btn_ccRead');
    
    $btn_query.click(function () {
   	 refreshGrid();
   });
    
    $("#btn_ccRead").click(function() {
    	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
             return row.id;
         });
    	 
    	if(ids == ""){
    		alert('请选择记录');
    		return;
    	}
    	
	jQuery("#list").jqGrid('setGridParam',{
	    url:'${ctx}/jsp/flows/flowCcorderAction!ccread.action',
		postData : {
	 			 	"flowCcorder.id":id,
	 			 	"flowCcorder.status":"0"
		}, 
	 	page:1
	}).trigger("reloadGrid");
	});
    
    
      	function refreshGrid(){
      		$tableList.bootstrapTable('refresh');
      	}
      	
    </script>


</body>
</html>
