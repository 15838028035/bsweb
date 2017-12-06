
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>历史流程实例</title>
     <%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/resource/scripts_all.jsp" %>


<script language="javascript"  type="text/javascript">
	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();

 		$(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii:ss',//格式化时间,
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
                url: '${ctx}/jsp/flows/flowOrderHistAction!bootStrapList.action',         //请求后台的URL（*）
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
                showExport: true,
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
                pageSize: 100,                       //每页的记录行数（*）
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
			 	{field:'id',title:'编号', sortable:true, visible:false},
			 	{field:'orderNo',title:'流程编号', sortable:true},
			 	{field:'orderVersion',title:'流程版本', sortable:true},
			 	{field:'flowProcessId',title:'流程定义ID', sortable:true, visible:false},
			 	{field:'parentId',title:'父ID', sortable:true, visible:false},
			 	{field:'parentNodeName',title:'父节点名称', sortable:true, visible:false},
			 	{field:'expireTime',title:'过期时间', sortable:true},
			 	{field:'priority',title:'优先级', sortable:true},
			 	{field:'variable',title:'流程变量', sortable:true, visible:false},
			 	{field:'createBy',title:'创建人', sortable:true, visible:false},
			 	{field:'createByUname',title:'创建人', sortable:true, visible:false},
			 	{field:'createDate',title:'创建日期', sortable:true, visible:false},
			 	{field:'updateBy',title:'更新人', sortable:true, visible:false},
			 	{field:'updateByUname',title:'更新人姓名', sortable:true, visible:false},
			 	{field:'updateDate',title:'更新日期', sortable:true, visible:false},
			 	{field:'endTime',title:'结束时间', sortable:true},
			 	{field:'orderState',title:'流程状态', sortable:true,formatter : function(value, row, index) {  
			 		if(value=='1'){
			 			return '活动状态';
			 		}
					if(value=='0'){
			 			return '结束状态';
			 		}
					if(value=='2'){
						return '终止状态';
					}
						return '其他';
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
			var orderNo=$("#orderNo").val();
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                 rows:params.rows,
                page:params.page,
                total:params.total,
                pageSize:params.limit,
                offset:params.offset,
                "sortName":this.sortName,
                "sortOrder":this.sortOrder,
		"flowOrderHist.orderNo":orderNo
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
                      

			 	<label class="control-label col-sm-1" for="orderNo">流程编号</label>
			<div class="col-sm-2"> <input type="text" class="form-control" id="orderNo"></div>

                   <div class="col-sm-12" style="text-align:left;">
                       <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                   </div>
                    </div>
                </form>
            </div>
        </div>  
        <div id="toolbar" class="btn-group">
	            <button id="btn_viewFlow" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查看
	            </button>
            
        </div>     
        <table id="tableList"></table>
    </div>


    <script type="text/javascript">
    	    var $tableList = $('#tableList');
	    var $btn_query = $('#btn_query');
	  	$btn_query.click(function () {
        	 refreshGrid();
        });

      	function refreshGrid(){
		$tableList.bootstrapTable('refresh');
      	}
      	
      //查看
        $("#btn_viewFlow").click(function() {
     		 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.id;
            });
       	if(ids == ''|| ids==null){
       		bootbox.alert('请选择要操作的记录');
       		return;
       	}
       	
       	if(ids.length>1){
       		bootbox.alert('请选择一条操作记录');
       		return;
       	}
       	
        	var instanceUrl = $.map($tableList.bootstrapTable('getSelections'), function (row) {
               return row.instanceUrl;
           });
        	var flowProcessId =$.map($tableList.bootstrapTable('getSelections'), function (row) {
               return row.flowProcessId;
           });
        	var orderId =$.map($tableList.bootstrapTable('getSelections'), function (row) {
               return row.orderNo;
           });
        	
        	var url ="${ctx}/jsp/flows/flowControllerAction!flowAllStyle.action?flowAllStyle=B&processId=" + flowProcessId+"&orderId="+orderId;
        	window.location.href = url;
        })
      	
    </script>


</body>
</html>
