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
                <a class="navbar-brand" href="main.jsp">统一用户权限管理系统</a>
            </div>
        </div>
    </nav>
    <div class="container-fluid all">
        <div class="sidebar col-sm-4">
            <ul class="nav">
               			<li><a href="${ctx}/jsp/user/upmUserList.jsp"  >用户管理</span></a></li>
							<li>	<a href="${ctx}/jsp/user/upmUserGroupTreeList.jsp"  >组织机构管理</a></li>
            </ul>
        </div>
        <div class="maincontent row">
            <div class="col-sm-12">
                <div class="jumbotron">
                    <h1>开源的基于struts2、spring、ibaits、bootstrap的统一用户权限管理系统</h1>
                </div>
            </div>
        </div>
    </div>
</body>
</html>