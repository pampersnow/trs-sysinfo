package com.sys.mapper;

import java.util.List;

import com.sys.pojo.Zqgk;

/**
 * @author JYB
 *创建日期：2018-06-1
 *创建时间：10:05
 *接口说明：站群概况		
 */
public interface ZqgkMapper {
	
	/**
	 * 查询当日总访问量
	 * */
	public Zqgk selectTotalVisits() throws Exception;
	
	/**
	 * 查询当日每小时的访问量
	 * */
	public List<Zqgk> getQueryHourCount()throws Exception;
	
	/**
	 * 查询总访问量
	 * */
	public Zqgk selectNum() throws Exception;
}
