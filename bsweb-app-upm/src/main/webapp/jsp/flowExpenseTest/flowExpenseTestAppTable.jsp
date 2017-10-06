<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>报销申请流程</title>
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
	             //minView: "month",//设置只显示到月份
	             clearBtn:true // 自定义属性,true 显示 清空按钮 false 隐藏 默认:true
	         });
	});

	
	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/flowExpenseTest/flowExpenseTestAction!bootStrapList.action',         //请求后台的URL（*）
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
			 	{field:'id',title:'ID', sortable:true, visible:false},
			 	{field:'operator',title:'申请人', sortable:true},
			 	{field:'operatorAmount',title:'报销金额',footerFormatter:sumFloatFormatter, sortable:true, editable: true,
			 		edit:{type:'text',validate: function (value) { //字段验证
			 			 if (!v) return '报销金额不能为空';
	            	}
			 	}},
			 	{field:'operatorTime',title:'操作时间', sortable:true},
			 	{field:'appMemo',title:'申请备注', sortable:true,editable: true,edit:{type:'textarea'}}
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
             	},
             	onEditableSave: function (field, row, oldValue, $el) {
                    $tableList = $('#tableList').bootstrapTable({});
                    $tableList.bootstrapTable('updateRow', {index: row.rowId, row: row});
                    
                    var postData = {
                    		"flowExpenseTest.id":row.id,
                    		"flowExpenseTest.processId":"${param.processId}",
            				"flowExpenseTest.orderId":"${orderId}",
            				"flowExpenseTest.taskId":"${taskId}",
            				"flowExpenseTest.operatorAmount":row.operatorAmount,
            				"flowExpenseTest.appMemo":row.appMemo
                        };
                    
                    var result = jQuery.ajax({
      		      	  url:"${ctx}/jsp/flowExpenseTest/flowExpenseTestAction!ajaxSave.action",
      		          async:false,
      		          cache:false,
      		          type:"post",
      		          dataType:"json",
      		          data:postData
      		      }).responseText;
      			var obj = eval("("+result+")");
      			bootbox.alert(obj.opResult);
      			
      			refreshGrid();
              }
              
            });
            
        };
 
        //得到查询的参数
      oTableInit.queryParams = function (params) {
            var temp = {//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                rows:params.rows,
                page:params.page,
                total:params.total,
                pageSize:params.limit,
                offset:params.offset,
                "sortName":this.sortName,
                "sortOrder":this.sortOrder,
				"flowExpenseTest.processId":"${param.processId}",
				"isApplyWhere":"true"//申请查询,包含之前草稿箱的记录
            };
            return temp;
        };
        return oTableInit;
    };
	
    function sumFloatFormatter(data) {
        var field = this.field;
        var total_sum = data.reduce(function(sum, row) {
            return (sum) + (parseFloat(row[field]) || 0);
        }, 0);
        return "合计:" + total_sum;
    }
    
</script>
</head>

<body>

	<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">借款申请</div>
            
            <div class="panel-body">
		           <div id="toolbar" class="btn-group">
		            <button id="btn_add" type="button" class="btn btn-default">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		            </button>
		            <button id="btn_delete" type="button" class="btn btn-default">
		                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		            </button>
		        </div>      
 					<table id="tableList"></table>
 					
 					<div id="toolbar2" class="btn-group">
		             <button id="btn_submit" type="button" class="btn btn-primary btn-lg">提交申请 </button>
		        </div>      
            </div>
        </div> 
        
       
    </div>


    <script type="text/javascript">
    	    var $tableList = $('#tableList');
    	    var $btn_add = $('#btn_add');
    	    var $btn_delete = $('#btn_delete');
    	    var $btn_submit = $('#btn_submit');
	    var $btn_query = $('#btn_query');

	    $("#btn_add").click(function() {
	  	  $tableList.bootstrapTable('append', appdendData());
	  	 $tableList.bootstrapTable('scrollTo', 'bottom');
	    });
	    
	    function appdendData() {
	       rows = [];
	        for (var i = 0; i < 1; i++) {
	            rows.push({
	            	"operatorAmount": 0,
	                "appMemo": '申请原因:'
	            });
	        }
	        return rows;
	    }
	    
	    $("#btn_delete").click(function() {
       	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.id;
            });
       	
       	 var selectLength=$tableList.bootstrapTable('getSelections').length;
       	 
       	if(selectLength ==0){
       		bootbox.alert('请选择要删除的记录');
       		return;
       	}
       
       	if(ids==""){
       	 $tableList.bootstrapTable('remove', {
	            field: 'id',
	            values: ids
	        }); 
       		refreshGrid();
       	}
       	
       	if(ids!=""){
	       	bootbox.confirm('确认要删除么?',function (result) {  
	               if(result) {  
	               	doDelete();
	               }
	       	});
       	}
    	
       });
		
       function doDelete(){
       	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.id;
            });
           var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/flowExpenseTest/flowExpenseTestAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			bootbox.alert(obj.opResult);

	    	  $tableList.bootstrapTable('remove', {
	            field: 'id',
	            values: ids
	        });  
			
			refreshGrid();
       }
       
       //提交申请
       $("#btn_submit").click(function() {
    	   var postData = {
           		"processId":"${processId}",
   				"orderId":"${orderId}",
   				"taskId":"${taskId}"
               };
    	 	bootbox.confirm('您确认要提交吗?提交成功后，网页将再5秒内自动关闭',function (result) {  
	               if(result) {  
		           var result = jQuery.ajax({
				      	  url:"${ctx}/jsp/flowExpenseTest/flowExpenseTestAction!flowBorrowTestAppTableSubmit.action",
				          async:false,
				          cache:false,
				          type:"post",
				          dataType:"json",
				          data:postData
				      }).responseText;
					var obj = eval("("+result+")");
					//bootbox.alert(obj.opResult);
					//自动关闭窗口
					parent.window.close();
	               }
    	 	});
    	 	
    	 	 
 	    });
       
  	$btn_query.click(function () {
        	 refreshGrid();
        });

      	function refreshGrid(){
		$tableList.bootstrapTable('refresh');
      	}
      	
    </script>


</body>
</html>
