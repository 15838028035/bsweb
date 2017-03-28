<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>应用管理</title>
    <meta name="viewport" content="width=device-width" />
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>

<!--css样式-->
<link href="${ctx}/styles/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/styles/bootstrap/bootstrap-table.css" rel="stylesheet">
<!--js-->
<script src="${ctx}/scripts/bootstrap/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="${ctx}/scripts/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/scripts/bootstrap/bootstrap-table.js"></script>
<script src="${ctx}/scripts/bootstrap/bootstrap-table-zh-CN.js"></script>

<style>
.altclass{background: #E5EFFD ;}
</style>

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
                url: '${ctx}/jsp/upmApp/upmAppAction!jqGridList.action',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 50,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [
                          { field: 'id', title: '序号' }, 
                          { field: 'appCode', title: 'appCode' }, 
                          { field: 'appName', title: 'appName' }, 
                          { field: 'appUrl', title: 'appUrl' }
               		 ]
            });
        };
 
        //得到查询的参数
      oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset,  //页码
                "upmApp.appId":$("#appId").val(),
 			 	"upmApp.appCode":$("#appCode").val(),
 			 	"upmApp.appName": $("#appName").val()
            };
            return temp;
        };
        return oTableInit;
    };
		
</script>
</head>

<body>

 <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">应用管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class=" marg_lef10 float_lef"><input type="button" id="add" class="window_button_centerInput" value="新增" /></div>
						<div class=" marg_lef10 float_lef"><input type="button" id="edit" class="window_button_centerInput" value="编辑" /></div>
						<div class=" marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDelete();"/></div>
						<div class=" marg_lef10 float_lef"><input type="button" id="appUserPerMgmt" class="window_button_centerInput" value="账号、角色、权限管理" /></div>
						
					<table>
						<tr>
						<td>应用ID</td>
						<td><input name="upmApp.appId" id = "appId" type="text"/></td>
						<td>应用编号</td>
						<td><input name="upmApp.appCode" id = "appCode" type="text"/></td>
						<td>应用名称</td>
						<td><input name="upmApp.appName" id = "appName" type="text" style="width:100px;"/></td>
						<td>		
							<div class=" marg_lef10 float_lef">
								<input class="window_button_centerInput" name="select" id = "select" type="button" value="查询" /></div>
							</div>
						</td>
						</tr>
					</table>
					</div>
				</div>
				
				<table id="list"></table>
				<div id="pager"></div>

            </div>
        </div>
    </div>
    
    <div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_departmentname">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_statu">状态</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_statu">
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
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
	    	var appId = $("#appId").val();
	    	var appCode = $("#appCode").val();
	    	var appName = $("#appName").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/upmApp/upmAppAction!jqGridList.action',
				postData : {"upmApp.appId":appId,
			 			 	"upmApp.appCode":appCode,
			 			 	"upmApp.appName":appName
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
		//新增
        $("#add").click(function() {
        	window.location.href = '${ctx}/jsp/upmApp/upmAppAction!input.action'
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
        	window.location.href = "${ctx}/jsp/upmApp/upmAppAction!input.action?operate=edit&id=" + ids;
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
        
        
         $("#appUserPerMgmt").click(function() {
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ''){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	if(ids.length > 1){
        		showModalMessage('请选择一条记录');
        		return;
        	}
        	
        	var s = $("#list").jqGrid('getRowData', ids);
        	
        	var appId = s.appId;
        	var appCode = s.appCode;
        	
        	var url= "${ctx}/jsp/app/commoniframe/commoniframe!rightmgmt.action?appId="+appId+"&appCode="+appCode;
        	// 新版 URL= "${ctx}/jsp/app/appauthor/commonappauthormng!permlist.action?appCode="+appCode+"&adminAcctSeq="+adminAcctSeq+"&appId="+appId+"&adminUserId="+adminUserId+"&loginOrgId="+loginOrgId+"&realAppId="+realAppId;
        	
        	//var url= "${ctx}/jsp/app/appauthor/commonappauthormng!permlist.action?appId="+appId+"&appCode="+appCode;
        	window.location.href = url;
        })
        	
        function doDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/upmApp/upmAppAction!multidelete.action?multidelete=" + ids,
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
			   url:'${ctx}/jsp/upmApp/upmAppAction!jqGridList.action',
			 	page:1
			 }).trigger("reloadGrid");
      	}
      	
    </script>


</body>
</html>
