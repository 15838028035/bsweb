<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>选择用户</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script   type="text/javascript">
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
                url: '${ctx}/jsp/user/upmUserAction!bootStrapList.action',         //请求后台的URL（*）
                method: 'post',                     //请求方式（*）
                dataType: "json",
                contentType : "application/x-www-form-urlencoded;charset=UTF-8",
                dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
                totalField: 'total',
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                smartDisplay:false,
                showRefresh:true,
                showColumns:true,
                showToggle:true,
                searchOnEnterKey:true,
                showFooter:true,
                trimOnSearch:true,
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
                pageSize: 50,                       //每页的记录行数（*）
                pageList: [5,10, 25, 40, 50, 100,'all'],        //可供选择的每页的行数（*）
                showPaginationSwitch:true,
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                //height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                idField:"id",
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [ 
                          { field: 'checkStatus', title: '全选',checkbox:true}, 
                           {field : 'Number', title : '行号', formatter : function(value, row, index) {  
                        	   			return index+1;
                           			}  
                           },
                          { field: 'id', title: 'ID',sortable:true, visible:false}, 
                          { field: 'loginNo', title: '登陆账号',sortable:true }, 
                          { field: 'userName', title: '用户名',sortable:true }, 
                          { field: 'mobile', title: '手机号码',sortable:true },
                          { field: 'email', title: '邮箱' ,sortable:true},
                          { field: 'orgDesc', title: '组织机构描述',sortable:true },
                          { field: 'createDate', title: '创建时间',sortable:true },
                          { field: 'updateDate', title: '修改时间',sortable:true }
               		 ],
             	formatLoadingMessage: function () {
             		return "请稍等，正在加载中...";
             	},
             	formatNoMatches: function () { //没有匹配的结果
             		return '无符合条件的记录';
             	},
             	onLoadError: function (data) {
             		$('#tableList').bootstrapTable('removeAll');
             		 bootbox.alert("数据加载失败！");
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
            		 "page.pageSize":params.pageSize,
                     "page.pageNumber":params.pageNumber,
	                "sortName":this.sortName,
	                "sortOrder":this.sortOrder,
	                "upmUser.loginNo":$("#loginNo").val(),
	                "upmUser.userName":$("#userName").val(),
	 			 	"upmUser.orgDesc":$("#orgDesc").val(),
	 			 	"upmUser.mobile": $("#mobile").val()
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
                    	 <label class="control-label col-sm-1" for="loginNo">登陆账号</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="loginNo">
                        </div>
                        <label class="control-label col-sm-1" for="userName">用户名</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="userName">
                        </div>
                        <label class="control-label col-sm-1" for="mobile">手机号码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="mobile">
                        </div>
                         <label class="control-label col-sm-1" for="orgDesc">组织机构</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="orgDesc">
                        </div>
                        <div class="col-sm-12" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_select" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>选择
            </button>
        </div>
        
        <table id="tableList"></table>
        <input type="text" id="returnValue" name="returnValue" value="" />
    </div>

    <script type="text/javascript">
    	var $tableList = $('#tableList');
    	 var $btn_query = $('#btn_query');
    
        $("#btn_select").click(function() {
        	var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.id;
            });
       	 
	       	if(ids == ""){
	       		bootbox.alert('请选择要选择记录');
	       		return;
	       	}
	       	
	       	var userName = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.userName;
            });
			
	       	var returnValue = userName+"("+userName+");";
	       	
	       	$("#returnValue").val(returnValue);
	       	parent.window.returnValue = returnValue;
	      //  parent.window.returnValue = returnValue;
	        window.close();
	      
        });
        
        function btn_select() {
        	var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.id;
            });
       	 
	       	if(ids == ""){
	       		bootbox.alert('请选择要选择记录');
	       		return;
	       	}
	       	
	       	var userName = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                return row.userName;
            });
			
	       	var returnValue = userName+"("+userName+");";
	        parent.window.returnValue = returnValue;
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
