<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>redis管理台</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
<%@ include file="/jsp/common/resource/styles_all.jsp" %>
<style>
.altclass{background: #E5EFFD ;}
</style>

</head>

<body>

 <div class="padd10">
        <div class="contain">
            <div class="contain_wrap">
            
                <div class="contain_title">
			    	<div class="contain_t_wrap">
			            <div class="float_lef contain_t_text">
			            	<span class="marg_lef5">redis管理台</span>
			            </div><!--end contain_t_text-->
			            <div class="float_rig contain_t_check">
			            </div><!--end contain_t_check-->
			       </div><!--end contain_t_wrap-->
			    </div><!--end contain_title-->
			    
				<div class="toolbar">
					<table>
						<tr>
			 			<td>KEY</td>
						<td><input  type="text" name="redisKey" id = "redisKey"  style="width:400px;"/></td>
						<td><input type="text" name="redisValue" id = "redisValue" style="width:400px;" /></td>
						</tr>
					</table>
				</div>
				
				<div class="toolbar">
					<div class="toolbar_wrap" style="margin-top:200px">
						<div class="window_button marg_lef10 float_lef"><input type="button" id="getRedisValue" class="window_button_centerInput" value="获取" onclick="getRedisValue()" /></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="removeRedisKey" class="window_button_centerInput" value="删除"  onclick="removeRedisKey()"/></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="removeRedisKeyBatch" value="批量删除" onclick="mulDelete();" onclick="removeRedisKeyBatch()"/></div>
						<div class="window_button marg_lef10 float_lef"><input type="button" id="setRedisValue" value="设置" onclick="setRedisValue();"/></div>
					</div>
				</div>
				
				<div id="pager"></div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        
        function getRedisValue() {
        	var redisKey = $("#redisKey").val();
            var result = jQuery.ajax({
		      	  url:"${ctx}/IndexAction!getRedisValue.action?redisKey="+ redisKey,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			alert(obj.opResult);
        }
        
        function removeRedisKey() {
        	var redisKey = $("#redisKey").val();
            var result = jQuery.ajax({
		      	  url:"${ctx}/IndexAction!removeRedisKey.action?redisKey=" + redisKey,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			alert(obj.opResult);
        }
        
        
        function removeRedisKeyBatch() {
        	var redisKey = $("#redisKey").val();
            var result = jQuery.ajax({
		      	  url:"${ctx}/IndexAction!removeRedisKeyBatch.action?redisKey=" + redisKey,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			alert(obj.opResult);
        }
        
        function setRedisValue() {
        	var redisKey = $("#redisKey").val();
        	var redisValue = $("#redisValue").val();
            var result = jQuery.ajax({
		      	  url:"${ctx}/IndexAction!setRedisValue.action?redisKey=" + redisKey + "&redisValue="+redisValue,
		          async:false,
		          cache:false,
		          dataType:"json"
		      }).responseText;
			var obj = eval("("+result+")");
			alert(obj.opResult);
        }
      	
    </script>


</body>
</html>
