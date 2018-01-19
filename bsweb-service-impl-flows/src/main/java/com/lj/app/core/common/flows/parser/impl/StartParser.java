package com.lj.app.core.common.flows.parser.impl;

import com.lj.app.core.common.flows.model.NodeModel;
import com.lj.app.core.common.flows.model.StartModel;
import com.lj.app.core.common.flows.parser.AbstractNodeParser;

/**
 * 
 * 开始节点
 *
 */
public class StartParser extends AbstractNodeParser {
  /**
   * 产生StartModel模型对象
   */
  protected NodeModel newModel() {
    return new StartModel();
  }

}