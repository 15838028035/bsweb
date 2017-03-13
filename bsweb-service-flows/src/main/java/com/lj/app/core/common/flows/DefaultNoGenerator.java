package com.lj.app.core.common.flows;

import java.util.Random;

import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.util.DateUtil;

/**
 * 默认的流程实例编号生成器
 * 编号生成规则为:yyyyMMdd-HH:mm:ss-SSS-random
 */
public class DefaultNoGenerator implements INoGenerator {
	public String generate(ProcessModel model) {
		//一定要确保流程编号的唯一性
		String time =DateUtil.getNowDate("yyyyMMdd-HH:mm:ss-SSS");
		Random random = new Random();
		return time + "-" + random.nextInt(1000);
	}
}