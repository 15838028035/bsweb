<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>UPM统一用户权限管理系统</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
</head>

<style type="text/css">
</style>
<body class="hold-transition ajax-template skin-blue fixed">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="${ctx}/index2.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-lg"><b>统一用户权限流程管理系统[${upmVersion}]</b></span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
       <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href='#'>${sessionScope.securityContext.loginName}:您好！欢迎登录!&nbsp;&nbsp;</a></li>
        <li><a href="${ctx}/jsp/user/changepwd.jsp">修改密码</a></li>
        <li><a href="${ctx}/loginAction!logout.action">退出</a></li>
      </ul>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${ctx}/scripts/adminLTE/img/avatar5.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.securityContext.loginName}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">系统菜单</li>
      	<li class="treeview">
          <a href="${ctx }/jsp/role/upmRoleList.jsp?appId=CRM">
            <i class="fa fa-dashboard"></i> <span>角色</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
       <li class="treeview">
          <a href="${ctx }/jsp/user/upmUserList.jsp">
            <i class="fa fa-dashboard"></i> <span>用户管理 </span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        
       <li class="treeview">
          <a href="${ctx }/jsp/role/upmRoleList.jsp?appId=CRM">
            <i class="fa fa-dashboard"></i> <span>角色</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        
         <s:iterator value="upmPermissionList" id="upmPermission">
            <li class="treeview">
          <a href="${ctx }/<s:property value="url" />">
            <i class="fa fa-dashboard"></i> <span><s:property value="name" /></span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        </s:iterator>
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
         
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
    </div>
    Copyright ©版权所有2017-2019
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

</div>
</body>
</html>