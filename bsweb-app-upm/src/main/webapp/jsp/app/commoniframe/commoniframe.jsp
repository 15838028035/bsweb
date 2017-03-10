<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>应用权限管理</title>

		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
	<script type="text/javascript">
  
  	$(function() {
      $("#tabs").tabs();
      contralEffect.contain();
      contralEffect.blueButton();		
      $("#appmgmt").click(function(){
									   
			//parent.LT_menu.location="/uap/jsp/app/appdirectory/directory.jsp?action=navi";
			//parent.LT_main.location="/uap/jsp/app/entity/appentity.jsp";
			
		});
		
	  var iframes = document.getElementsByTagName("iframe");
		for (var i = 0; i < iframes.length; i++) {
			var id = iframes[i].id ;
			changeTab(id.substr("iframe-".length-1));
			return;
		}		
     });
     
	function changeTab(type){
	
		var oldurl = $("#frame-"+type).attr("src");
		//if(oldurl!="")
		//if(oldurl!=""&&type!="3")  有些页面可能需要每次刷新，如果全部刷新，感觉易用性不好
			//return;
			
	   	var  tokenId =  jQuery.ajax({
		          url:"commoniframe!getSsoToken.action?appId=${appId}&adminAcctSeq=${adminAcctSeq}&timeStamp="+new Date().getTime(),
		          async:false,
		          dataType:"text"
		        }).responseText;
		//var linkurl = $("#frame-"+type).val(); //TODO:remove //
		var linkurl =document.getElementById("frame-"+type).value();
		var url = "";
		if(linkurl.indexOf("?")!=-1){
			url = linkurl +"&token="+tokenId+"&appAcctId=${adminAcctSeq}&flag=1&ip=${ip}&client=${client}";
		}else{
			url = linkurl +"?token="+tokenId+"&appAcctId=${adminAcctSeq}&flag=1&ip=${ip}&client=${client}";
		}
		
		$("#frame-"+type).attr("src",url);
		    
    }
   
</script>

		
	</head>

	<body>
		<div class="padd10">
			<div class="contain">
				<div class="contain_wrap">
					<div class="contain_title">
						<div class="contain_t_wrap">
							<div class="float_lef contain_t_text">
								<span class=""><img src="${ctx}/images/spreadsheet18.gif"
										align="absmiddle" /> </span>
								<span class="marg_lef5"><a id="appmgmt" href="#">应用管理
											</a> </span>
								<span class=""><img src="${ctx}/images/next.gif"
										align="absmiddle" /> </span> ${appNameTitle}
								<span class=""><img src="${ctx}/images/next.gif"
										align="absmiddle" /> </span>
								<span class="marg_lef5">应用实体管理</a> </span>
							</div>
							<!--end contain_t_text-->
							<div class="float_rig contain_t_check">
								<div class="contain_icon"></div>
							</div>
							<!--end contain_t_check-->
							<div class="clear"></div>
						</div>
						<!--end contain_t_wrap-->
					</div>
					<div class="contain_search">
						<div class="contain_s_wrap">
							<div id="tabs" style="margin: 2px; width: 98%;">
								<ul>
									<c:forEach items="${pageList}" var="pageSrcConfigBean"
										varStatus="status">
<!-- 										<sec:authorize code="${pageSrcConfigBean.code}" required="${pageSrcConfigBean.code==null?'false':'true' }"> -->
											<li>
												<a href="#tabs-${status.count}" onclick="changeTab(${status.count});">${pageSrcConfigBean.linkTitle}</a>
											</li>
<!-- 										</sec:authorize> -->
									</c:forEach>

								</ul>
								<c:forEach items="${pageList}" var="pageSrcConfigBean"
									varStatus="status">
<!-- 									<sec:authorize code="${pageSrcConfigBean.code}" required=" ${pageSrcConfigBean.code==null?'false':'true' }"> -->
									<div id="tabs-${status.count}">
										<iframe id="frame-${status.count}" value="${pageSrcConfigBean.linkUrl}" name="frame" width="100%" height="450px"
											frameBorder=0 scrolling='yes'
											src="">
										</iframe>
									</div>
<!-- 									</sec:authorize> -->
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</body>
</html>
