package com.lj.app.bsweb.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.bsweb.flows.entity.FlowLeaveTest;
import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * 
 * 离职
 *
 */
@Service("flowLeaveTestService")
public class FlowLeaveTestServiceImpl extends BaseServiceImpl<FlowLeaveTest>
    implements FlowLeaveTestService, Serializable {

}
