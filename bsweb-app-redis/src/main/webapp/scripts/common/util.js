function getStrBytes(val){
		var len = 0; 
		for (var i = 0; i < val.length; i++) { 
			if (val.charAt(i).match(/[^\x00-\xff]/ig) != null)//全角
			{
				len += 2; 
			}
			else 
			{
				len += 1;
			} 
		} 
		return len; 
    }
    
function trim(str){   
    str = str.replace(/^(\s|\u00A0)+/,'');   
    for(var i=str.length-1; i>=0; i--){   
        if(/\S/.test(str.charAt(i))){   
            str = str.substring(0, i+1);   
            break;   
        }   
    }   
    return str;   
}  