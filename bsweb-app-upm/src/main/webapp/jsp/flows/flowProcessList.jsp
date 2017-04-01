<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>流程定义</title>
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

<script language="javascript">

	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	});

	var TableInit = function () {
       var oTableInit = new Object();
       //初始化Table
       oTableInit.Init = function () {
           $('#tableList').bootstrapTable({
               url: '${ctx}/jsp/flows/flowProcessAction!bootStrapList.action',         //请求后台的URL（*）
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
                         { field: 'id', title: '序号',sortable:true }, 
                         { field: 'flowNo', title: '流程编号',sortable:true}, 
                         { field: 'flowName', title: '流程名称',sortable:true }, 
                         { field: 'displayName', title: '显示名称',sortable:true },
                         { field: 'flowVersion', title: '流程版本' ,sortable:true},
                         { field: 'flowType', title: '流程类型',sortable:true },
                         { field: 'instanceUrl', title: '流程URL',sortable:true },
                         { field: 'createByUName', title: '创建人',sortable:true },
                         
                         { field: 'createDate', title: '创建时间',sortable:true },
                         { field: 'updateByUname', title: '更新人',sortable:true },
                         { field: 'updateDate', title: '更新时间',sortable:true },
                         { field: 'enableFlag', title: '是否有效',sortable:true },
                         { field: 'lockStatus', title: '是否加锁',sortable:true }
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
               "flowProcess.flowNo":$("#flowNo").val(),
			 	"flowProcess.flowName": $("#flowName").val()
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
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="flowNo">
                        </div>
                        <label class="control-label col-sm-1" for="flowName">流程名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="flowName">
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
            
            <div class="window_button marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="processDesigner"  class="window_button_centerInput" value="设计" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="processDeploy"  class="window_button_centerInput" value="部署" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="processDeploy2"  class="window_button_centerInput" value="重新部署" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="startFlow"  class="window_button_centerInput" value="启动流程" /></div>
        	</div>
        
        <table id="tableList"></table>
    </div>
    </div>

    <script type="text/javascript">
    
	  //查询
	    $("#select").click(function() {
			 	var flowNo=$("#flowNo").val();
			 	var flowName=$("#flowName").val();
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/flows/flowProcessAction!jqGridList.action',
				postData : {
			 			 	"flowProcess.flowNo":flowNo,
			 			 	"flowProcess.flowName":flowName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/flows/flowProcessAction!input.action'
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
        	window.location.href = "${ctx}/jsp/flows/flowProcessAction!input.action?operate=edit&id=" + ids;
        })
        
        $("#processDesigner").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		window.location.href = "${ctx}/jsp/flows/flowProcessAction!processDesigner.action";
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	window.location.href = "${ctx}/jsp/flows/flowProcessAction!processDesigner.action?id=" + ids;
        })
        
         //部署
        $("#processDeploy").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要操作的记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	var row=jQuery("#list").jqGrid('getRowData',ids); 
        	var rowId = row.id;
        	var url ="${ctx}/jsp/flows/flowProcessAction!processDeploy.action?id=" + rowId;
        	  var result = jQuery.ajax({
		      	  url:url,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        })
        
          //部署
        $("#processDeploy2").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要操作的记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	var row=jQuery("#list").jqGrid('getRowData',ids); 
        	var rowId = row.id;
        		var url ="${ctx}/jsp/flows/flowProcessAction!processReDeploy.action?id=" + rowId;
        	  var result = jQuery.ajax({
		      	  url:url,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        })
        
        //启动流程
        $("#startFlow").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择要操作的记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	var row=jQuery("#list").jqGrid('getRowData',ids); 
        	var instanceUrl = row.instanceUrl;
        	var rowId = row.id;
        	var flowName = row.flowName;
        	
        	var url ="${ctx}" + instanceUrl +"?processId="+rowId +"&flowProcess.processName="+flowName;
        	window.location.href = url;
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
		      	  url:"${ctx}/jsp/flows/flowProcessAction!multidelete.action?multidelete=" + ids,
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
			    url:'${ctx}/jsp/flows/flowProcessAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
