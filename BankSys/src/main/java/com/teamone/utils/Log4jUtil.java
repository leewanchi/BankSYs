package com.teamone.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.PropertyConfigurator;

public class Log4jUtil {
	/**
	 * 配置log4j文件
	 */
	public static Log log = LogFactory.getLog(Log4jUtil.class);
//	public static void loadingLog4j(){
//		PropertyConfigurator.configure("log4j.properties");
//	}
}
