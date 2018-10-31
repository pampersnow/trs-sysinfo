package com.sys.service;

import java.util.List;

import com.sys.pojo.Zqgk;

/**
 * @author JYB
 *创建日期：2018-06-1
 *创建时间：10:30
 *业务接口说明：站群概况		
 */
public interface ZqgkService {
	
	/**
	 * 获取当日总访问量
	 * */
	public Zqgk getTotalVisits() throws Exception;
	
	/**
	 * 获取时刻访问量
	 * */
	public List<Zqgk> getHourlyTraffic()throws Exception;
	
	public Zqgk getNum()throws Exception;
}
