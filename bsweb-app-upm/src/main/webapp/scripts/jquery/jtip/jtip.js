/*
 * JTip
 * By Cody Lindley (http://www.codylindley.com)
 * Under an Attribution, Share Alike License
 * JTip is built on top of the very light weight jquery library.
 */

//on page load (as soon as its ready) call JT_init
$(document).ready(JT_init);

function JT_init(){
	       $("a.jTip")
		   .hover(function(){JT_show(this.href,this.id,this.name)},function(){$('#JT').remove();$('#JT_iframe').remove();})
           .click(function(){return false});	   
}

function JT_show(url,linkId,title){
	if(title == false)title="&nbsp;";
	var de = document.documentElement;
	var w = self.innerWidth || (de&&de.clientWidth) || document.body.clientWidth;
	var h = self.innerHeight || (de&&de.clientHeight) || document.body.clientHeight;
	var hasArea = w - getAbsoluteLeft(linkId);
	var hasArea_Vertical = h - getAbsoluteTop(linkId);
	var clickElementy = getAbsoluteTop(linkId)-10; //set y position edit by zengyp [getAbsoluteTop(linkId)-3]
	
	var queryString = url.replace(/^[^\?]+\??/,'');
	var params = parseQuery( queryString );
	if(params['width'] === undefined){params['width'] = 250};
	if(params['link'] !== undefined){
	$('#' + linkId).bind('click',function(){window.location = params['link']});
	$('#' + linkId).css('cursor','pointer');
	}
	
	if(hasArea>((params['width']*1)+75)){
		$("body").append("<div id='JT' style='width:"+params['width']*1+"px'><div id='JT_arrow_left'></div><div id='JT_content'><div id='JT_close_left'>"+title+"</div><div id='JT_copy'><div class='JT_loader'></div></div></div>");//right side
		var arrowOffset = getElementWidth(linkId) + 11;
		var clickElementx = getAbsoluteLeft(linkId) + arrowOffset; //set x position
	}else{
		$("body").append("<div id='JT' style='width:"+params['width']*1+"px'><div id='JT_arrow_right' style='left:"+((params['width']*1)+1)+"px'></div><div id='JT_content'><div id='JT_close_right'>"+title+"</div><div id='JT_copy'><div class='JT_loader'></div></div></div></div>");//left side
		var clickElementx = getAbsoluteLeft(linkId) - ((params['width']*1) + 15); //set x position
	}
	if(params['height'] === undefined){
	}else{
		if(hasArea_Vertical>((params['height']*1)+75)){
			//$("JT").append("<div id='JT' style='height:"+params['height']*1+"px'><div id='JT_arrow_left'></div><div id='JT_close_left'>"+title+"</div><div id='JT_copy'><div class='JT_loader'><div></div></div>");//bottom side
			var arrowOffset = getElementHeight(linkId) + 11;
			var clickElementy = getAbsoluteTop(linkId) + arrowOffset; //set y position
		}else{
			//$("body").append("<div id='JT' style='height:"+params['height']*1+"px'><div id='JT_arrow_right' style='top:"+((params['height']*1)+1)+"px'></div><div id='JT_close_right'>"+title+"</div><div id='JT_copy'><div class='JT_loader'><div></div></div>");//top side
			var clickElementy = getAbsoluteTop(linkId) - ((params['height']*1) + 15); //set y position
		}
	}
	$('#JT').css({left: clickElementx+"px", top: clickElementy+"px"});
	$('#JT').show();

	//$('#JT_copy').load(url);
	
	/*   add no cache. @author: shenzhanghui 2011/11/04 */
	var noCacheId;
	if(url.indexOf("?")==-1){
		noCacheId = "?NOTCACHEID="+new Date().getTime();
	}
	else{
		noCacheId = "&NOTCACHEID="+new Date().getTime();
	}
	
	//if IE6.0 
	if ($.browser.msie && $.browser.version==6){
		$('#JT_copy').load(url+noCacheId,function(){
			$('#JT_iframe').remove();
			$("#JT_content").css('border','#b8cde8 1px solid');
			$('body').append("<iframe id='JT_iframe' src='' scrolling='no' frameborder='0'></iframe>");
			$('#JT_iframe').css({
				'position': 'absolute',
				'width': $("#JT_content").width()+5,
				'height': $("#JT_content").height()+4,
				'top': $("#JT").css('top'),
				'left': $("#JT").css('left'),
				'z-index': $('#JT').css('z-index')-1
			});
			$("#JT_content").css('border','#b8cde8 0px solid');
			return false;
		});
	}
	else{
		$('#JT_copy').load(url+noCacheId);
	}
}

function getElementWidth(objectId) {
	x = document.getElementById(objectId);
	return x.offsetWidth;
}

function getElementHeight(objectId) {
	y = document.getElementById(objectId);
	return y.offsetHeight;
}

function getAbsoluteLeft(objectId) {
	// Get an object left position from the upper left viewport corner
	o = document.getElementById(objectId)
	oLeft = o.offsetLeft            // Get left position from the parent object
	while(o.offsetParent!=null) {   // Parse the parent hierarchy up to the document element
		oParent = o.offsetParent    // Get parent object reference
		oLeft += oParent.offsetLeft // Add parent left position
		o = oParent
	}
	return oLeft
}

function getAbsoluteTop(objectId) {
	// Get an object top position from the upper left viewport corner
	o = document.getElementById(objectId)
	oTop = o.offsetTop            // Get top position from the parent object
	while(o.offsetParent!=null) { // Parse the parent hierarchy up to the document element
		oParent = o.offsetParent  // Get parent object reference
		oTop += oParent.offsetTop // Add parent top position
		o = oParent
	}
	return oTop
}

function parseQuery ( query ) {
   var Params = new Object ();
   if ( ! query ) return Params; // return empty object
   var Pairs = query.split(/[;&]/);
   for ( var i = 0; i < Pairs.length; i++ ) {
      var KeyVal = Pairs[i].split('=');
      if ( ! KeyVal || KeyVal.length != 2 ) continue;
      var key = unescape( KeyVal[0] );
      var val = unescape( KeyVal[1] );
      val = val.replace(/\+/g, ' ');
      Params[key] = val;
   }
   return Params;
}

function blockEvents(evt) {
              if(evt.target){
              evt.preventDefault();
              }else{
              evt.returnValue = false;
              }
}