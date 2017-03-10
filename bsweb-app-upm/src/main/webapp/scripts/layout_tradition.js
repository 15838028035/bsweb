// JavaScript Document
var layout_Tradition = function(){
	var leftW;
	//页面布局
	function layout_T_layout(leftWidth){
		var DomW = document.documentElement.clientWidth;//取得dom的文档的宽度
		var DomH = document.documentElement.clientHeight;//取得dom的文档的高度
		if(DomW<500){DomW=500}
		if(DomH<300){DomH=300}
		//$("body").attr("scroll","no");
		leftW = leftWidth;
		$("#LT_left").width(leftWidth);
		var H = DomH-41-26+"px";
		var LT_menu_H = DomH-41-26-20+"px";
		$("#LT_left").height(H);
		$("#LT_menu").height(LT_menu_H);
		$("#LT_hide_ELe").height(H);
		$("#LT_hide_ELe").css({left:leftWidth});
		$("#LT_show_ELe").height(H);
		var maniW = DomW - leftWidth-9;
		var mainLeft = leftWidth+9;
		$("#LT_main").height(H);
		$("#LT_main").css({width:maniW,left:mainLeft});
		//点击收缩按钮收缩左侧菜单
		$("#LT_hide_ELe").click(function(){
			var mainWhide = DomW-9+"px";
			$(this).hide(10);
			$("#LT_show_ELe").show(10);
			$("#LT_left").hide(10);
			$("#LT_main").css({width:mainWhide,left:"9px"});
		});
		$("#LT_show_ELe").click(function(){
			$(this).hide(10);
			$("#LT_hide_ELe").show(10);
			$("#LT_left").show(10);
			$("#LT_main").css({width:maniW,left:mainLeft});
		});
		//当点击收缩按钮左侧收缩后resize和保持原有的收缩布局
		if($("#LT_show_ELe").css("display")==="block"){
			var mainWhide = DomW-9+"px";
			$("#LT_main").css({width:mainWhide,left:"9px"});
		}
		
	}
	//顶部menu
	function layout_T_Menu(){
		$(".LT_Fr_wrap li").prepend("<div class='LT_hd_li_hover'></div>");
		$(".LT_hd_li_hover").css('opacity', 0).hover(function(){
			$(this).stop().fadeTo(650, 1);
		},function(){
			$(this).stop().fadeTo(650, 0);
		});
		$(".LT_Fr_wrap li table").hover(function(){
			$(this).prev().stop().fadeTo(650, 1);
		},function(){
			$(this).prev().stop().fadeTo(650, 0);
		});
	}
	//左侧submenu
	function layout_T_Submenu(){
			//submenu
			$(".LT_SM_wrap>ul").hide();
			$(".LT_SM_wrap p").eq("0").addClass("LT_submenu_p_check");
			$(".LT_SM_wrap>ul").eq("0").slideDown("fast");
			$(".LT_submenu_p").click(function(){
				$(this).siblings("ul").slideUp("fast");
				$(this).siblings(".LT_submenu_p").removeClass("LT_submenu_p_check");
				$(this).addClass("LT_submenu_p_check");
				$(this).next("ul").slideDown();
			});
			//submenu li hover
			$(".LT_SM_wrap li").prepend("<div class='LT_SM_li_hover'></div>");
			$(".LT_SM_li_hover").css('opacity', 0).hover(function(){
				$(this).stop().fadeTo(650, 1);
				$(this).next().addClass("LT_SM_li_hover_active");
			},function(){
				$(this).stop().fadeTo(650, 0);
				$(this).next().removeClass("LT_SM_li_hover_active");
			});
			$(".LT_SM_wrap li table").hover(function(){
				$(this).addClass("LT_SM_li_hover_active");
				$(this).prev().stop().fadeTo(650, 1);
			},function(){
				$(this).removeClass("LT_SM_li_hover_active");
				$(this).prev().stop().fadeTo(650, 0);
			});
	}
	return{
		layout:layout_T_layout,
		menu:layout_T_Menu,
		submenu:layout_T_Submenu
	}

}();