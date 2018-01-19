package com.lj.app.core.common.flows.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.Action;
import com.lj.app.core.common.flows.FlowInterceptor;
import com.lj.app.core.common.flows.core.Execution;
import com.lj.app.core.common.util.ClassUtil;
import com.lj.app.core.common.util.StringUtil;

/**
 * 节点元素（存在输入输出的变迁）
 */
public abstract class NodeModel extends BaseModel implements Action {
  /**
   * 
   */
  private static final long serialVersionUID = -2377317472320109317L;
  protected static final Log LOG = LogFactory.getLog(NodeModel.class);
  
  /**
   * 输入变迁集合
   */
  private List<TransitionModel> inputs = new ArrayList<TransitionModel>();
  /**
   * 输出变迁集合
   */
  private List<TransitionModel> outputs = new ArrayList<TransitionModel>();
  /**
   * layout
   */
  private String layout;
  /**
   * 局部前置拦截器
   */
  private String preInterceptors;
  /**
   * 局部后置拦截器
   */
  private String postInterceptors;
  /**
   * 前置局部拦截器实例集合
   */
  private List<FlowInterceptor> preInterceptorList = new ArrayList<FlowInterceptor>();
  /**
   * 后置局部拦截器实例集合
   */
  private List<FlowInterceptor> postInterceptorList = new ArrayList<FlowInterceptor>();

  /**
   * 具体节点模型需要完成的执行逻辑
   * 
   * @param execution
   *          执行对象
   */
  protected abstract void exec(Execution execution);

  /**
   * 对执行逻辑增加前置、后置拦截处理
   * 
   * @param execution
   *          执行对象
   */
  public void execute(Execution execution) {
    intercept(preInterceptorList, execution);
    exec(execution);
    intercept(postInterceptorList, execution);
  }

  /**
   * 运行变迁继续执行
   * 
   * @param execution
   *          执行对象
   */
  protected void runOutTransition(Execution execution) {
    for (TransitionModel tm : getOutputs()) {
      tm.setEnabled(true);
      tm.execute(execution);
    }
  }

  /**
   * 拦截方法
   * 
   * @param interceptorList
   *          拦截器列表
   * @param execution
   *          执行对象
   */
  private void intercept(List<FlowInterceptor> interceptorList, Execution execution) {
    try {
      for (FlowInterceptor interceptor : interceptorList) {
        interceptor.intercept(execution);
      }
    } catch (Exception e) {
      LOG.error("拦截器执行失败=" + e.getMessage());
      throw new FlowException(e);
    }
  }

  /**
   * 根据父节点模型、当前节点模型判断是否可退回。可退回条件： 1、满足中间无fork、join、subprocess模型 2、满足父节点模型如果为任务模型时，参与类型为any
   * 
   * @param parent
   *          父节点模型
   * @return 是否可以退回
   */
  public static boolean canRejected(NodeModel current, NodeModel parent) {
    if (parent instanceof TaskModel && !((TaskModel) parent).isPerformAny()) {
      return false;
    }
    boolean result = false;
    for (TransitionModel tm : current.getInputs()) {
      NodeModel source = tm.getSource();
      if (source == parent) {
        return true;
      }
      if (source instanceof ForkModel || source instanceof JoinModel || source instanceof SubProcessModel
          || source instanceof StartModel) {
        continue;
      }
      result = result || canRejected(source, parent);
    }
    return result;
  }

  /**
   * 获得下一个模型
   * @param clazz 类
   * @return 获得下一个模型
   */
  public <T> List<T> getNextModels(Class<T> clazz) {
    List<T> models = new ArrayList<T>();
    for (TransitionModel tm : this.getOutputs()) {
      addNextModels(models, tm, clazz);
    }
    return models;
  }

  protected <T> void addNextModels(List<T> models, TransitionModel tm, Class<T> clazz) {
    if (clazz.isInstance(tm.getTarget())) {
      models.add((T) tm.getTarget());
    } else {
      for (TransitionModel tm2 : tm.getTarget().getOutputs()) {
        addNextModels(models, tm2, clazz);
      }
    }
  }

  public List<TransitionModel> getInputs() {
    return inputs;
  }

  public void setInputs(List<TransitionModel> inputs) {
    this.inputs = inputs;
  }

  public List<TransitionModel> getOutputs() {
    return outputs;
  }

  public void setOutputs(List<TransitionModel> outputs) {
    this.outputs = outputs;
  }

  public String getLayout() {
    return layout;
  }

  public void setLayout(String layout) {
    this.layout = layout;
  }

  public String getPreInterceptors() {
    return preInterceptors;
  }

  /**
   * 拦截器
   * @param preInterceptors 拦截器
   */
  public void setPreInterceptors(String preInterceptors) {
    this.preInterceptors = preInterceptors;
    if (StringUtil.isNotBlank(preInterceptors)) {
      for (String interceptor : preInterceptors.split(",")) {
        FlowInterceptor instance = (FlowInterceptor) ClassUtil.newInstance(interceptor);
        if (instance != null) {
          this.preInterceptorList.add(instance);
        }
      }
    }
  }

  public String getPostInterceptors() {
    return postInterceptors;
  }

  /**
   * 拦截器
   * @param postInterceptors 拦截器
   */
  public void setPostInterceptors(String postInterceptors) {
    this.postInterceptors = postInterceptors;
    if (StringUtil.isNotBlank(postInterceptors)) {
      for (String interceptor : postInterceptors.split(",")) {
        FlowInterceptor instance = (FlowInterceptor) ClassUtil.newInstance(interceptor);
        if (instance != null) {
          this.postInterceptorList.add(instance);
        }
      }
    }
  }
}
