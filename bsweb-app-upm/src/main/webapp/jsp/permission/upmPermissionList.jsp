
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>管理</title>
     <%@ include file="/jsp/common/meta.jsp" %>
    <%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script language="javascript"  type="text/javascript">
	$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${list}, ids = [], rootIds = [];
			for (var i=0; i<data.length; i++){
				ids.push(data[i].id);
			}
			ids = ',' + ids.join(',') + ',';
			for (var i=0; i<data.length; i++){
				if (ids.indexOf(','+data[i].parentId+',') == -1){
					if ((','+rootIds.join(',')+',').indexOf(','+data[i].parentId+',') == -1){
						rootIds.push(data[i].parentId);
					}
				}
			}
			for (var i=0; i<rootIds.length; i++){
				addRow("#treeTableList", tpl, data, rootIds[i], true);
			}
			$("#treeTable").treeTable({expandLevel : 5});
		});

		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if (row.parentId == pid){
					$(list).append(Mustache.render(tpl, {
						pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
		
</script>
</head>

<body>


<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
			 	<label class="control-label col-sm-1" for="appId">应用ID</label>
			<div class="col-sm-2"> <input type="text" class="form-control" id="appId"></div>
			 	<label class="control-label col-sm-1" for="name">名称</label>
			<div class="col-sm-2"> <input type="text" class="form-control" id="name"></div>
                        <div class="col-sm-12" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>   
 </div>    
        
        <table id="treeTable" class="table table-striped  table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>类型</th>
				<th>code</th>
				<th>key_code</th>
				<th>态状</th>
				<th>注备</th>
				<th>排序</th>
				<th>图片路径</th>
				<th>创建日期</th>
				<th>更新日期</th>
				<th>是否有效</th>
				<th>锁定状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td>
                <a href="${ctx}/jsp/permission/upmPermissionAction!input.action??id={{row.id}}&operate=edit">{{row.name}}</a>
            </td>
			<td>{{row.type}}</td>
			<td>{{row.code}}</td>
			<td>{{row.keyCode}}</td>
			<td>{{row.state}}</td>
			<td>{{row.remark}}</td>
			<td>{{row.sortNo}}</td>
			<td>{{row.iconPath}}</td>
			<td>{{row.createDate}}</td>
			<td>{{row.updateDate}}</td>
			<td>{{row.enableFlag}}</td>
			<td>{{row.lockStatus}}</td>
			<td>
   				<a href="${ctx}/jsp/permission/upmPermissionAction!input.action??id={{row.id}}&operate=edit">修改</a>
				<a href="${ctx}/jsp/permission/upmPermissionAction!delete?id={{row.id}}" onclick="return confirmx('确认要删除该及所有子吗？', this.href)">删除</a>
				<a href="${ctx}/form?parent.id={{row.id}}">添加下级</a> 
			</td>
		</tr>
	</script>


</body>
</html>
