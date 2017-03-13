package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * @title :流程任务表
 * @description :FlowTaskHistService
 * @author: liujie
 * @date: 2016-10-25 13:51:50
 */
@Service("flowTaskHistService")
public class FlowTaskHistServiceImpl<FlowTaskHist> extends BaseServiceImpl<FlowTaskHist> implements FlowTaskHistService<FlowTaskHist>,Serializable{

}
