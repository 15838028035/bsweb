package com.lj.app.bsweb.upm.user.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.stereotype.Controller;

import com.lj.app.core.common.util.IdentifyingCodeUtil;

@Controller
@Namespace("/")
@Action("identifyingcode")

public class IdentifyingCodeAction{
	
	public String getIdentifyingCodeNew(){
		IdentifyingCodeUtil ddentifyingCodeUtil = new IdentifyingCodeUtil();
		return ddentifyingCodeUtil.getIdentifyingCodeNew();
	}
	
}
