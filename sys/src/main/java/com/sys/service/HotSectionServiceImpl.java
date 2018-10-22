package com.sys.service;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sys.mapper.HotHitsMapper;
import com.sys.pojo.Rdlm;
/**
 * @author JYB 
 * 创建日期：2018-05-16
 * 创建时间： 14:32
 * 实现类说明：热点栏目 			
 */
@Service
public class HotSectionServiceImpl implements HotSectionService {
	 @Resource
	 private HotHitsMapper hothitsMapper;
	
	@Override
	public List<Rdlm> getSelectRdlm() throws Exception{
		// TODO Auto-generated method stub		
		return hothitsMapper.selectRdlm();
	}

	@Override
	public List<Rdlm> getSelectRdlmAsc() throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.selectRdlmAsc();
	}

	@Override
	public List<Rdlm> getselectRdlmByTimeAll(Date startTime, Date endTime)
			throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.selectRdlmByTimeAll(startTime, endTime);
	}
}
