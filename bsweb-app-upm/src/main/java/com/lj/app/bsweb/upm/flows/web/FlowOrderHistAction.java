package com.lj.app.bsweb.upm.flows.web;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.flows.entity.FlowOrderHist;
import com.lj.app.core.common.flows.service.FlowOrderHistService;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title 历史流程实例
 * @description :FlowOrderHistAction
 * @author: userName
 * @date: 2017-11-27 10:37:40
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/flows")
@Results({
    @Result(name = AbstractBaseAction.RELOAD, 
        location = "flowOrderHistAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT, 
        location = "/jsp/flows/flowOrderHist-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE_RESULT, 
        location = "flowOrderHistAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST_RESULT, 
        location = "/jsp/flows/flowOrderHistList.jsp", type = AbstractBaseAction.REDIRECT) 
    })

@Action("flowOrderHistAction")
public class FlowOrderHistAction extends AbstractBaseUpmAction<FlowOrderHist> {

  protected Logger logger = LoggerFactory.getLogger(FlowOrderHistAction.class);

  @Autowired
  private FlowOrderHistService flowOrderHistService;

  private FlowOrderHist flowOrderHist;

  public BaseService getBaseService() {
    return flowOrderHistService;
  }

  public FlowOrderHist getModel() {
    return flowOrderHist;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (flowOrderHist.getId() != null) {
      flowOrderHist = (FlowOrderHist) flowOrderHistService.getInfoByKey(flowOrderHist.getId());
    } else {
      flowOrderHist = new FlowOrderHist();
    }
  }

  public void setFlowOrderHist(FlowOrderHist flowOrderHist) {
    this.flowOrderHist = flowOrderHist;
  }

  public FlowOrderHist getFlowOrderHist() {
    return flowOrderHist;
  }

}
