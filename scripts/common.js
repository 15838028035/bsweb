var url=window.location.href;
var start=window.location.host.length+window.location.protocol.length+2;
var end = url.indexOf("/upm");
var ctx=url.substring(start,end);
/**
* 文本输入框鼠标定位时消除提示语
* @param inputId 输入框id
* @param inputDefaultValue 输入框默认值
* @author yuhao
*/
function removeTipsOnFocus(inputId,inputDefaultValue){
	$("#"+inputId).focus(function(){
		if($(this).val() == inputDefaultValue){
			$(this).val("");
		}
	});
	$("#"+inputId).blur(function(){
		if($(this).val() == ""){
			$(this).val(inputDefaultValue);
		}
	});
}
	
/**
* 密码域输入框鼠标定位时消除提示语
* @param passwdId 密码域id
* @param passwdPlaceHolderId 替代符id
* @author yuhao
*/
function switchPasswdAndTips(passwdId,passwdPlaceHolderId){
	// 密码输入框隐藏
	$("#"+passwdId).hide();
	// 密码输入框提示语显示
	$("#"+passwdPlaceHolderId).show();
	// 密码输入框鼠标定位时消除提示语
	$("#"+passwdPlaceHolderId).focus(function(){
		$(this).hide();
		$("#"+passwdId).show();
		$("#"+passwdId).focus();
	});
	$("#"+passwdId).blur(function(){
		if($(this).val() == ""){
			$("#"+passwdPlaceHolderId).show();
			$(this).hide();
		}
	});
}


/**
* 弹出短消息操作
* @param buttonId 按钮对象的id
* @param divId 要显示的div的id
* @author wangsj5
*/
function showMsgBox(buttonId,divId){
	$("#"+buttonId).click(function(){
			var div=$("#"+divId)
			$.msgbox({
				closeImg:ctx+'/web3/images/close03.png',
				height:div.height(),
				width:div.width(),
				content:div.html(),	
				title 			  :' ',    
				titleClass 	      :'',
				closeClass        :'',
				titleWrapperClass :'none',
				mainClass 		  :' ',
				type :'text',
				bgAnimate: false, // 禁止背景动画
				boxAnimate: false,// 禁止提示框动画
				enableDrag: false // 禁止拖拽
			});
	});
}
/**
* 弹出短消息操作
* @param content 内容
* @author wangsj5
*/
function showMsgBoxInfo(content,fun){
	$.msgbox({
		content:content,
		type :'alert',
		bgAnimate: false,
		boxAnimate: false,
		enableDrag: false, // 禁止拖拽
		onClose:function(v){
			eval(fun);
		}
	});
}
/**
* 弹出短消息操作
* @param content 内容
* @param width 宽度
* @param height 高度
* @author wangsj5
*/
function showMsgBoxInfoWH(content,width,height){
	$.msgbox({
		height  :height,
		width   :width,
		content :content,
		type    :'alert',
		bgAnimate: false,
		boxAnimate: false,
		enableDrag: false // 禁止拖拽
	});
}

function showMsgBoxInfoWHCallBackFun(content,width,height,fun){
	$.msgbox({
		height:height,
		width:width,
		content:content,
		type :'alert',
		bgAnimate: false,
		boxAnimate: false,
		enableDrag: false, // 禁止拖拽
		onClose:function(){
			eval(fun);
		}
	});
}
function showMsgBoxInfoCallBackFun(content,fun){
	$.msgbox({
		content:content,
		type :'alert',
		bgAnimate: false,
		boxAnimate: false,
		enableDrag: false, // 禁止拖拽
		onClose:function(v){
			eval(fun);
		}
	});
}

/**
* 弹出短消息操作
* @param content 内容
* @param yes 选择yes需要调用的函数
* @param no 选择no需要调用的函数
* @author wangsj5
*/
function showMsgBoxConfirm(content,yes,no){
	$.msgbox({
		content:content,
		type :'confirm',
		enableDrag: false, // 禁止拖拽
		onClose:function(v){
			if(v) eval(yes);else eval(no);
		},
		bgAnimate: false,
		boxAnimate: false
	});
}

/**
* jQuery msgBox插件封装
* @param type 要放入的数据类型
* @param width 弹出框宽度
* @param height 弹出框高度
* @param content 要显示的内容（当type是ajax、iframe，可以是Url地址）
* @param closeImgPath 关闭按钮图片的路径
*/
function jQueryMsgBox(type,width,height,content,closeImgPath){
	$.msgbox({
				closeImg:closeImgPath,
				height:height,
				width:width,
				content:content,	
				title 			  :' ',    
				titleClass 	      :'',
				closeClass        :'',
				titleWrapperClass :'none',
				mainClass 		  :' ',
				type :type,
				bgAnimate: false, // 禁止背景动画
				boxAnimate: false,// 禁止提示框动画
				enableDrag: false // 禁止拖拽
			});
}



/**
* 校验是否是合法ip
* @param obj
* @author yuhao
*/
function validateObjIsIp(obj){
	var result;
	var exp=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
	var reg = obj.match(exp);
	if(reg == null){
		result = false;
	}else{
		result = true;
	}
	return result;
}

function getStrBytes(val){
	var len = 0; 
	for (var i = 0; i < val.length; i++) { 
		if (val.charAt(i).match(/[^\x00-\xff]/ig) != null)//å¨è§
		{
			len += 2; 
		}
		else 
		{
			len += 1;
		} 
	} 
	return len; 
}

function trim(str){  
    str = str.replace(/^(\s|\u00A0)+/,'');   
    for(var i=str.length-1; i>=0; i--){   
        if(/\S/.test(str.charAt(i))){   
            str = str.substring(0, i+1);   
            break;   
        }   
    }   
    return str;   
}

//检测手机号是不符合要求
function isWrongMobileNum(sMobile) {
	return !(/^(((13[0-9]{1})|15[0-9]{1}|18[0-9]{1})+\d{8})$/.test(sMobile));
}

/**
* 消除ajax后台返回值的前后缀
*/
function removePre(data){
	var _data = data.replace("<PRE>","").replace("</PRE>","");
	return _data;
}
