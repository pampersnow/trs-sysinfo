package com.sys.service;
import java.util.Date;
import java.util.List;
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
	
	@Override
	public List<Rdwz> getSelectRdwz() throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.showRdwzInfo();
	}

	@Override
	public List<Rdwz> getSelectRdwzASC() throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.showRdwzInfoASC();
	}

	@Override
	public List<Rdwz> getselectRdwzByTimeAll(Date startTime, Date endTime)
			throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.selectRdwzByTimeAll(startTime, endTime);
	}
}
