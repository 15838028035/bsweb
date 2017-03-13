package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * @title :流程任务表
 * @description :FlowTaskService
 * @author: liujie
 * @date: 2016-10-18 10:40:15
 */
@Service("flowTaskService")
public class FlowTaskServiceImpl<FlowTask> extends BaseServiceImpl<FlowTask> implements FlowTaskService<FlowTask>,Serializable{

}