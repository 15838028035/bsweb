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
    <nav class="navbar navbar-defalut navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle show pull-left" data-target="sidebar">
                    <span class="sr-only">导航菜单</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">统一用户权限流程管理系统</a>
                 <ul class="nav navbar-nav navbar-right hidden-sm">
		            <li>
		          <a href='#'>${sessionScope.securityContext.loginName}:您好！欢迎登录!&nbsp;&nbsp;</a>
		            </li>
		            <li>
		          <a href="${ctx}/loginAction!logout.action">退出</a>
		            </li>
		          </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid all">
        <div class="sidebar col-sm-3" id="sidebar">
            <ul class="nav list-group">
            	<li><a class="list-group-item" data-addtab='{"id":"1","url": "${ctx}/jsp/user/upmUserList.jsp","target": "#tabs"}'>用户管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"2","url": "${ctx}/jsp/user/upmUserGroupTreeList.jsp","target": "#tabs"}'>组织机构管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"3","url": "${ctx}/jsp/role/upmRoleList.jsp?appId=UPM","target": "#tabs"}'>角色管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"4","url": "${ctx}/jsp/permission/permission.jsp?appId=UPM","target": "#tabs"}'>权限管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"5","url": "${ctx}/jsp/upmApp/upmAppList.jsp","target": "#tabs"}'>应用管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"6","url": "${ctx}/jsp/dictionary/upmDictionaryNoteList.jsp","target": "#tabs"}'>数据字典管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"7","url": "${ctx}/jsp/dictionary/upmConfigurationList.jsp","target": "#tabs"}'>配置管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"8","url": "${ctx}/jsp/upmNotice/upmNoticeList.jsp","target": "#tabs"}'>通知管理</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"9","url": "${ctx}/jsp/flows/flowProcessList.jsp","target": "#tabs"}'>流程定义</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"10","url": "${ctx}/jsp/flows/flowOrderList.jsp","target": "#tabs"}'>流程实例</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"11","url": "${ctx}/jsp/flows/flowCcorderList.jsp","target": "#tabs"}'>抄送实例</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"12","url": "${ctx}/jsp/flows/flowTaskList.jsp","target": "#tabs"}'>代办任务</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"13","url": "${ctx}/jsp/flows/flowTaskHistList.jsp","target": "#tabs"}'>历史任务</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"13","url": "${ctx}/jsp/flowBorrowTest/flowBorrowTestList.jsp","target": "#tabs"}'>借款测试流程业务数据</a></li>
            	<li><a class="list-group-item" data-addtab='{"id":"14","url": "${ctx}/systemInfoAction!input.action","target": "#tabs"}'>系统信息</a></li>
            </ul>
        </div>
        <div class="maincontent row" style="margin-top:60px;">
       		 <div class="col-sm-12 pull-right">
               <ul class="nav nav-tabs" id="tabs">
  				</ul>
  				<div class="tab-content"></div>
            </div>
	    </div>
	    
	    </div>
        
        <script type="text/javascript">
    $(document).ready(function () {
         $('#sidebar').BootSideMenu({
            side: "left",
            pushBody:false,
            closeOnClick:false,
            autoClose:false
        }); 
    });

</script> 
</body>
</html>