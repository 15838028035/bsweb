<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
// JavaScript Document
var Management_4A = function(){
	function Refresh(){
		$("#LT_main").attr("src","/uap/jsp/common/welcome.jsp");
		$("#LT_menu").attr("src","");
	}
	//4a顶部菜单导航
	function InTopMenu(){
		var isPermissionTree='${isPermissionTree}';
		//alert(isPermissionTree);
		$(".chongqingMenu").click(function(){         
		   $("#LT_left").show();
		   $("#LT_hide_ELe").show();
		   
		   $("#LT_menu").attr("src","/uap/jsp/local/chongqing/localMenu.jsp");
		   $("#LT_main").attr("src","/uap/jsp/local/chongqing/workLog.jsp");
		});
		//浙江应用接入
		$(".CutInApp").click(function(){         
		   $("#LT_left").show();
		   $("#LT_hide_ELe").show();
		   
		   $("#LT_menu").attr("src","/uap/jsp/local/zhejiang/localMenu.jsp");
		   $("#LT_main").attr("src","");
		});
		//浙江主帐号接入管理
		$(".mainacctCutin").click(function(){
			$("#LT_left").show();
			$("#LT_hide_ELe").show();

			$("#LT_menu").attr("src","/uap/jsp/local/zhejiang/mainacctMngMenu.jsp");
			$("#LT_main").attr("src","");
			
			//parent.parent.$("#showhideimg").click();//收起左侧菜单项
			//$("#LT_main").attr("src","http://uum.yw.zj.chinamobile.com:9080/zjuum/user/list.htm");
		});

		$(".accentMannagent").click(function(){
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			if(isPermissionTree=='Y'){
				$("#LT_menu").attr("src","/uap/jsp/syscfg/organization/sysorg!permissionTree.action?action=navi");
			}else{
			    $("#LT_menu").attr("src","/uap/jsp/syscfg/organization.jsp?action=navi");
			}
			$("#LT_main").attr("src","/uap/jsp/mainacct/mainacct!init.action");
		});
		$(".ApplicationMannagent").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			
			$("#LT_menu").attr("src","/uap/jsp/app/appdirectory/directory.jsp?action=navi");
			$("#LT_main").attr("src","/uap/jsp/app/entity/appentity.jsp");
		});
		$(".EquipmentManament").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			
			$("#LT_menu").attr("src","/uap/jsp/sys/allentity/allentity!showTree.action");
			$("#LT_main").attr("src","/uap/jsp/sys/allentity/allentity.action");
		});
		$(".RackGroupManament").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			
			$("#LT_menu").attr("src","/uap/jsp/rackgroup/rackgroup.jsp");
			$("#LT_main").attr("src","");
		});
		$(".SecurityManament").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();

			$("#LT_menu").attr("src","/uap/jsp/dscp/securityManamentLM.jsp");
			$("#LT_main").attr("src","");
		});
		$(".GoldBankManagement").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();

			$("#LT_menu").attr("src","/uap//jsp/goldbank/goldbankManagementLM.jsp");
			$("#LT_main").attr("src","");
		});
		
		$(".CommandManagment").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();

			$("#LT_menu").attr("src","/uap/jsp/blacklist/commandconfig.jsp");
			$("#LT_main").attr("src","");
		});
		
		$(".DomainManament").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();

			$("#LT_menu").attr("src","/uap/jsp/domain/domainlist.jsp");
			$("#LT_main").attr("src","/uap/jsp/domain/domainmanage!domainIndex.action");
		});
		
		$(".ReportManament").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			$("#LT_menu").attr("src","/uap/jsp/report/ReportLM.jsp");
			$("#LT_main").attr("src","/uap/jsp/report/common/mainacct/mainaccMainReport.jsp");
		});
		$(".SystemConfiguration").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();

			$("#LT_menu").attr("src","/uap/jsp/syscfg/SystemConfigurationLM.jsp");
			//加入权限控制，LT_main区域打开时默认为空白
			$("#LT_main").attr("src","");
			//$("#LT_main").attr("src","/uap/jsp/syscfg/pwd/pwdrule.jsp?ruleType=0");
		});
		$(".PlatformManagment").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			$("#LT_menu").attr("src","/uap/jsp/platform/platformconfiguration.jsp");
			$("#LT_main").attr("src","/uap/jsp/platform/defencehost/defencehostlist.jsp");
		});
		
		$(".TaskManagment").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			//后台任务管理导航控制
			$("#LT_menu").attr("src","/uap/jsp/topMenu/topmenu!bgtaskNavi.action");
			$("#LT_main").attr("src","");
			//$("#LT_main").attr("src","/uap/jsp/task/bgtaskconfig/bgtaskconfig.jsp");
		});
		
		<!-- added by WangXianfeng 2013-05-21 begin -->
		$(".MainAcctLoginRate").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			$("#LT_menu").attr("src","/uap/jsp/local/jiangsu/report/loginRateReport.jsp");
			$("#LT_main").attr("src","/uap/jsp/local/jiangsu/report/realtimeLoginRate.jsp");
		});
		<!-- added by WangXianfeng 2013-05-21 end -->
		
		<!-- added by ge.jiawei 2013-07-2 begin -->
		$(".UnionViewManagment").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			$("#LT_menu").attr("src","/uap/jsp/local/jiangsu/view/viewControl.jsp");
			$("#LT_main").attr("src","/uap/jsp/local/jiangsu/view/unionAccountView.jsp");
		});
		<!-- added by ge.jiawei 2013-07-2 end -->
		
		$(".LocalManagment").click(function(){						   
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
			//上海本地需求菜单
			$("#LT_menu").attr("src","/uap/jsp/local/shanghai/local_navi.jsp");
			$("#LT_main").attr("src","");
			//$("#LT_main").attr("src","/uap/jsp/task/bgtaskconfig/bgtaskconfig.jsp");
		});
		$(".ManuMannagent").click(function(){
			$("#LT_left").show();
			$("#LT_hide_ELe").show();
            $("#LT_menu").attr("src","/uap/jsp/local/shanghai/manu/manuorg!getManuOrgTree.action?action=navi&treeNodeId=0");
            $("#LT_main").attr("src","/uap/jsp/local/shanghai/manu/manumainacct!init.action");
		});
		
		$(".Logout").click(function(){						   
			if(confirm("确定退出管理平台吗？")) {
				$.ajax({
		          url:"/uap/login!logout.action",
		          async:false
		        });
		        
				window.close();
			}
		});		
		
	}
	//帐户管理左侧菜单导航
	function cteatAccent(){
		$(".createAccount").click(function(){				
			$("#LT_main",parent.document.body).attr("src","creatAccent.html");
		});
		$(".creatApplication").click(function(){				
			$("#LT_main",parent.document.body).attr("src","creatApplication.html");
		});
		$(".creatNewSubAccent").click(function(){				
			$("#LT_main",parent.document.body).attr("src","creatNewSubAccent.html");
		});
		$(".createsubAccentEquipment").click(function(){				
			$("#LT_main",parent.document.body).attr("src","creatsubAccentHost.html");
		});
		$(".creatDatabasesubAccentEquipment").click(function(){				
			$("#LT_main",parent.document.body).attr("src","creatsubAccentDatabase.html");
		});
	
	}
	function CA_4A_select(){
		$(".CA_4A_select").click(function(){
			$('#CA_4A_select').dialog('open');
			return false;						  
		});
		$('#CA_4A_select').dialog({
			autoOpen: false,
			title:"<s:text name='common.chooseArea'/>",
			modal: true,
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "<s:text name='common.options.ok'/>":function(){
					 $("#CA_4A_select").dialog("close");//关闭dialog
				 }
			}
		});
		$(".CA_4A_select01").click(function(){
			$('#CA_4A_select01').dialog('open');
			return false;						  
		});
		$('#CA_4A_select01').dialog({
			autoOpen: false,
			title:"<s:text name='common.chooseOrganization'/>",
			modal: true,
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "<s:text name='common.options.save'/>":function(){
					 $("#CA_4A_select01").dialog("close");//关闭dialog
				 },
				  "<s:text name='common.options.cancel'/>":function(){
					 $("#CA_4A_select01").dialog("close");//关闭dialog
				 }
			}
		});
		//start 设置
		$(".CA_4A_option").click(function(){
			$('#CA_4A_option').dialog('open');
			return false;						  
		});
		$('#CA_4A_option').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"设置认证策略",
			modal: true,
			position:"center",
			width:400,
			height:450, 
			show: 'slide',
			hide: 'scale',
			buttons:{
				 "保存":function(){
					 $("#CA_4A_option").dialog("close");//关闭dialog
				 }
			}
		});
		//start 设备管理界面
		$(".createEquipment").click(function(){
			$('#CA_4A_Equipment').dialog('open');
			return false;						  
		});
		$('#CA_4A_Equipment').dialog({
			autoOpen: false,
			title:"添加设备选项",
			modal: true,
			bgiframe:true,
			position:['100','0'],
			width:150,
			height:120, 
			show: 'slide',
			hide: 'slide'
		});
		$("#CA_4A_Equipment a").bind("click",function(event){
			$("#CA_4A_Equipment").dialog("close");								  
		});
		//createSubAccent页面

		var CSA_select_Val=$("#CSA_select").find("option:selected").text();
		$(".CA_4A_select03").click(function(){
				$('#CA_4A_select03').dialog('destroy');
				return false;						  
			});
			$('#CA_4A_select03').dialog({
				autoOpen: false,
				title:"选择"+CSA_select_Val,
				modal: true,
				show: 'slide',
				hide: 'slide',
				buttons:{
					 "确定":function(){
						 $("#CA_4A_select03").dialog("close");//关闭dialog
					 },
					  "确定":function(){
						 $("#CA_4A_select03").dialog("close");//关闭dialog
					 }
				}
			});
			//
			$(".CA_4A_select04").click(function(){
				$('#CA_4A_select04').dialog('open');
				return false;						  
			});
			$('#CA_4A_select04').dialog({
				autoOpen: false,
				title:"选择"+CSA_select_Val+"帐户",
				modal: true,
				show: 'slide',
				hide: 'slide',
				buttons:{
					 "确定":function(){
						 $("#CA_4A_select04").dialog("close");//关闭dialog
					 },
					  "取消":function(){
						 $("#CA_4A_select04").dialog("close");//关闭dialog
					 }
				}
			});
			$("#CSA_select").change(function(){
					var CSA_select_Val =$("#CSA_select").find("option:selected").text();
					$(".CA_4A_select03").click(function(){
						$('#CA_4A_select03').dialog('open');
						return false;						  
					});
					$('#CA_4A_select03').dialog({
						autoOpen: false,
						title:"选择"+CSA_select_Val,
						modal: true,
						show: 'slide',
						hide: 'slide',
						buttons:{
							 "确定":function(){
								 $("#CA_4A_select03").dialog("close");//关闭dialog
							 },
							  "取消":function(){
								 $("#CA_4A_select03").dialog("close");//关闭dialog
							 }
						}
					});
					//
					$(".CA_4A_select04").click(function(){
						$('#CA_4A_select04').dialog('open');
						return false;						  
					});
					$('#CA_4A_select04').dialog({
						autoOpen: false,
						title:"选择"+CSA_select_Val+"帐户",
						modal: true,
						show: 'slide',
						hide: 'slide',
						buttons:{
							 "确定":function(){
								 $("#CA_4A_select04").dialog("close");//关闭dialog
							 },
							  "取消":function(){
								 $("#CA_4A_select04").dialog("close");//关闭dialog
							 }
						}
					});				 
			 });
		//
		
	}
	//平台权限设置
	function PlatformPermis(){
		$("#RM_sele").change(function(){
			var RM_sele_Option_val = $(this).val();
			if(RM_sele_Option_val== 0){
				$("#LT_main",parent.document.body).attr("src","RightsManagement.html");
			}	
			if(RM_sele_Option_val== 1){
				$("#LT_main",parent.document.body).attr("src","CertificationPlatform.html");	
			}
			if(RM_sele_Option_val== 2){
				$("#LT_main",parent.document.body).attr("src","AuditPlatform.html");
			}
		});
	}
	//tabs
	function tabs(){
		$("#tabs").tabs();
		$("#tabs01").tabs();
		$("#tabs02").tabs();
		$("#tabs03").tabs();
	}

	//4atree
	function treeviewAccent(){
		// 帐户管理tree
		$("#navigation").treeview({
			persist: "location",
			collapsed: true,
			unique: true
		});
	}
	//4a添加应用系统页面添加行
	function creatNeqwli(){
		// 帐户管理tree
		$(".creatNeqwli").click(function(){
			$("#addLi").append("<li style='margin-top:3px;'><span class='marg_lef5'><s:text name="appentity.input.ssoname"/>&nbsp;</span><span class='marg_lef5'><input class='input_text30' name='ssoName' size='40' maxlength='40'  onblur='ssoOnblur();'/></span><span class='marg_lef5'>&nbsp;url:&nbsp;</span><span class='marg_lef5'><input class='input_text50'  name='ssoUrl'   size='200'  maxlength='200' onblur='ssoOnblur();'/></span><span class='marg_lef5'><img src='../../../images/13.gif' class='deleteLi'  style='padding:2px 3px; cursor:pointer;' /></span></li>");
			$(".deleteLi").click(function(){
				$(this).parent().parent().remove(); 				  
			});
		});
		$(".creatNewDatebaseli").click(function(){
			$("#addDatebaseLi").append("<li><input class='input_text30' disabled='disabled' /><span class='marg_lef5'><input type='button' value='选择' style='padding:2px 3px;' /></span><span class='marg_lef5'>端口:</span><span class='marg_lef5'><input class='input_text30' style='width:50px;' /></span><span class='marg_lef5'>实例:</span><span class='marg_lef5'><input class='input_text30' style='width:50px;' /></span><span class='marg_lef5'>TNS:</span><span class='marg_lef5'><input class='input_text30' style='width:50px;' /></span><span class='marg_lef5'><input type='radio' /></span><span class='marg_lef5'>默认</span><span class='marg_lef5'><input type='button' class='deleteDatebaseLi' value='删除' style='padding:2px 3px;' /></span></li>");
			$(".deleteDatebaseLi").click(function(){
				$(this).parent().parent().remove(); 				  
			});
		});
		$(".creatNewHostli").click(function(){
			$("#addHostLi").append("<li><input class='input_text30' /><span class='marg_lef5'><input type='radio' /></span><span class='marg_lef5'>默认</span><span class='marg_lef5'><input type='button' class='deleteHostLi' value='删除' style='padding:2px 3px;' /></span></li>");
			$(".deleteHostLi").click(function(){
				$(this).parent().parent().remove(); 				  
			});
		});
		$(".creatNewWangDuanli").click(function(){
			$("#addWangDuanLi").append("<li>从<span class='marg_lef5'><input class='input_text30' /></span><span class='marg_lef5'>到</span><span class='marg_lef5'><input class='input_text30' /></span><span class='marg_lef5'><input type='button' class='deleteHostLi' value='删除' style='padding:2px 3px;' /></span></li>");
			$(".deleteHostLi").click(function(){
				$(this).parent().parent().remove(); 				  
			});
		});
	}
	//批量导入
	function BulkImport(){
		$(".BulkImport_but").click(function(){
			$('#BulkImport_form').dialog('open');
			return false;						
		});
		$('#BulkImport_form').dialog({
				autoOpen: false,
				title:"批量导入帐号",
				modal: true,
				show: 'slide',
				width:400,
				height:200,
				hide: 'slide',
				buttons:{
					 "确定":function(){
						 $("#BulkImport_form").dialog("close");//关闭dialog
					 },
					  "取消":function(){
						 $("#BulkImport_form").dialog("close");//关闭dialog
					 }
				}
			});

	}
	return{
		cteat:cteatAccent,
		T_Menu:InTopMenu,
		Refresh:Refresh,
		cteate_select:CA_4A_select,
		tabs:tabs,
		Purview:PlatformPermis,
		AccentTree:treeviewAccent,
		createNewLi:creatNeqwli,
		BulkImport:BulkImport
	}
}()