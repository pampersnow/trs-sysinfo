package com.sys.service;
import java.util.Date;
import java.util.List;
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

	@Override
	public List<Fklb> getSelectFklbInfo() throws Exception {
		// TODO Auto-generated method stub
		return fklbMapper.selectFklbInfo();
	}

	@Override
	public List<Fklb> getQueryMore(String siteid) throws Exception {
		// TODO Auto-generated method stub
		return fklbMapper.queryMore(siteid);
	}

	@Override
	public List<Fklb> selectFklbByTimeAll(Date startTime, Date endTime)
			throws Exception {
		// TODO Auto-generated method stub
		return fklbMapper.selectPeriodOfTimeInfo(startTime, endTime);
	}
}
