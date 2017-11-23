package com.lj.app.core.common.flows.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.cache.Cache;
import com.lj.app.core.common.cache.CacheFactory;
import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.FlowConstains;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.parser.ModelParser;
import com.lj.app.core.common.util.Assert;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.FileUtil;
import com.lj.app.core.common.util.StringUtil;

/**
 * @title :流程定义表
 * @description :FlowProcessService
 * @author: liujie
 * @date: 2016-10-17 21:29:05
 */
@Service("flowProcessService")
public class FlowProcessServiceImpl<FlowProcess> extends BaseServiceImpl<FlowProcess> implements FlowProcessService<FlowProcess>,Serializable{

	private static final Log log = LogFactory.getLog(FlowProcessServiceImpl.class);
	
	private static final String DEFAULT_SEPARATOR = ".";
	/**
	 * 流程定义对象cache名称
	 */
	private static final String CACHE_ENTITY = "snaker.process.entity";
	/**
	 * 流程id、name的cache名称
	 */
	private static final String CACHE_NAME = "snaker.process.name";
	/**
	 * 实体cache(key=name,value=entity对象)
	 */
	private Cache  entityCache;
	/**
	 * 名称cache(key=id,value=name对象)
	 */
	private Cache nameCache;
	
	public static final Integer FLOW_CACHED_TIME = 60*60*24;//缓存一天

	/**
	 * 检查流程定义对象
	 * @param process 流程定义对象
	 * @param idOrName 流程定义id/name
	 */
	public void check(com.lj.app.core.common.flows.entity.FlowProcess process, String idOrName){
		
	}
	
	/**
	 * 保存流程定义
	 * @param process 流程定义对象
	 */
	public void saveFlowProcess(com.lj.app.core.common.flows.entity.FlowProcess process) throws Exception{
		this.insertObject(process);
	}
	
	/**
	 * 更新流程定义的类别
	 * @param id 流程定义id
	 * @param type 类别
	 */
	public void updateType(String id, String type)throws Exception{
		com.lj.app.core.common.flows.entity.FlowProcess entity = getProcessById(id);
		entity.setFlowType(type);
		this.updateObject(entity);
		cache(entity);
	}
	
	/**
	 * 缓存实体
	 * @param entity 流程定义对象
	 */
	private void cache(com.lj.app.core.common.flows.entity.FlowProcess entity) {
		Cache nameCache = ensureAvailableNameCache();
		Cache entityCache = ensureAvailableEntityCache();
		
		if(entity.getModel() == null && entity.getFlowContent() != null) {
			entity.setModel(ModelParser.parse(entity.getFlowContent()));
		}
		String processName = entity.getFlowName() + DEFAULT_SEPARATOR + entity.getFlowVersion();
		if(nameCache != null && entityCache != null) {
			if(log.isDebugEnabled()) {
				log.debug("cache process id is[{}],name is[{}]" + entity.getId() +  processName);
			}
			entityCache.add(processName, entity,FLOW_CACHED_TIME);
			nameCache.add(entity.getId().toString(), processName,FLOW_CACHED_TIME);
		} else {
			if(log.isDebugEnabled()) {
				log.debug("no cache implementation class");
			}
		}
}
	
	/**
	 * 根据主键ID获取流程定义对象
	 * @param id 流程定义id
	 * @return Process 流程定义对象
	 */
	public com.lj.app.core.common.flows.entity.FlowProcess getProcessById(String id) throws Exception{
		Assert.notNull(id);
		com.lj.app.core.common.flows.entity.FlowProcess entity = null;
		String processName;
		Cache nameCache = ensureAvailableNameCache();
		Cache entityCache = ensureAvailableEntityCache();
		if(nameCache != null && entityCache != null) {
			processName = (String)nameCache.get(id);
			if(StringUtil.isNotBlank(processName)) {
				entity =(com.lj.app.core.common.flows.entity.FlowProcess) entityCache.get(processName);
			}
		}
		if(entity != null) {
			if(log.isDebugEnabled()) {
				log.debug("obtain process[id={}] from cache." + id);
			}
			return entity;
		}
		entity = (com.lj.app.core.common.flows.entity.FlowProcess)this.getInfoByKey(id);
		if(entity != null) {
			if(log.isDebugEnabled()) {
				log.debug("obtain process[id={}] from database." +  id);
			}
			cache(entity);
		}
		return entity;
	}
	
	/**
	 * 根据流程name获取流程定义对象
	 * @param name 流程定义名称
	 * @return Process 流程定义对象
	 */
	public com.lj.app.core.common.flows.entity.FlowProcess getProcessByName(String name) throws Exception{
		return getProcessByVersion(name, null);
	}
	
	/**
	 * 根据流程name、version获取流程定义对象
	 * @param name 流程定义名称
	 * @param version 版本号
	 * @return Process 流程定义对象
	 */
	public com.lj.app.core.common.flows.entity.FlowProcess getProcessByVersion(String name, Integer version)throws Exception{
		if(version == null) {
			version = getLatestProcessVersion(name);
		}
		
		com.lj.app.core.common.flows.entity.FlowProcess  entity = null;
		String processName = name + DEFAULT_SEPARATOR + version;
		Cache entityCache = ensureAvailableEntityCache();
		if(entityCache != null) {
			entity = (com.lj.app.core.common.flows.entity.FlowProcess)entityCache.get(processName);
		}
		if(entity != null) {
			if(log.isDebugEnabled()) {
				log.debug("obtain process[name={}] from cache." + processName);
			}
			return entity;
		}

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("flowName", name);
		map.put("flowVersion", version);
		
		List<com.lj.app.core.common.flows.entity.FlowProcess > processs = this.queryForList(map);
		
		if(processs != null && !processs.isEmpty()) {
			if(log.isDebugEnabled()) {
				log.debug("obtain process[name={}] from database." + processName);
			}
			entity = processs.get(0);
			cache(entity);
		}
		return entity;
	}
	
	/**
	 * 根據InputStream輸入流，部署流程定义
	 * @param input 流程定义输入流
	 * @return String 流程定义id
	 */
	public String deploy(InputStream input){
		return deploy(input, null);
	}
	
	/**
	 * 根據input輸入流，部署流程定义
	 * @param input 流程定义输入流
	 * @param creator 创建人
	 * @return String 流程定义id
	 */
	public String deploy(String inputStr, String creator){
		InputStream input = FileUtil.getStreamFromString(inputStr);
		return deploy(input,creator);
	}
	
	/**
	 * 根據InputStream輸入流，部署流程定义
	 * @param input 流程定义输入流
	 * @param creator 创建人
	 * @return String 流程定义id
	 */
	public String deploy(InputStream input,String creator){
		Assert.notNull(input);
		try {
			
			
			InputStream input2=null;
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();  
			byte[] buffer = new byte[1024];  
			int len;  
			while ((len = input.read(buffer)) > -1 ) {  
			    baos.write(buffer, 0, len);  
			}  
			baos.flush();                
			
			
			InputStream stream1 = new ByteArrayInputStream(baos.toByteArray()); 
			InputStream stream2 = new ByteArrayInputStream(baos.toByteArray()); 
			
			byte[] bytes = FileUtil.readBytes(stream1);//FIXME:
			ProcessModel model = ModelParser.parse(stream2);
			
			Integer version = getLatestProcessVersion(model.getName());
			com.lj.app.core.common.flows.entity.FlowProcess entity = new com.lj.app.core.common.flows.entity.FlowProcess();
			entity.setFlowNo(StringUtil.getUUIDKey());
			if(version == null || version < 0) {
				entity.setFlowVersion(0);
			} else {
				entity.setFlowVersion(version + 1);
			}
			entity.setFlowName(model.getName());
			entity.setDisplayName(model.getDisplayName());
			
			entity.setLockStatus(FlowConstains.STATE_ACTIVE.toString());
			entity.setModel(model);
			entity.setFlowContent(bytes);
			entity.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
			entity.setCreateByUname(creator);
			insertObject(entity);
			cache(entity);
			return entity.getId().toString();
		} catch(Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			throw new FlowException(e.getMessage(), e.getCause());
		}
	}
	
	/**
	 * 根據InputStream輸入流，部署流程定义
	 * @param id 流程定义id
	 * @param input 流程定义xml内容
	 */
	public void redeploy(String id, String inputStr){
		InputStream input = FileUtil.getStreamFromString(inputStr);
		 redeploy(id,input);
	}
	
	/**
	 * 根據InputStream輸入流，部署流程定义
	 * @param id 流程定义id
	 * @param input 流程定义输入流
	 */
	public void redeploy(String id, InputStream input){
		Assert.notNull(input);
		try {
			com.lj.app.core.common.flows.entity.FlowProcess entity =(com.lj.app.core.common.flows.entity.FlowProcess) this.getProcessById(id);
			Assert.notNull(entity);
			String oldProcessName = entity.getFlowName();
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();  
			byte[] buffer = new byte[1024];  
			int len;  
			while ((len = input.read(buffer)) > -1 ) {  
			    baos.write(buffer, 0, len);  
			}  
			baos.flush();                
			
			
			InputStream stream1 = new ByteArrayInputStream(baos.toByteArray()); 
			InputStream stream2 = new ByteArrayInputStream(baos.toByteArray()); 
			
			byte[] bytes = FileUtil.readBytes(stream1);
			
			
			ProcessModel model = ModelParser.parse(bytes);
			entity.setModel(model);
			entity.setFlowName(model.getName());
			entity.setDisplayName(model.getDisplayName());
			entity.setFlowContent(bytes);
			entity.setInstanceUrl(model.getInstanceUrl());
			entity.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
			
			this.updateObject(entity);
			
			if(!oldProcessName.equalsIgnoreCase(entity.getFlowName())) {
				Cache entityCache = ensureAvailableEntityCache();
				if(entityCache != null) {
					entityCache.delete(oldProcessName + DEFAULT_SEPARATOR + entity.getFlowVersion());
				}
			}
			cache(entity);
			

		} catch(Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			throw new FlowException(e.getMessage(), e.getCause());
		}
	}
	
	/**
	 * 卸载指定的流程定义，只更新状态
	 * @param id 流程定义id
	 */
	public void undeploy(String id) throws Exception{
		com.lj.app.core.common.flows.entity.FlowProcess flowProcess = this.getProcessById(id);
		flowProcess.setStatus(FlowConstains.STATE_FINISH);
		this.updateObject(flowProcess);
		cache(flowProcess);
	}
	
	/**
	 * 谨慎使用.数据恢复非常痛苦，你懂得~~
	 * 级联删除指定流程定义的所有数据：
	 * 1.wf_process
	 * 2.wf_order,wf_hist_order
	 * 3.wf_task,wf_hist_task
	 * 4.wf_task_actor,wf_hist_task_actor
	 * 5.wf_cc_order
	 * @param id
	 */
	public void cascadeRemove(String id){
		
	}
	
	/**
	 * 获得流程最新版本
	 * @param flowName
	 * @return
	 */
	public int getLatestProcessVersion(String flowName)throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		map.put("flowName", flowName);
		map.put("sortColumns", " id desc");
		
		List list = this.queryForList("select",map);
		if(list!=null && list.size()>0) {
			return ((com.lj.app.core.common.flows.entity.FlowProcess)list.get(0)).getFlowVersion();
		}
		return 0;
	}
	
	/**
	 * 清除实体
	 * @param entity 流程定义对象
	 */
	private void clear(com.lj.app.core.common.flows.entity.FlowProcess entity) {
		Cache nameCache = ensureAvailableNameCache();
		Cache entityCache = ensureAvailableEntityCache();
		String processName = entity.getFlowName() + DEFAULT_SEPARATOR + entity.getFlowVersion();
		if(nameCache != null && entityCache != null) {
			nameCache.delete(entity.getId().toString());
			entityCache.delete(processName);
		}
	}
	
    private Cache ensureAvailableEntityCache() {
        Cache entityCache = ensureEntityCache();
		if(entityCache == null ) {
			nameCache =(Cache)CacheFactory.getCache().get(CACHE_ENTITY);
		}
        return entityCache;
    }
    
    private Cache ensureAvailableNameCache() {
        Cache nameCache = ensureNameCache();
		if(nameCache == null ) {
			nameCache =(Cache)CacheFactory.getCache().get(CACHE_NAME);
		}
        return nameCache;
    }

	public Cache ensureEntityCache() {
		return entityCache;
	}

	public void setEntity(Cache entityCache) {
		this.entityCache = entityCache;
	}

	public Cache ensureNameCache() {
		return nameCache;
	}

	public void setNameCache(Cache nameCache) {
		this.nameCache = nameCache;
	}
	
}
