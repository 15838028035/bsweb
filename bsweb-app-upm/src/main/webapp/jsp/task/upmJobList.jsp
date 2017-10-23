<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>upmJob管理</title>
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
                url: '${ctx}/jsp/task/upmJobAction!bootStrapList.action',         //请求后台的URL（*）
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
                detailView: true,                   //是否显示父子表
                columns: [  
			{ field: 'checkStatus', title: '',checkbox:true }, 
                           {field : 'Number', title : '行号', formatter : function(value, row, index) {  
                        	   			return index+1;
                           			}  
                           },
			 	{field:'id',title:'ID', sortable:true, visible:false},
			 	{field:'jobName',title:'定时任务名称', sortable:true},
			 	{field:'jobClass',title:'job执行类', sortable:true},
			 	{field:'jobFrequency',title:'执行表达式', sortable:true},
			 	{field:'jobDesc',title:'任务描述', sortable:true},
			 	{field:'status',title:'状态', sortable:true},
			 	{field:'createByUname',title:'创建人', sortable:true},
			 	{field:'createDate',title:'创建时间', sortable:true},
			 	{field:'updateByUname',title:'修改人', sortable:true},
			 	{field:'updateDate',title:'修改时间', sortable:true}
                        ], 
                      //注册加载子表的事件。注意下这里的三个参数！
                  onExpandRow: function (index, row, $detail) {
                	 InitSubTable(index, row, $detail);
                  },
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
			var jobName=$("#jobName").val();
			var jobClass=$("#jobClass").val();

            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                                rows:params.rows,
                page:params.page,
                total:params.total,
                pageSize:params.limit,
                offset:params.offset,
                "sortName":this.sortName,
                "sortOrder":this.sortOrder,
				"upmJob.jobName":jobName,
				"upmJob.jobClass":jobClass
            };
            return temp;
        };
            
        return oTableInit;
    };
  //初始化子表格(无线循环)
    InitSubTable = function (index, row, $detail) {
        var id = row.id;
        var cur_table = $detail.html('<table></table>').find('table');
        $(cur_table).bootstrapTable({
            url: '${ctx}/jsp/upmJobSechdu/upmJobSechduAction!bootStrapList.action?jobId='+id,
            method: 'post',
            dataType: "json",
            clickToSelect: true,
            detailView: true,//父子表
            uniqueId: "id",
            pageSize: 10,
            pageList: [10, 25],
            columns: [{field:'id',title:'ID', sortable:true},
                      {field:'startTime',title:'开始时间', sortable:true},
      			 	   {field:'endTime',title:'结束时间', sortable:true},
    			 	  {field:'jodStatus',title:'状态', sortable:true,formatter : function(value, row, index) {  
    			 		  if(value=="1"){
    			 			  return "执行中...";
    			 		  }
    			 		 if(value=="2"){
   			 			  return "执行完成";
   			 		  		}
    			 		  return value;
             			}  
      			 	   }
          		]
        });
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
			 	<label class="control-label col-sm-1" for="jobName">定时任务名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="jobName"></div>
                        
			 	<label class="control-label col-sm-1" for="jobClass">job执行类</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="jobClass"></div>
                    <div class="col-sm-12" style="text-align:left;">
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
            <button id="btn_handScheduler" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>手工调度
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
	    var $btn_handScheduler = $('#btn_handScheduler');
	
		//新增
        $("#btn_add").click(function() {
        	window.location.href = '${ctx}/jsp/task/upmJobAction!input.action'
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
        	window.location.href = "${ctx}/jsp/task/upmJobAction!input.action?operate=edit&id=" + ids;
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
		      	  url:"${ctx}/jsp/task/upmJobAction!multidelete.action?multidelete=" + ids,
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

  	//手动调度
  	$("#btn_handScheduler").click(function() {
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
        	 
        	if(ids == ""){
        		bootbox.alert('请选择要操作的记录');
        		return;
        	}
        	
        	var  isProcessJobStatus =  jQuery.ajax({
		          url:"${ctx}/jsp/task/upmJobAction!isProcessJobStatus.action?id="+ids,
		          async:false,
		          dataType:"text"
		        }).responseText;
				if(isProcessJobStatus=="true"){
					bootbox.alert('定时任务正在处理中，请稍等');
					return ;
				}

        	bootbox.confirm('确认要操作么?',function (result) {  
                if(result) {  
                	var result = jQuery.ajax({
      		      	  url:"${ctx}/jsp/task/upmJobAction!handScheduler.action?id=" + ids,
      		          async:false,
      		          cache:false,
      		          dataType:"json"
      		      }).responseText;
      			bootbox.alert(result);
      			refreshGrid();
                }
        	});
        })
  	
      	function refreshGrid(){
		$tableList.bootstrapTable('refresh');
      	}
      	
    </script>


</body>
</html>
