package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * 
 * 流程任务表
 *
 * @param <FlowTask>
 *          流程任务表
 */
@Service("flowTaskService")
public class FlowTaskServiceImpl<FlowTask> extends BaseServiceImpl<FlowTask>
    implements FlowTaskService<FlowTask>, Serializable {

}