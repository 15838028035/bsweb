<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<style>
.altclass{background: #E5EFFD ;}
</style>

<script type="text/javascript">
var CHILDREN_SELECTED = "0";
var CHILDREN_NOTSELECTED = "1";

$(document).ready(function(){
//渲染页面
	contralEffect.contain();
	contralEffect.tablelist();
	contralEffect.blueButton();
	var treeNodeId = "" ;
	
	onSelectRowaction = function(id){
			var s = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
			var sc = s.toString();
			var scindex = sc.indexOf(',');
			
			if(scindex >= 0){
				jQuery("#list").jqGrid('setSelection',sc.substring(0,scindex)); 
			}
		}	
		
	//生成树
      	var  root = jQuery.ajax({
          url:"${ctx}/jsp/user/upmUserGroupAction.action" ,
          async:false,
          cache:false,
          dataType:"text"
        }).responseText;
		
		var dataObj=eval("("+root+")");
		
		var tree = new TreePanel({
			renderTo:'upmUserGroupTreeDiv',
			'root' : dataObj,
			'iconPath' : "${ctx}/scripts/tree/img/",
			'switchType' : 'ajax',
			'ajaxAction' : "${ctx}/jsp/user/upmUserGroupAction.action"
		});
		tree.render();

	//选择事件
		tree.on(function(node){			
			$("#auditactselectedOrgid").val("");
		    treeNodeId = node.attributes.id;
			var treeNodeName = node.attributes.text;
			$.ajax({
				dataType:'json',
				type: "POST",
				cache:false,
				data: "orgId="+treeNodeId,			
			  	url: "${ctx}/jsp/user/upmUserGroupAction.action",
			  	success: function(data) {
			  			$("#btnInsert").prop("disabled",false);
			  			$("#btnsaveorg").prop("disabled",false);//set btn-save
			  			$("#btnDelete").prop("disabled",false);
			  			$("#btnAssignRole").prop("disabled",false);
			  			
			  			var childrenSelected = data.isselectchild;//set checkbox childrenSelected
			  			//alert("current user childrenSelected:"+childrenSelected);
				  		if(childrenSelected==CHILDREN_NOTSELECTED || childrenSelected==""){
				  			$("[name='childrenSelected']").prop("checked",false);
				  			$("[name='childrenSelected']").prop("disabled",true);
				  		}else{
				  			$("[name='childrenSelected']").prop("disabled",false);
				  		}
			  		$("#auditactselectedOrgid").val(treeNodeId);
			  		$("#parentId").val(treeNodeId);
			  		
			  		//加载用户信息
			  		refreshGrid();
				 },
				 error:function(){
				 	showModalMessage("失败");
				 	$("#btnInsert").prop("disabled",false);
				 	$("#btnsaveorg").attr("disabled","disabled");
				 	$("#btnDelete").prop("disabled",false);
				 	$("#btnAssignRole").prop("disabled",false);
				 }
			});
			
			jQuery("#list").jqGrid({
			url:'${ctx}/jsp/user/upmUserAction!listUserByCondition.action&treeNodeId='+treeNodeId,
			datatype: 'json',
			mtype: 'POST',
			colNames:['ID','用户ID','帐号','姓名','手机号码','组织机构'],
			colModel:[
			     {name:'userGroupAndUserRelId',index:'userGroupAndUserRelId'},
				 {name:'id',index:'id'},
				 {name:'loginNo',index:'loginNo'},
				 {name:'userName',index:'userName'},
				 {name:'mobile',index:'mobile'},
				 {name:'orgDesc',index:'orgDesc'}
				 ],
			pager: '#pager',
			sortable: true,
			rowNum: 10,
			rowList:[10,15,20,50],
			multiboxonly:true,
			multiselect: true,
			prmNames:{rows:"page.pageSize",page:"page.pageNumber",total:"page.totalPages"},     
			jsonReader: {     
				root: "rows",   
				repeatitems : false,
				id:"0"        		    
				},
			viewrecords: true,
			width: '100%',
			height: '100%',
			sortname:'loginNo',
			sortorder:'asc',
			hidegrid: false,
			loadtext: '正在加载,请稍等..',
			scrollrows: true,
			altRows:true,
			altclass:'altclass',
			onSelectRow: onSelectRowaction
		}); 
		});
				
		 $("#auditactform").validate({
			submitHandler: function(form){
				$("#btnInsert").prop("disabled",true);
			   $("#btnsaveorg").prop("disabled",true);
			   $("#btnDelete").prop("disabled",true);
			   $("#btnAssignRole").prop("disabled",true);
				var auditactselectedOrgid = $("#auditactselectedOrgid").val();				
				if(!auditactselectedOrgid){
					bootbox.alert("请一条记录");
					return false;
				}
				
				var options = {
			        dataType:'json', 		        	
			        cache:false,
			        type:'post',
			        contentType:'application/x-www-form-urlencoded; charset=UTF-8', 	       
			        url:"${ctx}/jsp/user/upmUserGroupAction!save.action",
			        success:function(respResult, statusText, xhr ) {
			        	$("#btnInsert").prop("disabled",false);		        	
			        	$("#btnsaveorg").prop("disabled",false); 
			        	$("#btnDelete").prop("disabled",false);	
			        	$("#btnAssignRole").prop("disabled",false);
			        	bootbox.alert(respResult.opResult);
					},
					 error:function(){
					 		bootbox.alert("提示信息"+respResult.message);
					 		$("#btnInsert").prop("disabled",false);
					 		$("#btnsaveorg").prop("disabled",false);
					 		$("#btnDelete").prop("disabled",false);
					 		$("#btnAssignRole").prop("disabled",false);
					 }
		        };	
		            	
				$("#auditactform").ajaxSubmit(options);
				
			}
		}); 
});

		function edit() {
			$("#operate").val("edit");
		}
		//删除
        function mulDelete(){
        	showModalConfirmation('确认要删除么',"doDeleteGroup()");
        }
        
        function doDeleteGroup(){
        	var ids = $("#parentId").val();
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/user/upmUserGroupAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        }
      	
      	function assignRole() {
	      	//分配角色
        	var userGroupId = $("#auditactselectedOrgid").val();				
			if(!userGroupId){
				showModalMessage("请一条记录");
				return false;
			}
				
        	jQuery.FrameDialog.create({
						url: "${ctx}/jsp/role/upmRoleGroupAssignList.jsp?userGroupId="+userGroupId,
						title: "角色管理",
						width: 800,
						height: 600,
						hide: 'slide',
						buttons:{}							
					}).bind('dialogclose', function(event, ui) {
							//refreshGrid();
			    	});
        }
</script>
</head>
<body>
<form id="auditactform" action="${ctx}/jsp/user/upmUserGroupAction!save.action">
	<input type="hidden" name="operate" id="operate"/>
	<input type="hidden" name="parentId" id="parentId"/>
	<input type="hidden" name="auditactselectedOrgid" id="auditactselectedOrgid"/>
	
	<div class="contain_search">
    <div class="contain_s_wrap" style="height:350px">
	<table align="center" width="100%" cellpadding="0" cellspacing="0">
		 <tr>
            <td>组织机构编码<font color="red">*</font> </td>
            <td><input type="text" id=”userGroupCode" name="userGroupCode" value="${userGroupCode}" maxLength="200" /></td>
        </tr>
        <tr>
            <td>业务编码<font color="red">*</font> </td>
            <td><input type="text" id="bussinessCode" name="bussinessCode" value="${bussinessCode}" maxLength="200" /></td>
        </tr>
          <tr>
            <td>组织机构名称<font color="red">*</font></td>
             <td><input type="text" id="userGroupName" name="userGroupName" value="${userGroupName}" maxlength="200"/> </td>
        </tr>
		<tr>
			<td>
			<div class=" marg_lef10 float_lef">
			  <input id="btnInsert" disabled="disabled" type="submit" class="window_button_centerInput" value="新增"/> 
			 <input id="btnsaveorg" disabled="disabled" type="submit" class="window_button_centerInput" value="保存" onclick="edit()"/> 
			 <input id="btnDelete" disabled="disabled" type="button" class="window_button_centerInput" value="删除" onclick="mulDelete()"/>
			  <input id="btnAssignRole" disabled="disabled" type="button" class="window_button_centerInput" value="分配角色" onclick="assignRole()"/> 
			</div>
			</td>
		</tr>
	</table>
	<div class="widget_tree" style="height: 300px;width:100%;overflow: no;font-weight: normal;">
<div id="upmUserGroupTreeDiv"  ></div>
</div>

</div>
</div>
</form>
 
 <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">用户管理</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<div class="toolbar_wrap">
						<div class=" marg_lef10 float_lef">
						<input type="button" id="addRel" class="window_button_centerInput"
						 value="新增" /></div>
						<div class=" marg_lef10 float_lef"><input type="button" class="window_button_centerInput" value="删除" onclick="mulDeleteRel();"/></div>
					<table>
						<tr>
						<td>用户名</td>
						<td><input name="userNameParam" id = "userNameParam" type="text"/></td>
						<td>手机号码</td>
						<td><input name="mobileParam" id = "mobileParam" type="text" style="width:100px;"/></td>
						<td>组织机构</td>
						<td><input name="orgDescParam" id = "orgDescParam" type="text"/></td>
						<td>		
							<div class=" marg_lef10 float_lef">
								<input class="window_button_centerInput" name="select" id = "select" type="button" value="查询" /></div>
							</div>
						</td>
						</tr>
					</table>
					</div>
				</div>
				
				<table id="list"></table>
				<div id="pager"></div>

            </div>
        </div>
    </div>
     <script type="text/javascript">
    
	    $("#select").click(function() {
	    	var userName = $("#userNameParam").val();
	    	var orgDesc = $("#orgDescParam").val();
	    	var mobile = $("#mobileParam").val();
	    	
			jQuery("#list").jqGrid('setGridParam',{
			    url:'${ctx}/jsp/user/upmUserAction!listUserByCondition.action',
				postData : {"userName" : userName,
							"orgDesc" : orgDesc,
							"mobile" : mobile
				}, 
			 	page:1
			}).trigger("reloadGrid");
	    })
	    
	        function showWin(url) {  
	    	alert("Test");
        $.magnificPopup.open({  
            items : [{  
                src : url, 
                type : 'iframe',  
                height : '150px',  
                width : '500px'  
            }]  
        });   
        return $.magnificPopup.instance;  
    }  
	    
		//新增
        $("#addRel").click(function() {
        	var groupId = $("#auditactselectedOrgid").val();				
			if(!groupId){
				bootbox.alert("请一条记录");
				return false;
			}
				
        	var url = "${ctx}/jsp/user/upmUserSelectList.jsp?groupId="+groupId;
        	showWin(url);
        	//callback function : refreshGrid();
        	
        })
		//删除
        function mulDeleteRel(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
        	if(ids == ""){
        		showModalMessage('请选择一条记录');
        		return;
        	}

        	showModalConfirmation('确认要删除么',"doDelete()");
        }
        	
        function doDelete(){
        	var ids = jQuery("#list").jqGrid('getGridParam','selarrrow'); 
            var result = jQuery.ajax({
		      	  url:"${ctx}/jsp/user/upmUserAndUserGroupRelAction!multidelete.action?multidelete=" + ids,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			showModalMessage(obj.opResult);
			refreshGrid();
        }
        
      	function refreshGrid(){
			var userName = $("#userNameParam").val();
	    	    var address = $("#addressParam").val();
	    	    var mobile = $("#mobileParam").val();
				 	
				jQuery("#list").jqGrid('setGridParam',{
				     url:"${ctx}/jsp/user/upmUserAction!listUserByCondition.action",
				     postData:{"userName":userName,
				     		   "address":address,
				     		   "mobile":mobile,
				     		   "treeNodeId":$("#parentId").val()
				     },
				 	 page:1
				 }).trigger("reloadGrid"); 
      	}
      	
    </script>
	
</body>
</html>
