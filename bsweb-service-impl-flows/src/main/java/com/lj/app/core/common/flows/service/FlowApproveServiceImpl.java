package com.lj.app.core.common.flows.service;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * 
 * 流程审批服务
 *
 * @param <FlowApprove>
 *          流程审批
 */
@Service("flowApproveService")
public class FlowApproveServiceImpl<FlowApprove> extends BaseServiceImpl<FlowApprove>
    implements FlowApproveService<FlowApprove>, Serializable {

}
