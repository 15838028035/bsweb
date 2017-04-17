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
 <div class="page-header">
		<h1>统一用户角色权限流程管理系统</h1>
		<small>${sessionScope.securityContext.loginName}:您好！欢迎登录!&nbsp;&nbsp;<a href="${ctx}/loginAction!logout.action">退出系统</a></small>
    </div> 
    
    <div class="container-fluid">
    	<div class="row-fluid">
			<div class="span3">
				<div class="well sidebar-nav">
	        		<ul class="nav nav-list">
						 <li class="nav-header">
							<a href="${ctx}/jsp/user/upmUserList.jsp"  >用户管理</a>
						</li>
						<li class="nav-header">
							<a href="${ctx}/jsp/user/upmUserGroupTreeList.jsp" >组织机构管理</a>
						</li>
						<li class="nav-header">
							<a href="${ctx}/jsp/role/upmRoleList.jsp?appId=CRM"  >角色管理</a>
						</li>
						<li class="nav-header">
							<a href="${ctx}/jsp/permission/permission.jsp?appId=CRM" >权限管理</a>
						</li>
		                  <li  class="nav-header">
							<a href="${ctx}/jsp/upmApp/upmAppList.jsp">应用管理</a>
						</li>
		                <li class="nav-header"> 
							<a href="${ctx}/jsp/dictionary/upmDictionaryNoteList.jsp" >数据字典管理</a>
						</li>
						<li class="nav-header"> 
							<a href="${ctx}/jsp/dictionary/upmConfigurationList.jsp" >配置管理</a>
						</li>
						<li class="nav-header"> 
							<a href="${ctx}/jsp/flows/flowProcessList.jsp" >流程定义</a>
						</li>
						<li class="nav-header"> 
							<a href="${ctx}/jsp/flows/flowOrderList.jsp" >流程实例</a>
						</li>
						<li class="nav-header"> 
							<a href="${ctx}/jsp/flows/flowCcorderList.jsp"  >抄送实例</a>
						</li>
						<li class="nav-header"> 
							<a href="${ctx}/jsp/flows/flowTaskList.jsp" >代办任务</a>
						</li>
						<li class="nav-header"> 
							<a href="${ctx}/jsp/flows/flowTaskHistList.jsp"  >历史任务</a>
						</li>
	          	</ul>
	          	</div>
				</div>
			
			<div class="span9"></div>
			</div>
    </div>
    <footer  class="well">
		<p>微信方式:15838028035</p>
	</footer>
    </div>
    
    
  </body>

</html>