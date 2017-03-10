package com.lj.app.bsweb.redis.manage.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.core.common.util.AjaxResult;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.Struts2Utils;
import com.lj.app.core.redis.service.RedisService;

@Controller
@Namespace("/")
@Results({
		@Result(name = "INDEX", location = "/index.jsp")
})

@Action("IndexAction")
public class IndexAction {


	@Autowired
	private RedisService redisService;
	
	private String redisKey;
	
	private String redisValue;
	
	public String index() throws Exception {
		return "manager-index";
	}
	
	/*
	 * 删除redis
	 */
	public void removeRedisKey() {
        
        AjaxResult ar = new AjaxResult();
        ar.setOpResult("操作成功");
        
        if (StringUtil.isBlank(redisKey)) {
        	
        }
        try {
            redisService.del(redisKey.trim());
        } catch (Exception e) {
        	 ar.setOpResult("操作失败");
        }
		
		Struts2Utils.renderJson(ar);
        
	}
	
	
	/**
	 * 批量删除redis
	 */
	public void  removeRedisKeyBatch() {
		  AjaxResult ar = new AjaxResult();
	       ar.setOpResult("操作成功");
	        
        if (StringUtil.isBlank(redisKey)) {
        }
        redisKey = redisKey.trim();
        if (redisKey.equals("*") || redisKey.equals("?")) {
        }
        try {
            redisService.delByPattern(redisKey);
        } catch (Exception e) {
        	 ar.setOpResult("操作失败");

        }
        Struts2Utils.renderJson(ar);
    }
	
	/**
	 * 获得redis
	 */
	 public  void getRedisValue() {
		  AjaxResult ar = new AjaxResult();
	        ar.setOpResult("操作成功");
	        
	        if (StringUtil.isBlank(redisKey)) {
	        }
	        try {
	        	ar.setOpResult((String)redisService.get(redisKey.trim()));
	        } catch (Exception e) {
	        	 ar.setOpResult("操作失败");
	        }
	        Struts2Utils.renderJson(ar);
	 }
	 
	 /**
	  * 设置redis
	  * @param redisKey
	  * @param redisValue
	  */
	 public void setRedisValue() {
		  AjaxResult ar = new AjaxResult();
	        ar.setOpResult("操作成功");
	        
	        if (StringUtil.isBlank(redisKey) || StringUtil.isBlank(redisValue)) {
	        }
	        try {
	            redisService.set(redisKey.trim(), redisValue.trim());
	        } catch (Exception e) {
	        	ar.setOpResult("操作失败");
	        }
	        Struts2Utils.renderJson(ar);
	}

	public RedisService getRedisService() {
		return redisService;
	}

	public void setRedisService(RedisService redisService) {
		this.redisService = redisService;
	}

	public String getRedisKey() {
		return redisKey;
	}

	public void setRedisKey(String redisKey) {
		this.redisKey = redisKey;
	}

	public void setRedisValue(String redisValue) {
		this.redisValue = redisValue;
	}
	 
	 
}