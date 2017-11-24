<%@page language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>审批流水</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
</head>

<body>


<ul class="timeline">
	 <c:forEach var="flowApprove" items="${flowApproveLogList}" varStatus="status">
	        <li class="time-label">
                  <span class="bg-red"><fmt:formatDate value="${flowApprove.operateTime}" pattern="yyyy-MM-dd HH:mm" /></span>
            </li>
             <li>
              <i class="fa fa-user bg-aqua"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${flowApprove.operateTime}" pattern="HH:mm" /></span>
                <h3 class="timeline-header">(${flowApprove.taskName})${flowApprove.operator}执行审批 ,审批结果:<a href="#"></a> 
                <c:if  test="${flowApprove.optResult=='0'}">同意</c:if>
                <c:if  test="${flowApprove.optResult=='-1'}">拒绝</c:if>
                <c:if  test="${flowApprove.optResult=='1'}">转派</c:if>
                </h3>
                <div class="timeline-body">
                		审批意见:${flowApprove.optContent}
                </div>
              </div>
            </li>
	</c:forEach>
</ul>

</body>
</html>
