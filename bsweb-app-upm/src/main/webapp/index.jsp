<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>UPM统一用户权限流程管理</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
</head>
<body class="hold-transition skin-blue  sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>UPM</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>用户权限流程管理</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${ctx}/scripts/adminLTE/img/avatar5.png" class="user-image" alt="User Image">
              <span class="hidden-xs">${sessionScope.securityContext.loginName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <p>
               	  姓名:${sessionScope.mainAcct.userName}
                  <small>手机号码:${sessionScope.mainAcct.mobile}</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-12 ">
                  	组织机构:
                  	<c:forEach var="userGroup" items="${sessionScope.appUserGroupList}" varStatus="status">
          				${userGroup}
          			</c:forEach>
                  </div>
                  <div class="col-xs-12 ">
                  	角色名称:
                  	 <c:forEach var="appRole" items="${sessionScope.appRoleList}" varStatus="status">
          				${appRole}
          				</c:forEach>
                  </div>
                  
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="${ctx}/jsp/user/changepwd.jsp">修改密码</a>
                </div>
                <div class="pull-right">
                  <a href="${ctx}/loginAction!logout.action">退出</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>

  <!-- =============================================== -->

  <!-- Left side column. contains the sidebar -->
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
          <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">导航菜单</li>
        
		<li class="treeview active">
          <a href="#">
            <span>导航菜单</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">${sessionScope.appMenuPermissionListSize}</span>
            </span>
          </a>
          <ul class="treeview-menu">
             <c:forEach var="upmPermission" items="${sessionScope.appMenuPermissionList}" varStatus="status">
         <li>
          <a href="${ctx}${upmPermission.url}"  target="menuFrame">
            <span>${upmPermission.name}</span>
            <span class="pull-right-container"></span>
          </a>
        </li>
		</c:forEach>
            </li>
          </ul>
        </li>
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- =============================================== -->

  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
        	<iframe id="menuFrame" name="menuFrame"  scrolling="auto" width="100%" height="800px" min-height="800px" frameborder="0"></iframe>
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
      <b>当前版本:</b> ${upmVersion}
    </div>
    <strong>Copyright &copy; 2017-2019</strong> 版权所有
    
  </footer>
     
  <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
