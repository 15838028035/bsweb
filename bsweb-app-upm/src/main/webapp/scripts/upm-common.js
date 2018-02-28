
	function commonAdd(url){
		window.location.href = url;
	}
	
	function commonEdit(tableList,url){
		var $tableList = $(tableList);
		 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
             return row.id;
         });
		 
    	if(ids == ''|| ids==null){
    		bootbox.alert('请选择要编辑的记录');
    		return;
    	}
    	
    	if(ids.length>1){
    		bootbox.alert('请选择一条编辑的记录');
    		return;
    	}
    	window.location.href = url+ids;
	}
	
	function commonDelete(tableList,url){
		var $tableList = $(tableList);
		 var ids = $.map($tableList.bootstrapTable('getSelections'), function (row) {
             return row.id;
         });
    	 
    	if(ids == ""){
    		bootbox.alert('请选择要删除的记录');
    		return;
    	}
    	
    	bootbox.confirm('确认要删除么?',function (result) {  
            if(result) {  
            	doDelete(tableList,url,ids);
            }
    	});
	}
	
    function doDelete(tableList,url,ids){
        var result = jQuery.ajax({
	      	  url:url + ids,
	          async:false,
	          cache:false,
	          dataType:"json"
	      }).responseText;
		var obj = eval("("+result+")");
		bootbox.alert(obj.opResult);
		refreshGrid(tableList);
    }

  	function refreshGrid(tableList){
  		$(tableList).bootstrapTable('refresh');
  	}
      	