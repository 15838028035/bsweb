package com.lj.app.core.common.flows.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 配置属性帮助类
 */
public class ConfigHelper {
	private static final transient Log log = LogFactory.getLog(ConfigHelper.class);

	/**
	 * 常用配置属性文件名称.
	 */
	private final static String PROPERTIES_FILENAME = "flow_config.properties";
	/**
	 * 配置属性对象静态化
	 */
	private static Properties properties;

	public static Properties getProperties() {
		if (properties == null) {
			synchronized (ConfigHelper.class) {
				if (properties == null) {
					loadProperties(PROPERTIES_FILENAME);
				}
			}
		}
		return properties;
	}

	/**
	 * 根据key获取配置的字符串value值
	 * 
	 * @param key
	 * @return
	 */
	public static String getProperty(String key) {
		if (key == null) {
			return null;
		}
		return getProperties().getProperty(key);
	}

	/**
	 * 根据key获取配置的数字value值
	 * 
	 * @param key
	 * @return
	 */
	public static int getNumerProperty(String key) {
		String value = getProperties().getProperty(key);
		if (NumberUtils.isNumber(value)) {
			return Integer.parseInt(value);
		} else {
			return 0;
		}
	}

	public static void loadProperties(Properties props) {
		properties = props;
	}

	/**
	 * 根据指定的文件名称，从类路径中加载属性文件，构造Properties对象
	 * 
	 * @param filename
	 *            属性文件名称
	 */
	public static void loadProperties(String filename) {
		InputStream in = null;
		ClassLoader threadContextClassLoader = Thread.currentThread().getContextClassLoader();
		properties = new Properties();
		if (threadContextClassLoader != null) {
			in = threadContextClassLoader.getResourceAsStream(filename);
		}
		if (in == null) {
			in = ConfigHelper.class.getResourceAsStream(filename);
			if (in == null) {
				log.warn("No properties file found in the classpath by filename " + filename);
			}
		} else {
			try {
				properties.load(in);
				log.info("Properties read " + properties);
			} catch (Exception e) {
				log.error("Error reading from " + filename, e);
			} finally {
				try {
					in.close();
				} catch (IOException e) {
					log.warn("IOException while closing InputStream: " + e.getMessage());
				}
			}
		}
	}

}