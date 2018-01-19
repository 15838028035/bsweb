package com.lj.app.core.common.flows.parser.impl;

import org.w3c.dom.Element;

import com.lj.app.core.common.flows.model.ExtTaskModel;
import com.lj.app.core.common.flows.model.NodeModel;

/**
 * 
 * 任务节点解析类
 *
 */
public class ExtTaskParser extends TaskParser {
  private static final String ATTR_ASSIGNEEDISPLAY = "assigneeDisplay";

  @Override
  protected void parseNode(NodeModel node, Element element) {
    super.parseNode(node, element);
    ExtTaskModel task = (ExtTaskModel) node;
    task.setAssigneeDisplay(element.getAttribute(ATTR_ASSIGNEEDISPLAY));
  }

  @Override
  protected NodeModel newModel() {
    return new ExtTaskModel();
  }
}
