<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/jsp/common/meta.jsp"%>
		<%@ include file="/jsp/common/resource/scripts_all.jsp"%>
		<%@ include file="/jsp/common/resource/styles_all.jsp"%>
		<style>
		.TreePanel {
			font-size: 12px;
			color: #666;
			font-family: verdana, geneva, arial, helvetica, sans-serif;
			white-space: nowrap;
			overflow-x:auto;
			overflow-y:auto;
			width:95%;	
			padding: 3px;
		}
		</style>
		<script type="text/javascript">
		var tree;
		$(document).ready(function(){
			contralEffect.contain();
			contralEffect.blueButton();
			try{
				tree = new TreePanel({
					renderTo:'treediv',
					'root' : ${JsonData},
					'iconPath' : "${ctx}/scripts/tree/img/",
					'switchType' : 'client',
					'ajaxAction' : "${ctx}/jsp/role/upmRoleAction!getPermissionTree.action?strRoleId=${upmRole.id}"
				});
				tree.render();
			}catch(e){
				tree = null;
				showModalMessage("出现异常");
			}
			
			if('${returnMessage}' != ""){
				showModalMessage("${returnMessage}","doUpdateSuccess()");
			}
		});
		
		function doUpdateSuccess(){
			jQuery.FrameDialog.closeDialog();
		   	parent.location.reload();
		}
	</script>
	</head>
	<body>
		<form
			action="${ctx}/jsp/role/upmRoleAction!save.action?appId=${appId}"
			method="post" id="roleForm">
			<input type="hidden" name="operate" value="${operate}" />
			<input type="hidden" name="upmRole.id" value="${upmRole.id}" />
			<input type="hidden" name="permissions" id="permissions" value="" />
		<div class="padd10">
			<div class="contain">
				<div class="contain_wrap">
				
					<div class="contain_title">
				    	<div class="contain_t_wrap">
				            <div class="float_lef contain_t_text">
					            <span class=""><img src="${ctx}/images/plus.png" align="absmiddle" /></span>
					            <span class="marg_lef5">
					            	<a href="${ctx}/jsp/role/upmRoleAction!forwardToJsp.action?appId=${appId}">应用名称${appId}
					            	</a>
					            </span>
					            <span class="marg_lef5"><img src="${ctx}/images/next.gif" align="absmiddle" /></span>
					            <span class="marg_lef5">
					            	<s:if test="upmRole.id==null">新增</s:if>
					            	<s:else>编辑</s:else>
					            </span>
					            </div><!--end contain_t_text-->
					            <div class="float_rig contain_t_check">
					            	<div class="contain_icon"></div>
					            </div><!--end contain_t_check-->
				            <div class="clear"></div>
				        </div><!--end contain_t_wrap-->
				    </div><!--end contain_title-->
			    
	    			<div class="contain_search">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="150" align="right" class="font_wei">
									<font color="red">*</font>角色编码
								</td>
								<td>
									<input class="input_text30" type="text" name="upmRole.roleCode" id="roleCode"
										value="${upmRole.roleCode}" maxlength="50" />
								</td>
							</tr>
							<tr>
								<td width="150" align="right" class="font_wei">
									<font color="red">*</font>角色名称
								</td>
								<td>
									<input class="input_text30" type="text" name="upmRole.roleName" id="roleName"
										value="${upmRole.roleName}" maxlength="200" />
								</td>
							</tr>
							<tr>
								<td align="right" class="font_wei"><font color="red">*</font>权限树</td>
								<td id="treediv"></td>
							</tr>
							<tr>
								<td align="right" class="font_wei">角色描述</td>
								<td>
									<textarea rows="3" cols="50" name="upmRole.roleDesc"
										id="roleDesc">${upmRole.roleDesc}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="marg_lef10 float_lef">
										<input type="button" id="submitButton" class="window_button_centerInput window_button_centerInput1"
											onclick="addRoleAction();" value="保存" />
									</div>
									<div class="marg_lef10 float_lef">
										<input type="button" id="returnBtn"
											class="window_button_centerInput window_button_centerInput1 CA_4A_select04" value="返回" />
									</div>
								</td>
							</tr>
						</table>
			
	    			</div><!-- contain_search -->
	    		</div>
	    	</div>
	    </div>

	<script type="text/javascript">
		$(function(){
			$(".TreePanel").css({"width":"99%","height":"320px"});
		});
    	$("#returnBtn").click(function(){
    		window.history.go(-1);
    	})

		$(document).ready(function() {
			$(":text").get(0).focus();
		    jQuery.validator.addMethod("checkByteLength", function(value, element) {      
		 	  var roleName = $("#roleName").val();
		 	  if(roleName.replace(/[^\x00-\xff]/g, 'xx').length > 200){
		 	    return false;
		 	  }else{
		 	    return true;
		 	  }
		 }, "最大长度不能超过200");
		});
		
        var batchid="";
    	function addRoleAction(){
    		batchid="";
			if(!tree){
				showModalMessage('对不起，你没有操作权限');
				return;
			}
			var treeNodeIds = tree.getCheckedAndHalfChecked();
			if(treeNodeIds.length==0){
				showModalMessage('请选择一条记录');
				return;
			}
			var treeNodeText = "";
			var treeIds = "";
			for(var i=0;i<treeNodeIds.length;i++){
				var tmp = getParentPath($.trim(treeNodeIds[i].toString()));
				treeNodeText += tmp;
				treeIds += treeNodeIds[i].toString();
				
				if(i < treeNodeIds.length - 1){
					treeNodeText += ",";
					treeIds += ",";
				}
			}
			//alert(treeNodeIds);
			document.getElementById("permissions").value = treeIds;
			
			/* batchid = $.ajax({
	            type: "POST",
	            url:"${ctx}/jsp/role/upmRoleAction!isPermissionsMutex.action",
	            data:{"permissions":treeIds,"appId":"${appId}"},
	            async: false,
	            dataType: "text"
	        }).responseText;
			//alert('batchid='+batchid);
			
			if(batchid!=""){
				getAllRoot(tree);
				showModalMessageWHNoMargin(batchid,400,400); 
				return;
			} */
			
			batchid='保存成功';//TODO：Remove me
			getAllRoot(tree);
			showModalMessageWHNoMargin(batchid,400,400); 
			
			$("#roleForm").submit();
		}
    	
		function getParentPath(id){
	        var node = tree.getNodeById(id);
	        path = node.attributes.text;
	        while(node.parentNode != null){
	            node = node.parentNode;
	            path = (node.attributes.text + ' - ' + path );
	        }
	       
	       return path;
	    }

		$('#roleForm').validate({
			submitHandler: function(form) {
				$("#submitButton").attr("disabled","disabled");
				jQuery(form).ajaxSubmit({
					cache:false,
				 	success: function(responseText) { 
						var obj = eval(responseText);
						showModalMessage(obj.opResult,"doUpdateSuccess()");
			    	} 
				});
			},
    		//debug:true, 
	    	rules: {
		       roleName: {
		        	required: true,
		        	checkByteLength:true,
		         	remote: {
		         		url: "upmRoleAction!checkRoleIsExist.action",//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
		         		type: "post",
		         		cache:false,
		         		data: {
		         			"strRoleId": "${upmRole.id}",
		         			"appId": "${appId}",
		         			"roleName": function(){return $("#roleName").val();}
		         		}
		         	}
		       },
			   "upmRole.roleDesc": {
		        	maxlength: 60
		       }
	    	},
	
			messages: {
				roleName: {
					required: "<span style='color:red'>角色名称必填</span>",
					remote: "角色名称已经存在，不允许添加"
				},
			   "upmRole.roleDesc": {
			       	maxlength: "<span style='color:red'>描述信息最多60个汉子</span>"
		       }
			}
    	});
		
		function getAllRoot(value){
			var rootNode=value.getRootNode();//获取根节点
			batchid=batchid.replace(new RegExp(rootNode.id, "g"),rootNode.attributes.text);
			findchildnode(rootNode); //开始递归
		}
		
		function findchildnode(node){
			var childnodes = node.childNodes;var nd;
			for(var i=0;i<childnodes.length;i++){ //从节点取出子节点依次遍历
				nd = childnodes[i];
				batchid=batchid.replace(new RegExp(nd.id, "g"),nd.attributes.text);
				if(nd.hasChildNodes()){ //判断子节点下否存子节点
					findchildnode(nd); 
				}
			}
		}
    	
    	function doUpdateSuccess(){
    		window.location.href = "${ctx}/jsp/role/upmRoleAction!forwardToJsp.action?appId=${appId}";
    	}						
    </script>

		</form>

	</body>
</html>
