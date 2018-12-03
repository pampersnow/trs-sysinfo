/**
 * 
 */
package com.sys.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.RefererMapper;
import com.sys.pojo.Referer;

/**
 * Copyright (C) Beijing TRS information technology co. LTD.In
 * 
 * @ClassName: SiteInfo
 * @Description: 访问来源业务逻辑
 * @author JYB
 * @date 2018年9月23日 11:14:55
 * @version 1.00
 */
@Service
public class RefererServiceImpl implements RefererService{

	@Resource
	private RefererMapper refererMapper;
	
	@Override
	public List<Referer> getfererCount(int siteid) throws Exception {
		// TODO Auto-generated method stub
		return refererMapper.selectRefererCount(siteid);
	}

	@Override
	public List<Referer> getHotArticlesDay(int siteid) throws Exception {
		// TODO Auto-generated method stub
		return refererMapper.selectHotArticlesDay(siteid);
	}

	@Override
	public List<Referer> getSite() throws Exception {
		// TODO Auto-generated method stub
		return refererMapper.selectSite();
	}

}
