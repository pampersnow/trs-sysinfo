package com.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sys.mapper.ZqgkMapper;
import com.sys.pojo.Zqgk;

/**
 * @author JYB
 *创建日期：2018-06-1
 *创建时间：10:20
 *业务接口说明：站群概况		
 */
@Service
public class ZqgkServiceImpl implements ZqgkService {

	@Autowired
	private ZqgkMapper zqgkMapper;	

	@Override
	public Zqgk getTotalVisits() throws Exception {
		// TODO Auto-generated method stub
		return zqgkMapper.selectTotalVisits();
	}

	@Override
	public List<Zqgk> getHourlyTraffic() throws Exception {
		// TODO Auto-generated method stub
		return zqgkMapper.getQueryHourCount();
	}

	@Override
	public Zqgk getNum() throws Exception {
		// TODO Auto-generated method stub
		return zqgkMapper.selectNum();
	}
	
}
