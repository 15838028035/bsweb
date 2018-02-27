
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
			
			console.log(rootIds.length);
			
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
                    <label class="control-label col-sm-1" for="userGroupCode">组织机构编码</label>
			<div class="col-sm-2"> <input type="text" class="form-control" id="userGroupCode"></div>
			 	<label class="control-label col-sm-1" for="userGroupName">组织机构名称</label>
			<div class="col-sm-2"> <input type="text" class="form-control" id="userGroupName"></div>
			 	<label class="control-label col-sm-1" for="bussinessCode">业务代码</label>
			<div class="col-sm-2"> <input type="text" class="form-control" id="bussinessCode"></div>

                        <div class="col-sm-12" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div> 
        </div>
                
        <table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>组织机构编码</th>
				<th>组织机构名称</th>
				<th>业务代码</th>
			<th>创建日期</th>
			<th>更新日期</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody id="treeTableList"></tbody>
</table>
<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td>{{row.userGroupCode}}</td>
			<td>{{row.userGroupName}}</td>
			<td>{{row.bussinessCode}}</td>
			<td>{{row.createDate}}</td>
			<td>{{row.updateDate}}</td>
			<td>
   				<a href="${ctx}/jsp/user/upmUserGroupAction!input.action?id={{row.id}}&operate=edit">修改</a>
				<a href="${ctx}//jsp/user/upmUserGroupAction!multidelete.action?multidelete={{row.id}}" onclick="return confirmx('确认要删除该及所有子吗？', this.href)">删除</a>
				<a href="${ctx}//jsp/user/upmUserGroupAction!input.action?parentId={{row.id}}">添加下级</a> 
			</td>
		</tr>
	</script>

</body>
</html>
