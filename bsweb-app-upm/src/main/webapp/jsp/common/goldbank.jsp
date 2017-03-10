<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

//发送审批不通过时审计日志
function goldBankErrorAudit(operCode,operContent,bankFlag,svnSn){
	jQuery.ajax({
    	url:"${ctx}/jsp/goldbank/goldbank!AuditForgoldBankError.action?id="+new Date(),
       	data:{
			"operCode":operCode,
			"operContent":encodeURI(operContent),
			"bankFlag":bankFlag,
			"svnSn":svnSn
		},
		type:"post",
        async:true,
        dataType:"json"
	});
}

	function doGoldBank(appCode,operCode,operContent,func){
		var  result =  jQuery.ajax({
          	url:"${ctx}/jsp/goldbank/goldbank!triggerAppBankMode.action?id="+new Date(),
          	data:{
				"operCode":operCode,
				"appCode":appCode
			},
			type:"post",
         	async:false,
          	dataType:"json"
        }).responseText;
        //alert(result);
       // return;
        var info = "";
        try{
        	info = eval( '(' + result + ')' );
        } catch(e){
        	eval(func);
        	return;
        }
        var rsp = info.rsp;
        var policy = info.policy;
        var svnSn = info.svnSn;
        var errdesc = info.errdesc;
        // 当rsp-1，出现异常，阻断
        // 当rsp为1，不用触发金库
        // 当rsp为0时,policyflag有以下值:
		// -3金库应急状态，操作继续
		// -2金库元业务场景关闭
		// 0已配置正常金库策略（代表需要调用4A页面）
		// 1未配置策略允许继续业务
		// 2未配置策略不允许继续业务
		// 3已有预约申请
        if(rsp=="-1"){
        	showModalMessage(errdesc);
        	goldBankErrorAudit(operCode,operContent,4,"");
        }else if(rsp=="1" ){
        	$("#bankFlag").val("");
	        $("#svnSn").val("");
	        eval(func);
        }else{
        	if(policy=="-3" || policy=="-2"){
        		$("#bankFlag").val(policy);
		        $("#svnSn").val("");
		        eval(func);
        	}else if (policy=="1"){
        		$("#bankFlag").val(5);
		        $("#svnSn").val("");
		        eval(func);
        	}else if (policy=="3"){
        		$("#bankFlag").val("1");
		        $("#svnSn").val(svnSn);
		        eval(func);
        	}else if (policy=="2"){
        		showModalMessage("<s:text name='goldbank.jsp.1'/>");
        		goldBankErrorAudit(operCode,operContent,6,"");
        	}else if(policy=="-5"){//未配置策略阻止
        		showModalMessage("<s:text name='goldbank.jsp.2'/>");
        		goldBankErrorAudit(operCode,operContent,policy,"");
        	}else if(policy=="0"){
        		
	        	var obj = new Object();
				obj.operCode=operCode;
				obj.subLoginName="";
				obj.appCode=appCode;
				obj.operContent=operContent;
				
				var iWidth=700; //模态窗口宽度
				var iHeight=480;//模态窗口高度
				var iTop=(window.screen.height-iHeight-100)/2;
				var iLeft=(window.screen.width-iWidth)/2;
				
				var returnValue=window.showModalDialog("${ctx}/jsp/goldbank/goldbank!goToIframe.action?id="+new Date()+"&operCode="+operCode, obj, "dialogHeight:"+iHeight+"px; dialogWidth:"+iWidth+"px; toolbar:no; menubar:no;  titlebar:no; scroll:no; resizable:no; location:no; status:no;left:"+iLeft+"px;top:"+iTop+"px;");
				/**
					//返回结果以下几类:
					//-3	——金库应急，允许业务继续
					//-2	——场景或元业务未开启，允许业务继续
					//-1	——直接关闭窗口，未申请审批 
					//1	——审批通过 
					//0	——审批不通过 
					//2	——超时，允许业务继续访问 
					//3	——超时，不允许业务继续访问
					//4	——出现错误或异常（包括数据异常）
					//5	——未配置策略，允许业务继续访问
					//6	——未配置策略，不允许继续访问
				**/
				var returnType = returnValue.substring(0,1);
				var svnSn = "";
				
				if(returnValue.indexOf("#") < 0){
					returnType = returnValue.substring(0,1);
				}else{
					returnType = returnValue.substring(0,returnValue.indexOf("#"));
					svnSn = returnValue.substring(returnValue.indexOf("#")+1,returnValue.length);
				}
				$("#bankFlag").val(returnType);
				$("#svnSn").val(svnSn);
				if(returnType=="-1"){
					//showModalMessage("页面关闭，操作中止");
	        		goldBankErrorAudit(operCode,operContent,-1,svnSn);
				}else if(returnType=="0"){
					showModalMessage("<s:text name='goldbank.jsp.approvalNotPass'/>");
					goldBankErrorAudit(operCode,operContent,0,svnSn);
				}else if(returnType=="1"){
					eval(func);
				}else if(returnType=="2"){
					eval(func);
				}else if(returnType=="3"){
					goldBankErrorAudit(operCode,operContent,3,svnSn);
				}else if(returnType=="4"){
					goldBankErrorAudit(operCode,operContent,4,svnSn);
				}else if(returnType=="5"){
					eval(func);
				}else if(returnType=="6"){
					goldBankErrorAudit(operCode,operContent,6,svnSn);
				}
        	}	
        }
	}
	
	function doLoginGoldBank(isInner,resKind,resEntityId,subAcctId,operCode,operContent,func){
	
		//alert(operContent);
		//alert(resKind+";"+resEntityId+";"+subAcctId);
		//var operCode = "1-AIUAP-19999";
		var  result =  jQuery.ajax({
          	url:"${ctx}/jsp/goldbank/goldbank!checkLoginBankMode.action?id="+new Date(),
          	data:{
          		"isInner":isInner,
				"requestInfo.busyType":resKind,
				"requestInfo.systemId":resEntityId,
				"requestInfo.resAcctId":subAcctId,
				"requestInfo.busyType":resKind
			},
			type:"post",
         	async:false,
          	dataType:"json"
        }).responseText;
        //alert(result);
       // return;
        var info = "";
        try{
        	info = eval( '(' + result + ')' );
        } catch(e){
        	eval(func);
        	return;
        } 
        var rsp = info.rsp;
        var policy = info.policy;
        var svnSn = info.svnSn;
        if(rsp=="1"){
        	// policy值
        	//	空 --非金库帐号，不用触发
			// -4 ——金库应急，临时帐号不允许业务继续
			// -3 ——金库应急，长期帐号允许业务继续
			// -2 ——场景或元业务未开启，允许业务继续
			// 1 ——审批通过（有预约申请记录）
			// 4 ——出现错误或异常（包括数据异常）
			// 5 ——未配置策略，允许业务继续访问
			// 6 ——未配置策略，不允许继续访问
			$("#bankFlag").val(policy);
        	$("#svnSn").val(svnSn);
        	if(policy=="4"){//出现错误或异常（包括数据异常）
        		showModalMessage("<s:text name='goldbank.jsp.3'/>");
        		goldBankErrorAudit(operCode,operContent,policy,"");
        	}else if(policy=="6"){//未配置策略阻止
        		showModalMessage("<s:text name='goldbank.jsp.4'/>");
        		goldBankErrorAudit(operCode,operContent,policy,"");
        	}else if(policy=="-4"){//未配置策略阻止
        		showModalMessage("<s:text name='goldbank.jsp.5'/>");
        		goldBankErrorAudit(operCode,operContent,policy,"");
        	}else if(policy=="-5"){//未配置策略阻止
        		showModalMessage("<s:text name='goldbank.jsp.6'/>");
        		goldBankErrorAudit(operCode,operContent,policy,"");
        	}else{//非金库帐号登录
        		eval(func);
        	}
        }else{
        	var obj = new Object();
			obj.subLoginName="";
			obj.appCode="UAP";
			obj.operContent=operContent;
			obj.isBasedOnLogin="true";
			obj.busyType=resKind;
			obj.systemId=resEntityId;
			obj.resAcctId=subAcctId;
			
			var iWidth=700; //模态窗口宽度
			var iHeight=480;//模态窗口高度
			var iTop=(window.screen.height-iHeight-100)/2;
			var iLeft=(window.screen.width-iWidth)/2;
			
			var returnValue=window.showModalDialog("${ctx}/jsp/goldbank/goldbank!goToIframe.action?id="+new Date()+"&operCode="+operCode, obj, "dialogHeight:"+iHeight+"px; dialogWidth:"+iWidth+"px; toolbar:no; menubar:no;  titlebar:no; scroll:no; resizable:no; location:no; status:no;left:"+iLeft+"px;top:"+iTop+"px;");
			/**
				//返回结果以下几类:
				//-3	——金库应急，允许业务继续
				//-2	——场景或元业务未开启，允许业务继续
				//-1	——直接关闭窗口，未申请审批 
				//1	——审批通过 
				//0	——审批不通过 
				//2	——超时，允许业务继续访问 
				//3	——超时，不允许业务继续访问
				//4	——出现错误或异常（包括数据异常）
				//5	——未配置策略，允许业务继续访问
				//6	——未配置策略，不允许继续访问
			**/
			
			var returnType = "";
			var svnSn = "";
			
			if(typeof(returnValue)!== 'undefined'){
				if(returnValue.indexOf("#") < 0){
					returnType = returnValue.substring(0,1);
				}else{
					returnType = returnValue.substring(0,returnValue.indexOf("#"));
					svnSn = returnValue.substring(returnValue.indexOf("#")+1,returnValue.length);
				}
			}else{
				//金库审批页面返回undefined
				returnType = "-4";
			}
			
			
			$("#bankFlag").val(returnType);
        	$("#svnSn").val(svnSn);
        	
			if(returnType=="-3"){
				eval(func);
			}else if(returnType=="-2"){
				eval(func);
			}else if(returnType=="-1"){
				//showModalMessage("页面关闭，操作中止");
        		goldBankErrorAudit(operCode,operContent,-1,svnSn);
			}else if(returnType=="0"){
				showModalMessage("<s:text name='goldbank.jsp.approvalNotPass'/>");
				goldBankErrorAudit(operCode,operContent,0,svnSn);
			}else if(returnType=="1"){
				eval(func);
			}else if(returnType=="2"){
				eval(func);
			}else if(returnType=="3"){
				goldBankErrorAudit(operCode,operContent,3,svnSn);
			}else if(returnType=="4"){
				goldBankErrorAudit(operCode,operContent,4,svnSn);
			}else if(returnType=="5"){
				eval(func);
			}else if(returnType=="6"){
				goldBankErrorAudit(operCode,operContent,6,svnSn);
			}else{
				showModalMessage("<s:text name='goldbank.jsp.7'/>",func);
			}
        }
	}
	
	
	function doGoldBankAppoint(isInner,appointType,resKind,resEntityId,operateValue,operContent,func){
	
		var operCode = "1-AIUAP-20319";
       	var obj = new Object();
		obj.isInner=isInner;
		obj.resKind=resKind;
		obj.resEntityId=resEntityId;
		obj.operateValue=operateValue;
		obj.operContent=operContent;
		obj.appointType=appointType;
		
		var iWidth=700; //模态窗口宽度
		var iHeight=480;//模态窗口高度
		var iTop=(window.screen.height-iHeight-100)/2;
		var iLeft=(window.screen.width-iWidth)/2;
		
		var returnValue=window.showModalDialog("${ctx}/jsp/goldbank/goldbankappoint!goToAppointIframe.action?id="+new Date(), obj, "dialogHeight:"+iHeight+"px; dialogWidth:"+iWidth+"px; toolbar:no; menubar:no;  titlebar:no; scroll:no; resizable:no; location:no; status:no;left:"+iLeft+"px;top:"+iTop+"px;");
		/**
			//返回结果以下几类:
			//-1	——直接关闭窗口，未申请审批 
			//1	——审批通过 
			//0	——审批不通过 
			//3	——超时，不允许业务继续访问
			//4	——出现错误或异常（包括数据异常）
		**/
		
		var returnType = "";
		var svnSn = "";
		
		if(typeof(returnValue)!== 'undefined'){
			if(returnValue.indexOf("#") < 0){
				returnType = returnValue.substring(0,1);
			}else{
				returnType = returnValue.substring(0,returnValue.indexOf("#"));
				svnSn = returnValue.substring(returnValue.indexOf("#")+1,returnValue.length);
			}
		}else{
			//金库审批页面返回undefined
			returnType = "-4";
		}
		
		
		$("#bankFlag").val(returnType);
       	$("#svnSn").val(svnSn);
		if(returnType=="-1"){
			//showModalMessage("页面关闭，操作中止");
       		goldBankErrorAudit(operCode,operContent,-1,svnSn);
		}else if(returnType=="0"){
			//showModalMessage("审批不通过");
			goldBankErrorAudit(operCode,operContent,0,svnSn);
		}else if(returnType=="1"){
			eval(func);
		}else if(returnType=="3"){
			goldBankErrorAudit(operCode,operContent,3,svnSn);
		}else if(returnType=="4"){
			goldBankErrorAudit(operCode,operContent,4,svnSn);
		}else if(returnType=="6"){
				goldBankErrorAudit(operCode,operContent,6,svnSn);
		}else{
			showModalMessage("<s:text name='goldbank.jsp.8'/>");
		}
	}
	
	function doBatchGoldBankAppoint(isInner,appointType,resKind,selectsrc,operContent,func,isBatch){
	
		var operCode = "1-AIUAP-20319";
       	var obj = new Object();
		obj.isInner=isInner;
		obj.resKind=resKind;
		obj.selectsrc=selectsrc;
		obj.operContent=operContent;
		obj.appointType=appointType;
		
		var iWidth=700; //模态窗口宽度
		var iHeight=480;//模态窗口高度
		var iTop=(window.screen.height-iHeight-100)/2;
		var iLeft=(window.screen.width-iWidth)/2;
		
		var returnValue=window.showModalDialog("${ctx}/jsp/goldbank/goldbankappoint!goToBatchAppointIframe.action?id="+new Date(), obj, "dialogHeight:"+iHeight+"px; dialogWidth:"+iWidth+"px; toolbar:no; menubar:no;  titlebar:no; scroll:no; resizable:no; location:no; status:no;left:"+iLeft+"px;top:"+iTop+"px;");
		/**
			//返回结果以下几类:
			//-1	——直接关闭窗口，未申请审批 
			//1	——审批通过 
			//0	——审批不通过 
			//3	——超时，不允许业务继续访问
			//4	——出现错误或异常（包括数据异常）
		**/
		
		var returnType = "";
		var svnSn = "";
		
		if(typeof(returnValue)!== 'undefined'){
			if(returnValue.indexOf("#") < 0){
				returnType = returnValue.substring(0,1);
			}else{
				returnType = returnValue.substring(0,returnValue.indexOf("#"));
				svnSn = returnValue.substring(returnValue.indexOf("#")+1,returnValue.length);
			}
		}else{
			//金库审批页面返回undefined
			returnType = "-4";
		}
		
		
		$("#bankFlag").val(returnType);
       	$("#svnSn").val(svnSn);
		if(returnType=="-1"){
			//showModalMessage("页面关闭，操作中止");
       		goldBankErrorAudit(operCode,operContent,-1,svnSn);
		}else if(returnType=="0"){
			//showModalMessage("审批不通过");
			goldBankErrorAudit(operCode,operContent,0,svnSn);
		}else if(returnType=="1"){
			eval(func);
		}else if(returnType=="3"){
			goldBankErrorAudit(operCode,operContent,3,svnSn);
		}else if(returnType=="4"){
			goldBankErrorAudit(operCode,operContent,4,svnSn);
		}else if(returnType=="6"){
				goldBankErrorAudit(operCode,operContent,6,svnSn);
		}else{
			showModalMessage("<s:text name='goldbank.jsp.8'/>");
		}
	}
