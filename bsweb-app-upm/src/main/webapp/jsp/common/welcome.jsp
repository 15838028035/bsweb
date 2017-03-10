<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="style/style.css" /> 

<script src="${ctx}/scripts/jquery/jquery.min.js" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/layout_tradition.js"></script>
<script language="javascript" src="${ctx}/scripts/jquery/jquery.tablegrid.min.js"></script>
<script language="javascript" src="${ctx}/scripts/control.js"></script>

<script language="javascript">
	$(function(){
		contralEffect.contain();
		contralEffect.tablelist();
		contralEffect.blueButton();
	});

</script>
</head>

<body>
<div class="padd10">
<!--start  contain容器-->
<div class="contain">
<div class="contain_wrap">
	<div class="contain_search">
    	<div class="contain_s_wrap">
        	<table width="100%" cellpadding="0" cellspacing="0" border="0" height="300">
            <tr>
                <td align="left" class="font_wei"><img src="${ctx}/images/welcome_bg.jpg" /></td>
            </tr>
  			</table>
        </div><!--end contain_s_wrap-->
    </div><!--end contain_search-->
</div><!--end contain_wrap-->
</div><!--end contain-->
</div>
</body>
</html>
