package com.lj.app.core.common.flows.service;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;

/**
 * 
 * 借款测试服务
 *
 * @param <FlowBorrowTest>
 *          借款测试
 */
@Service("flowBorrowTestService")
public class FlowBorrowTestServiceImpl<FlowBorrowTest> extends BaseServiceImpl<FlowBorrowTest>
    implements FlowBorrowTestService<FlowBorrowTest> {
}
