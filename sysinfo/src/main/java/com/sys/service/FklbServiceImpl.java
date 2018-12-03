package com.sys.service;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.FklbMapper;
import com.sys.pojo.Fklb;
/**
 * @author JYB
 *创建日期：2018-09-9
 *创建时间：下午 2:10
 *实现类说明：访客列表		
 */
@Service
public class FklbServiceImpl implements FklbService{

	@Resource
	private FklbMapper fklbMapper; 
	Map<String,Long> map = new HashMap<String,Long>();

	@Override
	public List<Fklb> selectFklbByTimeAll(Date startTime, Date endTime)
			throws Exception {
		// TODO Auto-generated method stub
		return fklbMapper.selectPeriodOfTimeInfo(startTime, endTime);
	}

	@Override
	public List<Fklb> selectByPage(Long currPage, Long pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return fklbMapper.selectByPage(map);
	}

	@Override
	public Long selectCount() throws Exception {
		// TODO Auto-generated method stub
		return fklbMapper.selectCount();
	}

	@Override
	public List<Fklb> queryFuzzySearch(String ip, String area,
			String accesstime, String siteid, String pageid, String type,
			String title, String writetime, String articleid) throws Exception {
		// TODO Auto-generated method stub
		return fklbMapper.selectFuzzySearch(ip, area, accesstime, siteid, pageid, type, title, writetime, articleid);
	}
}
