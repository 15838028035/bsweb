if(DscpBase == undefined){
	var DscpBase = {};
}

DscpBase.showDialogWithNoButton = function(id,url,title,height,width){
	
	height = (height == null) ? "auto" : height;
	
	$("#"+id).load(url).dialog({
		bgiframe:true,
		title: title,
		width: width,
		height:height,
		modal: true,
		position:"center",
		close:function(){
			$(this).dialog('destroy');
		}
	});
};

DscpBase.showDialogWithOkButton = function(id,url,title,width,height,fn){
	
	height = (height == null) ? "auto" : height;
	
	$("#"+id).load(url).dialog({
		bgiframe:true,
		title: title,
		width: width,
		height:height,
		modal: true,
		position:"center",
		buttons:{
			"确定":fn
		},
		close:function(){
			$(this).dialog('destroy');
		}
	});
};

/**
 * 显示主帐号对话框
 */
DscpBase.showPersonDlg = function(){
	function ok_fn(){
		$("#personDiv").dialog("close");
	}
	DscpBase.showDialogWithNoButton("personDiv",App.path+"jsp/dscp/accdimensionappauth/person_list.jsp","主帐号列表",950,880,null,ok_fn);
};

/**
 * 显示组织机构树
 */
DscpBase.showOrganizationDlg = function(){
	function ok_fn(){
		
	}
	DscpBase.showDialogWithNoButton("orgDiv",App.path+"jsp/dscp/accdimensionappauth/orgtree.jsp","组织机构",250,300,ok_fn);
};

/**
 * 显示子帐号
 */
var subAcctUrl= "";
function getSubAcct(){
	var mainAcctId = $("#mainAcctId").val();
	if(mainAcctId != '')
	$.ajax({
		type:"POST",
		url:subAcctUrl,
		data:{"queryVO.mainAccId":mainAcctId},
		success:function(data){
			var jsonstr = eval(data);
			var html = '';
			$("#subAccId").html(html);
			$("<option value=''></option>").appendTo("#subAccId");
			for(var i=0;i<jsonstr.length;i++){
				$("<option value='"+jsonstr[i].subAccId+"'>"+jsonstr[i].subAccName+"</option>").appendTo("#subAccId");
			}	
		}
	});
}

/**
 * 显示设备资源对话框
 */
DscpBase.showDeviceResourceDlg = function(){
	function ok_fn(){
		var selectedIds = [];
		selectedIds = $("#device_resource_list").jqGrid("getGridParam", "selarrrow");
		var checkedStr = '';
		var checkedNameStr = '';
		var checkedResTypeIdStr = '';
		$(selectedIds).each(function(i,o){
			if(o == undefined) return true;
			if(i < selectedIds.length - 1)
				checkedStr+=o+',';
			else
				checkedStr+=o;
			var entityName = jQuery("#device_resource_list").jqGrid('getRowData',o).entityName;
			if(i < selectedIds.length - 1)
				checkedNameStr += entityName + ',';
			else
				checkedNameStr += entityName;
			var resTypeId = $("#device_resource_list").jqGrid('getRowData',o).resTypeId;
			if(i < selectedIds.length - 1)
				checkedResTypeIdStr += resTypeId + ',';
			else
				checkedResTypeIdStr += resTypeId;
		});
		
		$("[name='entityId']:input").val(checkedStr);
		$("[name='checkedDeviceResourceShowName']:input").val(checkedNameStr);
		$("[name='checkedDeviceResTypeIds']:input").val(checkedResTypeIdStr);
		$("#deviceResourceDiv").dialog("close");
	}
	//DscpBase.showDialogWithOkButton("deviceResourceDiv",App.path+"jsp/dscp/sensidimensionacct/device_resource.jsp","设备资源列表",850,null,ok_fn);
	DscpBase.showDialogWithNoButton("deviceResourceDiv",App.path+"jsp/dscp/sensidimensionacct/device_resource.jsp","实体资源列表",430,850,null,ok_fn);
};
