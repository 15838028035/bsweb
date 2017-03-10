
var RADIO_LIST_NAME = "radiolist";
var CHECKBOX_LIST_NAME = "checkboxlist";
var MULTI_CHECKBOX_LIST_NAME = "multicheckboxlist";
var NOT_NULL_LIST_NAME = "notNullList";
var MODIFY_KEY = "_modify";
var CHECKBOX_KEY = "_checkbox";
function addCheckBox(boxName,isModify) {
	var name = CHECKBOX_LIST_NAME;
	if(typeof(isModify)!== 'undefined' && isModify){
		name += MODIFY_KEY;
	}
	var checkboxlist = $("#" + name).val();
	$("#" + name).val(checkboxlist + "," + boxName);
}
function initCheckBox(isModify) {
	var name = CHECKBOX_LIST_NAME;
	if(typeof(isModify)!== 'undefined' && isModify){
		name += MODIFY_KEY;
	}
	if($("#" + name)[0]){
		var checkboxlist = $("#" + name).val().split(",");
		for (var i = 0; i < checkboxlist.length; i++) {
			var checkboxname = checkboxlist[i];
			//alert(checkboxname);
			if (checkboxname != "") {
				//alert("yes=="+checkboxname);
				$("#" + checkboxname).val($("input[type='checkbox'][name='" + checkboxname + CHECKBOX_KEY + "']").is(":checked"));
				//alert(checkboxname + "=====" + $("#" + checkboxname).val());
			}
		}
	}
}
function addMultiCheckBox(multiboxName,isModify) {
	var name = MULTI_CHECKBOX_LIST_NAME;
	if(typeof(isModify)!== 'undefined' && isModify){
		name += MODIFY_KEY;
	}
	var multicheckboxlist = $("#" + name).val();
	$("#" + name).val(multicheckboxlist + "," + multiboxName);
}
function initMultiCheckBox(isModify) {
	var name = MULTI_CHECKBOX_LIST_NAME;
	if(typeof(isModify)!== 'undefined' && isModify){
		name += MODIFY_KEY;
	}
	if($("#" + name)[0]){
		var checkboxlist = $("#" + name).val().split(",");
		for (var i = 0; i < checkboxlist.length; i++) {
			var checkboxname = checkboxlist[i];
			//alert(checkboxname);
			if (checkboxname != "") {
				//alert("yes=="+checkboxname);
				$("#" + checkboxname).val("");
				$("input[type='checkbox'][name='" + checkboxname + CHECKBOX_KEY + "'][checked]").each(function () {
					var test = $("#" + checkboxname).val();
					if (test == "") {
						$("#" + checkboxname).val($(this).val());
					} else {
						$("#" + checkboxname).val(test + "," + $(this).val());
					}
				});
				//alert(checkboxname + "=====" + $("#" + checkboxname).val());
			}
		}
	}
}
function addRadio(radioName,isModify) {
	var name = RADIO_LIST_NAME;
	if(typeof(isModify)!== 'undefined' && isModify){
		name += MODIFY_KEY;
	}
	var radiolist = $("#" + name).val();
	$("#" + name).val(radiolist + "," + radioName);
}
function initRadio(isModify) {
	var name = RADIO_LIST_NAME;
	if(typeof(isModify)!== 'undefined' && isModify){
		name += MODIFY_KEY;
	}
	if($("#" + name)[0]){
		var radiolist = $("#" + name).val().split(",");
		for (var i = 0; i < radiolist.length; i++) {
			var radioname = radiolist[i];
			if (radioname != "") {
				$("#" + radioname).val($("input[type='radio'][name='" + radioname + "'][checked]").val());
				//alert(radioname + "=====" + $("#" + radioname).val());
			}
		}
	}
}

function getToken(path,appId,adminAcctSeq){
	var tokenId =  jQuery.ajax({
     	url:path+"/jsp/app/appacct/commonappacct!getSsoToken.action?timeStamp="+new Date().getTime(),
     	data:{
			"adminAcct.appId":appId,
			"adminAcct.acctSeq":adminAcctSeq
       	},
       	type:"post",
       	async:false,
       	dataType:"text"
     }).responseText;
     return tokenId;
}

function getSsoUrl(path,appId,adminAcctSeq,url,ids){
	var tokenId = getToken(path,appId,adminAcctSeq);
    if(url.indexOf("?")!=-1){
    	url +="&";
    }else{
    	url +="?";
    }
    url += "token="+tokenId+"&flag=1&appAcctId="+adminAcctSeq;
    if(typeof(ids) !== 'undefined'){
	    if(ids == ''|| ids == null ){
	    	
	    }else{
	    	url += ("&editSubAcct="+ids);
	    }
    }
   return url;
}

function getLocalRelUrl(appId,appCode,loginOrgId,realAppId,adminAcctSeq,mainAuthorType,url,ids,optype,isReverst){
	if(url.indexOf("?")!=-1){
		url +="&";
	}else{
       	url +="?";
	}
	url += "appCode="+appCode+"&appId="+appId+"&loginOrgId="+loginOrgId+"&realAppId="+realAppId+"&mainAuthorType="+mainAuthorType+"&grantId="+ids+"&adminAcctSeq="+adminAcctSeq;
	if(optype){
       	url += ("&optype="+optype);
	}
	if(isReverst){
		url += ("&isRevGrant="+isReverst);
	}
	return url;
}

function getLocalUrl(appId,appCode,loginOrgId,realAppId,adminAcctSeq,url,optype){
	if(url.indexOf("?")!=-1){
       	url +="&";
	}else{
       	url +="?";
	}
	url += "appCode="+appCode+"&appId="+appId+"&loginOrgId="+loginOrgId+"&realAppId="+realAppId+"&adminAcctSeq="+adminAcctSeq;
	if(optype){
       	url += ("&optype="+optype);
	}
	return url;
}
				
function openSelectDialog(selectName,selectType,path,appCode,appId,loginOrgId,realAppId,adminAcctSeq){
	jQuery.FrameDialog.create({
		url: path+"/jsp/app/appauthor/commonappauthormng!manager.action?appCode="+appCode+"&appId="+appId+"&loginOrgId="+loginOrgId+"&realAppId="+realAppId+"&adminAcctSeq="+adminAcctSeq+"&selectName="+selectName+"&optype="+selectType,
		title: "选择",
		width: document.documentElement.clientWidth * 0.8,
		height:document.documentElement.clientHeight* 0.95,
		//show: 'slide',
		hide: 'slide',
		buttons:{}							
	}).bind('dialogclose', function(event, ui) {
		
    });
}

function addNotNullList(isNotNull,notNullId,notNullName,isModify) {
	if(typeof(isNotNull)!== 'undefined' && isNotNull == 'N'){
		var name = NOT_NULL_LIST_NAME;
		if(typeof(isModify)!== 'undefined' && isModify){
			name += MODIFY_KEY;
		}
		var notNullList = $("#" + name).val();
		$("#" + name).val(notNullList + "," + notNullId + "~" + notNullName);
	}
}
function notNullValidate(isModify){
	var name = NOT_NULL_LIST_NAME;
	if(typeof(isModify)!== 'undefined' && isModify){
		name += MODIFY_KEY;
	}
	if($("#" + name)[0]){
		var notNullList = $("#" + name).val().split(",");
		for (var i = 0; i < notNullList.length; i++) {
			var notNullAttr = notNullList[i];
			//alert(notNullName);
			if (notNullAttr != "") {
				//alert("yes=="+notNullName);
				var notNull = notNullAttr.split("~");
				if(notNull.length == 2){
					var value = $("#" + notNull[0]).val();
					if(value == '' || value.length == 0){
						if($('#'+notNull[0]).is(":hidden") != true){
							showModalMessage(notNull[1] + "不能为空","$('#"+notNull[0]+"')[0].focus()");
						}else{
							showModalMessage(notNull[1] + "不能为空");
						}
						return notNull[1] + "不能为空";
					}
				}
			}
		}
	}
	return true;
}

function getTreeTypeList(path,appCode,showType){
	var list ;
 	jQuery.ajax({
        url:path+"/jsp/app/appauthor/commonappauthormng!getTreeTypeList.action?appCode="+appCode+"&showType="+showType+"&time="+new Date(),
        async:true,
        cache:false,
        dataType:"json",
        async: false,
        success:function(data) {
	 		list = data.list;
      	}
	});
	return list;
}

function isThisNodeLeaf(path,appCode,appId,optype,adminAcctSeq,id){
	var isLeaf = $.ajax({
		type: "POST",
		url: path+"/jsp/app/appauthor/commonappauthortreemng!isHaveChildren.action?random="+new Date(),
		data:{
			"appCode":appCode,
			"appId":appId,
			"optype":optype,
			"adminAcctSeq":adminAcctSeq,
			"treeNodeId":id
        	},
		dataType: "text",
		async: false
	}).responseText;
	
	if(isLeaf == "true"){
		return true;
	}else{
		return false;
	}
}
