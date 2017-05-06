
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>upmPermission管理</title>
    <meta name="viewport" content="width=device-width" />
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
	<%@ include file="/jsp/common/resource/styles_all.jsp"%>


<script   type="text/javascript">
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
        var appId=parent.document.getElementById("appId").value;
        var perssionParentId = $("#perssionParentId").val();
        
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: "${ctx}/jsp/permission/upmPermissionAction!bootStrapList.action?appId=" + appId + "&parentId="+ perssionParentId,         //请求后台的URL（*）
                method: "post",                     //请求方式（*）
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
			 	{field:'appId',title:'应用ID', sortable:true},
			 	{field:'parentId',title:'父ID', sortable:true},
			 	{field:'name',title:'名称', sortable:true},
			 	{field:'type',title:'类型', sortable:true},
			 	{field:'url',title:'URL', sortable:true},
			 	{field:'code',title:'code', sortable:true},
			 	{field:'keyCode',title:'key_code', sortable:true},
			 	{field:'state',title:'态状', sortable:true},
			 	{field:'remark',title:'注备', sortable:true},
			 	{field:'sortNo',title:'排序', sortable:true},
			 	{field:'iconPath',title:'图片路径', sortable:true},
			 	{field:'createBy',title:'创建人', sortable:true},
			 	{field:'createDate',title:'创建日期', sortable:true},
			 	{field:'updateBy',title:'新更人', sortable:true},
			 	{field:'updateDate',title:'更新日期', sortable:true},
			 	{field:'enableFlag',title:'是否有效', sortable:true},
			 	{field:'lockStatus',title:'锁定状态', sortable:true}
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
			var appId=$("#appId").val();
			var parentId=$("#parentId").val();
			var name=$("#name").val();
			var type=$("#type").val();
			var url=$("#url").val();
			var code=$("#code").val();
			var keyCode=$("#keyCode").val();
			var state=$("#state").val();
			var remark=$("#remark").val();
			var sortNo=$("#sortNo").val();
			var iconPath=$("#iconPath").val();
			var createBy=$("#createBy").val();
	    		var createDateBegin=$("#createDateBegin").val();
	    		var createDateEnd=$("#createDateEnd").val();
			var updateBy=$("#updateBy").val();
	    		var updateDateBegin=$("#updateDateBegin").val();
	    		var updateDateEnd=$("#updateDateEnd").val();
			var enableFlag=$("#enableFlag").val();
			var lockStatus=$("#lockStatus").val();

            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		 "page.pageSize":params.pageSize,
                     "page.pageNumber":params.pageNumber,
	                "sortName":this.sortName,
	                "sortOrder":this.sortOrder,
					"upmPermission.id":id,
					"upmPermission.appId":appId,
					"upmPermission.parentId":parentId,
					"upmPermission.name":name,
					"upmPermission.type":type,
					"upmPermission.url":url,
					"upmPermission.code":code,
					"upmPermission.keyCode":keyCode,
					"upmPermission.state":state,
					"upmPermission.remark":remark,
					"upmPermission.sortNo":sortNo,
					"upmPermission.iconPath":iconPath,
					"upmPermission.createBy":createBy,
					"upmPermission.createDateBegin":createDateBegin,
					"upmPermission.createDateEnd":createDateEnd,
					"upmPermission.updateBy":updateBy,
					"upmPermission.updateDateBegin":updateDateBegin,
					"upmPermission.updateDateEnd":updateDateEnd,
					"upmPermission.enableFlag":enableFlag,
					"upmPermission.lockStatus":lockStatus
            };
            return temp;
        };
        return oTableInit;
    };
		
</script>
</head>

<body>
  <input type="hidden" name="perssionParentId" id="perssionParentId"
                      value="${parentId}" />
|              <input type="hidden" name="appId" id="appId"
|                      value="${appId}" />

<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                      

			 	<label class="control-label col-sm-1" for="id">ID</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="id"></div>
                        
			 	<label class="control-label col-sm-1" for="appId">应用ID</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="appId"></div>
                        
			 	<label class="control-label col-sm-1" for="parentId">父ID</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="parentId"></div>
                        
			 	<label class="control-label col-sm-1" for="name">名称</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="name"></div>
                        
			 	<label class="control-label col-sm-1" for="type">类型</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="type"></div>
                        
			 	<label class="control-label col-sm-1" for="url">URL</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="url"></div>
                        
			 	<label class="control-label col-sm-1" for="code">code</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="code"></div>
                        
			 	<label class="control-label col-sm-1" for="keyCode">key_code</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="keyCode"></div>
                        
			 	<label class="control-label col-sm-1" for="state">态状</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="state"></div>
                        
			 	<label class="control-label col-sm-1" for="remark">注备</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="remark"></div>
                        
			 	<label class="control-label col-sm-1" for="sortNo">排序</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="sortNo"></div>
                        
			 	<label class="control-label col-sm-1" for="iconPath">图片路径</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="iconPath"></div>
                        
			 	<label class="control-label col-sm-1" for="createBy">创建人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="createBy"></div>
                        
			 	<label class="control-label col-sm-1" for="createDate">创建日期</label>
			   <div class="col-sm-2">
                            	<input type="text" name="createDateBegin" id = "createDateBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="createDateEnd" id = "createDateEnd"  class="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="updateBy">新更人</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="updateBy"></div>
                        
			 	<label class="control-label col-sm-1" for="updateDate">更新日期</label>
			   <div class="col-sm-2">
                            	<input type="text" name="updateDateBegin" id = "updateDateBegin"  class="datetimepicker" readonly="readonly"/>
				<input type="text" name="updateDateEnd" id = "updateDateEnd"  class="datetimepicker" readonly="readonly"/>
                         </div>
			 	<label class="control-label col-sm-1" for="enableFlag">是否有效</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="enableFlag"></div>
                        
			 	<label class="control-label col-sm-1" for="lockStatus">锁定状态</label>
				<div class="col-sm-2"> <input type="text" class="form-control" id="lockStatus"></div>
                        

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
        	window.location.href = '${ctx}/jsp/permission/upmPermissionAction!input.action'
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
        	window.location.href = "${ctx}/jsp/permission/upmPermissionAction!input.action?operate=edit&id=" + ids;
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

        	doDelete();
        })

        function doDelete(){
        	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.id;
             });
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/permission/upmPermissionAction!multidelete.action?multidelete=" + ids,
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
      	
    </script>


</body>
</html>
