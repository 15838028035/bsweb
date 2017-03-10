<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<script type="text/javascript">
	$(function (){
		$("#removeAuthor").click(function(){
			var ids = jQuery("#detaillist").jqGrid('getGridParam','selarrrow').toString();
			var selectidlist = ids.split(",");
			for (var i = 0; i < selectidlist.length; i++) {
				var selectid = selectidlist[i];
				if (selectid != "") {
					jQuery("#detaillist").jqGrid('delRowData',selectid);
				}
			}
		})
		
		$("#addAuthor").click(function(){
			//openSelectDialog("javascript:objIntoGrid",$("#authorTypes").val(),"${ctx}","${appCode}","${appId}","","","${adminAcctSeq}");
			openSelectDialog("javascript:detaillist",$("#authorTypes").val(),"${ctx}","${appCode}","${appId}","","","${adminAcctSeq}");
		})
	});
	
	function objIntoGrid(id ,name ,object){
		// alert(typeof(object));
		$("#detaillist").jqGrid('addRowData',id, object);
	}
</script>
<input type="hidden" id="operate" name="operate" value="${operate }" />
<table width="100%" cellpadding="0" cellspacing="0" border="0" id="buttonTable" style="display:none">
	<tr>
		<td align="center" width="20%">
		</td>
		<td align="right" width="60%">
			<div class="window_button marg_lef10 float_lef" style="float: left;">
				<input id="removeAuthor" type="button" value="" btnTip="<s:text name='batchoperate.removeSelect'/>" class="window_button_centerInput window_button_centerInput1 beTypeOperateButton" />
			</div>
			<div class="window_button marg_lef10 float_lef" style="float: left;">
				<input id="addAuthor" type="button" value="" btnTip="<s:text name='batchoperate.addTo' />${operate == 'COPY' ? '授权' : '解除' }" class="window_button_centerInput window_button_centerInput1 beTypeOperateButton" />
			</div>
			<div class="window_button marg_lef10 float_lef" style="float: left;">
				<input id="saveOperate" type="button" value="${operate == 'COPY'  ? '添加' : '解除' }<s:text name="batchoperate.author" />" class="window_button_centerInput window_button_centerInput1 beTypeOperateButton" />
			</div>
		</td>
		<td align="center" width="20%">
		</td>
	</tr>
</table>
