<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>
<s:set name="policyId" value="#parameters.policyId[0]"/>
<s:set name="operatorId" value="#parameters.operatorId[0]"/>
<s:set name="busiType" value="#parameters.busiType[0]"/>
<s:set name="busiId" value="#parameters.busiId[0]"/>
<s:set name="domain" value="#parameters.domain[0]"/>
<s:set name="belongOrg" value="#parameters.belongOrg[0]"/>
<s:set name="lockstatus" value="#parameters.lockstatus[0]"/>
<s:set name="provCodeEn" value="#parameters.provCodeEn[0]" />
<s:set name="islogin" value="#parameters.islogin[0]" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<script src="${ctx}/scripts/StringBuffer.js"></script>
	<style>
	.altclass{background: #E5EFFD ;}
	#pager_center{width:270px;}
	</style>

	<script type="text/javascript">
		//按组织机构查询
		function queryByOrg() {
			var options = $(parent.parent.window.document).find("#mainAcctMulShow option");
					var result = new StringBuilder();
					$.each(options, function(){
						result.Append(this.value);
					});
					var s = result.join(',');
			 $("#list").jqGrid('setGridParam',{
			     url:"${ctx}/jsp/mainacct/mainacct!listWithout.action",
			     postData:{
			     	"queryVO.belongOrg":$("#belongOrg").val(),
			     	"queryVO.orgId":$("#orgId").val(),
			     	"queryVO.withoutMainAcctIds":s
			     },
			 	 page:1
			 }).trigger("reloadGrid"); 				
		  	return false;
		}		
	
		function refresh() {
		 	$("#list").jqGrid().trigger("reloadGrid");
		}
	
		function clearGridData() {
			$("#list").jqGrid('clearGridData');
		}
		
		//是否第一次进入页面		
		var isInit = true;
		$(function() {
			//渲染页面
			contralEffect.contain();
			contralEffect.tablelist();
			contralEffect.blueButton();	
			//组织机构路径
			orgStatus = function(el, cellval, opts) {
				var orgId = opts.defaultOrg.orgId
				var orgName = opts.defaultOrg.orgName
				var orttitle = "<s:text name='common.org' />";
				var path = "<a style='color:black' href='${ctx}/jsp/syscfg/organization!getOrgPath.action?orgId=" + orgId + "' name='"+orttitle+"' class='jTip' id='" + cellval.rowId + "OrgTip'>" + orgName + "</a>";;
				return path;
			}
			var orgbe= '${belongOrg}';
			if(orgbe==""){
				orgbe=0;
			}
			 
			//主帐号管理列表
			var urltemp  ="${ctx}/jsp/mainacct/mainacct!listWithout.action?queryVO.belongOrg="+orgbe;
			var options = $(parent.parent.window.document).find("#mainAcctMulShow option");
					var result = new StringBuilder();
					$.each(options, function(){
						result.Append(this.value);
					});
					var s = result.join(',');
					
			$("#list").jqGrid({
					
				url : urltemp,
				datatype: 'json',
				mtype: 'POST',
		     	postData:{"queryVO.withoutMainAcctIds":s},
				colNames:['id', '<s:text name="mainacct.mainacct" />', 
							'<s:text name="mainacct.name" />', 
							'<s:text name="common.org" />', 
							'<s:text name="mainacct.mobilenumber" />'
							],
				colModel:[
					 {name:'mainAcctId',index:'mainAcctId', hidden:true},
					 {name:'loginName',index:'loginName', width:'140',align:'center'},
					 {name:'name',index:'name', align:'center',width:'140'},
					 {name:'defaultOrg.orgName',index:'defaultOrg', align:'center', formatter:orgStatus,width:'140'},
					 {name:'mobile',index:'mobile', align:'center',width:'140'}
					 ],
				pager: '#pager',
				sortable: true,
				rowNum: '10',
				rowList:[10,15,20],
				altclass:'altclass',
				altRows:true,
				multiselect: 'true', 
				prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
				jsonReader: {     
					root: "rows",   
					repeatitems : false,
					id:"0"        		    
					},
				gridComplete:function(){
					//初始化tips
					JT_init();
			    	var orgId = '${orgId}'==''?'0':'${orgId}'; 
				},
				viewrecords: true,
				height: '100%',
				hidegrid: false,
				loadtext: "<s:text name='common.tips.loading' />",
				scrollrows: true
			}); 
			 
			//保存按钮
			$("#savescope").click(function(){
				if( ($("#isSelectOrg").prop("disabled")==true || $("#scopetoolbar:visible")[0]==undefined) && ($("#list").jqGrid('getDataIDs'))[0]==undefined){
            		showModalMessage("<s:text name='common.nosaveopts'/>");
            		return ;
            	}
            	var selectedIdFull = $("#list").jqGrid().getGridParam("selarrrow");
            	selectedIdFull += "";
            	var selectedIdArr=selectedIdFull.split(",");
            	for(i=0;i<selectedIdArr.length;i++){
	            	var selectedName = "<option value='"+jQuery("#list").jqGrid("getRowData",selectedIdArr[i]).mainAcctId+"'>"+jQuery("#list").jqGrid("getRowData",selectedIdArr[i]).loginName+"</option>";
            		selectedIdArr[i]=selectedName;
            	}
            	var selectedNameFull=selectedIdArr.join(",");
            	$('#mainAcctMulShow',window.parent.parent.document).append(selectedNameFull);
				parent.parent.closeDialog();
			});

			 	//是否匹配查询组织机构
			$("#isSelectOrgObj").click(function(){
				var orgIdObjValue = $("#belongOrg").val();
				//alert(orgIdObjValue);
				if($("#isSelectOrgObj").prop("checked") == true) {
					 $("#orgIdObj").val(orgIdObjValue);
				}else{
					 $("#orgIdObj").val("");
				}
				
			})
			
			
			 
			//提交查询
			$('#queryForm').submit(function() {
					 var loginName = $("#loginName").val();
					 var name = $("#name").val();
					 var mobile = $("#mobile").val();
					 var lockStatus = $("#lockStatus").val();
					  var orgIdValue =  $("#orgIdObj").val();
					  var orgId="";
					  if($("#isSelectOrgObj").prop("checked")==true)
					  {
					  	orgId=$("#belongOrg").val();
					  }
					//隐藏范围设置
					$("#list").jqGrid('setGridParam',{
					     url:"${ctx}/jsp/mainacct/mainacct!listWithout.action",
					     postData:{"queryVO.loginName":loginName,
					     		   "queryVO.name":name,
					     		   "queryVO.mobile":mobile,
					     		   "queryVO.lockStatus":lockStatus,
					     		   "queryVO.belongOrg":"",
					     		   "queryVO.withoutMainAcctIds":s,
					     		   "queryVO.orgId":orgId
					     },
					 	 page:1
					 }).trigger("reloadGrid"); 		
				 	return false;		
				});		
			$("#loginName").focus();
			$('#scopeform').submit(function() { 
			  	return false;
			});
		});
		
	</script>    
</head>
<body>	
<div class="padd10">
<!--start  contain容器-->
<div class="contain">
<div class="contain_wrap">
    <div class="contain_search">
    	<div class="contain_s_wrap" style="height:50px">
	        <form action="${ctx}/jsp/mainacct/mainacct!listWithout.action" method="post" id="queryForm">    	
    		<input type="hidden" name="belongOrg" id="belongOrg" value="${belongOrg}"/> 	        	
        	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	            <tr>
		            <td  align="right" class="font_wei"><s:text name="mainacct.mainacct"></s:text>:</td>
		            <td align="left"><input type="text"  style="width:160px" name="queryVO.loginName" id="loginName"/></td>
		            <td  align="right" class="font_wei"><s:text name="mainacct.name"></s:text>:</td>
		            <td  align="left"> <input type="text"  style="width:160px" name="queryVO.name" id="name"/></td>
	            </tr>       
	            <tr>
		            <td  align="right" class="font_wei"><s:text name="mainacct.mobilenumber"></s:text>:</td>
		            <td  align="left"  ><input name="queryVO.mobile" style="width:160px" id="mobile"/></td>
		            <td align="right"  class="font_wei"  id="lockStatusTd"><s:text name="mainacct.status"></s:text>:</td>
		            <td  align="left" >
			            <select name="queryVO.lockStatus"  id="lockStatus" style="width:167px" >
				            <option value=""><s:text name="common.all"></s:text> </option>
				            <option value="0"><s:text name="common.status.normal"></s:text></option>
				            <option value="1"><s:text name="common.status.locked"></s:text></option>
			            </select>	            
		            </td>
		            <td align="right" class="font_wei"  >
						<input type="checkbox" name="isSelectOrgObj" id="isSelectOrgObj" />
					</td>
					<td align="left"  >
						<s:text name="mainacct.orgnamecondition"></s:text>
						<!-- <input name="orgName" style="width: 160px" id="orgName" onclick="orgSelect()"/> -->
						<input type="hidden" name="orgIdObj" style="width: 20px" id="orgIdObj"/>
					</td>
		            <td >
			             <div class="">
			            	<input type="submit" class="window_button_centerInput window_button_centerInput1" value="<s:text name="common.options.query"></s:text>" />
			             </div>
		            </td>
	            </tr>
            </table>
            </form>
        </div><!--end contain_s_wrap-->
    </div><!--end contain_search-->
     <div class="toolbar">
    	<div class="toolbar_wrap">
	    	<form id="scopeform" action="${ctx}/jsp/goldbank/goldbankwhite!save.action" method="post" style="height:10px;">
			<div class="float_lef" id="scopetoolbar">
				<input type="hidden" name="appRelationType" id="appRelationType" value="1"/>
	    		<input type="hidden" name="policyId" id="policyId" value="${policyId}"/>
	    		<input type="hidden" name="operatorId" id="operatorId" value="${operatorId}"/>
	    		<input type="hidden" name="orgId" id="orgId" value="${belongOrg}"/>
	    		<input type="hidden" name="personList" id="personList" />
	    		<input type="hidden" name="unSelectPersonList" id="unSelectPersonList"/>
			</div>
			<div class="">
				<input type="button" class="window_button_centerInput window_button_centerInput1" id="savescope" value="<s:text name="common.options.save"></s:text>" />
			</div>
			</form>
        </div>
	</div>
	<!--start grid-->
	<table id="list"></table>
	<div id="pager"></div>
          <!--end grid-->
</div><!--end contain_wrap-->
</div><!--end contain-->
</div>
</body>
</html>