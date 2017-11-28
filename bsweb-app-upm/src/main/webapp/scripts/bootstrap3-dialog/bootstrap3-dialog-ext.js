//弹出错误提示的登录框
$.showErr = function(str, func) {
    // 调用show方法
    BootstrapDialog.show({
        type : BootstrapDialog.TYPE_DANGER,
        title : '错误 ',
        message : str,
        size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
        buttons : [ {// 设置关闭按钮
            label : '关闭',
            action : function(dialogItself) {
                dialogItself.close();
            }
        } ],
        // 对话框关闭时带入callback方法
        onhide : func
    });
};

$.showConfirm = function(str, funcok, funcclose) {
    BootstrapDialog.confirm({
        title : '确认',
        message : str,
        type : BootstrapDialog.TYPE_WARNING, // <-- Default value is
        // BootstrapDialog.TYPE_PRIMARY
        closable : true, // <-- Default value is false，点击对话框以外的页面内容可关闭
        draggable : true, // <-- Default value is false，可拖拽
        btnCancelLabel : '取消', // <-- Default value is 'Cancel',
        btnOKLabel : '确定', // <-- Default value is 'OK',
        btnOKClass : 'btn-warning', // <-- If you didn't specify it, dialog type
        size : BootstrapDialog.SIZE_SMALL,
        // 对话框关闭的时候执行方法
        onhide : funcclose,
        callback : function(result) {
            // 点击确定按钮时，result为true
            if (result) {
                // 执行方法
                funcok.call();
            }
        }
    });
};

$.showSuccessTimeout = function(str, func) {
    BootstrapDialog.show({
        type : BootstrapDialog.TYPE_SUCCESS,
        title : '成功 ',
        message : str,
        size : BootstrapDialog.SIZE_SMALL,
        buttons : [ {
            label : '确定',
            action : function(dialogItself) {
                dialogItself.close();
            }
        } ],
        // 指定时间内可自动关闭
        onshown : function(dialogRef) {
            setTimeout(function() {
                dialogRef.close();
            }, YUNM._set.timeout);
        },
        onhide : func
    });
};

$.iframeDialog = function(title,url, callBackFunction) {
    BootstrapDialog.show({
        title : title,
        size : BootstrapDialog.SIZE_WIDE,
        message: $("<iframe id='iframeDialog' width=\"100%;\" height=\"800px\"; src="+url+"></iframe>"),
        buttons : [ {
            label : '确定',
            action : function(dialogItself) {
                dialogItself.close();
            }
        } ],
        onhide : callBackFunction
    });
};

$.iframeDialogHeight = function(title,url, callBackFunction,height) {
    BootstrapDialog.show({
        title : title,
       // size : BootstrapDialog.SIZE_WIDE,
        message: $("<iframe id='iframeDialog' width=\"100%;\" height=\"" + height+"px\"; src="+url+"></iframe>"),
        buttons : [ {
            label : '确定',
            action : function(dialogItself) {
                dialogItself.close();
            }
        } ],
        onhide : callBackFunction
    });
};

function selectOrg(ctx, e1, e2) {
	var url =  ctx+ "/jsp/user/upmUserSelectNew.jsp";
	$.iframeDialog("选择用户",url,selectOrgCallback);
}

function selectOrgCallback() {
	var childdoc = document.getElementById("iframeDialog").contentWindow.document;
	var l = childdoc.getElementById("returnValue").value;
	if (l == null)
		return;
	var result = splitUsersAndAccounts(l);
	element1.value = result[0];
	element1.title = result[0];
	element2.value = result[1];
}

function selectOrgUser(ctx, e1, e2) {
	var url =  ctx+ "/jsp/user/upmUserSelectNew.jsp";
	$.iframeDialog("选择用户",url,selectOrgCallback);
}

function splitUsersAndAccounts(userNamesAndAccount) {
	var userNames = "";
	var accounts = "";

	var array = userNamesAndAccount.split(";");
	for (i = 0; i < array.length; i++) {
		var temp = splitUserNameAndAccount(array[i]);
		userNames += temp[0] + ",";
		accounts += temp[1] + ",";
	}
	userNames = userNames.substr(0, userNames.length - 1);
	accounts = accounts.substr(0, accounts.length - 1);
	var result = new Array(2);
	result[0] = userNames;
	result[1] = accounts;
	return result;
}

function splitUserNameAndAccount(userNameAndAccount) {
	var temp = new Array(2);
	if (userNameAndAccount.indexOf("(") != -1) {
		temp[0] = userNameAndAccount.substring(0, userNameAndAccount
				.indexOf("("));
		temp[1] = userNameAndAccount.substring(
				userNameAndAccount.indexOf("(") + 1, userNameAndAccount
						.indexOf(")"));
	} else {
		temp[0] = userNameAndAccount;
		temp[1] = userNameAndAccount;
	}
	return temp;
}