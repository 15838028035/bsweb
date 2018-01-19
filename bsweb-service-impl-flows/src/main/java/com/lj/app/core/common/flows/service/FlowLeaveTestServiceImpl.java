package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.flows.entity.FlowLeaveTest;

/**
 * 
 * 离职
 *
 */
@Service("flowLeaveTestService")
public class FlowLeaveTestServiceImpl extends BaseServiceImpl<FlowLeaveTest> implements FlowLeaveTestService,Serializable{

}
