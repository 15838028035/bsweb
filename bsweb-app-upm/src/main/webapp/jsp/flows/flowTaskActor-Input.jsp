<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>流程实例</title>
    <%@ include file="/jsp/common/meta.jsp" %>
	<%@ include file="/jsp/common/resource/scripts_all.jsp" %>
	<%@ include file="/jsp/common/resource/styles_all.jsp" %>
</head>

<body>
<form id="inputForm" action="" method="post">
    <input type="hidden" name="orderId" id="orderId" value="${orderId }"/>
    <input type="hidden" name="taskName" id="taskName" value="${taskName }"/>
    <table width="100%" border="0" align="center" cellpadding="0"
           class="table_all_border" cellspacing="0" style="margin-bottom: 0px;border-bottom: 0px">
        <tr>
            <td class="td_table_top" align="center">
                动态添加参与者
            </td>
        </tr>
    </table>
    <table class="table_all" align="center" border="0" cellpadding="0"
           cellspacing="0" style="margin-top: 0px">
        <tr>
            <td class="td_table_1">
                <span>添加参与者：</span>
            </td>
            <td class="td_table_2" colspan="3">
                <input type="text" class="input_240" id="operator" name="operator"/>
            </td>
        </tr>
    </table>
    <table align="center" border="0" cellpadding="0"
           cellspacing="0">
        <tr align="left">
            <td colspan="1">
                <input type="button" class="button_70px" name="submit" value="提交" onclick="addActor()">
                &nbsp;&nbsp;
                <input type="button" class="button_70px" name="reback" value="关闭"
                       onclick="window.close()">
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function addActor() {
            var orderId = $('#orderId').val();
            var taskName = $('#taskName').val();
            var operator = $('#operator').val();
            $.ajax({
                type:'POST',
                url:"${ctx}//jsp/flows/flowTaskAction!addTaskActorJsonTip.action",
                data:"orderId=" + orderId + "&taskName=" + taskName + "&operator=" + operator,
                async: false,
                globle:false,
                error: function(){
                    alert('数据处理错误！');
                    return false;
                },
                success: function(data){
                    window.returnValue = operator;
                    window.close();
                }
            });
        }
    </script>
</form>
</body>
</html>
