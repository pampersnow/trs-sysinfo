package com.sys.mapper;
import java.util.List;

import com.sys.pojo.Qsfx;

/**
 * @author JYB
 *创建日期：2018-06-5 
 *创建时间：9:10
 *接口说明：趋势分析		
 */
public interface QsfxMapper {
	
	/**
	 * 查询当月访客量
	 * */
	public Qsfx selectDuringTheMonth()throws Exception;
	
	/**
	 * 查询当季访客量
	 * */
	public Qsfx selectInTheQuarter()throws Exception;
	
	/**
	 * 查询当年访客量
	 * */
	public Qsfx selectThatYear()throws Exception;
	
	/**
	 * 查询指定时间段每天访问量访客量
	 * */
	public List<Qsfx> selectTimeVisitorsCount()throws Exception; 
}
