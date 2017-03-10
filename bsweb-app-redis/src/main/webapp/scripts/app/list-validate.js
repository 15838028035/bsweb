$(function(){
	$("#save").click(function(){
		initRadio();
		initCheckBox();
		initMultiCheckBox();
		var operateType = $("#operateType").val();
		if(operateType && operateType == "UPDATE"){
			$("#"+$("#appKeyColumn").val()).removeAttr("disabled");
			$("#"+$("#appKeyColumn").val()).attr("readonly",true);
		}
		$("#inputForm").submit();
	})
	$('#inputForm').validate({
		submitHandler:function(form){
			jQuery(form).ajaxSubmit({
				beforeSubmit : function(){
				     //本地js校验： 如果各省权限接入需要个性化校验，请单独在自己的js文件中实现 function validateAccessPermissionsExt(){}
					var validateFlag = true;
					if(typeof validateAccessPermissionsExt !='undefined' && validateAccessPermissionsExt instanceof Function ){
						validateFlag = 	validateAccessPermissionsExt();
					}
					if(validateFlag){
						$("#save").attr("disabled","true");
						var notNullValidateResult = notNullValidate();
						if(notNullValidateResult != true){
							$("#save").removeAttr("disabled");
							return false;
						}
					}else{
					  return false;
					}
				},
				
			 	success: function(responseText) {
					var operateType = $("#operateType").val();
			 		if(operateType && operateType == "UPDATE"){
						$("#"+$("#appKeyColumn").val()).attr("disabled",true);
						$("#"+$("#appKeyColumn").val()).removeAttr("readonly");
					}
					if(responseText == "ok"){
				 		alert("操作成功");
						$("#save").removeAttr("disabled");
						try{
					    	parent.reload();
					    }catch(e){
					    	
					    }
					    $.FrameDialog.closeDialog();
					}else{
					   alert("操作失败："+responseText);
					   $("#save").removeAttr("disabled");
					}
		    	} 
			});
		},
		rules:{
		}
	});
})