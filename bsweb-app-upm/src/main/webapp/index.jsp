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
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle show pull-left" data-target="sidebar">
                    <span class="sr-only">导航菜单</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main3.jsp">统一用户权限流程管理系统</a>
            </div>
        </div>
    </nav>
    <div class="container-fluid all">
        <div class="sidebar col-sm-4" id="sidebar">
            <ul class="nav list-group">
               			<li><a href="${ctx}/jsp/user/upmUserList.jsp"  class="list-group-item"  target="main_frame">用户管理</span></a></li>
						<li><a href="${ctx}/jsp/user/upmUserGroupTreeList.jsp"  class="list-group-item"  >组织机构管理</a></li>
						<li><a href="${ctx}/jsp/role/upmRoleList.jsp?appId=CRM"  class="list-group-item" >角色管理</a></li>
						<li><a href="${ctx}/jsp/permission/permission.jsp?appId=UPM" class="list-group-item" >权限管理</a></li>
						<li><a href="${ctx}/jsp/upmApp/upmAppList.jsp" class="list-group-item" >应用管理</a></li>
						<li><a href="${ctx}/jsp/dictionary/upmDictionaryNoteList.jsp" class="list-group-item"  >数据字典管理</a></li>
						<li><a href="${ctx}/jsp/dictionary/upmConfigurationList.jsp" class="list-group-item" >配置管理</a></li>
						<li><a href="${ctx}/jsp/upmNotice/upmNoticeList.jsp" class="list-group-item"  >通知管理</a></li>
						<li><a href="${ctx}/jsp/flows/flowProcessList.jsp" class="list-group-item"  >流程定义</a></li>
						<li><a href="${ctx}/jsp/flows/flowOrderList.jsp" class="list-group-item" >流程实例</a></li>
						<li><a href="${ctx}/jsp/flows/flowCcorderList.jsp"  class="list-group-item" >抄送实例</a></li>
						<li><a href="${ctx}/jsp/flows/flowTaskList.jsp" class="list-group-item"  >代办任务</a></li>
						<li><a href="${ctx}/jsp/flows/flowTaskHistList.jsp" class="list-group-item" >历史任务</a></li>
						<li><a href="${ctx}/systemInfoAction!input.action" class="list-group-item" >系统信息</a></li>
            </ul>
        </div>
        <div class="maincontent row" id="main_frame">
            <div class="col-sm-12">
                <div class="jumbotron">
                    <h1>开源的基于struts2、spring、ibaits、bootstrap构建</h1>
                </div>
            </div>
        </div>
        
        <script type="text/javascript">
    $(document).ready(function () {
         $('#sidebar').BootSideMenu({
            side: "left",
            pushBody:false,
            closeOnClick:false,
            autoClose:true
        }); 
    });
</script> 
</body>
</html>