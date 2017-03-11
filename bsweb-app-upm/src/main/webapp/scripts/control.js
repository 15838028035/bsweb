// JavaScript Document
var contralEffect = function(){
	function containEffect(){
		$(".contain_icon").click(function(){
			$(this).toggleClass("contain_icon_active");
			$(this).parent().parent().parent().next(".contain_search").slideToggle("fast");
		});
	}
	function menuEffect(){
		//$(".LT_Fr_wrap li").eq(0).addClass("colorOrange");
		$(".LT_Fr_wrap li").click(function(){
				$(this).siblings().removeClass("colorOrange");
				$(this).addClass("colorOrange");							   
		});	
	}
	function slideMenu(){
		if($.browser.msie){
			var slideMenuHtml = "<div class='slideMenuBox' style='display:none;'><div class='slideMB_title'></div><div class='slideMB_top'></div><div class='slideMB_con'><div class='slideMB_con_wrap'><ul><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon001'></div></span></div><div class='float_lef'><span class='marg_lef5'>趋势分析</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li></ul></div></div><div class='slideMB_bot'><div class='slideMB_bot_wrap'><div class='hideSlideMenu'></div></div></div></div>";
			var slideMenuHtml1 = "<div class='slideMenuBox' style='display:none;'><div class='slideMB_title'></div><div class='slideMB_top'></div><div class='slideMB_con'><div class='slideMB_con_wrap'><ul><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon003'></div></span></div><div class='float_lef'><span class='marg_lef5'>http模拟</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon004'></div></span></div><div class='float_lef'><span class='marg_lef5'>短信模拟</span></div><div class='clear'></div></li></ul></div></div><div class='slideMB_bot'><div class='slideMB_bot_wrap'><div class='hideSlideMenu'></div></div></div></div>";
			var slideMenuHtml2 = "<div class='slideMenuBox' style='display:none;'><div class='slideMB_title'></div><div class='slideMB_top'></div><div class='slideMB_con'><div class='slideMB_con_wrap'><ul><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon003'></div></span></div><div class='float_lef'><span class='marg_lef5'>虚拟数据中心管理</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon004'></div></span></div><div class='float_lef'><span class='marg_lef5'>资源申请</span></div><div class='clear'></div></li></ul></div></div><div class='slideMB_bot'><div class='slideMB_bot_wrap'><div class='hideSlideMenu'></div></div></div></div>";
			$(".SME1").append(slideMenuHtml);
			$(".SME2").append(slideMenuHtml1);
			$(".SME3").append(slideMenuHtml2);
			$(".slideMenuElement table").click(function(){
				$(this).parent().siblings(".slideMenuElement").children(".slideMenuBox").slideUp("fast");
				$(this).next().stop().slideDown("fast");
			});
			$(".LT_hd_li table").click(function(){
				$(this).parent().siblings(".slideMenuElement").children(".slideMenuBox").slideUp("fast");								
			});	
			$("#LT_main").contents().find("html").click(function(){
				 $(".slideMenuBox").slideUp("fast");					  
			});
			$("#LT_left").click(function(){
				 $(".slideMenuBox").slideUp("fast");					  
			});
			$(".hideSlideMenu").click(function(){
				$(this).parent().parent().parent().slideUp("fast");
			});
			$(".slideMB_con_wrap ul li").click(function(){
				$(this).parent().parent().parent().parent().slideUp("fast");
			});
			$(".slideMB_con_wrap ul li").hover(function(){
				$(this).addClass("slideMB_con_li_active");									
			},function(){
				$(this).removeClass("slideMB_con_li_active");
			});
			$(".LT_Fr_wrap li").click(function(){
				$(this).siblings().removeClass("colorOrange");
				$(this).addClass("colorOrange");							   
			});
		}else{
			var slideMenuHtml = "<div class='slideMenuBox'><div class='slideMB_title'></div><div class='slideMB_top'></div><div class='slideMB_con'><div class='slideMB_con_wrap'><ul><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon001'></div></span></div><div class='float_lef'><span class='marg_lef5'>趋势分析</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon002'></div></span></div><div class='float_lef'><span class='marg_lef5 smc'>业务流程监控</span></div><div class='clear'></div></li></ul></div></div><div class='slideMB_bot'><div class='slideMB_bot_wrap'><div class='hideSlideMenu'></div></div></div></div>";
			var slideMenuHtml1 = "<div class='slideMenuBox'><div class='slideMB_title'></div><div class='slideMB_top'></div><div class='slideMB_con'><div class='slideMB_con_wrap'><ul><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon003'></div></span></div><div class='float_lef'><span class='marg_lef5'>http模拟</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon004'></div></span></div><div class='float_lef'><span class='marg_lef5'>短信模拟</span></div><div class='clear'></div></li></ul></div></div><div class='slideMB_bot'><div class='slideMB_bot_wrap'><div class='hideSlideMenu'></div></div></div></div>";
			var slideMenuHtml2 = "<div class='slideMenuBox' style='display:none;'><div class='slideMB_title'></div><div class='slideMB_top'></div><div class='slideMB_con'><div class='slideMB_con_wrap'><ul><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon003'></div></span></div><div class='float_lef'><span class='marg_lef5'>虚拟数据中心管理</span></div><div class='clear'></div></li><li><div class='float_lef'><span class='marg_lef5'><div class='slidemenuicon004'></div></span></div><div class='float_lef'><span class='marg_lef5'>资源申请</span></div><div class='clear'></div></li></ul></div></div><div class='slideMB_bot'><div class='slideMB_bot_wrap'><div class='hideSlideMenu'></div></div></div></div>";
			$(".SME1").append(slideMenuHtml);
			$(".SME2").append(slideMenuHtml1);
			$(".SME3").append(slideMenuHtml2);
			$(".slideMenuBox").css({"opacity":"0","display":"none"});
			$(".slideMenuElement table").click(function(){
				$(this).parent().siblings(".slideMenuElement").children(".slideMenuBox").stop().fadeTo(650, 0).css({"display":"none"});
				$(this).next().css('display','block').stop().fadeTo(650, 1);
			});
			$(".LT_hd_li table").click(function(){
				$(this).parent().siblings(".slideMenuElement").children(".slideMenuBox").stop().fadeTo(650, 0).css({"display":"none"});								
			});
			$(".hideSlideMenu").click(function(){
				$(this).parent().parent().parent().stop().fadeTo(650, 0).css({"display":"none"});
			});
			$(".slideMB_con_wrap ul li").click(function(){
				$(this).parent().parent().parent().parent().stop().fadeTo(650, 0).css({"display":"none"});
			});
			$(".slideMB_con_wrap ul li").hover(function(){
				$(this).addClass("slideMB_con_li_active");									
			},function(){
				$(this).removeClass("slideMB_con_li_active");
			});
			$("#LT_main").contents().find("html").click(function(){
				 $(".slideMenuBox").stop().fadeTo(650, 0).css({"display":"none"});					  
			});
			$("#LT_left").click(function(){
				 $(".slideMenuBox").stop().fadeTo(650, 0).css({"display":"none"});					  
			});
			$(".LT_Fr_wrap li").click(function(){
				$(this).siblings().removeClass("colorOrange");
				$(this).addClass("colorOrange");							   
			});
		}
	}
	function tablegrid(){
				  /**
		 * 表格 zebra crossing & hover & click 效果插件
		 *
		 * @author     Akon(番茄红了) <aultoale@gmail.com>
		 * @copyright  Copyright (c) 2008 (http://www.tblog.com.cn)
		 * @license    http://www.gnu.org/licenses/gpl.html     GPL 3
		 *
		 * @example $('table').tablegrid();
		 *
		 * @params {oddColor, evenColor, overColor, selColor, useClick}
		 * oddColor  : 奇数行背景色
		 * evenColor : 偶数行背景色
		 * overColor : 鼠标悬停时背景色
		 * selColor  : 行选中时背景色
		 * useClick  : 是否启用点击选中
		 */
		
		$('.datalist>table').tablegrid(); //如果不做任何设置则可以直接这样调用
		$('.datalist>table').tablegrid({
			oddColor  : '#f9f9f9', //奇数行背景色
			evenColor : '#F0F0F0', //偶数行背景色
			overColor : '#C0D0E0', //鼠标悬停时背景色
			selColor  : '#FFCC99', //行选中时背景色
			useClick  : true       //是否启用点击选中
		});
		 
		$.fn.tablegrid = function(params){
			var options = {
				oddColor   : '#E0EFFA',
				evenColor  : '#F2F9FD',
				overColor  : '#C0D0E0',
				selColor   : '#FFCC99',
				useClick   : false
			};
			$.extend(options, params);
			$(this).each(function(){
				$(this).find('tr:odd > td').css('backgroundColor', options.oddColor);
				$(this).find('tr:even > td').css('backgroundColor', options.evenColor);
				$(this).find('tr').each(function(){
					this.origColor = $(this).find('td').css('backgroundColor');
					this.clicked = false;
					if (options.useClick) {
						$(this).click(function(){
							if (this.clicked) {
								$(this).find('td').css('backgroundColor', this.origColor);
								this.clicked = false;
							} else {
								$(this).find('td').css('backgroundColor', options.selColor);
								this.clicked = true;
							}
							$(this).find('td > input[@type=checkbox]').attr('checked', this.clicked);
						});
					}
					$(this).mouseover(function(){
						$(this).find('td').css('backgroundColor', options.overColor);
					});
					$(this).mouseout(function(){
						if (this.clicked) {
							$(this).find('td').css('backgroundColor', options.selColor);
						} else {
							$(this).find('td').css('backgroundColor', this.origColor);
						}
					});
				});
			});
		}; 

	}
	function SmcEffe(){
		$(".menu_SMC").children("ul").css({"display":"block","padding-left":"0px"});
		$(".menu_SMC").css({"display":"none"}).stop().fadeTo(650, 0);
		$(".smc").click(function(){
			$(".menu_index").stop().fadeTo(650, 0).css('display','none');
			$(".menu_SMC").css('display','block').stop().fadeTo(650, 1);
		});
		$(".Smc_check").click(function(){
									   
		});
	}
	function buttonInner(){//按钮效果
			$(".window_button_centerInput1").before('<td class="window_button_left"></td>').after('<td class="window_button_right"></td>').wrap('<td class="window_button_center"></td>');
		$(".window_button").wrapInner('<table cellpadding="0" cellspacing="0" border="0" class="window_button_blue"><tr></tr></table>');
			//window button
	$(".window_button_blue").mouseover(function(){
			$(this).children().find(".window_button_left").addClass("window_button_leftHover");
			$(this).children().find(".window_button_center").addClass("window_button_centerHover");
			$(this).children().find(".window_button_right").addClass("window_button_rightHover");
	});
	$(".window_button_blue").mousedown(function(){
			$(this).children().find(".window_button_left").addClass("window_button_leftDown");
			$(this).children().find(".window_button_center").addClass("window_button_centerHoverDown");
			$(this).children().find(".window_button_right").addClass("window_button_rightHoverDown");
	});
	$(".window_button_blue").mouseup(function(){
			$(this).children().find(".window_button_left").removeClass("window_button_leftDown");
			$(this).children().find(".window_button_center").removeClass("window_button_centerHoverDown");
			$(this).children().find(".window_button_right").removeClass("window_button_rightHoverDown");
	});
	$(".window_button_blue").mouseout(function(){
			$(this).children().find(".window_button_left").removeClass("window_button_leftHover");
			$(this).children().find(".window_button_center").removeClass("window_button_centerHover");
			$(this).children().find(".window_button_right").removeClass("window_button_rightHover");
	});
	//window bluebutton
		//window button
	$(".window_button_blue").mouseover(function(){
			$(this).children().find(".window_button_left").addClass("window_button_leftHover");
			$(this).children().find(".window_button_center").addClass("window_button_centerHover");
			$(this).children().find(".window_button_right").addClass("window_button_rightHover");
			$(this).children().find(".window_button_centerInput").addClass("window_button_centerInputHover");
	});
	$(".window_button_blue").mousedown(function(){
			$(this).children().find(".window_button_left").addClass("window_button_leftDown");
			$(this).children().find(".window_button_center").addClass("window_button_centerHoverDown");
			$(this).children().find(".window_button_right").addClass("window_button_rightHoverDown");
			$(this).children().find(".window_button_centerInput").addClass("window_button_centerInputDown");
	});
	$(".window_button_blue").mouseup(function(){
			$(this).children().find(".window_button_left").removeClass("window_button_leftDown");
			$(this).children().find(".window_button_center").removeClass("window_button_centerHoverDown");
			$(this).children().find(".window_button_right").removeClass("window_button_rightHoverDown");
			$(this).children().find(".window_button_centerInput").removeClass("window_button_centerInputDown");
	});
	$(".window_button_blue").mouseout(function(){
			$(this).children().find(".window_button_left").removeClass("window_button_leftHover");
			$(this).children().find(".window_button_center").removeClass("window_button_centerHover");
			$(this).children().find(".window_button_right").removeClass("window_button_rightHover");
			$(this).children().find(".window_button_centerInput").removeClass("window_button_centerInputHover");
	});

	}
	return{
		menu:menuEffect,
		contain:containEffect,
		slideMenu:slideMenu,
		tablelist:tablegrid,
		Smc:SmcEffe,
		blueButton:buttonInner
	}
}();