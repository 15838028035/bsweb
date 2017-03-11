// JavaScript Document
var contral_4A_dialog= function(){
	//首页锁屏
	function indexLockPing(){
		$("#TopMenu .indexLockPing").click(function(){
			$('#indexLockPing').dialog('open');
			return false;						  
		});
		$('#indexLockPing').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"锁定屏幕",
			modal:true,
			position:"center",
			width:400,
			height:200, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "登录":function(){
					 $("#indexLockPing").dialog("close");//关闭dialog
				 }
			}
		});
	}
	//系统设置
	function SystemConfiguration(){
		$(".SystemConfigurationBut").click(function(){
			$('#SystemConfiguration').dialog('open');
			return false;						  
		});
		$('#SystemConfiguration').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"系统设置",
			modal: true,
			position:"center",
			width:600,
			height:420, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "确定":function(){
					 $("#SystemConfiguration").dialog("close");//关闭dialog
				 }
			}
		});
		$("#help").click(function(){
			$('#help_dialog').dialog('open');
			return false;						  
		});
		$('#help_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"帮助中心",
			modal: true,
			position:"center",
			width:600,
			height:300, 
			show: 'slide',
			hide: 'slide'
		});
	}
	function Announcement(){
		$("#Announcement").click(function(){
			$('#Announcement_dialog').dialog('open');
			return false;						  
		});
		$('#Announcement_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"发布公告",
			modal: true,
			position:"center",
			width:600,
			height:350, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "保存":function(){
					 $("#Announcement_dialog").dialog("close");//关闭dialog
					 },
				 "取消":function(){
					 $("#Announcement_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		$(".but_select").click(function(){
			$('#Announcement_dialog_select').dialog('open');
			return false;						  
		});
		$('#Announcement_dialog_select').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"选择",
			modal: true,
			position:"center",
			width:700,
			height:400, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "保存":function(){
					 $("#Announcement_dialog_select").dialog("close");//关闭dialog
					 },
				 "取消":function(){
					 $("#Announcement_dialog_select").dialog("close");//关闭dialog
				 }
			}
		});
		$('#changepossword').dialog({
			autoOpen: true,
			bgiframe:true,
			title:"修改密码",
			modal: true,
			position:"center",
			width:300,
			height:210, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "保存":function(){
					 $("#changepossword").dialog("close");//关闭dialog
					 },
				 "取消":function(){
					 $("#changepossword").dialog("close");//关闭dialog
				 }
			}
		});
		
	}
	//快捷操作委托授权
	function Shortcuts(){
		
		//委托授权
		$("#Authorize .Authorize_Event").click(function(){
			$('#Authorize_dialog').dialog('open');
			return false;						  
		});
		
		$('#Authorize_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"授权",
			modal: true,
			position:"center",
			width:500,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "确定":function(){
					 $("#Authorize_dialog").dialog("close");//关闭dialog
					 }
			}
		});
		$("#Authorize_select").click(function(){
			$('#Authorize_select_dialog').dialog('open');
			return false;						  
		});
		
		$('#Authorize_select_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"授权",
			modal: true,
			position:"center",
			width:820,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "确定":function(){
					 $("#Authorize_select_dialog").dialog("close");//关闭dialog
					 }
			}
		});
		//待办工单页面查看更多审批历史
		$("#moreHistory").click(function(){
			$('#moreHistory_dialog').dialog('open');
			return false;						  
		});
		
		$('#moreHistory_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"查看审批历史",
			modal: false,
			position:"left",
			width:700,
			height:300, 
			show: 'slide',
			hide: 'slide'
		});
		
	}
	function login_dialog(){
		
		//密码找回
		$("#Password_Event").click(function(){
			$('#Password_Event_dialog').dialog('open');
			return false;						  
		});
		
		$('#Password_Event_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"找回密码",
			modal: true,
			position:"center",
			width:500,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "提交":function(){
					 $("#Password_Event_dialog").dialog("close");//关闭dialog
					 },
				 "关闭":function(){
					 $("#Password_Event_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//登录说明
		$("#login_Explain").click(function(){
			$('#login_Explain_dialog').dialog('open');
			return false;						  
		});
		
		$('#login_Explain_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"登录说明",
			modal: false,
			position:"left",
			width:350,
			height:600, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#login_Explain_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//工具下载
		$("#tool_down").click(function(){
			$('#tool_down_dialog').dialog('open');
			return false;						  
		});
		
		$('#tool_down_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"工具下载",
			modal: true,
			position:"center",
			width:500,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "提交":function(){
					 $("#tool_down_dialog").dialog("close");//关闭dialog
					 },
				 "关闭":function(){
					 $("#tool_down_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//资源登录按钮
		$("#Resources .login").click(function(){
			$('#Resources_dialog').dialog('open');
			return false;						  
		});
		
		$('#Resources_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"登录",
			modal: true,
			position:"center",
			width:500,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "命令行":function(){
					 $("#Resources_dialog").dialog("close");//关闭dialog
					 },
				 "Plsql":function(){
					 $("#Resources_dialog").dialog("close");//关闭dialog
				 },
				 "toad":function(){
					 $("#Resources_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//自定义目录
		$("#tree_add").click(function(){
			$('#tree_add_dialog').dialog('open');
			return false;						  
		});
		
		$('#tree_add_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"添加目录",
			modal: true,
			position:"center",
			width:400,
			height:200, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "提交":function(){
					 $("#tree_add_dialog").dialog("close");//关闭dialog
					 },
				 "关闭":function(){
					 $("#tree_add_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		$("#tree_edite").click(function(){
			$('#tree_edite_dialog').dialog('open');
			return false;						  
		});
		
		$('#tree_edite_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"编辑目录",
			modal: true,
			position:"center",
			width:400,
			height:200, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "提交":function(){
					 $("#tree_edite_dialog").dialog("close");//关闭dialog
					 },
				 "关闭":function(){
					 $("#tree_edite_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		$("#tree_delete").click(function(){
			$('#tree_delete_dialog').dialog('open');
			return false;						  
		});
		
		$('#tree_delete_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"删除目录",
			modal: true,
			position:"center",
			width:400,
			height:200, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "提交":function(){
					 $("#tree_delete_dialog").dialog("close");//关闭dialog
					 },
				 "关闭":function(){
					 $("#tree_delete_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		$("#add_Entity").click(function(){
			$('#add_Entity_dialog').dialog('open');
			return false;						  
		});
		
		$('#add_Entity_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"增加实体",
			modal: true,
			position:"center",
			width:700,
			height:400, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "提交":function(){
					 $("#add_Entity_dialog").dialog("close");//关闭dialog
					 },
				 "关闭":function(){
					 $("#add_Entity_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		
	}
	function MyTable_dialog(){
		$("#work_table_message a").click(function(){
			$('#work_table_message_dialog').dialog('open');
			return false;						  
		});
		
		$('#work_table_message_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"消息内容",
			modal: true,
			position:"center",
			width:400,
			height:380, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#work_table_message_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//
		$("#work_table_Bulletin a").click(function(){
			$('#work_table_Bulletin_dialog').dialog('open');
			return false;						  
		});
		
		$('#work_table_Bulletin_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"公告内容",
			modal: true,
			position:"center",
			width:400,
			height:380, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#work_table_Bulletin_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//流程配置
		$("#Configuration").click(function(){
			$('#Configuration_dialog').dialog('open');
			return false;						  
		});
		
		$('#Configuration_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"步骤配置",
			modal: true,
			position:"center",
			width:880,
			height:450, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#Configuration_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		$("#Configuration_Select").click(function(){
			$('#Configuration_select_dialog').dialog('open');
			return false;						  
		});
		
		$('#Configuration_select_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"选人",
			modal: true,
			position:"center",
			width:880,
			height:450, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#Configuration_select_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//上传模板
		$("#update_model").click(function(){
			$('#update_model_dialog').dialog('open');
			return false;						  
		});
		
		$('#update_model_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"上传模板",
			modal: true,
			position:"center",
			width:600,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#update_model_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//增加角色编辑角色查看角色
		$("#addRole").click(function(){
			$('#addRole_dialog').dialog('open');
			return false;						  
		});
		
		$('#addRole_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"添加参与者",
			modal: true,
			position:"center",
			width:600,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#addRole_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		$("#edite_Role").click(function(){
			$('#addRole_dialog').dialog('open');
			return false;						  
		});
		
		$('#edite_Role_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"编辑参与者",
			modal: true,
			position:"center",
			width:600,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#edite_Role_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		//绑定人员
		$("#Binding").click(function(){
			$('#Binding_dialog').dialog('open');
			return false;						  
		});
		
		$('#Binding_dialog').dialog({
			autoOpen: false,
			bgiframe:true,
			title:"绑定参与人员",
			modal: true,
			position:"center",
			width:600,
			height:300, 
			show: 'slide',
			hide: 'slide',
			buttons:{
				 "关闭":function(){
					 $("#Binding_dialog").dialog("close");//关闭dialog
				 }
			}
		});
		
	}
	
	return{
		indexLockPing:indexLockPing,
		SystemConfiguration:SystemConfiguration,
		Announcement:Announcement,
		Shortcuts:Shortcuts,
		login_dialog:login_dialog,
		MyTable_dialog:MyTable_dialog
	}
}();