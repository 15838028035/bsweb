package com.lj.app.core.common.flows.service;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.lj.app.core.common.base.service.BaseServiceImpl;
import com.lj.app.core.common.flows.FlowConstains;

/**
 * 
 * 流程抄送
 *
 * @param <FlowCcorder> 流程抄送
 */
@Service("flowCcorderService")
public class FlowCcorderServiceImpl<FlowCcorder> extends BaseServiceImpl<FlowCcorder>
    implements FlowCcorderService<FlowCcorder> {

  /**
   * 创建实例的抄送
   * 
   * @param orderId
   *          orderId
   * @param creator
   *          创建人
   * @param actorIds
   *          参与人
   */
  public void createCcOrder(String orderId, String creator, String... actorIds) {
    for (String actorId : actorIds) {
      com.lj.app.core.common.flows.entity.FlowCcorder ccorder = new com.lj.app.core.common.flows.entity.FlowCcorder();
      ccorder.setOrderId(Integer.parseInt(orderId));
      ccorder.setActorId(actorId);
      ccorder.setCreator(creator);
      ccorder.setStatus(FlowConstains.STATE_ACTIVE);
      ccorder.setCreateTime(new Date());
      try {
        this.insertObject(ccorder);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}
