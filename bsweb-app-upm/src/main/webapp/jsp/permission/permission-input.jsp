<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<script language="javascript">
	$(document).ready(function(){
		contralEffect.contain();
		contralEffect.tablelist();
		contralEffect.blueButton();
		
		jQuery.validator.addMethod("specialChar", function(value, element) {      
		 	   vkeyWords=/^[^\|"'<>()@#$%\'\"]*$/;
			   if(!vkeyWords.test(value)){
			   		return false;
			   }else{
			   		return true;
			   }
		 }, '不能包含特殊字符');
		
					 
		$('#inputForm').validate({
	    		
	    		submitHandler:function(form){
				//获取原来的名称
				var oldName = $("#oldName").val(); 
				//根据名称是否存在
				var parentId = $("#parentId").val();
				var name = $("#name").val();
				//若是执行修改操作，先判断修改了菜单名称，如果没有修改，则过滤掉ajax重名验证
				if(oldName!=name){
				$.ajax({
			 	url: "${ctx}/jsp/permission/upmPermissionAction!checkIsExistsPermission.action",
			 	type: "post",
			 	async:false,
			 	data:{
			 		"parentId":parentId,
			 		"name":name
			 	},
			  	success: function(msg){
			    	if("true"==msg){
			    	showModalMessage( '操作失败' +name);
			    	return false;
			    	}else{
			    $("#submitBtn").attr("disabled","disabled");
			    $("#return").attr("disabled","disabled");
			    form.submit();
			    	}
			    }
			 });
				}else{
				 form.submit();
				}
				},
	    		
		    	rules: {
			       "upmPermission.name": {
						required: true,
						specialChar:true,
						minlength:2,
						maxlength:32
			       },
			       "upmPermission.sortNo":{
			       	number:true,
			       	minlength:1,
					maxlength:10
			       },
			       	"upmPermission.remark": {
						maxlength:2000
			       }
		    },
		
			messages: {
		       "uapNetWorkMapArea.areaName": {
		        	required: "<span style='color:red'><s:text name='uap.networkmaparea.name.missMessage' /></span>",
		        	specialChar: "<span style='color:red'><s:text name='uap.networkmaparea.name.specialCharMessage' /></span>"
		       }
	      }
     });
			
	});


</script>
	</head>

	<body>

		<div class="padd10">
			<!--start  contain容器-->
			<div class="contain">
				<div class="contain_wrap">
					<div class="contain_title">
						<div class="contain_t_wrap">
							<div class="float_lef contain_t_text">
								<span class="marg_lef5"><img src="${ctx}/images/next.gif"
										align="absmiddle" /> </span><span class="marg_lef5">权限管理</span>
							</div>
							<!--end contain_t_text-->
							<div class="float_rig contain_t_check">
								<div class="contain_icon"></div>
							</div>
							<!--end contain_t_check-->
							<div class="clear"></div>
						</div>
						<!--end contain_t_wrap-->
					</div>
					<!--end contain_title-->


					<div class="contain_search">
						<form id="inputForm" action="upmPermissionAction!commonSaveOrUpdate.action" method="post">
							<input type="hidden" name="upmPermission.appId" id="appId" value="${appId }">
							<input type="hidden" name="upmPermission.parentId" id="parentId" value="${parentId}">
							<input type="hidden" name="upmPermission.id" id="permissionId" value="${permissionId}">
							<input type="hidden" name="oldName" id="oldName" value="${upmPermission.name }">
							
							<div class="contain_s_wrap">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="10%" align="right" class="font_wei">权限名称<span style="color: red">*</span>:</td>
										
										<td width="30%" align="left">
											<input type="text" class="input_text" style="width: 150px" id="name" name="upmPermission.name" 	value="${upmPermission.name }" />
										</td>
									</tr>
									<tr>
										<td width="10%" align="right" class="font_wei">权限编码:
										</td>
										<td width="30%" align="left">
											<input type="text" class="input_text" style="width: 150px" id="code" name="upmPermission.code" value="${upmPermission.code}" />
										</td>
									</tr>
									<tr>
										<td width="10%" align="right" class="font_wei">权限类型</td>
										<td width="30%" align="left">
											<select id="type" name="upmPermission.type" class="select" style="width: 80px">
												<c:forEach var="upmDic" items="${permissionTypeList}">
													<option value="${upmDic.dataCode}">${upmDic.dataDesc}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td width="10%" align="right" class="font_wei">权限状态:</td>
										<td width="30%" align="left">
											<select id="state" name="upmPermission.state" class="select" style="width: 80px">
												<c:forEach var="upmDic" items="${permissionStateList}">
													<option value="${upmDic.dataCode}">${upmDic.dataDesc}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td width="10%" align="right" class="font_wei">
											URL:
										</td>
										<td width="30%" align="left">
											<input type="text" class="input_text" style="width: 150px" id="url" name="upmPermission.url" value="${upmPermission.url }" />
										</td>
									</tr>
									<tr>
										<td width="10%" align="right" class="font_wei">排序编号:</td>
										<td width="30%" align="left">
											<input type="text" class="input_text" style="width: 150px" id="sortNo" name="upmPermission.sortNo" value="${upmPermission.sortNo }" />
										</td>
									</tr>
									<tr>
										<td width="10%" align="right" class="font_wei">权限描述:</td>
										<td width="85%" align="left" colspan="4">
											<textarea class="textarea80" name="upmPermission.remark"
												id="description" style="width: 400px">${upmPermission.remark}</textarea>
										</td>
									</tr>
								</table>
							</div>
							<!--end contain_s_wrap-->
							<tr>
								<td width="10%" align="right" class="font_wei">
									&nbsp;
								</td>
								<td align="left" colspan="3">
									<div class="marg_lef10 float_lef">
										<input id="submitBtn" name="submitButton" type="submit"
											class="window_button_centerInput window_button_centerInput1"
											value="保存" />
									</div>
									<div class="marg_lef10 float_lef">
										<input type="button" id="return"
											class="window_button_centerInput window_button_centerInput1"
											value="返回"
											onclick="window.location='${ctx}/jsp/permission/upmPermissionAction!turnToPermissionList.action?appId=${appId}&parentId=${parentId }'" />
									</div>
								</td>
							</tr>
							</table>
					</div>
					<!--end contain_s_wrap-->
				</div>
				<!--end contain_search-->

			</div>
			<!--end contain_wrap-->
		</div>
		<!--end contain-->
		</div>
		<!--end padding10-->
	</body>
</html>
