package com.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sys.mapper.SiteInfoMapper;
import com.sys.pojo.SiteInfo;
@Service
public class SiteInfoServiceImpl implements SiteInfoService {
	private SiteInfoMapper siteInfoMapper;
	@Override
	public List<SiteInfo> querySiteinfo() throws Exception {
		// TODO Auto-generated method stub
		return siteInfoMapper.selectSiteinfo();
	}

}
