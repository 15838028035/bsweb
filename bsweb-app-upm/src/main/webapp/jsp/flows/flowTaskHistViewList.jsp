
<%@page language="java" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jsp/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>历史任务管理</title>
<%@ include file="/jsp/common/meta.jsp" %>
<%@ include file="/jsp/common/resource/scripts_all.jsp" %>

<script language="javascript"  type="text/javascript">
	$(document).ready(function(){
		 var oTable = new TableInit();
	     oTable.Init();
	     
	     $(".datetimepicker").datetimepicker({
	      		language: 'zh-CN',
	             format: 'yyyy-mm-dd hh:ii',//格式化时间,
	             autoclose:true,//日期选择完成后是否关闭选择框
	             //minView: "month",//设置只显示到月份
	             clearBtn:true // 自定义属性,true 显示 清空按钮 false 隐藏 默认:true
	         });
	});

	
	var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tableList').bootstrapTable({
                url: '${ctx}/jsp/flows/flowTaskHistAction!bootStrapList.action?flowOrderId=${param.flowOrderId}',         //请求后台的URL（*）
                method: 'post',                     //请求方式（*）
                dataType: "json",
                contentType : "application/x-www-form-urlencoded;charset=UTF-8",
                dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
                totalField: 'total',
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                smartDisplay:false,
                showRefresh:true,
                showColumns:true,
                showToggle:true,
                searchOnEnterKey:true,
                trimOnSearch:true,
                showFooter:true,
                search:false,
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                singleSelect:false,
                clickToSelect: true,
                smartDisplay:true,
                queryParams: oTableInit.queryParams,//传递参数（*）
                queryParamsType:'',					//  queryParamsType = 'limit' 参数: limit, offset, search, sort, order;
                									//  queryParamsType = '' 参数: pageSize, pageNumber, searchText, sortName, sortOrder.
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 25,                       //每页的记录行数（*）
                pageList: [5,10, 25, 40, 50, 100,'all'],        //可供选择的每页的行数（*）
                showPaginationSwitch:true,
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                //height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                idField:"id",
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [  
			 	{field:'taskName',title:'任务标识', sortable:true},
			 	{field:'displayName',title:'任务名称', sortable:true},
			 	{field:'operator',title:'操作者', sortable:true},
			 	{field:'createTime',title:'开始时间', sortable:true},
			 	{field:'finishTime',title:'结束时间', sortable:true},
			 	{field:'finishTime-createTime',title:'任务历时', formatter : function(value, row, index) {  
			 		if(row.finishTime==null){
			 			return "";
			 		}
			 		var date1=new Date(row.createTime);  //开始时间
			 		var date2=new Date(row.finishTime);    //结束时间
			 		var date3=date2.getTime()-date1.getTime();  //时间差的毫秒数
			 		//计算出相差天数
			 		var days=Math.floor(date3/(24*3600*1000));
			 		 
			 		//计算出小时数
			 		var leave1=date3%(24*3600*1000) ;   //计算天数后剩余的毫秒数
			 		var hours=Math.floor(leave1/(3600*1000));
			 		//计算相差分钟数
			 		var leave2=leave1%(3600*1000);        //计算小时数后剩余的毫秒数
			 		var minutes=Math.floor(leave2/(60*1000));
			 		//计算相差秒数
			 		var leave3=leave2%(60*1000) ;     //计算分钟数后剩余的毫秒数
			 		var seconds=Math.round(leave3/1000);
			 		
			 		var diffResult = "";
			 		
			 		if(days>0){
			 			diffResult=diffResult+days+"天 ";
			 		}
			 		if(hours>0){
                        diffResult=diffResult+hours+"小时";
                    }
			 		if(minutes>0){
                        diffResult=diffResult+minutes+"分钟";
                    }
			 		if(seconds>0){
                        diffResult=diffResult+seconds+"秒";
                    }
			 		
			 		if(diffResult==""){
			 			diffResult ="0秒";
			 		}
			 		
                    return diffResult;
                  }  
			 	}
			 	
                        ],               		
             	formatLoadingMessage: function () {
             		return "请稍等，正在加载中...";
             	},
             	formatNoMatches: function () { //没有匹配的结果
             		return '无符合条件的记录';
             	},
             	onLoadError: function (data) {
             		$('#tableList').bootstrapTable('removeAll');
             		 bootbox.alert("数据加载失败！");
             	},
             	responseHandler: function (res) {
             	    return {
             	        total: res.total,
             	        rows: res.rows
             	    };
             	}
              
            });
            
        };
 
        //得到查询的参数
      oTableInit.queryParams = function (params) {
			var id=$("#id").val();
			var flowOrderId=${param.flowOrderId};
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		 "page.pageSize":params.pageSize,
                     "page.pageNumber":params.pageNumber,
	                "sortName":this.sortName,
	                "sortOrder":this.sortOrder,
					"flowTaskHist.flowOrderId":flowOrderId,
					
            };
            return temp;
        };
        return oTableInit;
    };
		
</script>
</head>

<body>


<div class="panel-body" style="padding-bottom:0px;">
        <table id="tableList"></table>
    </div>
</body>
</html>
