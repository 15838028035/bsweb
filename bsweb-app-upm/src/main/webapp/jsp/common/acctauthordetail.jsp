<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

	<body>
		<script language="javascript">
			$(document).ready(function(){
					contralEffect.contain();
					contralEffect.tablelist();
					contralEffect.blueButton();
					Management_4A.cteate_select();
					Management_4A.createNewLi();
					
			$("#quit").click(function(){
				$.FrameDialog.closeDialog();
			});		
					
			   });
		</script>
	
	<body>
			<div class="contain">
				<div class="contain_wrap">
					<div class="contain_search">
			  			<div class="contain_s_wrap">
						<table>
							<tr>
								<td>
									<span>${acctAuthorInfo}</span>
								</td>
							</tr>
							<br>
							<tr>
								<td>
									<span>${authorSendMsgInfo}</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
					             	<div class=" float_lef marg_lef10"><input type="button" class="window_button_centerInput window_button_centerInput1"  value="<s:text name='common.options.ok' />" id="quit"/></div>				
								</td>
							</tr>
						</table>
		  			</div>
				</div>
			</div>
		</div>
	</body>
</head>
