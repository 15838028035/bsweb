$(function(){
	
	//渲染页面
	contralEffect.contain();
	contralEffect.tablelist();
	contralEffect.blueButton();
	//表格 
	$("#list")
			.jqGrid(
					{
						url : App.path+"jsp/dscp/accdimensionsysauth/accdimensionsysauthshow.action",
						datatype : 'json',
						mtype : 'POST',
						colNames : [ '主帐号', '从帐号', '元数据类型', '资源实体',
								'IP地址','文件目录/实例名','文件/数据表','数据类型','敏感级别','操作权限' ],
						colModel : [ {
							name : 'mainAccName',
							index : 'mainAccName',
							align : 'center'
						}, {
							name : 'subAccName',
							index : 'subAccName',
							align : 'center'
						}, {
							name : 'metaType',
							index : 'metaType',
							align : 'center'
						}, {
							name : 'entityName',
							index : 'entityName',
							align : 'center'
						}, {
							name : 'ip',
							index : 'ip',
							align : 'center',
							width : '100'
						} ,
						{
							name : 'fori',
							index : 'fori',
							align : 'center'
						} ,
						{
							name : 'fort',
							index : 'fort',
							align : 'center'
						} ,
						{
							name : 'dataType',
							index : 'dataType',
							align : 'center'
						} ,
						{
							name : 'sensiLevel',
							index : 'sensiLevel',
							align : 'center'
						} ,
						{
							name : 'appPermissionName',
							index : 'appPermissionName',
							align : 'center'
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
						rowNum : 10, //每页显示记录数
						rowList : [ 10, 24, 36 ], //可调整每页显示的记录数
						multiselect : false, //是否支持多选
						viewrecords : true,
						height : '100%',
						autowidth:true,
						shrinkToFit:true,
						//width : '100%',
						hidegrid : false,
						loadtext : "数据加载中......",
						scrollrows : true
					});
	
	/**
	 * 显示系统资源
	 */
	$("#metaTypeId").change(function(){
		var metaTypeId = $("#metaTypeId").val();
		if(metaTypeId == 0){
			var html = '';
			$("#resId").html(html);
		}
		if(metaTypeId != 0)
		$.ajax({
			type:"POST",
			url:App.path+"jsp/dscp/accdimensionsysauth/accdimensionsysauthshow!findSysRes.action",
			data:{"queryVO.metaTypeId":metaTypeId},
			success:function(data){
				var jsonstr = eval(data);
				var html = '';
				$("#resId").html(html);
				$("<option value=''></option>").appendTo("#resId");
				for(var i=0;i<jsonstr.length;i++){
					$("<option value='"+jsonstr[i].resId+"'>"+jsonstr[i].fori+"</option>").appendTo("#resId");
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
						var subAccName = $("#subAccId").find("option:selected").text();
						if(subAccName != null && subAccName != ""){
							var filter_char_array = new Array("<数据库>","<主机>");
							subAccName = filter_char(subAccName,filter_char_array);
						}
						var resId = $("#resId").val();
						if(resId == null)resId="";
						var metaTypeId = $("#metaTypeId").val();
						var sensiLevelId = $("#sensiLevelId").val();
						if(sensiLevelId == null || sensiLevelId == 0 )sensiLevelId="";
						var dataTypeId = $("#dataTypeId").val();
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
											url : App.path+"jsp/dscp/accdimensionsysauth/accdimensionsysauthshow!list.action",
											postData : {
												"queryVO.orgId" : orgId,
												"queryVO.mainAccName" : mainAcctName,
												"queryVO.subAccName" : subAccName,
												"queryVO.resId" : resId,
												"queryVO.metaTypeId" :metaTypeId,
												"queryVO.sensiLevelId" : sensiLevelId,
												"queryVO.dataTypeId" :dataTypeId
											},
											page : 1
										}).trigger("reloadGrid");

						$("#gbox_list").find("input[type=checkbox]").attr(
								"disabled", "").attr("checked", "");
						return false;
	});
	
	/**
	 * 显示系统子帐号URL
	 */
	subAcctUrl=App.path+"jsp/dscp/accdimensionsysauth/accdimensionsysauthshow!findSysSubAcct.action";
	
	function filter_char(ori,filter){
		for(var i=0;i<filter.length;i++ ){
			var char = filter[i];
			if(ori.indexOf(char) != -1)
				ori = ori.replace(char,"");
		}
		return ori;
	}
	
	$("#resId").click(function(){
		var metaTypeId = $("#metaTypeId").val();
		if(metaTypeId == 0)
			showModalMessage("请先选择元数据类型！");
	});
	
	$("#subAccId").click(function(){
		var mainAcctName = $("#mainAcctName").val();
		if(mainAcctName == null || mainAcctName == "")
			showModalMessage("请先选择或输入主帐号！");
	});
	
	$("#reset").click(function(){
		$("#subAccId").html('');
		$("#resId").html('');
	});

});
