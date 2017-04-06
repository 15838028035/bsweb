
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>角色管理</title>
    <meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script  type="text/javascript">
	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	});

	
	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/role/upmRoleAction!bootStrapList.action',         //请求后台的URL（*）
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
						 {field:'roleCode',title:'色角编码', sortable:true},
						 {field:'appId',title:'用应编码', sortable:true},
						 {field:'roleName',title:'色角名称', sortable:true},
						 {field:'createBy',title:'建创人', sortable:true},
						 {field:'createDate',title:'建创日期', sortable:true},
						 {field:'updateBy',title:'更新人', sortable:true},
						 {field:'updateDate',title:'更新日期', sortable:true},
						 {field:'enableFlag',title:'否是有效', sortable:true,formatter : function(value, row, index) {  
	               	   			if(value=='F') return '否';
	               	   			return '是';
               				}  
						 },
						 {field:'lockStatus',title:'定锁状态', sortable:true,sortable:true,formatter : function(value, row, index) {  
	               	   			if(value=='1') return '是';
	               	   			return '否';
               				}  },
						 {field:'roleDesc',title:'色角描述', sortable:true}
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
			var roleCode=$("#roleCode").val();
			var appId=$("#appId").val();
			var roleName=$("#roleName").val();
			var createBy=$("#createBy").val();
	    		var createDateBegin=$("#createDateBegin").val();
	    		var createDateEnd=$("#createDateEnd").val();
			var updateBy=$("#updateBy").val();
	    		var updateDateBegin=$("#updateDateBegin").val();
	    		var updateDateEnd=$("#updateDateEnd").val();
			var enableFlag=$("#enableFlag").val();
			var lockStatus=$("#lockStatus").val();
			var roleDesc=$("#roleDesc").val();

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
		"upmRole.id":id,
		"upmRole.roleCode":roleCode,
		"upmRole.appId":appId,
		"upmRole.roleName":roleName,
		"upmRole.createBy":createBy,
		"upmRole.createDateBegin":createDateBegin,
		"upmRole.createDateEnd":createDateEnd,
		"upmRole.updateBy":updateBy,
		"upmRole.updateDateBegin":updateDateBegin,
		"upmRole.updateDateEnd":updateDateEnd,
		"upmRole.enableFlag":enableFlag,
		"upmRole.lockStatus":lockStatus,
		"upmRole.roleDesc":roleDesc
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
                        
			 	<label class="control-label col-sm-1" for="roleCode">色角编码</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="roleCode"></div>
                        
			 	<label class="control-label col-sm-1" for="appId">用应编码</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="appId"></div>
                        
			 	<label class="control-label col-sm-1" for="roleName">色角名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="roleName"></div>
                        
			 	<label class="control-label col-sm-1" for="createBy">建创人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="createBy"></div>
                        
			 	<label class="control-label col-sm-1" for="createDate">建创日期</label>
			   <div class="col-sm-2">
                 <input type="text" name="createDateBegin" id = "createDateBegin"  class="date-widget" data-date-format="yyyy-mm-dd hh:ii"  readonly="readonly" placeholder="请选择日期"/>
				<input type="text" name="createDateEnd" id = "createDateEnd"  class="date-widget" data-date-format="yyyy-mm-dd hh:ii"  readonly="readonly" placeholder="请选择日期"/>
                 </div>
			 	<label class="control-label col-sm-1" for="updateBy">更新人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="updateBy"></div>
                        
			 	<label class="control-label col-sm-1" for="updateDate">更新日期</label>
			   <div class="col-sm-2">
                            	<input type="text" name="updateDateBegin" id = "updateDateBegin"   readonly="readonly"/>
				<input type="text" name="updateDateEnd" id = "updateDateEnd"   readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="enableFlag">否是有效</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="enableFlag"></div>
                        
			 	<label class="control-label col-sm-1" for="lockStatus">定锁状态</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="lockStatus"></div>
                        
			 	<label class="control-label col-sm-1" for="roleDesc">色角描述</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="roleDesc"></div>
                        

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
        	window.location.href = '${ctx}/jsp/role/upmRoleAction!input.action'
        });
		
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
        	window.location.href = "${ctx}/jsp/role/upmRoleAction!input.action?operate=edit&id=" + ids;
        });
		
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
        });
        
        function doDelete(){
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/role/upmRoleAction!multidelete.action?multidelete=" + ids,
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
      	};
      	
      	 $(".date-widget").datetimepicker({
             format: 'yyyy-mm-dd',//格式化时间
         });
      	
    </script>

</body>
</html>
