<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>${fns:getProperty('flowsProductName')}</title>
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
      <span class="logo-mini"><b>flows</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>${fns:getProperty('flowsProductName')}</b></span>
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
          <li>
                     <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
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
         <c:if test="${fn:startsWith(upmPermission.url, 'http')}">
          <a href="${upmPermission.url}"  target="menuFrame">
            <span>${upmPermission.name}</span>
            <span class="pull-right-container"></span>
          </a>
          </c:if>
          <c:if test="${fn:startsWith(upmPermission.url, '/')}">
          <a href="${ctx}${upmPermission.url}"  target="menuFrame">
            <span>${upmPermission.name}</span>
            <span class="pull-right-container"></span>
          </a>
          </c:if>
        </li>
        </c:forEach>
            </li>
          </ul>
        </li>
        
      </ul>
    </script>
     
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
      <b>当前版本:</b>${fns:getProperty('flowsVersion')}
    </div>
    <strong>Copyright &copy; 2017-2019</strong> 版权所有
    
  </footer>
     
   <aside class="control-sidebar control-sidebar-dark ">
    <!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a
					href="#control-sidebar-theme-demo-options-tab" data-toggle="tab"
					aria-expanded="true"><i class="fa fa-wrench"></i></a></li>
			</ul>
			<!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab"></div>
      
				<div id="control-sidebar-theme-demo-options-tab"
					class="tab-pane active">
					<div>
						<h4 class="control-sidebar-heading">选择喜欢的风格,单击切换</h4>
						<ul class="list-unstyled clearfix">
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-blue" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
								     <div>
										    <span style="display: block; width: 20%; float: left; height: 7px; background: #367fa9"></span>
											<span class="bg-light-blue" style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #222d32"></span>
											<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin">蓝色</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-black" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
								    <div style="box-shadow: 0 0 2px rgba(0, 0, 0, 0.1)" class="clearfix">
									<span
											style="display: block; width: 20%; float: left; height: 7px; background: #fefefe"></span><span
											style="display: block; width: 80%; float: left; height: 7px; background: #fefefe"></span>
									</div>
									<div>
										<span
											style="display: block; width: 20%; float: left; height: 20px; background: #222"></span><span
											style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin">黑色</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-purple" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" 	class="clearfix full-opacity-hover">
								     <div>
										<span style="display: block; width: 20%; float: left; height: 7px;" class="bg-purple-active"> </span>
										<span class="bg-purple" style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #222d32"></span>
										<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin">紫色</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-green" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
								    <div>
										<span style="display: block; width: 20%; float: left; height: 7px;" class="bg-green"></span>
									    <span style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #222d32"></span>
										<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin">绿色</p>
							</li>
							
							<li style="float:left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-red" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
								<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-red-active"></span>
								<span class="bg-red" style="display:block; width: 80%; float: left; height: 7px;"></span>
								</div>
								<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #222d32"></span>
									<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
								</div>
							</a>
							<p class="text-center no-margin">红色</p>
							</li>
						
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-yellow" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
									<div>
										<span style="display: block; width: 20%; float: left; height: 7px;" class="bg-yellow-active"></span>
										<span class="bg-yellow" style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #222d32"></span>
											<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin">黄色</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-blue-light" 	style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)"
								class="clearfix  full-opacity-hover">
									<div>
										<span style="display: block; width: 20%; float: left; height: 7px; background: #367fa9"></span>
										<span class="bg-light-blue" style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #f9fafc"></span>
										<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin" style="font-size: 12px">蓝白</p>
						   </li>
						   
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-black-light" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)"
								class="clearfix  full-opacity-hover">
								   <div style="box-shadow: 0 0 2px rgba(0, 0, 0, 0.1)" class="clearfix">
										<span style="display: block; width: 20%; float: left; height: 7px; background: #fefefe"></span>
										<span style="display: block; width: 80%; float: left; height: 7px; background: #fefefe"></span>
									</div>
									<div>
									    <span style="display: block; width: 20%; float: left; height: 20px; background: #f9fafc"></span>
										<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin" style="font-size: 12px">黑白</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-purple-light" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
								   <div>
										<span
											style="display: block; width: 20%; float: left; height: 7px;"
											class="bg-purple-active"></span><span class="bg-purple"
											style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #f9fafc"></span>
										<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									 </div>
							</a>
							<p class="text-center no-margin" style="font-size: 12px">紫白</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
							<a href="javascript:void(0)" data-skin="skin-green-light" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
									<div>
										<span style="display: block; width: 20%; float: left; height: 7px;" class="bg-green-active"></span>
										<span class="bg-green" style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #f9fafc"></span>
											<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
							</a>
							<p class="text-center no-margin" style="font-size: 12px">绿白</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
								<a href="javascript:void(0)" data-skin="skin-red-light" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
									<div>
										<span style="display: block; width: 20%; float: left; height: 7px;" class="bg-red-active"></span>
										<span class="bg-red-active" style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #f9fafc"></span>
										<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
								</a>
									
							<p class="text-center no-margin" style="font-size: 12px">红白</p>
							</li>
							
							<li style="float: left; width: 33.33333%; padding: 5px;">
								<a href="javascript:void(0)" data-skin="skin-yellow-light" style="display: block; box-shadow: 0 0 3px rgba(0, 0, 0, 0.4)" class="clearfix full-opacity-hover">
									<div>
										<span style="display: block; width: 20%; float: left; height: 7px;" class="bg-yellow-active"></span>
										<span class="bg-yellow" style="display: block; width: 80%; float: left; height: 7px;"></span>
									</div>
									<div>
										<span style="display: block; width: 20%; float: left; height: 20px; background: #f9fafc"></span>
										<span style="display: block; width: 80%; float: left; height: 20px; background: #f4f5f7"></span>
									</div>
								</a>
								<p class="text-center no-margin" style="font-size: 12px">黄白</p>
						</li>
						</ul>
					</div>
				</div>
				<!-- /.tab-pane -->
      </div>
</aside>
</div>
</body>
</html>
