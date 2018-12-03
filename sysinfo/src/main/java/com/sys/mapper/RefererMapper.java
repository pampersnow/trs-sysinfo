/**
 * 
 */
package com.sys.mapper;

import java.util.List;

import com.sys.pojo.Referer;

/**
 * Copyright (C) Beijing TRS information technology co. LTD.In
 * 
 * @ClassName: SiteInfo
 * @Description: 访问来源数据持久交互
 * @author JYB
 * @date 2018年9月23日 11:08:00
 * @version 1.00
 */
public interface RefererMapper {
	
	/**
	 * @Description: 首页访问来源统计
	 * @param Referer 
	 */
	List<Referer> selectRefererCount(int siteid)throws Exception;
	
	/**
	 * @Description: 首页访问今日热点文章
	 * @param Referer 
	 */
	List<Referer> selectHotArticlesDay(int siteid)throws Exception;
	
	/**
	 * @Description: 首页访问查询站点
	 * @param Referer 
	 */
	List<Referer> selectSite()throws Exception;
	
}
