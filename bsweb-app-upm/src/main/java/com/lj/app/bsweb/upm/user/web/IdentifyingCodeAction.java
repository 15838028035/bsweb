package com.lj.app.bsweb.upm.user.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.stereotype.Controller;

import com.lj.app.core.common.cache.CacheFactory;
import com.lj.app.core.common.util.IdentifyingCodeUtil;
import com.lj.app.core.common.web.Struts2Utils;

@Controller
@Namespace("/")
@Action("identifyingcode")

public class IdentifyingCodeAction{
	
	public String getIdentifyingCodeNew(){
		IdentifyingCodeUtil ddentifyingCodeUtil = new IdentifyingCodeUtil();
		 ddentifyingCodeUtil.getIdentifyingCodeNew();
		 String rand = (String) Struts2Utils.getSession().getAttribute("rand");
	      CacheFactory.getCache().add("IdentifyingCode"+rand, rand, 60*60);//验证码
		 return null;
	}
	
}
