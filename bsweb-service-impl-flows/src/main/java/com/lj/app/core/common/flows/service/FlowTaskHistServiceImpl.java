package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * 
 * 流程任务表
 *
 * @param <FlowTaskHist>
 *          流程任务表
 */
@Service("flowTaskHistService")
public class FlowTaskHistServiceImpl<FlowTaskHist> extends BaseServiceImpl<FlowTaskHist>
    implements FlowTaskHistService<FlowTaskHist>, Serializable {

}
