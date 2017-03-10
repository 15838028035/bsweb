<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

import org.springframework.stereotype.Service;

/**
 * @title :${table.remarks}
 * @description :${className}Service
 * @author: ${author}
 * @date: ${now?string("yyyy-MM-dd HH:mm:ss")}
 */
@Service("${classNameLower}Service")
public class ${className}ServiceImpl<${className}> extends BaseServiceImpl<${className}> implements ${className}Service<${className}>{

}
