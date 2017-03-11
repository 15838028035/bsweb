$(function(){
	
	//渲染页面
	contralEffect.contain();
	contralEffect.tablelist();
	contralEffect.blueButton();
	
	//表格 
	$("#list")
			.jqGrid(
					{
						url : App.path+"jsp/dscp/accdimensionappauth/accdimensionappauthshow.action",
						datatype : 'json',
						mtype : 'POST',
						colNames : [ 'appId', '主帐号', '从帐号', '应用标识', '应用角色',
								'应用权限' ],
						colModel : [ {
							name : 'appId',
							index : 'appId',
							width : '50',
							hidden : true
						}, {
							name : 'mainAccName',
							index : 'mainAccName',
							align : 'center',
							width : '100'
						}, {
							name : 'subAccName',
							index : 'subAccName',
							align : 'center',
							width : '250'
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
							width : '300'
						} ],
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
	});
	
	
	/**
	 * 单击事件-组织机构树
	 */
	$("#chooseOrganization").click(function(){
		var mainAcctName = $("[name='mainAcctName']:input").val();
		if(mainAcctName != ''){
			showModalMessage("组织机构和主帐号只能选择其一!");
			return false;
		}
		DscpBase.showOrganizationDlg();
	});
	
	/**
	 * 清空事件-组织机构树
	 */
	$("#clearOrganization").click(function(){
		$("[name='orgId']:input").val('');
		$("[name='orgName']:input").val('');
	});
	
	$("#choosePerson").click(function(){
		var orgName = $("[name='orgName']:input").val();
		if(orgName != ''){
			showModalMessage("组织机构和主帐号只能选择其一!");
			return false;
		}
		DscpBase.showPersonDlg();
	});
	
	$("#clearPerson").click(function(){
		$("[name='mainAcctId']:input").val('');
		$("[name='mainAcctName']:input").val('');
		var html = '';
		$("#subAccId").html(html);
	});
	
	//提交查询
	$('#queryForm')
			.submit(
					function() {
						//var subAccId = $("#subAccId").val();
						//if(subAccId == null || subAccId=='null')subAccId='';
						var subAccName = $("#subAccId").find("option:selected").text();
						var appRoleId = $("#appRoleId").val();
						if(appRoleId == null || appRoleId=='null')appRoleId='';
						var orgId = $("#orgId").val();
						var mainAcctName = $("#mainAcctName").val();
						if(orgId != '' && mainAcctName != '')
						{
							showModalMessage("组织机构和主帐号只能选择其一!");
							return false;
						}

						$("#list")
								.jqGrid(
										'setGridParam',
										{
											url : App.path+"jsp/dscp/accdimensionappauth/accdimensionappauthshow!list.action",
											postData : {
												"queryVO.orgId" : orgId,
												"queryVO.mainAccName" : mainAcctName,
												"queryVO.subAccName" : subAccName,
												"queryVO.appId" : $("#appId").val(),
												"queryVO.appRoleId" :appRoleId
											},
											page : 1
										}).trigger("reloadGrid");

						$("#gbox_list").find("input[type=checkbox]").attr(
								"disabled", "").attr("checked", "");
						return false;
	});
	
	/**
	 * 显示应用子帐号URL
	 */
	subAcctUrl=App.path+"jsp/dscp/accdimensionappauth/accdimensionappauthshow!findAppSubAcct.action";
	
	$("#appRoleId").click(function(){
		var appId = $("#appId").val();
		if(appId == "")
			showModalMessage("请先选择应用系统！");
	});
	
	$("#subAccId").click(function(){
		var mainAcctName = $("#mainAcctName").val();
		if(mainAcctName == null || mainAcctName == "")
			showModalMessage("请先选择或输入主帐号！");
	});
	
	$("#reset").click(function(){
		$("#subAccId").html('');
		$("#appRoleId").html('');
	});

});
