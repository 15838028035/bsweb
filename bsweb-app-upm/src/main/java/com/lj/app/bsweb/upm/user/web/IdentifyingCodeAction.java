package com.lj.app.bsweb.upm.user.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.stereotype.Controller;

import com.lj.app.core.common.cache.CacheFactory;

@Controller
@Namespace("/")
@Action("identifyingcode")

/**
 * 
 * 验证码管理
 *
 */
public class IdentifyingCodeAction {

  public String getIdentifyingCodeNew() {
    IdentifyingCodeUtil ddentifyingCodeUtil = new IdentifyingCodeUtil();
    ddentifyingCodeUtil.getIdentifyingCodeNew();
    String rand = (String) Struts2Utils.getSession().getAttribute("rand");
    CacheFactory.getCache().add("IdentifyingCode" + rand, rand, 1 * 60);// 验证码
    return null;
  }

}
