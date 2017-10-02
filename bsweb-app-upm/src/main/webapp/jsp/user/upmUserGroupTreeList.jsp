<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>组织机构管理</title>
    <meta name="viewport" content="width=device-width" />
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
	<%@ include file="/jsp/common/resource/styles_all.jsp"%>
	
	<style type="text/css" >
	 .login-dialog .modal-dialog  {
                width: 98%;
                height:1000px;
                min-height:1000px;
            }
             .speial-dialog .modal-dialog-body {
                width: 92%;
            }
            .speial-dialog .bootstrap-dialog-message {
            }
           
	</style>
	
</head>

<script type="text/javascript">
var CHILDREN_SELECTED = "0";
var CHILDREN_NOTSELECTED = "1";

var treeNodeId = "" ;

$(document).ready(function(){
		//获取权限菜单树
		var jsonData = $.ajax({
			          url:"${ctx}/jsp/user/upmUserGroupAction!list.action",
			          async:false,
			          cache:false,
			          dataType:"text"
		}).responseText;
		
		jsonData = "[" + jsonData + "]";
		
		var dataObj=eval("("+jsonData+")");
        
		 $('#upmUserGroupTreeDiv').treeview({
	            data:dataObj,
	            levels: 10,
	            showIcon: true,  
	            multiSelect: false,
	            highlightSelected: true, //是否高亮选中
	            highlightSearchResults:true,
	            showCheckbox:false,
	            showIcon:true,
	            onNodeChecked: function(event, data) {
	            	
	            },
				 onNodeSelected: function(event, data) {
					 
					 if(data.nodes!=null){                               
					        var select_node = $('#upmUserGroupTreeDiv').treeview('getSelected');
					        if(select_node[0].state.expanded){
					            $('#upmUserGroupTreeDiv').treeview('collapseNode',select_node);
					            select_node[0].state.selected=false;
					        }
					        else{
					            $('#upmUserGroupTreeDiv').treeview('expandNode',select_node);
					            select_node[0].state.selected=false;
					        }
					    }
					 
					  treeNodeId = data.id;
	                    $("#btnInsert").prop("disabled",false);
			  			$("#btnsaveorg").prop("disabled",false);//set btn-save
			  			$("#btn_delete").prop("disabled",false);
			  			$("#btnAssignRole").prop("disabled",false);
				  			var childrenSelected = data.isselectchild;//set checkbox childrenSelected
				  			//alert("current user childrenSelected:"+childrenSelected);
					  		if(childrenSelected==CHILDREN_NOTSELECTED || childrenSelected==""){
					  			$("[name='childrenSelected']").prop("checked",false);
					  			$("[name='childrenSelected']").prop("disabled",true);
					  		}else{
					  			$("[name='childrenSelected']").prop("disabled",false);
					  		}
				  		$("#auditactselectedOrgid").val(treeNodeId);
				  		$("#parentId").val(treeNodeId);
				  		//加载用户信息
				  		refreshGrid();
		       },
		       onNodeExpanded: addNextNode
		      }
		 );

			 var oTable = new TableInit();
		     oTable.Init();
});

/**
 * 一个节点被展开 惰性加载
 */
function addNextNode(event, node) {
    $.getJSON("${ctx}/jsp/user/upmUserGroupAction!list.action?treeNodeId="+node.nodeId, function (data) {
    	$('#upmUserGroupTreeDiv').treeview("deleteChildrenNode", node.nodeId);
    	$('#upmUserGroupTreeDiv').treeview("remove", node.nodeId);
    	
    	$.each(data, function (index, nodeItem) {
    				var nodeId = nodeItem.id;
					$('#upmUserGroupTreeDiv').treeview("addNode", [node.nodeId, {levels: 2,node: nodeItem}]);
				});
    	
        // $("#upmUserGroupTreeDiv").treeview("addNode", [{ node: { text: "新加的菜单","parentId":"1"} }]);
    });
    
}
		 
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tableList').bootstrapTable({
        	url:'${ctx}/jsp/user/upmUserAction!listUserByCondition.action?treeNodeId='+treeNodeId, //请求后台的URL（*）
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
            idField:"userGroupAndUserRelId",
            uniqueId: "userGroupAndUserRelId",                     //每一行的唯一标识，一般为主键列
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [ 
                      { field: 'checkStatus', title: '全选',checkbox:true ,footerFormatter:function () {
                    	  return '合计'
                      }}, 
                       {field : 'Number', title : '行号', formatter : function(value, row, index) {  
                    	   			return index+1;
                       			}  
                       },
                       { field: 'userGroupAndUserRelId', title: '用户组织机构关联表ID',sortable:true, visible:false},
                       { field: 'id', title: 'ID',sortable:true}, 
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

$("#btnInsert").on("click", function(){
    //获取表单对象
   var bootstrapValidator = form.data('bootstrapValidator');
      //手动触发验证
      bootstrapValidator.validate();
      if(bootstrapValidator.isValid()){
      }
      
      bootstrapValidator.on('success.form.bv', function (e) {
    	    e.preventDefault();
    	    //提交逻辑
    	    var $form = $(e.target);

    	    // Get the BootstrapValidator instance
    	    var bv = $form.data('bootstrapValidator');
    	    
    	    $("#btnInsert").prop("disabled",true);
    		   $("#btnsaveorg").prop("disabled",true);
    		   $("#btnDelete").prop("disabled",true);
    		   $("#btnAssignRole").prop("disabled",true);
    			var auditactselectedOrgid = $("#auditactselectedOrgid").val();				
    			if(!auditactselectedOrgid){
    				bootbox.alert("请一条记录");
    				return false;
    			}
    			
    			var options = {
    		        dataType:'json', 		        	
    		        cache:false,
    		        type:'post',
    		        contentType:'application/x-www-form-urlencoded; charset=UTF-8', 	       
    		        url:"${ctx}/jsp/user/upmUserGroupAction!save.action",
    		        success:function(respResult, statusText, xhr ) {
    		        	$("#btnInsert").prop("disabled",false);		        	
    		        	$("#btnsaveorg").prop("disabled",false); 
    		        	$("#btnDelete").prop("disabled",false);	
    		        	$("#btnAssignRole").prop("disabled",false);
    		        	 bootbox.alert(respResult.opResult);
    				},
    				 error:function(){
    				 		bootbox.alert("提示信息"+respResult.message);
    				 		$("#btnInsert").prop("disabled",false);
    				 		$("#btnsaveorg").prop("disabled",false);
    				 		$("#btnDelete").prop("disabled",false);
    				 		$("#btnAssignRole").prop("disabled",false);
    				 }
    	     };	
    	         	
    			$("#saveUserGroupForm").ajaxSubmit(options);
    	});
});



		function edit() {
			$("#operate").val("edit");
		}
		//删除
        function mulDelete(){
        	bootbox.confirm('确认要删除么?',function (result) {  
                if(result) {  
                	var ids = $("#parentId").val();
                    var result = jQuery.ajax({
        		      	  url:"${ctx}/jsp/user/upmUserGroupAction!multidelete.action?multidelete=" + ids,
        		          async:false,
        		          cache:false,
        		          dataType:"json"
        		      }).responseText;
        			var obj = eval("("+result+")");
        			bootbox.alert(obj.opResult);
        			//refreshGrid();
                }
        	});
        }
      	
      	function assignRole() {
	      	//分配角色
        	var userGroupId = $("#auditactselectedOrgid").val();				
			if(!userGroupId){
				bootbox.alert("请一条记录");
				return false;
			}
			
      		var dialog = new BootstrapDialog({
      		  	title:"分配角色",
      		  cssClass :"speial-dialog",
      		  size:BootstrapDialog.SIZE_WIDE,
      		    message: $('<iframe  width="100%;" height="800px"; src="${ctx}/jsp/role/upmRoleGroupAssignList.jsp?userGroupId=" +userGroupId + ""></iframe>'),
      		  buttons: [ {
                  label: '关闭',
                  action: function(dialogRef){
                      dialogRef.close();
                  }
              }]
      		});
      		dialog.open();
        }
      	
</script>
</head>
<body>

<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">组织机构管理</div>
            <div class="panel-body">
	<form id="saveUserGroupForm" role="form"  name="saveUserGroupForm" action="${ctx}/jsp/user/upmUserGroupAction!save.action">
	<input type="hidden" name="operate" id="operate"/>
	<input type="hidden" name="parentId" id="parentId"/>
	<input type="hidden" name="auditactselectedOrgid" id="auditactselectedOrgid"/>
	
		<div class="form-group" style="margin-top:15px">
	     	 <label class="control-label col-sm-2" for="userGroupCode">组织机构编码</label>
	         <div class="col-sm-2">
	             <input type="text" class="form-control" id="userGroupCode" name="userGroupCode">
	         </div>
	         <label class="control-label col-sm-2" for="bussinessCode">业务编码</label>
	         <div class="col-sm-2">
	             <input type="text" class="form-control" id="bussinessCode" name="bussinessCode">
	         </div>
	         <label class="control-label col-sm-2" for="userGroupName">组织机构名称</label>
	         <div class="col-sm-2">
	             <input type="text" class="form-control" id="userGroupName" name="userGroupName">
	         </div>
     	</div>
	 <div id="toolbar-A" class="btn-group">
	  		<button id="btn_query" type="button" class="btn btn-default" >查询</button>
            <button id="btnInsert" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
             <button id="btnsaveorg" type="submit" class="btn btn-default" onclick="edit()">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>修改保存
            </button>
            <button id="btn_delete" type="button" class="btn btn-default"  onclick="mulDelete();">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
             <button id="btnAssignRole" type="button" class="btn btn-default"  onclick="assignRole();">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>分配角色
            </button>
        </div>
	<div class="widget_tree" style="height: 300px;width:100%;overflow: no;font-weight: normal;">
<div id="upmUserGroupTreeDiv"  ></div>
</div>

</div>
</div>
</form>

            </div>
        </div>
    </div>
 
    <div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">用户管理</div>
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
                        <div class="col-sm-3" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
				
				 <div id="toolbar" class="btn-group">
            <button id="addRel" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_mulDeleteRel" type="button" class="btn btn-default" onClick="mulDeleteRel();">
                <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除
            </button>
        </div>
				<table id="tableList"></table>

            </div>
        </div>
    </div>
     <script type="text/javascript">
     var $tableList = $('#tableList');
     var $btn_query = $('#btn_query');
     
     $btn_query.click(function () {
    	 refreshGrid();
    });
     
		//新增
        $("#addRel").click(function() {
        	var groupId = $("#auditactselectedOrgid").val();	
        	if(groupId==""){
        		bootbox.alert("请选择组织机构");
        		return false;
        	}
			 
			 var dialog = new BootstrapDialog({
	      		  	title:"用户管理",
	      		  cssClass :"speial-dialog",
	      		  size:BootstrapDialog.SIZE_WIDE,
	      		    message: $('<iframe  width="100%;" height="800px"; src="${ctx}/jsp/user/upmUserSelectAssignList.jsp?groupId=" +groupId + ""></iframe>'),
	      		  buttons: [ {
	                  label: '关闭',
	                  action: function(dialogRef){
	                      dialogRef.close();
	                      refreshGrid();
	                  }
	              }]
	      		});
	      		dialog.open();
	      		
        })
		//删除
        function mulDeleteRel(){
	    	 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
                 return row.userGroupAndUserRelId;
             });
        	if(ids == ""){
        		bootbox.alert("请一条记录");
        		return;
        	}

        	bootbox.confirm('确认要删除么?',function (result) {  
                if(result) {  
                    var result = jQuery.ajax({
        		      	  url:"${ctx}/jsp/user/upmUserAndUserGroupRelAction!multidelete.action?multidelete=" + ids,
        		          async:false,
        		          cache:false,
        		          dataType:"json"
        		      }).responseText;
        			var obj = eval("("+result+")");
        			bootbox.alert(obj.opResult);
        			refreshGrid();
                }
        	});
        }
        
      	function refreshGrid(){
      		var parentId =$("#parentId").val();
			$tableList.bootstrapTable('refresh', "${ctx}/jsp/user/upmUserAction!listUserByCondition.action?treeNodeId="+parentId);
      	}
      	
    </script>
	
</body>
</html>
