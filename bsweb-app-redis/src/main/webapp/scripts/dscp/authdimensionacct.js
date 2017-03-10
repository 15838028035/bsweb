$(function(){
	
	//渲染页面
	contralEffect.contain();
	contralEffect.tablelist();
	contralEffect.blueButton();
	
	//表格 
	$("#list")
			.jqGrid(
					{
						url : App.path+"jsp/dscp/authdimensionacct/authdimensionacctshow.action",
						datatype : 'json',
						mtype : 'POST',
						colNames : [ '主帐号', '从帐号', '应用标识', '应用角色',
								'应用权限','岗位职责' ],
						colModel : [ {
							name : 'mainAccName',
							index : 'mainAccName',
							align : 'center',
							width : '100'
						}, {
							name : 'subAccName',
							index : 'subAccName',
							align : 'center',
							width : '247'
						}, {
							name : 'appName',
							index : 'appName',
							align : 'center',
							width : '118'
						}, {
							name : 'appRoleName',
							index : 'appRoleName',
							align : 'center',
							width : '300'
						}, {
							name : 'appAuthName',
							index : 'appAuthName',
							align : 'center',
							width : '200'
						} , {
							name : 'positionName',
							index : 'positionName',
							align : 'center',
							width : '100'
						}],
						pager : '#pager', //分页工具栏 
						sortable : true,
						altclass : 'altclass',
						altRows : true,
						jsonReader : {
							root : "rows",
							repeatitems : false
						},
						prmNames : {
							rows : "pager.pageSize",
							page : "pager.pageNumber",
							total : "pager.totalPages"
						},
						rowNum : 12, //每页显示记录数
						rowList : [ 12, 24, 36 ], //可调整每页显示的记录数
						multiselect : false, //是否支持多选
						viewrecords : true,
						height : '100%',
						//width : '100%',
						autowidth:true,
						hidegrid : false,
						loadtext : "数据加载中......",
						scrollrows : true
					});
	$("#appId").change(function(){
		var appId = $("#appId").val();
		if(appId == ''){
			var html = '';
			$("#appRoleId").html(html);
			$("#appAuthId").html(html);
		}
		if(appId != '')
		$.ajax({
			type:"POST",
			url:App.path+"jsp/dscp/accdimensionappauth/accdimensionappauthshow!findAppRole.action",
			data:{"queryVO.appId":appId},
			success:function(data){
				var jsonstr = eval(data);
				var html = '';
				$("#appRoleId").html(html);
				$("<option value=''></option>").appendTo("#appRoleId");
				for(var i=0;i<jsonstr.length;i++){
					$("<option value='"+jsonstr[i].appRoleId+"'>"+jsonstr[i].appRoleName+"</option>").appendTo("#appRoleId");
				}	
			}
		});
		$.ajax({
			type:"POST",
			url:App.path+"jsp/dscp/authdimensionacct/authdimensionacctshow!findAppAuth.action",
			data:{"queryVO.appId":appId},
			success:function(data){
				var jsonstr = eval(data);
				var html = '';
				$("#appAuthId").html(html);
				$("<option value=''></option>").appendTo("#appAuthId");
				for(var i=0;i<jsonstr.length;i++){
					$("<option value='"+jsonstr[i].appAuthId+"'>"+jsonstr[i].appAuthName+"</option>").appendTo("#appAuthId");
				}	
			}
		});
	});
	
	//提交查询
	$('#queryForm')
			.submit(
					function() {
						var appId = $("#appId").val();
						var appRoleId = $("#appRoleId").val();
						if(appRoleId == null || appRoleId=='null')appRoleId='';
						var appAuthId = $("#appAuthId").val();
						if(appAuthId == null || appAuthId=='null')appAuthId='';
						$("#list")
								.jqGrid(
										'setGridParam',
										{
											url : App.path+"jsp/dscp/authdimensionacct/authdimensionacctshow!list.action",
											postData : {
												"queryVO.appAuthId" : appAuthId,
												"queryVO.appId" : appId,
												"queryVO.appRoleId" :appRoleId
											},
											page : 1
										}).trigger("reloadGrid");

						$("#gbox_list").find("input[type=checkbox]").attr(
								"disabled", "").attr("checked", "");
						return false;
	});
	
	
	$("#appRoleId").click(function(){
		var appId = $("#appId").val();
		if(appId == "")
			showModalMessage("请先选择应用系统！");
	});
	
	$("#appAuthId").click(function(){
		var appId = $("#appId").val();
		if(appId == "")
			showModalMessage("请先选择应用系统！");
	});
	
	$("#reset").click(function(){
		$("#appAuthId").html('');
		$("#appRoleId").html('');
	});

});
