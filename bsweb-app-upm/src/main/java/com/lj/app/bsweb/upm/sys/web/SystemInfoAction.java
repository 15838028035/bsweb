package com.lj.app.bsweb.upm.sys.web;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.UpmUser;
import com.lj.app.core.common.base.service.BaseService;

/**
 * 
 * 系统信息
 *
 */
@Controller
@Namespace("/sys")
@Results({
      @Result(name = "systemInfo", location = "/systemInfo.jsp")
      })

@Action("systemInfoAction")
public class SystemInfoAction extends AbstractBaseUpmAction<UpmUser> {

  static final long MEGABYTE = 1048576L;

  private String systemInfo;

  @Override
  public UpmUser getModel() {
    return null;
  }

  @Override
  protected void prepareModel() throws Exception {

  }

  @Override
  public BaseService<UpmUser> getBaseService() {
    return null;
  }

  /**
   * 系统信息属性
   * @return map
   */
  public static Map<String, String> getSystemProperties() {
    Properties sysProps = System.getProperties();
    Map<String, String> props = new ListOrderedMap();
    props.put("系统日期", DateFormat.getDateInstance().format(new Date()));
    props.put("系统时间", DateFormat.getTimeInstance().format(new Date()));
    props.put("当前目录", getCurrentDirectory());

    props.put("Java版本", sysProps.getProperty("java.version"));
    props.put("Java提供商", sysProps.getProperty("java.vendor"));
    props.put("虚拟机版本", sysProps.getProperty("java.vm.specification.version"));
    props.put("JVM提供商", sysProps.getProperty("java.vm.specification.vendor"));
    props.put("JVM实现版本", sysProps.getProperty("java.vm.version"));
    props.put("Java运行名称", sysProps.getProperty("java.runtime.name"));
    props.put("Java VM", sysProps.getProperty("java.vm.name"));

    props.put("用户名", sysProps.getProperty("user.name"));
    props.put("用户所在时区", sysProps.getProperty("user.timezone"));

    props.put("操作系统", sysProps.getProperty("os.name") + " " + sysProps.getProperty("os.version"));
    props.put("操作系统架构", sysProps.getProperty("os.arch"));

    return props;
  }

  private static String getCurrentDirectory() {
    try {
      return new File(".").getCanonicalPath();
    } catch (IOException e) {
      return "<undefined>";
    }
  }

  /**
   * 获取jvm信息
   * @return map
   */
  public Map<String, String> getJvmStatistics() {
    Map<String, String> stats = new ListOrderedMap();
    stats.put("Total Memory", "" + getTotalMemory() + "MB");
    stats.put("Free Memory", "" + getFreeMemory() + "MB");
    stats.put("Used Memory", "" + getUsedMemory() + "MB");
    return stats;
  }

  public long getTotalMemory() {
    return Runtime.getRuntime().totalMemory() / MEGABYTE;
  }

  public long getFreeMemory() {
    return Runtime.getRuntime().freeMemory() / MEGABYTE;
  }

  public long getUsedMemory() {
    return getTotalMemory() - getFreeMemory();
  }

  /**
   * 打印服务器信息
   * 
   * @return 页面
   */
  public String printSysInfo() {
    StringBuilder buf = new StringBuilder();
    buf.append(propertiesMapToString("服务器信息", getSystemProperties()));
    systemInfo = buf.toString();
    return "systemInfo";
  }

  @Override
  public String toString() {
    StringBuilder buf = new StringBuilder();
    buf.append(propertiesMapToString("系统信息", getSystemProperties()));
    return buf.toString();
  }

  private static String propertiesMapToString(String mapName, Map<String, String> properties) {
    StringBuilder buf = new StringBuilder();
    buf.append("<h3>" + mapName + "</h3>");
    buf.append("<hr/>");

    Iterator<String> iterator = properties.keySet().iterator();
    while (iterator.hasNext()) {
      String name = (String) iterator.next();
      String value = (String) properties.get(name);
      buf.append("<div>   ");
      buf.append(StringUtils.rightPad(name + ":", 30));
      buf.append(value).append("</div>");
    }
    return buf.toString();
  }

  public String getSystemInfo() {
    return systemInfo;
  }

  public void setSystemInfo(String systemInfo) {
    this.systemInfo = systemInfo;
  }

}
