<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>UPM权限管理系统</title>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
	<%@ include file="/jsp/common/resource/scripts_base.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_jqueryui.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_render.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_date.jsp" %>

	<!--新引入的文件开始-->
	<script src="${ctx}/scripts/jquery/jquery-framedialog.js" type="text/javascript"></script>
	<script language="javascript" src="${ctx}/scripts/layout_tradition_4A.js"></script>
	<script language="javascript" src="${ctx}/scripts/control_4A_dialog.js"></script>
	<!--新引入的文件结束-->

	<!--[if IE 6]>
	<script src="${ctx}/scripts/DD_belatedPNG.js"></script>
	<![endif]-->	
	<script language="javascript">
		
		    //顶部帮助按钮图标切换
function topMenuEff(){
	  $("#TopMenu img").hover(function(){
		$(this).css('opacity', 0.3).attr('src',$(this).attr('src').substring(0,$(this).attr('src').indexOf('_'))+'.gif').stop().animate({opacity: '1'},500);
		},function(){
		$(this).css('opacity', 0.3).attr('src',$(this).attr('src').substring(0,$(this).attr('src').indexOf('.'))+'_h.gif').stop().animate({opacity: '1'},500);	
		});
}
		$(function(){
			topMenuEff();
			layout_Tradition.layout();				 //修改 layout(260)为layout()
			layout_Tradition.submenu();
			layout_Tradition.TopMenu();              //增加项    给帐号管理加背景
			//layout_Tradition.menu();              //此行一定去掉，否则菜单出错
			//contralEffect.logout();
			contralEffect.menu();
			contralEffect.blueButton();
			
			//全屏，默认进入页面不采用全屏显示。
			$("#fullscreen").click(function(){
				Fkey();
		    });
		    
			// Management_4A.tabs();
			 
			 var isshow = "1";
			 var oriLeftFrmWidth = $("#LT_left").width();
			 var showdivwidth = $("#LT_hide_ELe").width();;
			 var oriRightFrmWidth = $("#LT_left").width();
			 $("#showhideimg").click(function(e){
				if(isshow=="1"){
					hideframe();
				}else if(isshow=="0"){	
					showframe();
				}				
			}); 
			
			var isdown="0";
				
			
		});
		
		function creatDialog(url,title,width,height){
			jQuery.FrameDialog
				.create({
					url: url,
					title: title,
					width: width,
					height: height,
					//show: 'slide',
	     			//hide: 'slide',
					buttons: {}
			});
		}
		
		window.onresize = function()
		{
			layout_Tradition.layout();
		}
		
		
			
		function Fkey(){
			try{
				var WsShell = new ActiveXObject('WScript.Shell')
		     WsShell.SendKeys('{F11}');
			}catch(err){
				//alert("您没有允许对于窗口的最小化："+err.description );
			}
	     
		}		
		
		function MouseDownToResize(obj){ 
			obj.mouseDownX=event.clientX; 
			obj.pareneTdW=obj.parentElement.offsetWidth; 
			obj.pareneTableW=theObjTable.offsetWidth; 
			obj.setCapture(); 
		} 
		function MouseMoveToResize(obj){ 
			if(!obj.mouseDownX) return false; 
			var newWidth=obj.pareneTdW*1+event.clientX*1-obj.mouseDownX; 
			if(newWidth>0) 
			{ 
			obj.parentElement.style.width = newWidth; 
			theObjTable.style.width=obj.pareneTableW*1+event.clientX*1-obj.mouseDownX; 
			} 
		} 
		
		function MouseUpToResize(obj){ 
			obj.releaseCapture(); 
			obj.mouseDownX=0; 
		} 
		
	</script>	
  </head>
  
  <body>
	<div class="layout_t_hd">
	<div class="layout_t_hd_wrap">
        	<div class="LT_logo">
      <div class="float_rig">
        	<div class="LT_Fr_wrap slideMenu" id="TopMenu">
            	<ul>
				<li class="float_lef LT_hd_li Logout" style="width:200px;"> 
					${sessionScope.securityContext.loginName}:您好！欢迎登录!&nbsp;&nbsp;<a href="${ctx}/loginAction!logout.action">退出系统</a>
				</li>
              </ul>
            </div><!--end LT_logo-->
            </div><!--end LT_Fr_wrap-->
      </div><!--end float_rig-->
        <div class="float_rig">
       		<div class="menu_slide">
            
            </div><!--end menu_slide-->
        </div><!--end float_rig-->
        <div class="clear"></div>
    </div><!--end layout_t_hd_wrap-->
</div><!--end layout_t_hd-->

<div class="subTopMenu" id="subTopMenu">
	<div class="subTopMenu_wrap">
    
    	<div class="LT_Fr_wrap_TM" id="LT_Fr_wrap_TM" style="float:left">
        	<ul>
				
				 <li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/user/upmUserList.jsp" target="LT_main" >用户管理</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/user/upmUserGroupTreeList.jsp" target="LT_main" >组织机构管理</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/role/upmRoleList.jsp?appId=CRM" target="LT_main" >角色管理</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/permission/permission.jsp?appId=CRM" target="LT_main" >权限管理</a>
				</li>
                   <li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none">
					<a href="${ctx}/jsp/upmApp/upmAppList.jsp" target="LT_main" >应用管理</a>
				</li>
                <li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/dictionary/upmDictionaryNoteList.jsp" target="LT_main" >数据字典管理</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/dictionary/upmConfigurationList.jsp" target="LT_main" >配置管理</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/freemarkerTemplateConfig/freemarkerTemplateConfigList.jsp" target="LT_main" >freemarker模板管理</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/flows/flowProcessList.jsp" target="LT_main" >流程定义</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/flows/flowOrderList.jsp" target="LT_main" >流程实例</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/flows/flowCcorderList.jsp" target="LT_main" >抄送实例</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/flows/flowTaskList.jsp" target="LT_main" >代办任务</a>
				</li>
				<li class="float_lef LT_hd_li_TM LocalManagment" style="font-size:16px;float:none"> 
					<a href="${ctx}/jsp/flows/flowTaskHistList.jsp" target="LT_main" >历史任务</a>
				</li>
				
          </ul>
         </div><!--end LT_Fr_wrap_TM-->
       
    </div><!--end subTopMenu_wrap-->
</div><!--end subTopMenu-->


	<div class="LT_left" id="LT_left" style="width:80px">
		
	   	<iframe class="LT_menu" style="margin: 0px"  id="LT_menu" src="" width="100%" frameborder="0" allowTransparency="true" scrolling="auto">
	   	</iframe>
	   
	</div><!--end LT_left-->
	
	
	<div class="LT_hide_ELe" id="LT_hide_ELe" style="vertical-align: bottom;background-color: #C0C0C0;padding: 0px; width:9px;" >&nbsp;
	</div>
	
	
	<iframe class="LT_main" id="LT_main" src="" scrolling="auto" frameborder="0" allowTransparency="true" name="LT_main">
	</iframe><!--end LT_main-->
	<div class="clear"></div>


  </body>

</html>