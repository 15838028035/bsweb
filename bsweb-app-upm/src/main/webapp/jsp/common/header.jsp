<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><s:text name='header.addresoucedir'/></title>
    
	<%@ include file="/jsp/common/meta.jsp" %>
	
	<link href="${ctx }/styles/base.css" rel="Stylesheet" />
	<link href="${ctx }/styles/bomc.css" rel="Stylesheet" />
	<link href="${ctx }/styles/table.css" rel="Stylesheet" />
	<link href="${ctx }/styles/tab.css" rel="Stylesheet" />
	<link href="${ctx }/styles/button.css" rel="Stylesheet" />
	<link href="${ctx }/styles/custom.css" rel="Stylesheet" />
	<link href="${ctx }/styles/pagination.css" rel="Stylesheet" />
	<link href="${ctx }/styles/layout.css" rel="Stylesheet" />
	<link href="${ctx }/styles/temp.css" rel="Stylesheet" />
	
  </head>
  
  <body>
  
  	<!--begin header-->
	<div class="header">
	    <div class="logo"></div>
	    <div class="toolBar">
	        <ul>
	            <li><a href="#">admin</a></li>
	            <li>|</li>
	            <li><a href="#"><s:text name='header.help'/></a></li>
	            <li>|</li>
	            <li><a href="#"><s:text name='header.logout'/></a></li>
	        </ul>
	    </div>
	    <div class="clear"></div>
	</div>
	<!--end header-->
	
 	<div class="tab wraper-bc">
         <ul>
             <li><a href="${ctx}/jsp/mainacct/mainacct-index.jsp"><s:text name='header.acctmng'/></a> </li>
             <li><a href="${ctx}/jsp/app/appmgmt-index.jsp"><s:text name='header.appmng'/></a></li>
             <li><a href="${ctx}/jsp/sys/allentity/allentity.action"><s:text name='common.equipmentMgmt'/></a> </li>
             <li><a href="${ctx}/jsp/syscfg/pwd/pwdrule.jsp?ruleType=0"><s:text name='common.sysconfig'/></a> </li>
             <li><a href="#"><s:text name='header.reportmng'/></a> </li>
             <li><a href="#"><s:text name='header.platformmng'/></a> </li>
         </ul>
         <div class="clear">
         </div>
     </div>
  </body>
</html>
