package com.sys.service;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.HotHitsMapper;
import com.sys.pojo.Rdwz;
/**
 * @author JYB 
 * 创建日期：2018-05-16
 * 创建时间	 15:29
 * 实现类说明：热点文章 			
 */
@Service
public class HotArticleServiceImpl implements HotArticleService {

	@Resource
	private HotHitsMapper hothitsMapper;
	Map<String,Long> map = new HashMap<String,Long>();

	@Override
	public List<Rdwz> getselectRdwzByTimeAll(Date startTime, Date endTime)
			throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.selectRdwzByTimeAll(startTime, endTime);
	}

	@Override
	public List<Rdwz> selectByPage(Long currPage, Long pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return hothitsMapper.selectByPageRdwz(map);
	}

	@Override
	public Long selectCount() throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.selectCountRdwz();
	}
}
