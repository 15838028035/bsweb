<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
    <title></title>
  <%
  	String hostRackGroupId = request.getParameter("hostRackGroupId");
    String hostRackGroupAcctId = request.getParameter("hostRackGroupAcctId");
	String resAcctId=request.getParameter("resAcctId").toString();
	String resKind=request.getParameter("resKind").toString();
	String resEntityId=request.getParameter("resEntityId").toString();
	String adminAcctSeq=request.getParameter("adminAcctSeq")!=null?request.getParameter("adminAcctSeq").toString():"";
	String provCodeEn=request.getParameter("provCodeEn")!=null?request.getParameter("provCodeEn").toString():"";
	request.setAttribute("hostRackGroupId",hostRackGroupId);
	request.setAttribute("hostRackGroupAcctId",hostRackGroupAcctId);
	request.setAttribute("provCodeEn",provCodeEn);
	request.setAttribute("resAcctId",resAcctId);
	request.setAttribute("resKind",resKind);
	request.setAttribute("resEntityId",resEntityId);
	request.setAttribute("adminAcctSeq",adminAcctSeq);
	
	String mainAcctId = request.getParameter("mainAcctId")==null?"":request.getParameter("mainAcctId").toString();
	String mainAcctName = request.getParameter("mainAcctName")==null?"":request.getParameter("mainAcctName").toString();
	String dbType=request.getParameter("dbType")==null?"":request.getParameter("dbType").toString();
	
	//appcode 用于判断是否为HANGBOSS，如果为HANGBASS应用，则不渲染样式。
	String appCode  = request.getParameter("appCode")==null?"":request.getParameter("appCode").toString();
	request.setAttribute("appCode",appCode);
	String acctSeq  = request.getParameter("acctSeq")==null?"":request.getParameter("acctSeq").toString();
	request.setAttribute("acctSeq",acctSeq);
	String appId  = request.getParameter("appId")==null?"":request.getParameter("appId").toString();
	request.setAttribute("appId",appId);
 %>
 <%if(adminAcctSeq!=null&&!adminAcctSeq.equals("")){%>
  		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
 <%} %>
 	<style>
		.altclass{background: #E5EFFD;}
	</style>
  <script type="text/javascript">
		
        jQuery(document).ready(function(){ 
        	if("${adminAcctSeq}"!="" && "${appCode}"!="HANGBASS"){//应用是iframe嵌套该页面 需要自身渲染按钮效果 系统资源也渲染会导致按钮丢失？
				contralEffect.contain();
				contralEffect.tablelist();
				contralEffect.blueButton();		
        	}
        	var width = document.body.offsetWidth*0.92 ;
			jQuery("#list").jqGrid({
				url:'${ctx}/jsp/common/rackgroupacctauthor.action?hostRackGroupId=${hostRackGroupId}&resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}',
				datatype: 'json',
				mtype: 'POST',
				colNames:['ID','ownID','<s:text name="author.tips.ownloginname"></s:text>',
				'<s:text name="author.tips.ownpersonname"></s:text>',
				'<s:text name="author.tips.authorstatus"></s:text>',
				'<s:text name="common.tips.effecttime"></s:text>',
				'<s:text name="common.tips.expiretime"></s:text>'],
				colModel:[
					 {name:'authorId',index:'authorId',hidden:true},
					 {name:'ownMainAcctId',index:'ownMainAcctId',hidden:true},
					 {name:'ownMainAcctName',index:'ownMainAcctName',align:'center', width:100,editable:true},
					 {name:'ownAcctPersonName',index:'ownAcctPersonName',align:'center', width:110,editable:true},
					 {name:'authorStatus',index:'authorStatus',align:'center', width:140,editable:true},
					 {name:'authorEffectTime',index:'authorEffectTime',align:'center', width:200,editable:true},
					 {name:'authorExpireTime',index:'authorExpireTime',align:'center', width:200,editable:true}
					 ],
				sortable: true,
				rowNum: 50,
				rowList:[50,100,200],
				multiselect: true, 
				pager: '#pager',
				prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
				jsonReader: {     
					root: "rows",   
					repeatitems : false,
					id:"0"        		    
					},
				sortname: 'ownMainAcctId',
				sortorder: 'asc',
				viewrecords: true,
				gridComplete:function(){
					var listLength = $("#list").getDataIDs().length;
					if(resType=="2"||resType=="3")
					{
						if(listLength==0)
						{
							$("#ssoSpan").hide();
							
						}
						else
						{
							$("#ssoSpan").show();
						}
					}
					var isPublic=document.getElementById("isPublic").value;
					if((isPublic == '0'||isPublic=="null") && listLength > 0){
						document.getElementById("addAuthor").disabled = true;
					}else{
						document.getElementById("addAuthor").disabled = false;
					}
					
				},
				caption: '<s:text name="author.tips.authorlist"></s:text>',
				height: '100%',
				width: width,
				hidegrid: false,
				altRows:true,
				altclass:'altclass',
				loadtext: '<s:text name="common.tips.loading"></s:text>',
				scrollrows: true
			}); 
			
		});
		
		$(function() {
			
			//日期控件
			$("#effectDate,#expireDate").addClass("Wdate");

			$("#effectDate,#expireDate").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d'});
			});		
			
			$("#effectDateSetting1").click(function() {
				$("#effectDate").attr("disabled","disabled");
				$("#effectDate").val("");
				$("#effectDateSetting2").next().hide();
				$("#effectDate").next().hide();
			 })
			$("#effectDateSetting2").click(function() {
				$("#effectDate").removeAttr("disabled");
				$("#effectDateSetting2").next().show();
			 })
			$("#expireDateSetting1").click(function() {
				$("#expireDate").attr("disabled","disabled");
				$("#expireDate").val("");
				$("#expireDateSetting2").next().hide();
				$("#expireDate").next().hide();
			 })
			$("#expireDateSetting2").click(function() {
				$("#expireDate").removeAttr("disabled");
				$("#expireDateSetting2").next().show();
			 });
		});
		function removeworkNoNotice(){
		  $("#workNoNotice").html(" ");
		}
  </script>
</head>
  <body>
  		<div class="padd10">
			<!--start  contain容器-->
			<div class="contain">
			<div class="contain_wrap">
											<div class="contain_search">
	<table align="center">
		<tr>
			<td align="right" width="100"><s:text name="common.restype"></s:text>:</td>
			<td id="resKindName1" align="left" width="120"></td>
			<td align="right" width="100"><s:text name="common.subacctname"></s:text>:</td>
			<td id="acctName1" align="left" width="120"></td>
		</tr>
		<tr>
			<td align="right" width="100"><s:text name="common.hostIps"></s:text>:</td>
			<td id="hostIps" align="left" width="220"></td>
			<td align="right" width="80"></td>
			<td align="left" width="200"></td>
		</tr>
	</table>
	
	<table id="list">
	</table>
	<div id="pager"></div>
	<table align="center">
		<tr>
			<td><div class=" marg_lef10 float_lef"><input type="button" id="addAuthor" class="window_button_centerInput window_button_centerInput1" value="<s:text name='author.tips.addauthor'></s:text>" onclick="addAuthor();"/></div></td>
			<td><div class=" marg_lef10 float_lef"><input type="button" id="revokeAuthor" class="window_button_centerInput window_button_centerInput1" value="<s:text name='author.tips.revokeauthor'></s:text>" onclick="revokeAllAuthor();"/></div></td>
		</tr>
	</table>
	<input type="hidden" name="ownMainAcctIds" id="ownMainAcctIds"/>
	<div id="reovekAcctautherDaliog">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td align="right" class="font_wei">
					<s:text name='work.no'/>
				</td>
					<td align="left">
								<input type="text" style="width: 160px"
								name="workNo" id="workNoReovek" onfocus="removeworkNoNotice()"/>
					</td>
				</tr>
				<tr>
				 <td colspan="2"><label id="workNoNotice"></label></td>
				</tr>
				<tr style="padding-top:20px;">
					<td colspan="2" style="color:red;">
						<s:text name='author.tips.confirmrevoke'></s:text>
					</td>
				</tr>
			</table>
	</div>
<div id="addAu" style="display: none;">
  	<form action="${ctx }/jsp/common/rackgroupacctauthor!save.action" id="authorForm" name="authorForm" method="post">
  	<input type="hidden" name="resKind" value="${resKind }" />
  	<input type="hidden" name="resEntityId" value="${resEntityId }" />
  	<input type="hidden" name="resAcctId" value="${resAcctId }" />
  	<input type="hidden" name="adminAcctSeq" value="${adminAcctSeq}" />
  	<input type="hidden" id="acctTypeResult" value='0'/>
  	<input type="hidden" id="isPublic" value="" />
  	<input type="hidden" id="acctType" name="acctType" value=""/>
  	<input type="hidden" id="flag" value=""/>
  	<input type="hidden" id="dbType" name="dbType" value="${dbType}"/>
  	<input type="hidden" id="acctSeq" name="acctSeq" value="${acctSeq}"/>
  	<input type="hidden" id="appCode" name="appCode" value="${appCode}"/>
  	<input type="hidden" id="appId" name="appId" value="${appId}"/>
	<input type="hidden" id="hostRackGroupId" name="hostRackGroupId" value="${hostRackGroupId}"/>
	<input type="hidden" id="hostRackGroupAcctId" name="hostRackGroupAcctId" value="${hostRackGroupAcctId}"/>
	
	<table>
		<tr>
			<td width="15">&nbsp;</td>
			<td width="90" align="right"><s:text name="common.restype"></s:text>:</td>
			<td id="resKindName" width="500" align="left"></td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td width="90" align="right"><s:text name="common.resname"></s:text>:</td>
			<td id="resEntityName" width="500" align="left"></td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td width="90" align="right"><s:text name="common.subacctname"></s:text>:</td>
			<td id="acctName" width="500" align="left"></td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td width="90" align="right"><s:text name="mainacct.mainacct"></s:text>:</td>
			<td width="500" align="left">
			<% if(mainAcctId!=null && !"".equals(mainAcctId)){%>
				<input type="text" id="mainAcctName" readonly="readonly" />				
				<input type="hidden" id="mainAcctId" name="uapAcctAuthor.ownMainAcctId" value="<%=mainAcctId %>" />
			 <%}else{ %>
			 	<input type="text" id="mainAcctName" readonly="readonly" />
				<img src="${ctx}/images/User.png" class="CA_4A_select cursor_pointer" onclick="mainAcctSelect();" style='padding:2px 3px; cursor:pointer;' />
				<input type="hidden" id="mainAcctId" name="uapAcctAuthor.ownMainAcctId" />
			 
			  <%} %>
				
			</td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td  width="90" align="right"><s:text name='authorise.reason'/>:</td>
			<td><input type="text" id="authorDesc" name="uapAcctAuthor.authorDesc" maxLength=21 value="${authorDesc}"/></td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td  width="90" align="right"><s:text name='work.no'/>:</td>
			<td><input type="text" id="authorWorkNo"" name="uapAcctAuthor.workNo" maxLength='32' /></td>
		</tr>
		<tr id="isSsoShow">
			<td width="15">&nbsp;</td>
			<td width="90" align="right"></td>
			<td width="500" align="left">
				<input type="checkbox" id="isSsoCheckBox"}/><s:text name="common.acctupdate.isSso"></s:text>
				<input type="hidden" name="isSsoValue" id="isSsoValue"/>
			</td>
		</tr>
		<tr id="updatepwdways">
			<td width="15">&nbsp;</td>
			<td width="100" align="right"><s:text name="common.acctupdate.ways"/>:</td>
            <td width="740" align="left">
            	<span id="updatepwdway1">
            		<input type="radio" id="updatePwdWay1" value="0" name="updatePwdWay" checked /><s:text name="common.acctupdate.way1"/>
				</span>
				<span id="updatepwdway2">
            		<input type="radio" id="updatePwdWay2" value="1" name="updatePwdWay"/><s:text name="common.acctupdate.way2"/>
				</span>
				<span id="updatepwdway3">
            		<input type="radio" id="updatePwdWay3" value="2" name="updatePwdWay"/><s:text name="common.acctupdate.way3"/>
				</span>
			</td>
		</tr>
		<tr id="updatepwdwaytips">
			<td width="15">&nbsp;</td>
			<td width="100" align="right"></td>
            <td width="740" align="left">
            	<span id="way1tip">
            		(<s:text name="common.acctupdate.way1.tip"/>)
				</span>
				<span id="way2tip">
            		(<s:text name="common.acctupdate.way2.tip"/>)
				</span>
				<span id="way3tip">
            		(<s:text name="common.acctupdate.way3.tip"/>)
				</span>
			</td>
		</tr>
		<tr id="testPwd">
			<td width="15">&nbsp;</td>
			<td width="100" align="right"><s:text name="common.acctupdate.pwdInput"/>:</td>
            <td width="740" align="left">
            	<table>
					<tr>
						<td id="acctpwdTd" width="200">
							<input style="width:125px" class="input_text"  type="password" id="acctpasswd" name="acctpasswd"/>
							<span id="errMsg"></span>
							<input type="hidden" id="acctPasswd" name="acctPasswd" />
						</td>
						<td align="left" class="font_wei" id="testButton">
							<div class="" id="TestHostConnectDiv">
								<input type="button" id="TestHostConnectButton"
									class="window_button_centerInput window_button_centerInput1"
									value="<s:text name="common.connect"></s:text>" onclick="testConnect('0')" />
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;<font color="red" id="testConnectMsg"><s:text name="testConnectMsg.notConnect"/></font>
								<!-- 记录测试连接的结果，"0"为没有进行测试,"1"为通过,2为不通过 -->
								<input type="hidden" id="testConnectStatus" name="testConnectStatus" value="0"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td width="90" align="right"><s:text name="common.tips.effecttime"></s:text>:</td>
			<td width="800" align="left">
            	<input type="radio" id="effectDateSetting1" value="1" name="effectDateType" checked /><s:text name="common.tips.effectnow"></s:text>
                <input type="radio" id="effectDateSetting2" value="2" name="effectDateType" /><s:text name="common.tips.effectby"></s:text>
                <input type="text" id="effectDate" name="effectDate" disabled value="<s:date name='uapAcctAuthor.authorEffectTime' format='yyyy-MM-dd hh:mm:ss' />" />
                <input type="hidden" id="effectTimeHidden" name="uapAcctAuthor.authorEffectTime" value="<s:date name='uapAcctAuthor.authorEffectTime' format='yyyy-MM-dd hh:mm:ss' />"/>
			</td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td width="90" align="right"><s:text name="common.tips.expiretime"></s:text>:</td>
			<td width="800" align="left">
            	<input type="radio" name="expireDateType" id="expireDateSetting1" value="1" checked/><s:text name="common.tips.effecttime"></s:text>
                <select id="expireDateScale" name="expireDateScale">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9" selected>9</option>
                <option value="10">10</option>
                </select><s:text name="common.tips.yearslater"></s:text>
                <input type="radio" value="2" name="expireDateType" id="expireDateSetting2"/><s:text name="common.tips.effectby"></s:text>
                <input type="text" id="expireDate" name="expireDate" disabled value="<s:date name='authorExpireTime' format='yyyy-MM-dd hh:mm:ss' />"/>
                
                <input type="hidden" id="expireTimeHidden" name="uapAcctAuthor.authorExpireTime" value="<s:date name='uapAcctAuthor.authorExpireTime' format='yyyy-MM-dd hh:mm:ss' />"/>
			</td>
		</tr>
		
		<tr>
			<td width="15">&nbsp;</td>
			<td width="90" align="right">
				<div class=" marg_lef10 float_rig"><input type="button" class="window_button_centerInput window_button_centerInput1" id="submitauthor" value="<s:text name='common.options.save'></s:text>"/></div>
			</td>
			<td width="500" align="left">
				<div class=" marg_lef10 float_lef"><input type="button" class="window_button_centerInput window_button_centerInput1" value="<s:text name='common.options.cancel'></s:text>" onclick="cancelOperate();"/></div>
			
				&nbsp;&nbsp;&nbsp;&nbsp;<font color="red" ><s:text name="rackgroupAcctAuthor.save"/></font>
			</td>
		</tr>
	</table>
	</form>
</div>

</div>
					</div>
				<!--end contain_wrap-->
			</div>
			<!--end contain-->
		</div>
		<!--end padding10-->
  </body>
  	
<script type="text/javascript"   defer >

	var acctType="";
	var isSso="";
	var password="";
	/*****************************************************************************************************/
	var pwdrequest=false;
 	var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/common/rackgroupacctauthor!commonShow.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}&hostRackGroupId=${hostRackGroupId}&hostRackGroupAcctId=${hostRackGroupAcctId}",
		          async:false,
		          dataType:"json"
			      }).responseText;
	var obj = eval("("+result+")");
	document.getElementById("resKindName").innerText = obj.resKindName;
	document.getElementById("resEntityName").innerText = obj.resEntityName;
	document.getElementById("acctName").innerText = obj.acctName;
	document.getElementById("resKindName1").innerText = obj.resKindName;
	document.getElementById("hostIps").innerText = obj.hostIps;
	//document.getElementById("resEntityName1").innerText = obj.resEntityName;
	document.getElementById("acctName1").innerText = obj.acctName;
	document.getElementById("isPublic").value = obj.isPublic;
	document.getElementById("acctpasswd").value = obj.acctPasswd;
	
	password=obj.acctPasswd;
	acctType=obj.acctType;
	$("#acctType").val(acctType);
	isSso=obj.isSso;
	/** yinwy添加代码开始***/
	$("#way2tip").hide();
	$("#way3tip").hide();
	/** yinwy添加代码结束***/

	var resType="${resKind}";
	
	//dbType=1 ----DB2
	var dbType="${dbType}";

	
	function addAuthor(){
		$("#authorDesc").val("");
		$("#authorWorkNo").val("");
		$("#testConnectMsg").html('<s:text name="testConnectMsg.notConnect"/>');
		$("#testConnectStatus").val("0");
		if(resType=="1"){
			//如果是应用,则不显示单点登录方式等信息
			$("#isSsoShow").hide();
			$("#updatepwdwaytips").hide();
			$("#updatepwdways").hide();
			$("#testPwd").hide();
			document.getElementById("addAu").style.display = "";
			if(acctType=="00"){//未知帐号，强制选择帐号类型
         		jQuery.FrameDialog.create({
				url: "${ctx}/jsp/app/appacct/commonappacct!getAapplicationAcctType.action?acctId=${resAcctId}&resKind=${resKind}&appId=${resEntityId}", 
				title: '<s:text name="sys.choiceAcctType.openframetitle"/>',
				width: 400,
				height: 300,
				//show: 'slide',
	     		//hide: 'slide',
				buttons: {}
         			}).bind('dialogclose', function(event, ui) {
						 acctType =  jQuery.ajax({
				          url:"${ctx}/jsp/app/appacct/commonappacct!checkAcctType.action?resAcctId=${resAcctId}",
				          async:false,
				          dataType:"text"
				          }).responseText;
				          });
			}
		}else{
			//如果是系统侧
			if(acctType=="00"){//未知帐号，强制选择帐号类型
         		jQuery.FrameDialog.create({
				url: "${ctx}/jsp/sys/allentity/allentity!choiceAcctTypeDisplay.action?acctId=${resAcctId}&resKind=${resKind}", 
				title: '<s:text name="sys.choiceAcctType.openframetitle"/>',
				width: 400,
				height: 300,
				//show: 'slide',
	     		//hide: 'slide',
				buttons: {}
         			}).bind('dialogclose', function(event, ui) {
         				 var acctTypeStatus = jQuery("#acctTypeResult").val();
         				 if(acctTypeStatus=="1"){
						 acctType =  jQuery.ajax({
				          url:"${ctx}/jsp/sys/allentity/allentity!checkAcctType.action?resKind=${resKind}&resAcctId=${resAcctId}",
				          async:false,
				          dataType:"text"
				        }).responseText;
				        //alert("acctType:"+acctType);
				        if(resType=="2"){
				        	$("#acctType").val(acctType);
				        	for (var i = 0; i < document.getElementById("acctType").length; i++) {
						         if (document.getElementById("acctType").options[i].value == acctType) {        
						             document.getElementById("acctType").options[i].selected = true; 
						             if(acctType == "00" || acctType == "02" || acctType == "03"){
										document.getElementById("isDelete").disabled = true;
									 }else{
										document.getElementById("isDelete").disabled = false;
									 }       
						             break;        
						         }        
    							}
				        }else if(resType=="3"){
				        	$("#acctType").val(acctType);
				        	for (var i = 0; i < document.getElementById("acctType2").length; i++) {
						         if (document.getElementById("acctType2").options[i].value == acctType) {        
						             document.getElementById("acctType2").options[i].selected = true;  
						             if(acctType == "02" || acctType == "03"){
										document.getElementById("isDelete2").disabled = true;
									 }else{
										document.getElementById("isDelete2").disabled = false;
									 }         
						             break;        
						         }        
    							}
				        }else if(resType=="4"){
				        	$("#acctType").val(acctType);
				        	for (var i = 0; i < document.getElementById("acctType").length; i++) {
						         if (document.getElementById("acctType").options[i].value == acctType) {        
						             document.getElementById("acctType").options[i].selected = true;  
						             if(acctType=="02"||acctType=="03" || acctType=="05"){
										//帐号类型是未知,程序帐号,管理帐号,则不可删除
										$("#isDeleteCheckBox").attr("disabled","true");
										$("#isDeleteCheckBox").removeAttr("checked");
										document.getElementById("isDelete").value = "0";
									}else {
										$("#isDeleteCheckBox").removeAttr("disabled"); 
									}
						             break;        
						         }        
    							}
				        }else if(resType=="5"){
				        	$("#acctType").val(acctType);
				        	for (var i = 0; i < document.getElementById("acctType").length; i++) {
						         if (document.getElementById("acctType").options[i].value == acctType) {        
						             document.getElementById("acctType").options[i].selected = true;    
						             if(acctType=="02"||acctType=="03" || acctType=="05"){
										//帐号类型是未知,程序帐号,管理帐号,则不可删除
										$("#isDeleteCheckBox").attr("disabled","true");
										$("#isDeleteCheckBox").removeAttr("checked");
										document.getElementById("isDelete").value = "0";
									}else {
										$("#isDeleteCheckBox").removeAttr("disabled"); 
									}    
						             break;        
						         }        
    							}
				        }
         		}
         		//都会执行的代码
				//alert("acctType:"+acctType);
				getAcctType();
				//alert("acctName:"+acctName);
				if(acctName=='root')
				{//根用户则没有推送方式
					$("#updatepwdway2").hide();
					$("#way2tip").hide();
				}
				//alert("dbType:"+dbType);
				if(dbType=="1")
				{//如果dbType是db2数据库
					$("#isSsoShow").hide();
					$("#updatepwdwaytips").hide();
					$("#updatepwdways").hide();
					$("#testPwd").hide();
				}
				//判断密码修改默认选中值
				//显示的选项，则选中第一个。
				document.getElementById("addAu").style.display = "";
				//alert($("#updatepwdway1").is(':visible'));
				if($("#updatepwdway1").is(':visible'))
				{
					$("#updatePwdWay1").attr("checked",'checked'); 
				}
				else
				{
					if($("#updatepwdway2").is(':visible'))
					{
						$("#updatePwdWay2").attr("checked",'checked'); 
					}
					else
					{
						if($("#updatepwdway3").is(':visible'))
						{
							$("#updatePwdWay3").attr("checked",'checked'); 
						}
						else
						{
							$("#isSsoCheckBox").attr("checked",false);
						}
					}
				}
				checkRadio();
				if($("#isSsoCheckBox").attr("checked")==false)
				{
					$("#updatepwdwaytips").hide();
					$("#updatepwdways").hide();
					$("#testPwd").hide();
				}
		  });	
		}
		else
		{
			//alert("acctType:"+acctType);
			getAcctType();
			//alert("acctName:"+acctName);
			if(acctName=='root')
			{//根用户则没有推送方式
				$("#updatepwdway2").remove();
				$("#way2tip").remove();
			}
			//alert("dbType:"+dbType);
			if(dbType=="1")
			{//如果dbType是DB2数据库
				//$("#isSsoShow").show();
				$("#updatepwdwaytips").remove();
				$("#updatepwdways").remove();
				$("#testPwd").remove();
			}
			document.getElementById("addAu").style.display = "";
			//判断密码修改默认选中值,显示的选项，则选中第一个。
			$(":radio[name='updatePwdWay']").eq(0).attr("checked",true)
			checkRadio();
			if($("#isSsoCheckBox").attr("checked")==false)
			{
				$("#updatepwdwaytips").hide();
				$("#updatepwdways").hide();
				$("#testPwd").hide();
			}
			
			/*yinwy新增代码结束*/
			/* 原来代码
			if(acctType=="02"||acctName=='root'||resType=="1"){//是程序帐号
				document.getElementById("updatepwdway2").style.display="none";
			}else {
				document.getElementById("updatepwdway2").style.display="";
			}*/
			
			/* 原来代码
			if(dbType=="1"||isSso=="0"){
				document.getElementById("updatepwdway1").style.display="none";
				document.getElementById("updatepwdway2").style.display="none";
			}*/
		
			}
		}
		$("#TestHostConnectButton").removeAttr("disabled");
		//document.getElementById("mainAcctName").value = "";
		//document.getElementById("mainAcctId").value = "";
		$("#effectDateSetting1").click();
		$("#expireDateSetting1").click();
	}
	
	function getAcctType()
	{
		// 根据acctType得到默认的显示下的
			var SSOvalue = "";
			var way1 = "";
			var way2 = "";
			var way3 = "";
			jQuery.ajax({
	            async: false,
	            url: "${ctx}/jsp/syscfg/accttype/accttypeloginset!query.action?acctType="+acctType,
	            dataType: "json",
	            success: function (data) {
	                var uapAcctTypeLoginSetVO = data.uapAcctTypeLoginSetVO;
					SSOvalue = uapAcctTypeLoginSetVO.isSso;
					way1 = uapAcctTypeLoginSetVO.isRegister;
					way2 = uapAcctTypeLoginSetVO.isPush;
					way3 = uapAcctTypeLoginSetVO.isLogin;
	            },
	            error: function (err) {
	                alert(err);
	            }
	        });
	        //alert("SSOvalue:"+SSOvalue);
	        if(SSOvalue=="0")
	        {
	        	$("#isSsoCheckBox").attr("checked",false);
				$("#isSsoValue").val("0");
	        	$("#updatepwdwaytips").hide();
				$("#updatepwdways").hide();
				$("#testPwd").hide();
	        }
	        else
	        {
	        	$("#isSsoCheckBox").attr("checked",true);
	        	$("#isSsoValue").val("1");
	        	$("#updatepwdwaytips").show();
				$("#updatepwdways").show();
				$("#testPwd").show();
	        }
	        //alert("way1:"+way1);
	        if(way1=="0")
	       	{
				$("#updatepwdway1").remove();
				$("#way1tip").remove();
				$("#testPwd").remove();
			}
			//alert("way2:"+way2);
			if(way2=="0")
	       	{
				$("#updatepwdway2").remove();
				$("#way2tip").remove();
			}
			//alert("way3:"+way3);
			if(way3=="0")
	       	{
				$("#updatepwdway3").remove();
				$("#way3tip").remove();
			}
	}
	function mainAcctSelect(){
		jQuery.FrameDialog
              .create({
                 url: "${ctx}/jsp/mainacct/mainacct-select.jsp?provCodeEn=${provCodeEn}",
                  title: '<s:text name="author.tips.choosemainacct"></s:text>',
                  width: 980,
                  height: 500,
                  buttons: {}
        })
	}
	
	function cancelOperate(){
		document.getElementById("addAu").style.display = "none";
	}
	
	function revokeAllAuthor(){
	
		$("#acctpasswd").val("");
		$("#hostacctpasswd").val("");
		
		$("#TestHostConnectButton").removeAttr("disabled");
		
	    var ids = jQuery("#list").jqGrid('getGridParam','selarrrow');
	    
       	if(ids == ""){
       		showModalMessage("<s:text name='author.tips.choosewhichtorevoke'></s:text>");
       		return;
       	}
       	
	    var ownMainAcctIds = "";
	    for(var i = 0;i < ids.length;i++){
	    	var rowData = jQuery("#list").jqGrid("getRowData", ids[i]);
	    	var resKind  = "${resKind}";
	    	var ownMainAcctId = rowData.ownMainAcctId;
	    	var acctName  = document.getElementById("acctName").innerText;
	    	//var resAcctId  = "${resAcctId}";
	    	//alert("acctName=="+acctName);
	    	if(resKind=='2' && acctName !='root'){
	    		var  hasHostRootAcct =  jQuery.ajax({
		          url:"${ctx}/jsp/sys/host/hostacct!hasHostRootAcct.action?uapAcctAuthor.resKind="+resKind+"&uapAcctAuthor.resEntityId=${resEntityId}&uapAcctAuthor.ownMainAcctId="+ownMainAcctId,
		          async:false,
		          dataType:"json"
		        }).responseText;
		        if(hasHostRootAcct=='true'){
		        	showModalMessage("<s:text name='hostacct.root.exists'></s:text>");
		    		return ;
		        }
		        
	    	}
	    	ownMainAcctIds += rowData.ownMainAcctId + "~";
	    }
	    // 去掉最后的逗号
	    var ownMainAcctIds_length = ownMainAcctIds.length;
	    ownMainAcctIds = ownMainAcctIds.substring(0,ownMainAcctIds_length-1);
	   	//把ids放在隐藏域，在dialog的方法中获取
	   	$("#ownMainAcctIds").val(ownMainAcctIds);
	   	$("#workNoNotice").html(" ");
	   	$('#reovekAcctautherDaliog').dialog("open");
	}
	$('#reovekAcctautherDaliog').dialog({
				autoOpen: false,
				title:"<s:text name='author.tips.revokeauthor'></s:text>",
				modal: true,
				bgiframe:true,
				position:[110, 40],
				width:300,
				height:200, 
				//show: 'slide',
				hide: 'slide',	buttons:{
				"<s:text name="common.options.cancel"></s:text>":function(){
				$("#reovekAcctautherDaliog").dialog("close");
			 },
			 "<s:text name="common.options.ok"></s:text>":function(){
				var workNo = $("#workNoReovek").val();
				var workNoTemp = "";
				workNoTemp = workNo.replace(/(^\s*)|(\s*$)/g,"").replace(/[^\x00-\xff]/g, "xx");
				workNo = workNo.replace(/(^\s*)|(\s*$)/g,"");
				if(workNoTemp.length<=32){
				  var ownMainAcctIds = $("#ownMainAcctIds").val();
				  doRevoke(workNo,ownMainAcctIds);
				  $("#reovekAcctautherDaliog").dialog("close");
				}else{
				  $("#workNoNotice").html("<font color='red'><s:text name='author.tips.workno.length'/></font>");
				}
			 }
		},close:function(){
				 $("#workNoReovek").val("");
			}
			});
	function doRevoke(workNo,ownMainAcctIds){
		var result = jQuery.ajax({
					          url:"${ctx }/jsp/common/rackgroupacctauthor!revokeAllAuthor.action?hostRackGroupId=${hostRackGroupId}&resAcctId=${resAcctId}&resEntityId=${resEntityId}&resKind=${resKind}&ownMainAcctIds=" + ownMainAcctIds+"&workNo="+workNo,
					          async:false,
					          dataType:"json"
					      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			document.getElementById("mainAcctName").value = "";
			document.getElementById("mainAcctId").value = "";
			reloadPageList();
	}
	
	
	function reloadPageList(){
		jQuery("#list").jqGrid('setGridParam',{
				    url:"${ctx}/jsp/common/acctauthor.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}",
				 	 page:1
		 }).trigger("reloadGrid");
	}
	
	function closeFrameReloadGrid(mainacctid,mainacctname){
	  	  $(".dialog").remove();
          $(".bg").remove();
		  $(":text").get(0).focus();
		/**$(".dialog").remove();
		$(".bg").remove();	
		document.getElementById("mainAcctId").value = mainacctid;
		document.getElementById("ownMainAcct").value = mainacctname;*/
	}
	
	//由于updatePwdWay Radio和isSsoCheckBox变换时都用到，所以提取出来
	//作用是根据updatePwdWay Radio选择的值来确定显示
	function checkRadio()
	{
		 var updatePwdWay=$("input[name='updatePwdWay'][type='radio'][checked]").val(); 
        	 if(updatePwdWay=="1"||updatePwdWay=="2"){
        	 	$("#acctpasswd").next().hide();
			 	$("#testPwd").hide();
				if(updatePwdWay=="1")
				{
					$("#way2tip").show();
					$("#way2tip").siblings().hide();
				}
				else
				{
					$("#way3tip").show();
					$("#way3tip").siblings().hide();
				}
			 }else if(updatePwdWay=="0"){
			 	$("#testPwd").show();
			 	$("#way1tip").show();
				$("#way1tip").siblings().hide();
				//alert("oldpwd:"+oldpwd);
				$("#acctpasswd").val(oldpwd);
				$("#acctPasswd").val(oldpwd);
			 	$("#acctpasswd").focus();
			 	//$("#acctpasswd").select();
			 	//alert("pwd"+$("#acctpasswd").val());
			 }
	}
	
	$(document).ready(function() {
		$(":radio[name='updatePwdWay']").click(function() {
        	checkRadio();
        });
        
		$("#isSsoCheckBox").click(function(){
	   		if($(this).attr("checked")==true)
	   		{
				$("#isSsoValue").val("1");
				$("#updatepwdwaytips").show();
				$("#updatepwdways").show();
				checkRadio();
		    }
		    else
		    {
		    	$("#isSsoValue").val("0");
		    	$("#updatepwdwaytips").hide();
				$("#updatepwdways").hide();
				$("#testPwd").hide();
		    }
		});

		//因为只在页面上测试连接，需要记录测试连接的结果，当填写密码的框被写入时需要清空测试连接结果的状态
		$("#acctpasswd").blur(function() {
		var passwd=encodeURIComponent(encodeURIComponent($("#acctpasswd").val()));
		var oldpasswd=$("#acctPasswd").val()
			if(passwd!=oldpasswd)
			{
				$("#testConnectMsg").html('<s:text name="testConnectMsg.notConnect"/>');
				$("#testConnectStatus").val("0");
			}
			$("#acctPasswd").val(passwd);
        });
        var customError = "";
		jQuery.validator.addMethod("compareDate", function(value, element) {
			var returnVal = true;
			var effDate = getAuthorEffectTime();
			var expDate = getAuthorExpireTime();
			if(effDate > expDate){
				customError = "<s:text name='authorise.expiretime'/>("+expDate+")<s:text name='not.lessthan.authorise.effecttime'/>("+effDate+")";
				returnVal = false; 
			}	
			$.validator.messages.compareDate = customError; 
			 return this.optional(element) || returnVal;   
			},customError);
			
		
		jQuery.validator.addMethod("compareAcctDate", function(value, element) {
			var returnVal = true;
			var effDate = getAuthorEffectTime();
			var expDate = getAuthorExpireTime();
			var result = jQuery.ajax({
	      	  url:"${ctx}/jsp/common/acctauthor!checkAuthorTime.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}&effectDate=" + effDate+"&expireDate="+expDate,
	          async:false,
	          dataType:"text"
		      }).responseText;
			if(result == 'false'){
				customError = "<s:text name='requesterror.tip'/>";
				returnVal = false; 
			}	
			if(result != 'true' && result != 'false'){
				var arr = new Array();
				arr = result.split("@");
				customError = "<s:text name='authorise.effecttime'/>("+effDate+" <s:text name='to'/> "+expDate+")<s:text name='must.between.acct.effectexpire.time'/>("+arr[0]+" <s:text name='to'/>  "+arr[1]+")<s:text name='between'/>";
				returnVal = false;
			}		
			$.validator.messages.compareAcctDate = customError; 
			 return this.optional(element) || returnVal;   
			},customError);
		
		jQuery.validator.addMethod("mainAcctInUse", function(value, element) {
			var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/common/acctauthor!mainAcctIdIsInuse.action?resAcctId=${resAcctId}&resKind=${resKind}&ownMainAcctId=" + value,
		          async:false,
		          dataType:"text"
			      }).responseText;
			if(result == 'true'){
				return true;
			}			
			return false;
		}, ""); 

	});		
	
	$('#submitauthor').click(function(){
		$("#errMsg").remove();
		var acctpasswd=$("#acctpasswd").val();
		var updatePwdWay=$("input[name='updatePwdWay'][type='radio'][checked]").val();
		var isSsoValue=$("#isSsoValue").val();
		
		/**yinwy编写开始*/
		var isSsoValue = $("#isSsoValue").val();
		/**yinwy编写结束*/
		var acctTypeZh = "";
		var tips ="";
		
		
		if(acctType=="01"){
			acctTypeZh = "<s:text name='app.acct.normal'></s:text>";
		}else if(acctType=="02"){
			acctTypeZh = "<s:text name='app.acct.programe'></s:text>";
		}else if(acctType=="05"){
			acctType="<s:text name='self.service.terminal.acct'/>";
		}
		else if(acctType=="03"){
			acctTypeZh = "<s:text name='app.acct.system'></s:text>";
		}else if(acctType=="04"){
			acctTypeZh = "<s:text name='app.acct.adminMng'></s:text>";
		}else {
			acctTypeZh = "<s:text name='app.acct.unknow'></s:text>";
			//未知帐号类型,提示修改
			addAuthor();
			return;
		}

		/**下一行yinwy修改，isSso变为isSsoValue**/
		if(dbType=="1"||isSsoValue=="0"){
				tips = "<s:text name='author.tips.confirmauthor0'></s:text>";
				
				showModalConfirmation(tips,'submitForm();');
				
		}else {
			if(resType=="1"){
				 //获得是否需要修改从帐号密码的配置参数值 hanjc
			    var modifyAppAcctPwdWhenAuthor =  jQuery.ajax({
		          url:"${ctx}/jsp/common/acctauthor!getModifyAppAcctPwdWhenAuthor.action",
		          async:false,
		          dataType:"json"
		        }).responseText;
		        if(modifyAppAcctPwdWhenAuthor == 'n'){
		            tips = "<s:text name='author.tips.confirmauthor1'></s:text>"+acctTypeZh+"<s:text name='author.tips.confirmauthor10'></s:text>";
		            showModalConfirmation(tips,'submitForm();');
				}else{
				  if(acctType=="02" || acctType=="05"){
						tips = "<s:text name='author.tips.confirmauthor1'></s:text>"+acctTypeZh+"<s:text name='author.tips.confirmauthor5'></s:text>";
					}else{
						tips = "<s:text name='author.tips.confirmauthor1'></s:text>"+acctTypeZh+"<s:text name='author.tips.confirmauthor2'></s:text>";
					}
					showModalConfirmation(tips,'submitForm();');
				}
			}else {
				if(updatePwdWay=="0"){//手工注册密码
					if(acctpasswd!=""){
						
						/**yinwy添加开始***/
						var testResult=$("#testConnectStatus").val();//0表示未测试，1表示通过，2表示未通过
						if(testResult=="2"){
							tips = "<s:text name='author.tips.confirmauthor6'/>";
							//alert("3");
							showModalConfirmation(tips,'submitForm();');
						}else if(testResult=="0"){
							tips = "<s:text name='author.tips.confirmauthor7'/>";
							//alert("4");
							showModalConfirmation(tips,'submitForm();');
						}
						else {
							tips = "<s:text name='author.tips.confirmauthor1'></s:text>"+acctTypeZh+"<s:text name='author.tips.confirmauthor3'></s:text>";
							//alert("5");
							showModalConfirmation(tips,'submitForm();');
						}
						/**yinwy添加结束***/
					
					}else {
						tips = "<s:text name='author.tips.confirmauthor9'/>";
							//alert("6");
							showModalConfirmation(tips,'submitForm();');
					}
				
				}else if(updatePwdWay=="1"){//推送方式
					tips = "<s:text name='author.tips.confirmauthor1'></s:text>"+acctTypeZh+"<s:text name='author.tips.confirmauthor4'></s:text>";
						//alert("7");
						showModalConfirmation(tips,'submitForm();');
						/**if(!confirm(tips)){
						return false;
					}*/
				}
				else{//登录方式
					tips = "<s:text name='author.tips.confirmauthor1'></s:text>"+acctTypeZh+"<s:text name='author.tips.confirmauthor8'></s:text>";
						//alert("8");
						showModalConfirmation(tips,'submitForm();');
						/**if(!confirm(tips)){
						return false;
					}*/
				}
			}
		}
	});

   	$('#authorForm').validate({
		submitHandler: function(form) {
			jQuery(form).ajaxSubmit({
				beforeSubmit : function(){
						$("#errMsg").remove();
						var acctpasswd=$("#acctpasswd").val();
						var updatePwdWay=$("input[name='updatePwdWay'][type='radio'][checked]").val();
						/**yinwy修改下面两行**/
						var isSsoValue = $("#isSsoValue").val();
			 			/***yinwy修改下面，取消密码非空验证
						if(updatePwdWay=="0"&&dbType!="1"&&isSsoValue=="1"){//密码注册方式,需要手工填入密码
			 				if(acctpasswd==null||acctpasswd.trim()==""){
			  					$("#acctpwdTd").append($("<span>").attr("id", "errMsg").attr("style", "color:red").append($("<b>").append("<s:text name="passwd.required"></s:text>")));
			   					$("#acctpasswd").focus();
			   					return false;
			  				}
			  			}*/
						$('#submitauthor').attr("disabled","disabled");
						var effDate = getAuthorEffectTime();
						var expDate = getAuthorExpireTime();
						var resKind="${resKind}";
						var acctName  = document.getElementById("acctName").innerText;
						var mainAcctId=$("#mainAcctId").val();
						var result = jQuery.ajax({
				      	  url:"${ctx}/jsp/common/acctauthor!checkAuthorTime.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}&effectDate=" + effDate+"&expireDate="+expDate,
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
							showModalMessage("<s:text name='authorise.effecttime'/>("+effDate+" <s:text name='to'/> "+expDate+")<s:text name='must.between.acct.effectexpire.time'/>("+arr[0]+" <s:text name='to'/>  "+arr[1]+")<s:text name='between'/>");
							$('#submitauthor').removeAttr("disabled");
							return false;
						}
						var result1 = jQuery.ajax({
					      	  url:"${ctx}/jsp/common/acctauthor!checkMainAcct.action?effectDate="+effDate+"&expireDate="+expDate+"&mainAcctId="+mainAcctId,
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
							arr = result1.split("@");
							showModalMessage("<s:text name='authorise.effecttime'/>("+effDate+" <s:text name='to'/> "+expDate+")<s:text name='must.between.acct.effectexpire.time'/>("+arr[0]+" <s:text name='to'/>  "+arr[1]+")<s:text name='between'/>");
							$('#submitauthor').removeAttr("disabled");
							return false;
						}
						if(resType=="1"){
							var result = jQuery.ajax({
					      	  url:"${ctx}/jsp/common/acctauthor!checkAuthor.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}&mainAcctId="+$("#mainAcctId").val(),
					          async:false,
					          dataType:"text"
						      }).responseText;
							if(result=="false"){
								showModalMessage("");
								$('#submitauthor').removeAttr("disabled");
								return false;
							}
						}
				},
			 	success: function(responseText) { 
					var obj = eval(responseText);
					if(obj.opResult.indexOf("|")>-1){//成功信息中包含"|"字符,用作字符串分割标志
						jQuery.FrameDialog.create({
							url: "${ctx}/jsp/common/acctauthor!showAcctAuthorDetail.action?acctAuthorInfo="+encodeURIComponent(encodeURIComponent(obj.opResult)), 
							title: '<s:text name="sys.message.openframetitle"></s:text>',
							width: 480,
							height: 300,
							buttons: {}
       					});
       				if(resType=="2"||resType=="3")
					{
       					if($("#isSsoCheckBox").is(":checked"))
						{
							$("#isSso").attr("checked","true");
						}
						else
						{
							$("#isSso").removeAttr("checked"); 
						}
					}
					}else {
						//alert("obj.opResult"+obj.opResult);
						showModalMessage(obj.opResult);
					}
					reloadPageList();
					cancelOperate();
					if('${mainAcctId}'!=$("#mainAcctId").val()){
						$.getJSON("${ctx}/jsp/mainacct/mainacct!getJsonMainAcct.action?mainAcctId=" + $("#mainAcctId").val(),
						function(data) {
								var userName=data.name;
								var email=data.email;
								var mobile=data.mobile;
								if(userName==null){
									userName ="";
								}
								if(email==null){
									email ="";
								}
								if(mobile==null){
									mobile ="";
								}
								$(parent.document).find("#userName").val(userName);
								$(parent.document).find("#email").val(email);
								$(parent.document).find("#mobile").val(mobile);
							}  
						)
					}
					$('#submitauthor').removeAttr("disabled");
		    	} 
			});
		},
   		//debug:true, // 打开debug模式，不会真实提交，适合测试
    	rules: {
	       "uapAcctAuthor.ownMainAcctId": {
	       		required: true,
	       		mainAcctInUse: true
	       },
	       "uapAcctAuthor.workNo": {
						minlength:2,
						maxlength:32
	       },
	       
	       /**"acctpasswd":{
	       		required:function(){
	       			var acctpasswd=$("#acctpasswd").val();
	       			var updatePwdWay=$("input[name='updatePwdWay'][type='radio'][checked]").val(); 
	       			if(updatePwdWay=="0"){//密码注册方式,需要手工填入密码
	       				if(acctpasswd==null||acctpasswd.trim()==""){
		       				return true;
		       			}else {
		       				return false;
		       			}
	       			}else {
	       				return false;
	       			}
	       		}
	       },*/
	       
	       effectDate :{
	       		required: true
	       },
	       expireDate :{
	       		required: true,
	       		compareDate: true,
	       		compareAcctDate : true
	       }
    	},

		messages: {
	       "uapAcctAuthor.ownMainAcctId": {
	       		required: "<span style='color:red'><s:text name='common.tips.cannotnull'></s:text></span>",
	       		mainAcctInUse: "<s:text name='author.tips.cannotbindagain'></s:text>"
	       },
	       
	       /**"acctpasswd":{
	       		required:"<span style='color:red'><s:text name='passwd.required'></s:text></span>"
	       },*/
	       
	       effectDate :{
	       		required: "<s:text name='common.tips.cannotnull'></s:text>"
	       },
	       expireDate :{
	       		required: "<s:text name='common.tips.cannotnull'></s:text>"
	       }
		}
   	});
   	
		function submitForm() {
		
			var resKind = '${resKind}';
			var resEntityId = '${resEntityId}';
			var resAcctId = '${resAcctId}';
			$('#authorForm').submit();
		}

		function validateAcctTypeAndAuthor(){

			//判断主机群组从帐号的帐号类型是否一致,是否包含授权
			var result =  jQuery.ajax({
          		url:"${ctx}/jsp/rackgroup/host/hostrackgroup!validateAcctTypeAndAuthor.action?hostRackGroupId=${hostRackGroupId}&acctNames=${uapHostAcct.acctName}",
          		async:false,
         		dataType:"text"
        		}).responseText;
			if(result != ""){
				showModalConfirmation(result);
			}
			
		}
		
		function getAuthorEffectTime() {
			var eff1 = $("#effectDateSetting1").is(":checked");
			var eff2 = $("#effectDateSetting2").is(":checked");
			
			var effDate;
			
			if(eff1 == true) {
				effDate = jQuery.ajax({
		          url:"${ctx}/jsp/mainacct/mainacct!getNowDate.action" ,
		          async:false,
		          dataType:"text"
		        }).responseText;
			}
			if(eff2 == true) {
				effDate = $("#effectDate").val();
			}
			return effDate;		
		}
		
		function getAuthorExpireTime() {
			var exp1 = $("#expireDateSetting1").is(":checked");
			var exp2 = $("#expireDateSetting2").is(":checked");
	
			var expDate;
	
			if(exp1 == true) {
				var addScale = $("#expireDateScale").val();
				var effDate = getAuthorEffectTime();
				//var expDate = o2s.dateAdd("y", addScale, effDate);
				//expDate = $.format.date(expDate, "yyyy-MM-dd HH:mm:ss");
				var expDate = jQuery.ajax({
				  url:"${ctx}/jsp/mainacct/mainacct!addDateYear.action?date="+effDate + "&scale=" + addScale,
		          async:false,
		          cache:false,
		          dataType:"text"
		        }).responseText;
				
			}
			if(exp2 == true) {
				expDate = $("#expireDate").val();					
			}
			
			return expDate;
		}
		
		function testConnect(obj){
			$("#acctpasswd").next().hide();
			$("#errMsg").remove();
			var resEntityId="${resEntityId}";
			var acctPwd=$("#acctpasswd").val();
			if(acctPwd==null||acctPwd==""){
				$("#acctpwdTd").append($("<span>").attr("id", "errMsg").attr("style", "color:red").append($("<b>").append("<s:text name="passwd.required"></s:text>")));
		      	$("#acctpasswd").focus();
		      	 return false;
			}
			
			var resAcctId="${resAcctId}";
			var resKind="${resKind}";
			
			$("#TestHostConnectButton").attr("disabled","true");
			var result = jQuery.ajax({
			 	type: "post",
			 	url: "${ctx}/jsp/sys/allentity/allentity!testConnect.action",
			 	data: "resEntityId=" + resEntityId + "&acctPwd=" + encodeURIComponent(encodeURIComponent(acctPwd)) + "&resAcctId=" + resAcctId+"&resKind="+resKind,
			  	dataType: "text",
			  	async:false,
			  	success: function(msg){
			  		if(msg=="true"||msg=="1"){
			  			if(obj=='0'){
			  				//测试连接通过
			  				showModalMessage('<s:text name="oracle.testConnSucess"/>');
			  				$("#testConnectMsg").html('<s:text name="testConnectMsg.connectSuccess"/>');
			  				$("#testConnectStatus").val("1");
			  				
			  			}
			  		}else{
			  			if(obj=='0'){
			  				//测试连接不通过
			  				$("#testConnectMsg").html('<s:text name="testConnectMsg.connectFailed"/>');
			  				$("#testConnectStatus").val("2");
			  				showModalMessage('<s:text name="testConnectMsg.connectFailed"/>');
			  			}
			    			
			  		}
			  		
			    	$("#TestHostConnectButton").removeAttr("disabled"); 
			    }
			 }).responseText;
			 
			 $("#acctpasswd").val(acctPwd);
			 return result;
		}
var oldpwd ="";
		jQuery(document).ready(function(){ 
		oldpwd = jQuery.ajax({
		      	  url:"${ctx}/jsp/common/acctauthor!getPassword.action?resAcctId=${resAcctId}&resKind=${resKind}&resEntityId=${resEntityId}",
		          async:false,
		          dataType:"json"
			      }).responseText;
		//alert("get oldpwd:"+oldpwd);
	});
</script>
</html>
