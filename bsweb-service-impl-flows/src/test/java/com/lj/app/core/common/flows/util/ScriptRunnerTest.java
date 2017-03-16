package com.lj.app.core.common.flows.util;

import java.sql.Connection;

import org.junit.Test;

import com.lj.app.core.common.properties.PropertiesUtil;
import com.lj.app.core.common.util.DBUtil;

public class ScriptRunnerTest {
	@Test
	public void setUpRunEnvNew() {

		try {
			String driverClass = PropertiesUtil.getProperty("jdbc.driverClassName");
			String url = PropertiesUtil.getProperty("jdbc.url.server");
			String userName = PropertiesUtil.getProperty("jdbc.username");
			String password = PropertiesUtil.getProperty("jdbc.password");

			Connection conn = DBUtil.getConnection(driverClass, url, userName, password);
			ScriptRunner runner = new ScriptRunner(conn, true);
			runner.runScript("flows.sql");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
