<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>用户申请流程管理</title>
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
	             //minView: "month",//设置只显示到月份
	             clearBtn:true // 自定义属性,true 显示 清空按钮 false 隐藏 默认:true
	         });
	});

	
	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/flowUpmUser/flowUpmUserAction!bootStrapList.action',         //请求后台的URL（*）
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
			 	{field:'id',title:'ID', sortable:true, visible:false},
			 	{field:'operator',title:'申请人', sortable:true},
			 	{field:'applyType',title:'申请类别', sortable:true,formatter : function(value, row, index) {
			 		if(value="1"){
			 			return "申请";
			 		}
			 		if(value="2"){
			 			return "加锁";
			 		}
			 		if(value="3"){
			 			return "角色变更";
			 		}
			 		if(value="4"){
			 			return "组织机构变更";
			 		}
			 		if(value="9"){
			 			return "其他";
			 		}
    	   			return "其他";
       			}  
       				},
			 	{field:'operatorTime',title:'操作时间', sortable:true},
			 	{field:'flowOrderId',title:'流程实例ID', sortable:true, visible:false},
			 	{field:'flowTaskId',title:'任务Id', sortable:true, visible:false},
			 	{field:'appMemo',title:'申请备注', sortable:true},
			 	{field:'processId',title:'流程定义ID', sortable:true, visible:false}
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
			var operator=$("#operator").val();
    		var operatorTimeBegin=$("#operatorTimeBegin").val();
    		var operatorTimeEnd=$("#operatorTimeEnd").val();

            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                rows:params.rows,
                page:params.page,
                total:params.total,
                pageSize:params.limit,
                offset:params.offset,
                "sortName":this.sortName,
                "sortOrder":this.sortOrder,
				"flowUpmUser.operator":operator,
				"flowUpmUser.operatorTimeBegin":operatorTimeBegin,
				"flowUpmUser.operatorTimeEnd":operatorTimeEnd
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
			 	<label class="control-label col-sm-1" for="operator">申请人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="operator"></div>
			 	<label class="control-label col-sm-1" for="operatorTime">操作时间</label>
			   <div class="col-sm-4">
                  <input type="text" name="operatorTimeBegin" id = "operatorTimeBegin"  class="datetimepicker"  readonly="readonly"/>
				 <input type="text" name="operatorTimeEnd" id = "operatorTimeEnd"  class="datetimepicker"  readonly="readonly"/>
                </div>
                    <div class="col-sm-12" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                    </div>
                    </div>
                </form>
            </div>
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
      	
    </script>


</body>
</html>
