<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>

<STYLE type=text/css>
BODY {
	BORDER-TOP-WIDTH: 0px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 0px
}
DIV {
	BORDER-TOP-WIDTH: 0px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 0px
}
FONT {
	BORDER-TOP-WIDTH: 0px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 0px
}
#menuSwitch {
	  WIDTH: 13; CURSOR: pointer; PADDING-TOP: 0px; HEIGHT: 1000px
}
#menuSwitch IMG {
}
</STYLE>

<SCRIPT language=javascript>
function changeWin(o){
	if(parent.mainFrame.cols != "0,8,*") {
		parent.mainFrame.cols = "0,8,*";
		o.innerHTML = "<img src='${ctx}/images/angle_right1.gif'>";
	}	else {
		parent.mainFrame.cols = "19%,8,*";
		o.innerHTML = "<img src='${ctx}/images/angle_left1.gif'>";
	}
}
</SCRIPT>

<BODY>
<DIV id="menuSwitch" onclick=changeWin(this)> 
<img src='${ctx}/images/angle_left1.gif'>
</DIV>
</BODY></HTML>
