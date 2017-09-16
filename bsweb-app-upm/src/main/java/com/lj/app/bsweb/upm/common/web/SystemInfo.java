package com.lj.app.bsweb.upm.common.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;

public class SystemInfo {
	private  static final long MEGABYTE = 1048576L;
	 
	 private Properties properties;
	
	 public static Map<String,String> getSystemProperties() {
	      Properties sysProps = System.getProperties();
	      Map<String,String> props = new HashMap<String,String>();
	      props.put("System Date", DateUtil.getNowDateYYYYMMddHHMMSS());
	      props.put("System Time", DateUtil.getNowDateYYYYMMddHHMMSS());
	      props.put("Current directory", getCurrentDirectory());

	      props.put("Java Version", sysProps.getProperty("java.version"));
	      props.put("Java Vendor", sysProps.getProperty("java.vendor"));
	      props.put("JVM Version", sysProps.getProperty("java.vm.specification.version"));
	      props.put("JVM Vendor", sysProps.getProperty("java.vm.specification.vendor"));
	      props.put("JVM Implementation Version", sysProps.getProperty("java.vm.version"));
	      props.put("Java Runtime", sysProps.getProperty("java.runtime.name"));
	      props.put("Java VM", sysProps.getProperty("java.vm.name"));

	      props.put("User Name", sysProps.getProperty("user.name"));
	      props.put("User Timezone", sysProps.getProperty("user.timezone"));

	      props.put("Operating System", sysProps.getProperty("os.name") + " " + sysProps.getProperty("os.version"));
	      props.put("OS Architecture", sysProps.getProperty("os.arch"));

	      return props;
	   }

	   private static String getCurrentDirectory() {
	      try {
	         return new File(".").getCanonicalPath();
	      } catch (IOException e) {
	         return "<undefined>";      }
	   }

	   public Map<String,String> getJVMStatistics() {
		   Map<String,String> stats = new HashMap<String,String>();
	      stats.put("Total Memory", "" + getTotalMemory() + "MB");
	      stats.put("Free Memory", "" + getFreeMemory() + "MB");
	      stats.put("Used Memory", "" + getUsedMemory() + "MB");
	      return stats;
	   }

	   public Map<String,String> getBuildInfo() {
		   Map<String,String> stats = new HashMap<String,String>();
	      stats.put("Version", properties.getProperty("BUILD_VERSION"));
	      stats.put("Build Date", properties.getProperty("BUILD_DATE_KEY"));
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

	   @Override
	public String toString() {
	      StringBuffer buf = new StringBuffer();
	      buf.append(propertiesMapToString("Build", getBuildInfo()));
	      buf.append(propertiesMapToString("System", getSystemProperties()));
	      return buf.toString();
	   }

	   private static String propertiesMapToString(String mapName, Map<String,String> properties) {
	      StringBuffer buf = new StringBuffer();
	      buf.append(mapName);
	      buf.append(":\n");

	      Iterator<String> iterator = properties.keySet().iterator();
	      while (iterator.hasNext()) {
	         String name = (String) iterator.next();
	         String value = (String) properties.get(name);
	         buf.append("   ");
	         buf.append(StringUtil.trimBlank(name+":"));
	         buf.append(value).append("\n");
	      }
	      buf.append("\n");
	      return buf.toString();
	}
}
