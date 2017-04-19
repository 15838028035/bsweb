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


<div style="width: 200px;">
			<div class="panel-group" id="accordion2">
			<div class="panel-heading">
				<strong style="font-size: 30px;">论坛分类</strong>
			</div>
				<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseOne">
						<a class="accordion-toggle">Java</a>
					</div>
					<div id="collapseOne" class="panel-collapse collapse"
						style="height: 0px;">
						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Java基础</a></li>
								<li><a href="#">Java面向对象</a></li>
								<li><a href="#">Java核心API</a></li>
								<li><a href="#">JavaEE</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo">
						<a class="accordion-toggle">数据库</a>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						style="height: 0px;">
						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">SQL基础</a></li>
								<li><a href="#">Oracle</a></li>
								<li><a href="#">MySQL</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseThree">
						<a class="accordion-toggle">技术前沿</a>
					</div>
					<div id="collapseThree" class="panel-collapse in"
						style="height: 0px;">
						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">NoSQL</a></li>
								<li><a href="#">Hadoop</a></li>
								<li><a href="#">WebService</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		</body>
		
		</html>