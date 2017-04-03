<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>

  </head>
 	 			<style>
		.altclass{background: #eeeeee;}
		</style>
  <script type="text/javascript">
		$(document).ready(function(){
			//contralEffect.contain();
			//contralEffect.tablelist();
			contralEffect.blueButton();
			//$("#tabs").tabs();
			//manageApplicationDialog();//dialog
			//Management_4A.AccentTree();
		});
		
		
    	//if('${returnMessage}' != ''){
  			//alert('${returnMessage}');
  			//window.location = "${ctx}/jsp/common/acctauthor!input.action?resAcctId=${resAcctId}&resEntityId=${resEntityId}&resKind=${resKind}&authorId=${authorId}";
  		//}
  		
		$(function() {
			openEdit = function(el, cellval, opts){
				var id = cellval.rowId;
				var effectTime = opts.authorEffectTime;
				var expireTime = opts.authorExpireTime;
				
				//无论帐号是否失效，都可以编辑生、失效的时间
				//并将“编辑”二字显示出下划线，并且标为蓝色，用于用户可以识别。
				var yinhao = "\"";
				return "<a href='#' onclick='editAuthorTime("+id+","+yinhao +effectTime+yinhao+","+yinhao+expireTime+yinhao+");'><font color='blue'><u><s:text name='CommonEdit'></s:text></u></font></a>";
			}		

			//日期控件
			$("#effectDate,#expireDate,#editEffectDate,#editExpireDate").addClass("Wdate");

			$("#effectDate,#expireDate,#editEffectDate,#editExpireDate").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d'});
			});		
			
			$("#effectDateSetting1").click(function() {
				$("#effectDate").attr("disabled","disabled");
				$("#effectDate").val("");
				$("#effectDate").hide();
				$("#effectTimeHidden").next().hide();
				
			 })
			$("#effectDateSetting2").click(function() {
				$("#effectDate").removeAttr("disabled");
				$("#effectDate").show();
			 })
			$("#expireDateSetting1").click(function() {
				//$("#expireDate").attr("disabled","disabled");
				//$("#expireDate").val("");
			 })
			 
			$("#editEffectDateSetting1").click(function() {
				$("#editEffectDate").prop("readonly",true);
				$("#editEffectDate").val("");
				$("#editEffectDate").hide();
			 })
			$("#editEffectDateSetting2").click(function() {
				$("#editEffectDate").removeAttr("disabled");
				$("#editEffectDate").show();
			 })
			$("#editEffectDateSetting1").click(function() {
				//$("#editExpireDate").attr("disabled","disabled");
				//$("#editExpireDate").val("");
			 })
			 
		});
		
        jQuery(document).ready(function(){ 
			jQuery("#list").jqGrid({
				url:'${ctx}/jsp/common/acctauthor!subList.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}&ownMainAcctId=${uapAcctAuthor.ownMainAcctId}',
				datatype: 'json',
				mtype: 'POST',
				colNames:['ID','<s:text name="author.tips.ownperson"></s:text>',
				'',
				'<s:text name="author.tips.useperson"></s:text>',
				'',
				'<s:text name="author.tips.authorstatus"></s:text>',
				'<s:text name="author.tips.authortype"></s:text>',
				'<s:text name="common.tips.effecttime"></s:text>',
				'<s:text name="common.tips.expiretime"></s:text>',
				'<s:text name="common.tips.operate"></s:text>'],
				colModel:[
					 {name:'authorId',index:'authorId',hidden:true},
					 {name:'ownMainAcctName',index:'ownMainAcctName',align:'center', width:100,editable:true},
					 {name:'ownMainAcctId',index:'ownMainAcctId',hidden:true},
					 {name:'inUseAcctPersonName',index:'inUseAcctPersonName',align:'center', width:100,editable:true},
					 {name:'useMainAcctId',index:'useMainAcctId',hidden:true},
					 {name:'authorStatus',index:'authorStatus',align:'center', width:80,editable:true},
					 {name:'authorType',index:'authorType',align:'center', width:80,editable:true},
					 {name:'authorEffectTime',index:'authorEffectTime',align:'center', width:210,editable:true},
					 {name:'authorExpireTime',index:'authorExpireTime',align:'center', width:210,editable:true},
					 {name:'editAuthor',index:'',align:'center', width:70,formatter:openEdit}
					 ],
				sortable: true,
				rowNum:50,
				multiselect: false, 
				prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
				jsonReader: {     
					root: "rows",   
					repeatitems : false,
					id:"0"        		    
					},
				sortname: 'authorEffectTime',
				sortorder: 'asc',
				viewrecords: true,
				caption: '<s:text name="author.tips.authorlist"></s:text>',
				height: '100%',
				hidegrid: false,
				altRows:true,
				altclass:'altclass',
				loadtext: '<s:text name="common.tips.loading"></s:text>',
				scrollrows: true,
				gridComplete:function(){
					var selr = jQuery("#list").getRowData();
					for(var i=0;i<selr.length;i++)
					{
						if(selr[i].ownMainAcctId!=selr[i].useMainAcctId)
						{
								document.getElementById("entrustAuthorId").value = selr[i].authorId;
								document.getElementById("ofbizAuthor").disabled = true;
								document.getElementById("cancelEntrust").disabled = false;
								document.getElementById("entrustEffectDate").value = selr[i].authorEffectTime;
								document.getElementById("entrustExpireDate").value = selr[i].authorExpireTime;
								return;
						}
					}
					document.getElementById("ofbizAuthor").disabled = false;
					document.getElementById("cancelEntrust").disabled = true;
					document.getElementById("entrustEffectDate").value = "";
					document.getElementById("entrustExpireDate").value = "";
				}
			}); 
			
		});
  </script>
  <body>
  	<input id="effectDateAll" type="hidden" value="${effectDate }"/>
  	<input id="expireDateAll" type="hidden" value="${expireDate }"/>
	<table align="center">
		<tr>
			<td align="right" width="100"><s:text name="common.subacctname"></s:text>:</td>
			<td align="left" width="150" id="acctName1">${acctName }</td>
			<td align="right" width="80"><s:text name="common.resname"></s:text>:</td>
			<td align="left" width="200">${resEntityName }</td>
		</tr>
		<tr>
			<td align="right" width="100"><s:text name="author.tips.ownmainacct"></s:text>:</td>
			<td align="left" width="150">${uapAcctAuthor.ownMainAcctName }</td>
			<td align="right" width="80"><s:text name="author.tips.authorstatus"></s:text>:</td>
			<td align="left" width="200" id="tdAuthorStatus">${authorStatus }</td>
		</tr>
		<tr>
			<td align="right" width="100"><s:text name="common.tips.effecttime"></s:text>:</td>
			<td align="left" width="150" id="tdEffectTime">${effectDate }</td>
			<td align="right" width="80"><s:text name="common.tips.expiretime"></s:text>:</td>
			<td align="left" width="200" id="tdExpireTime">${expireDate }</td>
		</tr>
	</table>
	
	<table align="center">
		<tr>
		
			<td>
				<div class=" marg_lef10 float_lef"><input type="button" id="ofbizAuthor" class="window_button_centerInput window_button_centerInput1" value="<s:text name='author.tips.entrustauthor'></s:text>" onclick="ofbizAuthor();"/></div>
			</td>
			<td>
				<div class=" marg_lef10 float_lef"><input type="button" id="cancelEntrust" class="window_button_centerInput window_button_centerInput1" value="<s:text name='author.tips.revokeentrustauthor'></s:text>" onclick="releaseAuthor();" disabled=disabled/></div>
			</td>
			<td>
				<div class=" marg_lef10 float_lef"><input type="button" id="refresh" class="window_button_centerInput window_button_centerInput1" value="<s:text name='common.tips.refresh'></s:text>" onclick="refresh();"/></div>
			</td>
			<td>
				<div class=" marg_lef10 float_lef"><input type="button" id="revokeAuthor" class="window_button_centerInput window_button_centerInput1" value="<s:text name='common.options.cancel'></s:text>" onclick="closeWindow();"/></div>
			</td>
		</tr>
	</table>
	
	<table id="list">
	</table>
	<input id="entrustExpireDate" type="hidden" value=""/>
  	<input id="entrustEffectDate" type="hidden" value=""/>
<div id="editAu" style="display: none;">
  	<form action="${ctx }/jsp/common/acctauthor!edit.action" id="authorForm1" method="post">
  	<input type="hidden" name="resKind" value="${resKind }" />
  	<input type="hidden" name="resEntityId" value="${resEntityId }" />
  	<input type="hidden" name="resAcctId" value="${resAcctId }" />
  	<input type="hidden" name="authorId" value="${authorId }" />
  	<table>
  		<tr>
			<td width="10"></td>
			<td width="100" align="left"><font color="green"><b><s:text name="author.tips.entrustauthor"></s:text>:</b></font></td>
			<td width="500" align="left"></td>
		</tr>
  		<tr>
			<td width="10">&nbsp;</td>
			<td width="100" align="right"><s:text name="mainacct.mainacct"></s:text>:</td>
			<td width="500" align="left">
				<input type="text" id="mainAcctName" readonly="readonly" onclick="choseMainAcct();" />
				<img src="${ctx}/images/User.png" class="CA_4A_select cursor_pointer" onclick="choseMainAcct();" style='padding:2px 3px; cursor:pointer;' />
				<input  type="hidden" id="mainAcctId" name="uapAcctAuthor.useMainAcctId" />
			</td>
		</tr>
  		<tr>
			<td width="10">&nbsp;</td>
			<td width="100" align="right"><s:text name="common.tips.effecttime"></s:text>:</td>
			<td width="500" align="left">
            	<input type="radio" id="effectDateSetting1" value="1" name="effectDateType" checked/><s:text name="common.tips.effectnow"></s:text>:
                <input type="radio" id="effectDateSetting2" value="2" name="effectDateType" /><s:text name="common.tips.effectby"></s:text>:<br/>
                <input type="text" id="effectDate" name="effectDate" readonly="readonly" value="<s:date name='uapAcctAuthor.authorEffectTime' format='yyyy-MM-dd HH:mm:ss' />" style="display:none"/>
                <input type="hidden" id="effectTimeHidden" name="effectTimeHidden" value="<s:date name='uapAcctAuthor.authorEffectTime' format='yyyy-MM-dd HH:mm:ss' />"/>
			</td>
		</tr>

		<tr>
			<td width="10">&nbsp;</td>
			<td width="100" align="right"><s:text name="common.tips.expiretime"></s:text>:</td>
			<td width="500" align="left">
                <input type="text" id="expireDate" name="expireDate" readonly="readonly" value="<s:date name='authorExpireTime' format='yyyy-MM-dd hh:mm:ss' />"/>
                
                <input type="hidden" id="expireTimeHidden" name="uapAcctAuthor.authorExpireTime" value="<s:date name='uapAcctAuthor.authorExpireTime' format='yyyy-MM-dd hh:mm:ss' />"/>
			</td>
		</tr>
		<tr>
			<td width="10">&nbsp;</td>
			<td width="100" align="right">
				<div class=" marg_lef10 float_rig"><input type="submit" class="window_button_centerInput window_button_centerInput1" id="authorButton1" value="<s:text name='common.options.save'></s:text>"/></div>
			</td>
			<td width="500" align="left">
				<div class=" marg_lef10 float_lef"><input type="button" class="window_button_centerInput window_button_centerInput1" value="<s:text name='common.options.cancel'></s:text>" onclick="cancelOperate();"/></div>
			</td>
		</tr>
	</table>
	</form>
</div>


<div id="editAu2" style="display: none;">
  	<form action="${ctx }/jsp/common/acctauthor!editAuthorTime.action" id="authorForm2" method="post">
  	<input type="hidden" id="editAuthorId" name="editAuthorId" value="" />
  	<input type="hidden" id="entrustAuthorId" name="entrustAuthorId" value="" />
  	<input type="hidden" name="resKind" value="${resKind }" />
  	<input type="hidden" name="resEntityId" value="${resEntityId }" />
  	<input type="hidden" name="resAcctId" value="${resAcctId }" />
  	<input type="hidden" name="ownMainAcctId" value="${uapAcctAuthor.ownMainAcctId }" />
  	<table>
  		<tr>
			<td width="10"></td>
			<td width="100" align="left"><font color="green"><b><s:text name="author.tips.editauthor"></s:text>:</b></font></td>
			<td width="500" align="left"></td>
		</tr>
  		<tr>
			<td width="10">&nbsp;</td>
			<td width="100" align="right"><s:text name="common.tips.effecttime"></s:text>:</td>
			<td width="500" align="left">
            	<input class="dis" type="radio" id="editEffectDateSetting1" value="1" name="editEffectDateType" checked /><label class="dis"><s:text name="common.tips.effectnow"></s:text></label>
                <input class="dis"  type="radio" id="editEffectDateSetting2" value="2" name="editEffectDateType" /><label class="dis"><s:text name="common.tips.effectby"></s:text><br /></label>
                <input class="dis"  type="text" readonly="readonly"  id="editEffectDate" name="editEffectDate" value="<s:date name='editAuthorEffectTime' format='yyyy-MM-dd hh:mm:ss' />" style="display:none"/>
                <input class="endis"  type="text" disabled="disabled"  id="editEffectDateShow" value=""/>
				<input type="hidden" id="editEffectTimeHidden" name="editEffectTimeHidden" value="<s:date name='editAuthorEffectTime' format='yyyy-MM-dd hh:mm:ss' />"/>

   			</td>
		</tr>

		<tr>
			<td width="10">&nbsp;</td>
			<td width="100" align="right"><s:text name="common.tips.expiretime"></s:text>:</td>
			<td width="500" align="left">
                <input type="text" readonly="readonly" id="editExpireDate" name="editExpireDate" value="<s:date name='editAuthorExpireTime' format='yyyy-MM-dd hh:mm:ss' />"/>
			</td>
		</tr>
		<tr>
			<td width="10">&nbsp;</td>
			<td width="100" align="right">
				<div class=" marg_lef10 float_rig"><input type="submit" id="authorButton2" class="window_button_centerInput window_button_centerInput1" value="<s:text name='common.options.save'></s:text>"/></div>
			</td>
			<td width="500" align="left">
				<div class=" marg_lef10 float_lef"><input type="button" class="window_button_centerInput window_button_centerInput1" value="<s:text name='common.options.cancel'></s:text>" onclick="cancelOperate();"/></div>
			</td>
		</tr>
	</table>
	</form>
</div>
<script type="text/javascript">
  	$("#effectDateSetting2").click();
  	$("#editEffectDateSetting2").click();

	function refresh(){
		jQuery("#list").jqGrid('setGridParam',{
				    url:"${ctx}/jsp/common/acctauthor!subList.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}&ownMainAcctId=${uapAcctAuthor.ownMainAcctId}",
				 	 page:1
		 }).trigger("reloadGrid");
	}
	
	function choseMainAcct(){
		jQuery.FrameDialog
              .create({
                  url: "${ctx}/jsp/mainacct/mainacct-select.jsp",
                  title: '<s:text name="author.tips.choosemainacct"></s:text>',
                  width: 850,
                  height: 300,
                  buttons: {}
        })  
	}
	
	function releaseAuthor(){
		showModalConfirmation("<s:text name='author.tips.confirmrevokeentrust'></s:text>","doRevoke()");
	}
	
	function doRevoke(){
		var editAuthorId = document.getElementById("entrustAuthorId").value; 
		var result = jQuery.ajax({
				      	  url:"${ctx }/jsp/common/acctauthor!releaseAuthor.action?resAcctId=${resAcctId}&resEntityId=${resEntityId}&resKind=${resKind}&ownMainAcctId=${uapAcctAuthor.ownMainAcctId}&editAuthorId="+editAuthorId,
				          async:false,
				          dataType:"json"
				      }).responseText;
		var obj = eval("("+result+")");
		showModalMessage(obj.opResult);
		document.getElementById("entrustAuthorId").value = "";
		refresh();
		cancelOperate();
	}
	
	function ofbizAuthor(){
		document.getElementById("editAu").style.display = "";
		document.getElementById("editAu2").style.display = "none";
		$("#effectDateSetting1").click();
		document.getElementById("effectTimeHidden").value = getEffectTime();
		document.getElementById("expireTimeHidden").value = "";
		document.getElementById("expireDate").value = "";
		document.getElementById("mainAcctName").value = "";
		document.getElementById("mainAcctId").value = "";
		
	}
	
	function editAuthorTime(authorId,effectTime,expireTime){
		document.getElementById("editAuthorId").value = authorId;
		$("#editEffectDateSetting2").click();
		document.getElementById("editAu").style.display = "none";
		document.getElementById("editAu2").style.display = "";
		document.getElementById("editEffectDate").value = effectTime;
		document.getElementById("editExpireDate").value = expireTime;
		document.getElementById("editEffectTimeHidden").value = effectTime;
		document.getElementById("editEffectDateShow").value = effectTime;
		var nowDate = getNowDate();
		if(nowDate > effectTime && document.getElementById("entrustExpireDate").value != ''){
			$(".dis").hide();
			$(".endis").show();
		}else{
			$(".dis").show();
			$(".endis").hide();
		}
	}
	
	function closeWindow(){
		parent.window.reloadPageList();
		jQuery.FrameDialog.closeDialog();
	}
		
	function cancelOperate(){
		document.getElementById("editAu2").style.display = "none";
		document.getElementById("editAu").style.display = "none";
	}
	
	
	$(document).ready(function() {
		
		jQuery.validator.addMethod("compareDate1", function(value, element) {
			var effDate = getEffectTime();
			var expDate = getExpireTime();
				
			return !(effDate > expDate);   
		}, ""); 
		jQuery.validator.addMethod("compareDate2", function(value, element) {
			var effDate = getEditEffectTime();
			var expDate = getEditExpireTime();
				
			return !(effDate > expDate);   
		}, ""); 
		jQuery.validator.addMethod("acctDateRangeEffect", function(value, element) {
			var effDateAll = document.getElementById("effectDateAll").value;
			var effDate = getEffectTime();
			return !(effDateAll > effDate);   
		}, ""); 
		jQuery.validator.addMethod("acctDateRangeExpire", function(value, element) {
			var expDateAll = document.getElementById("expireDateAll").value;
			var expDate = getExpireTime();
			
			return !(expDateAll < expDate);   
		}, "");
		
		jQuery.validator.addMethod("acctDateRangeEditEffect", function(value, element) {
			var entrustEffectDate = document.getElementById("entrustEffectDate").value;
			if(entrustEffectDate == '' ){
				return true;
			}
			var effDateAll = document.getElementById("effectDateAll").value;
			return !(effDateAll > getEditEffectTime());   
		}, ""); 
		jQuery.validator.addMethod("acctDateRangeEditExpire", function(value, element) {
			var entrustEffectDate = document.getElementById("entrustEffectDate").value;
			if(entrustEffectDate == ''){
				return true;
			}
			
			var expDateAll = document.getElementById("expireDateAll").value;
			return !(expDateAll < getEditExpireTime());   
		}, "");
		jQuery.validator.addMethod("entrustTimeVilidate", function(value, element) {
			var entrustEffectDate = document.getElementById("entrustEffectDate").value;
			var entrustExpireDate = document.getElementById("entrustExpireDate").value;
			var expDateAll = document.getElementById("expireDateAll").value;
			var effDateAll = document.getElementById("effectDateAll").value;
			
			if(entrustEffectDate == ''){
				return true;
			}
			var effectHidden = document.getElementById("editEffectTimeHidden").value;
			//后一条 
			if(entrustEffectDate < effectHidden){
				return !(entrustEffectDate > getEditEffectTime());
			}else if(entrustEffectDate > effectHidden){
				var expDate = getEditExpireTime();
				return !(entrustExpireDate < expDate);
			}
			
			return true;   
		}, ""); 
	});	
	
	$('#authorForm1').validate({
		submitHandler: function(form) {
			jQuery(form).ajaxSubmit({
				beforeSubmit : function(){
					$('#authorButton1').attr("disabled","disabled");
				},
			 	success:    function(responseText) { 
					var obj = eval(responseText);
					showModalMessage(obj.opResult);
					refresh();
					cancelOperate();
					$('#authorButton1').removeAttr("disabled");
		    	} 
			});
		},
   		//debug:true, // 打开debug模式，不会真实提交，适合测试
    	rules: {
	       "uapAcctAuthor.useMainAcctId": {
	        	required: true,
	       		remote: "${ctx}/jsp/common/acctauthor!mainAcctIdIsInuse.action?resAcctId=${resAcctId}&resKind=${resKind}&entrustFlag=0"
	       },
	       effectTimeHidden: {
	       		required: true,
	       		acctDateRangeEffect: true
	       },
	       expireDate: {
	       		required: true,
	       		compareDate1: true,
	       		acctDateRangeExpire: true
	       }
    	},

		messages: {
			"uapAcctAuthor.useMainAcctId": {
				required: "<span style='color:red'><s:text name='author.tips.pleasechoose'></s:text></span>",
				remote: "<s:text name='author.tips.cannotentrusttoown'></s:text>"
			},
	       	effectTimeHidden: {
	       		required: "<span style='color:red'><s:text name='author.tips.pleaseinputeffect'></s:text></span>",
	       		acctDateRangeEffect: "<s:text name='author.tips.entrusttimeerror'></s:text>"
	       	},
	       	expireDate: {
	       		required: "<span style='color:red'><s:text name='author.tips.pleaseinputexpire'></s:text></span>",
	       		compareDate1: "<s:text name='author.tips.excannotbeforeef'></s:text>",
	       		acctDateRangeExpire: "<s:text name='author.tips.entrusttimeerror'></s:text>"
	       	}
		}
   	});
   	
   	$('#authorForm2').validate({
		submitHandler: function(form) {
			jQuery(form).ajaxSubmit({
				beforeSubmit : function(){
				
					var effDate = $("#editEffectDate").val();
					var expDate = $("#editExpireDate").val();
					var editEffectDateType = $("input[type=radio][name='editEffectDateType'][checked]").val();
				    var mainAcctId="${uapAcctAuthor.ownMainAcctId}";
					
					var result = jQuery.ajax({
					      	  url:"${ctx}/jsp/common/acctauthor!checkAuthorTime.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}&effectDate=" + effDate+"&expireDate="+expDate+"&editEffectDateType="+editEffectDateType,
					          async:false,
					          dataType:"text"
						      }).responseText;
					if(result=="false"){
							showModalMessage("<s:text name='requesterror.tip'/>");
							$('#submitauthor').removeAttr("disabled");
							return false;
						}
					if(result != 'true' && result != 'false'){
						var arr = new Array();
						arr = result.split("@");
						showModalMessage("<s:text name='author.effectexpiretime'/>("+effDate+" <s:text name='to'/> "+expDate+")<s:text name='must.between.acct.effectexpire.time'/>("+arr[0]+" <s:text name='to'/>  "+arr[1]+")<s:text name='between'/>");
						$('#submitauthor').removeAttr("disabled");
						return false;
					}
						
						var result1 = jQuery.ajax({
					      	  url:"${ctx}/jsp/common/acctauthor!checkMainAcct.action?effectDate="+effDate+"&expireDate="+expDate+"&mainAcctId=${uapAcctAuthor.ownMainAcctId}"+"&editEffectDateType="+editEffectDateType,
					          async:false,
					          dataType:"text"
						      }).responseText;
						if(result1=="false"){
							showModalMessage("<s:text name='requesterror.tip'/>");
							$('#submitauthor').removeAttr("disabled");
							return false;
						}
						if(result1 != 'true' && result1 != 'false'){
							var arr = new Array();
							arr = result.split("@");
							showModalMessage("<s:text name='author.effectexpiretime'/>("+effDate+" <s:text name='to'/> "+expDate+")<s:text name='must.between.acct.effectexpire.time'/>("+arr[0]+" <s:text name='to'/>  "+arr[1]+")<s:text name='between'/>");
							$('#submitauthor').removeAttr("disabled");
							return false;
						}      
				
					$('#authorButton1').attr("disabled","disabled");
				},
			 	success:    function(responseText) { 
					var obj = eval(responseText);
					showModalMessage(obj.opResult);
					$("#tdEffectTime").html(obj.effectDate);
					$("#tdExpireTime").html(obj.expireDate);
					document.getElementById("effectDateAll").value = obj.effectDate;
					document.getElementById("expireDateAll").value = obj.expireDate;
					$("#tdAuthorStatus").html(obj.authorStatus);
					refresh();
					cancelOperate();
					$('#authorButton1').removeAttr("disabled");
		    	} 
			});
		},
   		//debug:true, // 打开debug模式，不会真实提交，适合测试
    	rules: {
	       editEffectTimeHidden: {
	       		required: true,
	       		acctDateRangeEditEffect: true,
	       		entrustTimeVilidate : true
	       },
	       editExpireDate: {
	       		required: true,
	       		acctDateRangeEditExpire: true,
	       		compareDate2: true,
	       		entrustTimeVilidate : true
	       }
    	},

		messages: {
	       	editEffectTimeHidden: {
	       		required: "<span style='color:red'><s:text name='author.tips.pleaseinputeffect'></s:text></span>",
	       		acctDateRangeEditEffect: "<s:text name='author.tips.entrusttimeerror'></s:text>",
	       		entrustTimeVilidate : "<s:text name='author.tips.efcannotbeforeen'></s:text>"
	       	},
	       	editExpireDate: {
	       		required: "<span style='color:red'><s:text name='author.tips.pleaseinputexpire'></s:text></span>",
	       		acctDateRangeEditExpire: "<s:text name='author.tips.entrusttimeerror'></s:text>",
	       		compareDate2: "<s:text name='author.tips.excannotbeforeef'></s:text>",
	       		entrustTimeVilidate : "<s:text name='author.tips.excannotafteren'></s:text>"
	       	}
		}
   	});
   
   		function getNowDate(){
   			var nowDate = jQuery.ajax({
		          url:"${ctx}/jsp/mainacct/mainacct!getNowDate.action" ,
		          async:false,
		          dataType:"text"
		        }).responseText;
		    
		    return nowDate;
   		}
   
		function getEffectTime() {
			var eff1 = $("#effectDateSetting1").is(":checked");
			var eff2 = $("#effectDateSetting2").is(":checked");
			var effDate;
			
			if(eff1 == true) {
				effDate = getNowDate();
			}
			if(eff2 == true) {
				effDate = $("#effectDate").val();
			}
			return effDate;		
		}
		
		function getExpireTime() {
			var expDate;
	
			expDate = $("#expireDate").val();					
			
			return expDate;
		}
		
		function getEditEffectTime() {
			var eff1 = $("#editEffectDateSetting1").is(":checked");
			var eff2 = $("#editEffectDateSetting2").is(":checked");
			
			var effDate;
			if(eff1 == true) {
				effDate = getNowDate();
			}
			if(eff2 == true) {
				effDate = $("#editEffectDate").val();
			}
			return effDate;		
		}
		
		function getEditExpireTime() {
			var expDate;
	
			expDate = $("#editExpireDate").val();					
			
			return expDate;
		}
</script>
  </body>
</html>
