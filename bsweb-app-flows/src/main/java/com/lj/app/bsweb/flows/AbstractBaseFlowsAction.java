package com.lj.app.bsweb.flows;

import com.lj.app.core.common.web.AbstractBaseAction;

/**
 * 
 * action基类
 *
 * @param <T> T
 */
@SuppressWarnings("serial")
public abstract class AbstractBaseFlowsAction<T> extends AbstractBaseAction<T> {

  @Override
  public String list() throws Exception {
    return null;
  }

  @Override
  public String save() throws Exception {
    return null;
  }

  @Override
  public String input() throws Exception {
    return INPUT;
  }

  @Override
  public String delete() throws Exception {
    return null;
  }

}
