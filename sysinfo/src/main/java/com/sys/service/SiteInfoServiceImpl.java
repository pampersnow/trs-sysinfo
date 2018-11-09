package com.sys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.SiteInfoMapper;
import com.sys.pojo.SiteInfo;
@Service
public class SiteInfoServiceImpl implements SiteInfoService {
	
	@Resource
	private SiteInfoMapper siteInfoMapper;
	Map<String,Long> map = new HashMap<String,Long>(); 
	
	@Override
	public List<SiteInfo> selectByPage(Long currPage, Long pageSize)
			throws Exception {		
		// TODO Auto-generated method stub
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return siteInfoMapper.selectByPage(map);
	}
	@Override
	public Long selectCount() throws Exception {
		// TODO Auto-generated method stub
		return siteInfoMapper.selectCount();
	}

}
