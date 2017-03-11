<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<s:set	name="mainAcctId"	value="#parameters.mainAcctId[0]"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<%@ include file="/jsp/common/meta.jsp" %>
	
  </head>
  
  <body>
	 <table width="100%"  cellpadding="0" cellspacing="0" border="0">
	    <tr>
    	 	<td width="25%" valign="top">
		    	<iframe id="LT_menu" src="${ctx}/jsp/common/organization.jsp?mainAcctId=${mainAcctId}" scrolling="auto" width="100%" height="450" frameborder="0"></iframe>
		    </td>
		    <td width="75%" valign="top">
			    <iframe id="LT_main" src="${ctx}/jsp/common/selectMainAcctR.jsp?domain=2&dirbar=true" scrolling="auto" width="100%" height="600" frameborder="0" allowTransparency="true" style="overflow-x:hidden;"></iframe>
		    </td>
	    </tr>
    </table>
  </body>
</html>
