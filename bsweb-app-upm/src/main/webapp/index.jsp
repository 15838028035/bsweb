<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>UPM权限管理系统</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
 
 </head>
  
  <body>
   <div class="container">
	<div class="page-header">
		<h1>统一用户角色权限流程管理系统</h1>
		<small>${sessionScope.securityContext.loginName}:您好！欢迎登录!&nbsp;&nbsp;<a href="${ctx}/loginAction!logout.action">退出系统</a></small>
    </div>
		<div  class="sidebar-nav">
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
    </div>
    
    </div>
    
  </body>

</html>