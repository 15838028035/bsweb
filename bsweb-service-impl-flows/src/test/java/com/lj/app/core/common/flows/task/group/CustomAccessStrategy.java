package com.lj.app.core.common.flows.task.group;

import java.util.ArrayList;
import java.util.List;

import com.lj.app.core.common.flows.service.GeneralAccessStrategyServiceImpl;

public class CustomAccessStrategy extends GeneralAccessStrategyServiceImpl {

  @Override
  protected List<String> ensureGroup(String operator) {
    List<String> groups = new ArrayList<String>();
    if (operator.equals("test")) {
      groups.add("test");
    } else {
      groups.add("role1");
    }
    return groups;
  }
}
