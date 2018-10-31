package com.sys.service;
import java.util.List;
import com.sys.pojo.Qsfx;

/**
 * @author JYB
 *创建日期：2018-06-5 
 *创建时间：9:20
 *接口说明：趋势分析		
 */
public interface QsfxService {
	/**
	 * 查询当月访客量
	 * */
	Qsfx getDuringTheMonth()throws Exception;
	
	/**
	 * 查询当季访客量
	 * */
	Qsfx getInTheQuarter()throws Exception;
	
	/**
	 * 查询当年访客量
	 * */
	Qsfx getThatYear()throws Exception;
	
	/**
	 * 查询指定时间段每天访问量访客量
	 * */
	List<Qsfx> getTimeVisitorsCount()throws Exception; 
}
