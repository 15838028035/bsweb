<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<script type="text/javascript">

	$(function (){
	
		jQuery("#detaillist").jqGrid({
			url:"",
			datatype: 'json',
			mtype: 'POST',
			colNames:${colNames},
			colModel:${colModel},
			sortable: true,
			rowNum:1000,
			prmNames:{rows:"objectPage.pageSize",page:"objectPage.pageNumber",total:"objectPage.totalPages"},     
			jsonReader: {
				root: "rows",
				repeatitems : false,
				id:"0"        		    
				},
			viewrecords: true,
			width: windowWidth * 0.7,
			height: "200",
			hidegrid: false, 
			loadtext: '<s:text name="common.tips.loading" />',
			scrollrows: true,
			multiselect:true,
			altRows:true,
			altclass:'altclass'
		}); 
		
		var json = '${jsonDate}';
		if(json != null && json != ''){
			var resultData = eval('(' + json + ')');
			jQuery("#detaillist").jqGrid('addRowData','${appKeyColumn}', resultData);
		}
		
		$("#saveOperate").click(function(){
			$("#removeUnAvailable").click();
			var mainAuthorIds = $("#list").jqGrid('getDataIDs').toString();
			if(mainAuthorIds == null || mainAuthorIds == ''){
				showModalMessage($("#mainAuthorDesc").html()+"<s:text name='batchoperate.notNullNeedAdd'/>","$('#inputText')[0].focus()");
				return;
			}
			var beAuthorIds = $("#detaillist").jqGrid('getDataIDs').toString();
			if(beAuthorIds == null || beAuthorIds == ''){
				showModalMessage($("#authorTypes").find('option:selected').text()+"<s:text name='batchoperate.notNullNeedAdd'/>");
				return;
			}
			var isCopy = ($("#operate").val() == "COPY");
			if(isCopy){
				initRadio();
				initCheckBox();
				initMultiCheckBox();
				var notNullValidateResult = notNullValidate();
				if(notNullValidateResult != true){
					return;
				}
			}
			$(".beTypeOperateButton").prop("disabled",true);
			var url ;
			if(isCopy){
				url = "${ctx}/jsp/app/appauthor/rel/commonappauthorrel!save.action";
			}else{
				url = "${ctx}/jsp/app/appauthor/rel/commonappauthorrel!delete.action";
			}
			var  result =  jQuery.ajax({
	          url:url+"?id="+new Date(),
	          data:{
	            ${extPostString}
				"appCode":"${appCode}",
				"mainAuthorType":"${mainAuthorTypeName}",
				"grantAppKey":$("#list").jqGrid('getDataIDs').toString(),
				"optype":$("#authorTypes").val(),
				"adminAcctSeq":"${adminAcctSeq}",
				"ids":$("#detaillist").jqGrid('getDataIDs').toString()
	          },
	          type:"post",
	          async:false,
	          dataType:"json"
	        }).responseText;
	        $(".beTypeOperateButton").prop("disabled",false);
	        if(result == "true"){
	        	showModalMessage('<s:text name="appentity.optionSucc"/>');
	        }else{
	        	showModalMessage('<s:text name="appentity.optionFail"/>'+result);
	        }
		})
		
	})
</script>
<c:if test="${operate == 'COPY' && !empty appAuthorRelExtList}">
<div id="relExtList">
	<input type="hidden" id="multicheckboxlist" />
	<input type="hidden" id="checkboxlist" />
	<input type="hidden" id="radiolist" />
	<input type="hidden" id="notNullList" />
	<fieldset width="100%">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
					<div style="clear: both">
						<c:forEach var="appAuthorRelExt"
							items="${appAuthorRelExtList}" varStatus="status">
							<div style="float: left;">
								<c:if test="${appAuthorRelExt.dataType !='2'}">
									${appAuthorRelExt.columnDesc}:
									<strong> <font color="red">${appAuthorRelExt.isNull
											== 'N' ? '*' : '' }</font> </strong>
								</c:if>
								<c:choose>
									<c:when test="${appAuthorRelExt.dataType =='4'}">
										<input type="text" id="relExt_${appAuthorRelExt.columnName }"
											name="relExt_${appAuthorRelExt.columnName }" />
									</c:when>
									<c:when test="${appAuthorRelExt.dataType =='6'}">
										<input type="text" id="relExt_${appAuthorRelExt.columnName }"
											name="relExt_${appAuthorRelExt.columnName }" class="Wdate"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}'})" />
									</c:when>
									<c:when test="${appAuthorRelExt.dataType =='7'}">
										<textarea id="relExt_${appAuthorRelExt.columnName }"
											name="relExt_${appAuthorRelExt.columnName }" cols="30" rows="2">${appAuthorRelExt.value }</textarea>
									</c:when> 
									<c:when test="${appAuthorRelExt.dataType =='5'}">
										<select id="relExt_${appAuthorRelExt.columnName }"
											name="relExt_${appAuthorRelExt.columnName }">
											<c:forEach var="data"
												items="${appAuthorRelExt.datalist}">
												<option value="${data.dataCode }" ${appAuthorRelExt.value== data.dataCode ? 'selected' : ''}>
													${data.dataDesc }
												</option>
											</c:forEach>
										</select>
									</c:when>
									<c:when test="${appAuthorRelExt.dataType =='3'}">
										<script>
											addMultiCheckBox("relExt_${appAuthorRelExt.columnName }");
										</script>
										<input type="hidden"
											id="relExt_${appAuthorRelExt.columnName }" />
										<c:forEach var="data"
											items="${appAuthorRelExt.datalist}">
											<input type="checkbox"
												name="relExt_${appAuthorRelExt.columnName }"
												value="${data.dataCode }" 
												${appAuthorRelExt.value== data.dataCode ? 'checked' : ''} /> ${data.dataDesc }
										</c:forEach>
									</c:when>
									<c:when test="${appAuthorRelExt.dataType =='1'}">
										<script>
											addRadio("relExt_${appAuthorRelExt.columnName }");
										</script>
										<input type="hidden"
											id="relExt_${appAuthorRelExt.columnName }" />
										<c:forEach var="data"
											items="${appAuthorRelExt.datalist}">
											<input type="radio"
												name="relExt_${appAuthorRelExt.columnName }"
												value="${data.dataCode }" 
												${appAuthorRelExt.value== data.dataCode ? 'checked' : ''} /> ${data.dataDesc }
										</c:forEach>
									</c:when>
									<c:when test="${appAuthorRelExt.dataType =='8'}">
										<input type="hidden" id="relExt_${appAuthorRelExt.columnName }"
											name="relExt_${appAuthorRelExt.columnName }"
											value="${appAuthorRelExt.value }" />
										<input type="text" readonly
											id="relExt_${appAuthorRelExt.columnName }_DESC"
											name="relExt_${appAuthorRelExt.columnName }_DESC"
											value="${appAuthorRelExt.descValue }"
											onclick="openSelectDialog('relExt_${appAuthorRelExt.columnName }','${appAuthorRelExt.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');" />
										<img src="${ctx }/images/icon2_030.gif"
											id="relExt_${appAuthorRelExt.columnName }_DESC_IMG"
											class="CA_4A_select cursor_pointer"
											onclick="openSelectDialog('relExt_${appAuthorRelExt.columnName }','${appAuthorRelExt.selectTypeName }','${ctx }','${appCode }','${appId }','${loginOrgId }','${realAppId }','${adminAcctSeq }');"
											style='padding: 2px 3px; cursor: pointer;' />
									</c:when>
									<c:when test="${appAuthorRelExt.dataType =='2'}">
										<script>
											addCheckBox("relExt_${appAuthorRelExt.columnName }");
										</script>
										<input type="hidden"
											id="relExt_${appAuthorRelExt.columnName }"
											name="relExt_${appAuthorRelExt.columnName }" />
										<input type="checkbox"
											id="relExt_${appAuthorRelExt.columnName }_checkbox"
											name="relExt_${appAuthorRelExt.columnName }_checkbox"
											${appAuthorRelExt.value== appAuthorRelExt.checkedValue ? 'checked' : ''} />
											${appAuthorRelExt.columnDesc }
									</c:when>
								</c:choose>
								<script>
									addNotNullList("${appAuthorRelExt.isNull }","relExt_${appAuthorRelExt.columnName }","${appAuthorRelExt.columnDesc }");
								</script>
								&nbsp;&nbsp;&nbsp;
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	</fieldset>
</div>
</c:if>
<table id="detaillist"></table>
