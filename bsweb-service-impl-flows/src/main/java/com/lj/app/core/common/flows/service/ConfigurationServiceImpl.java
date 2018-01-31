package com.lj.app.core.common.flows.service;

import java.io.InputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.security.auth.login.Configuration;
import javax.xml.parsers.DocumentBuilder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionInterceptor;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.lj.app.core.common.exception.FlowException;
import com.lj.app.core.common.flows.Context;
import com.lj.app.core.common.flows.SimpleContext;
import com.lj.app.core.common.flows.core.ServiceContext;
import com.lj.app.core.common.flows.util.ConfigHelper;
import com.lj.app.core.common.flows.util.XmlHelper;
import com.lj.app.core.common.util.ClassUtil;
import com.lj.app.core.common.util.FileUtil;
import com.lj.app.core.common.util.SpringContextHolder;
import com.lj.app.core.common.util.StringUtil;

/**
 * 初始化依赖的服务
 */
@Service("configurationService")
public class ConfigurationServiceImpl implements ConfigurationService, Serializable {
  /**
   * 
   */
  private  final Log log = LogFactory.getLog(ConfigurationServiceImpl.class);
  private static final String BASE_CONFIG_FILE = "base.config.xml";
  private static final  String EXT_CONFIG_FILE = "ext.config.xml";
  private static final  String USER_CONFIG_FILE = "snaker.xml";
  /**
   * 事务拦截器抽象类
   */
  private TransactionInterceptor interceptor = null;
  /**
   * 需要事务管理的class类型
   */
  private Map<String, Class<?>> txClass = new HashMap<String, Class<?>>();

  /**
   * 无参构造方法，创建简单的Context实现类，并调用{@link Configuration#Configuration(Context)}
   */
  public ConfigurationServiceImpl() {
    this(new SimpleContext());
    parser();
  }

  /**
   * 根据服务查找实现类构造配置对象
   * 
   * @param context
   *          上下文实现
   */
  public ConfigurationServiceImpl(Context context) {
    ServiceContext.setContext(context);
  }

  /**
   * 构造SnakerEngine对象，用于api集成 通过SpringHelper调用
   * 
   * @return SnakerEngine
   * @throws FlowException 异常
   */
  public FlowEngine buildSnakerEngine() throws FlowException {
    if (log.isInfoEnabled()) {
      log.info("SnakerEngine start......");
    }
    parser();
    FlowEngine flowEngine = (FlowEngine) SpringContextHolder.getBean("flowEngine");

    if (flowEngine == null) {
      throw new FlowException("配置无法发现SnakerEngine的实现类");
    }
    if (log.isInfoEnabled()) {
      log.info("SnakerEngine be found:" + flowEngine.getClass());
    }
    return flowEngine.configure(this);
  }

  /**
   * 依次解析框架固定的配置及用户自定义的配置 固定配置文件:base.config.xml 扩展配置文件:ext.config.xml 用户自定义配置文件:snaker.xml
   */
  public void parser() {
    if (log.isDebugEnabled()) {
      log.debug("Service parsing start......");
    }

    // 默认使用snaker.xml配置自定义的bean
    String config = ConfigHelper.getProperty("config");
    if (StringUtil.isBlank(config)) {
      config = USER_CONFIG_FILE;
    }
    parser(config);
    parser(BASE_CONFIG_FILE);
    parser(EXT_CONFIG_FILE);
    for (Entry<String, Class<?>> entry : txClass.entrySet()) {
      /*
       * if(interceptor != null) { Object instance = interceptor.getProxy(entry.getValue());
       * ServiceContext.put(entry.getKey(), instance); } else { ServiceContext.put(entry.getKey(), entry.getValue()); }
       */
    }

    if (log.isDebugEnabled()) {
      log.debug("Service parsing finish......");
    }
  }

  /**
   * 解析给定resource配置，并注册到ServiceContext上下文中
   * 
   * @param resource
   *          资源
   */
  private void parser(String resource) {
    // 解析所有配置节点，并实例化class指定的类
    DocumentBuilder documentBuilder = XmlHelper.createDocumentBuilder();
    try {
      if (documentBuilder != null) {
        InputStream input = FileUtil.getResourceAsStream(resource);
        if (input == null)  {
          return;
        }
        Document doc = documentBuilder.parse(input);
        Element configElement = doc.getDocumentElement();
        NodeList nodeList = configElement.getChildNodes();
        int nodeSize = nodeList.getLength();
        for (int i = 0; i < nodeSize; i++) {
          Node node = nodeList.item(i);
          if (node.getNodeType() == Node.ELEMENT_NODE) {
            Element element = (Element) node;
            String name = element.getAttribute("name");
            String className = element.getAttribute("class");
            String proxy = element.getAttribute("proxy");
            if (StringUtil.isBlank(name)) {
              name = className;
            }
            if (ServiceContext.exist(name)) {
              log.warn("Duplicate name is:" + name);
              continue;
            }
            Class<?> clazz = ClassUtil.loadClass(className);
            if (TransactionInterceptor.class.isAssignableFrom(clazz)) {
              interceptor = (TransactionInterceptor) ClassUtil.instantiate(clazz);
              ServiceContext.put(name, interceptor);
              continue;
            }
            if (proxy != null && proxy.equalsIgnoreCase("transaction")) {
              txClass.put(name, clazz);
            } else {
              ServiceContext.put(name, clazz);
            }
          }
        }
      }
    } catch (Exception e) {
      log.error(e);
      throw new FlowException("资源解析失败，请检查配置文件[" + resource + "]", e.getCause());
    }
  }

  /**
   * 可装载自定义的属性配置文件
   * 
   * @param fileName
   *          属性文件名称
   * @return Configuration
   */
  public ConfigurationService initProperties(String fileName) {
    ConfigHelper.loadProperties(fileName);
    return this;
  }

  /**
   * 可装载已有的属性对象
   * 
   * @param properties
   *          属性对象
   * @return Configuration
   */
  public ConfigurationService initProperties(Properties properties) {
    ConfigHelper.loadProperties(properties);
    return this;
  }
}
