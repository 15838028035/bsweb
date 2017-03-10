$(function(){
	
	//渲染页面
	contralEffect.contain();
	contralEffect.tablelist();
	contralEffect.blueButton();
	

	//表格 
	$("#list")
	.jqGrid(
			{
				url : App.path+"jsp/dscp/sensidimensionacct/sensidimensionacctshow.action",
				datatype : 'json',
				mtype : 'POST',
				colNames : [ '元数据类型', '资源实体',
						'IP地址','文件目录/实例名','文件/数据表','数据类型','敏感级别','元数据归属应用', '主帐号','从帐号','主帐号归属组织机构' ],
				colModel : [ {
					name : 'metaType',
					index : 'appName',
					align : 'center',
					width : '100'
				}, {
					name : 'entityName',
					index : 'appRoleName',
					align : 'center',
					width : '110'
				}, {
					name : 'ip',
					index : 'ip',
					align : 'center',
					width : '100'
				} ,
				{
					name : 'fori',
					index : 'fori',
					align : 'center',
					width : '150'
				} ,
				{
					name : 'fort',
					index : 'fort',
					align : 'center',
					width : '150'
				} ,
				{
					name : 'dataType',
					index : 'dataType',
					align : 'center',
					width : '80'
				} ,
				{
					name : 'sensiLevel',
					index : 'sensiLevel',
					align : 'center',
					width : '60'
				},{
					name : 'appName',
					index : 'appName',
					align : 'center',
					width : '130'
				}, {
					name : 'mainAccName',
					index : 'mainAccName',
					align : 'center',
					width : '70'
				} ,
				{
					name : 'subAccName',
					index : 'subAccName',
					align : 'center',
					width : '110'
				}, {
					name : 'orgName',
					index : 'orgName',
					align : 'center',
					width : '145'
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
				rowNum : 10, //每页显示记录数
				rowList : [ 10, 24, 36 ], //可调整每页显示的记录数
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
						var resTypeId = $("#resTypeId").val();
						var entityId = $("#entityId").val();
						var sensiDataId = $("#sensiDataId").val();
						var metaTypeId = $("#metaTypeId").val();
						//2.主机3.数据库
						if(resTypeId != null && resTypeId == 2
								&& metaTypeId == 1)
							showModalMessage("元数据类型请选择文件！");
						if(resTypeId != null && resTypeId == 3
								&& metaTypeId == 2)
							showModalMessage("元数据类型请选择数据表！");
						$("#list")
								.jqGrid(
										'setGridParam',
										{
											url : App.path+"jsp/dscp/sensidimensionacct/sensidimensionacctshow!list.action",
											postData : {
												"queryVO.entityId" : entityId,
												"queryVO.sensiDataId" : sensiDataId,
												"queryVO.metaTypeId" :metaTypeId
											},
											page : 1
										}).trigger("reloadGrid");

						$("#gbox_list").find("input[type=checkbox]").attr(
								"disabled", "").attr("checked", "");
						return false;
	});
	
	
	$("#sensiDataId").click(function(){
		var entityId = $("#entityId").val();
		if(entityId == "")
			showModalMessage("请先选择资源实体！");
	});
	
	$("#reset").click(function(){
		$("#sensiDataId").html('');
	});
	
	$("#choosEntity").click(function(){
		DscpBase.showDeviceResourceDlg();
	});
	
	$("#clearEntity").click(function(){
		$("[name='entityId']:input").val('');
		$("[name='resTypeId']:input").val('');
		$("[name='entityName']:input").val('');
	});
	
});
