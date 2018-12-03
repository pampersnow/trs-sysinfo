/**
 * 
 */
package com.sys.service;

import java.util.List;

import com.sys.pojo.Referer;

/**
 * Copyright (C) Beijing TRS information technology co. LTD.In
 * 
 * @ClassName: SiteInfo
 * @Description: 访问来源业务逻辑
 * @author JYB
 * @date 2018年9月23日  11:12:40
 * @version 1.00
 */
public interface RefererService {
	/**
	 * @Description: 首页访问来源统计
	 * @param Referer 
	 */
	List<Referer> getfererCount(int siteid)throws Exception;
	
	/**
	 * @Description: 首页访问今日热点文章
	 * @param Referer 
	 */
	List<Referer> getHotArticlesDay(int siteid)throws Exception;
	
	/**
	 * @Description: 首页访问今日热点文章
	 * @param Referer 
	 */
	List<Referer> getSite()throws Exception;
}
