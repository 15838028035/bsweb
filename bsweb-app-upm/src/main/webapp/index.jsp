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
     	<a class="toogle pull-right">
			<i class="fa fa-chevron-left"></i>
		</a>
     </div> 
    
    <div class="container-fluid">
          <div class="row">
          		<div class="col-sm-3 col-md-3 sidebar" id="sidebar">
          			<div class="list-group">
								<a href="${ctx}/jsp/user/upmUserList.jsp"  class="list-group-item"  >用户管理</span></a>
								<a href="${ctx}/jsp/user/upmUserGroupTreeList.jsp"  class="list-group-item"  >组织机构管理</a>
								<a href="${ctx}/jsp/role/upmRoleList.jsp?appId=CRM"  class="list-group-item" >角色管理</a>
								<a href="${ctx}/jsp/permission/permission.jsp?appId=CRM" class="list-group-item" >权限管理</a>
								<a href="${ctx}/jsp/upmApp/upmAppList.jsp" class="list-group-item" >应用管理</a>
								<a href="${ctx}/jsp/dictionary/upmDictionaryNoteList.jsp" class="list-group-item"  >数据字典管理</a>
								<a href="${ctx}/jsp/dictionary/upmConfigurationList.jsp" class="list-group-item" >配置管理</a>
								<a href="${ctx}/jsp/upmNotice/upmNoticeList.jsp" class="list-group-item"  >通知管理</a>
								<a href="${ctx}/jsp/flows/flowProcessList.jsp" class="list-group-item"  >流程定义</a>
								<a href="${ctx}/jsp/flows/flowOrderList.jsp" class="list-group-item" >流程实例</a>
								<a href="${ctx}/jsp/flows/flowCcorderList.jsp"  class="list-group-item" >抄送实例</a>
								<a href="${ctx}/jsp/flows/flowTaskList.jsp" class="list-group-item"  >代办任务</a>
								<a href="${ctx}/jsp/flows/flowTaskHistList.jsp" class="list-group-item" >历史任务</a>
          			</div>
				</div>
				<div class="toggler" data-whois="toggler">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</div>
				
				<div class="col-sm-12 col-md-12 main" id="main">
					<iframe id="main_iframe" src="" scrolling="auto" frameborder="0" allowTransparency="true" style="width:100%;" name="main_iframe">
					</iframe>
				</div>

			</div> 
			
			</div>
			
	    <footer  class="well">
			<p>微信方式:15838028035</p>
		</footer>
    </div>
    

<script type="text/javascript">
    $(document).ready(function () {
       /*  $('#sidebar').BootSideMenu({
            side: "left",
            pushBody:false,
            closeOnClick:false
        }); */
    });
</script>    
  </body>

</html>