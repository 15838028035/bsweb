<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.service;

import com.lj.app.core.common.base.service.BaseService;

/**
 * @title :${table.remarks}
 * @description :${className}Service
 * @author: ${author}
 * @date: ${now?string("yyyy-MM-dd HH:mm:ss")}
 */
public interface ${className}Service<${className}> extends BaseService {

}
