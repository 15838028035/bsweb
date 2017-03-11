<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="h" uri="http://www.asiainfo.com/uap/html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/jsp/common/meta.jsp"%>
	</head>
  
  <body>
	<!--font color="green"><b>${uapPwdRule.ruleName }:&nbsp;<b></font-->
	<table width="230px">
		<c:if test="${uapPwdRule.ruleType == 1}">
			<tr>
				<td align="left"><s:text name="pwd.appidentity" />${ruleEntity }</td>
			</tr>
		</c:if>
		<tr>
			<td width="100%" align="left" class="font_wei">
				<table width="100%">
					<tr>
						<td align="left" colspan="2">
							<s:text name="pwd.length"></s:text>
							<span style='color:red'><b>${uapPwdRule.minLength } <s:text name="common.tips.to"></s:text> ${uapPwdRule.maxLength } <s:text name="common.tips.bit"></s:text></b></span>
						</td>
					</tr>
					<tr>
						<td valign="top" align="left" colspan="2">
							<s:text name="pwd.buildup"></s:text>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 28px">
							<c:if test="${uapPwdRule.hasLowercase == 1}">
								<span style='color:red'><b><s:text name="pwd.lowercaseleast"></s:text>${uapPwdRule.leastLowercase}<s:text name="common.tips.bit"></s:text> </b></span>&nbsp;
							</c:if>
							<c:if test="${uapPwdRule.hasUppercase == 1}">
								<br />
								<span style='color:red'><b><s:text name="pwd.uppercaseleast"></s:text>${uapPwdRule.leastUppercase}<s:text name="common.tips.bit"></s:text></b></span>&nbsp;
							</c:if>
							<c:if test="${uapPwdRule.hasNumber == 1}">
								<br />
								<span style='color:red'><b><s:text name="pwd.numberleast"></s:text>${uapPwdRule.leastNumber}<s:text name="common.tips.bit"></s:text></b></span>&nbsp;
							</c:if>
							<c:if test="${uapPwdRule.hasSpecial == 1}">
								<br />
								<span style='color:red'><b>
								<s:text name="pwd.specialcharacter" /> ${uapPwdRule.specialChars}</b></span>&nbsp;
							</c:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="font_wei" align="left">
				<s:text name="pwd.historytimes"></s:text>
				<span style='color:red'><b>${uapPwdRule.pwdHistoryTimes}</b></span>
			</td>
		</tr>
		<tr>
			<td class="font_wei" align="left">
				<s:text name="pwd.newoldnotmatchnums"></s:text> <span style='color:red'><b>${uapPwdRule.leastDiffWord}</b></span>
			</td>
		</tr>	
		<tr>
			<td class="font_wei" align="left">
				<s:text name="pwd.singlecharRepeatmost"></s:text>&nbsp;&nbsp;&nbsp;
				<span style='color:red'><b>${uapPwdRule.mostRepeatWord}</b></span>
			</td>
		</tr>
		<c:if test="${uapPwdRule.notAcctSimilar == 1}">
		<tr>
			<td class="font_wei" align="left" colspan="2">
				<s:text name="pwd.rule"></s:text>&nbsp;
				<span style='color:red'><b><s:text name="pwd.notsimilerwithacct"></s:text> </b></span>
			</td>
		</tr>
		</c:if>

	</table>
  </body>
</html>
