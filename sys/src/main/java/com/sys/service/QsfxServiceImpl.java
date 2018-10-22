package com.sys.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sys.mapper.QsfxMapper;
import com.sys.pojo.Qsfx;

/**
 * @author JYB
 *创建日期：2018-06-5 
 *创建时间：9:25
 *接口说明：趋势分析		
 */
@Service
public class QsfxServiceImpl implements QsfxService{

	@Autowired
	private QsfxMapper qsfxMapper;
	
	@Override
	public Qsfx getDuringTheMonth() throws Exception {
		// TODO Auto-generated method stub
		return qsfxMapper.selectDuringTheMonth();
	}
	
	@Override
	public Qsfx getInTheQuarter() throws Exception {
		// TODO Auto-generated method stub
		return qsfxMapper.selectInTheQuarter();
	}

	@Override
	public Qsfx getThatYear() throws Exception {
		// TODO Auto-generated method stub
		return qsfxMapper.selectThatYear();
	}

	@Override
	public List<Qsfx> getTimeVisitorsCount()
			throws Exception {
		// TODO Auto-generated method stub
		return qsfxMapper.selectTimeVisitorsCount();
	}

}
