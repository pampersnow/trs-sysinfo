package com.sys.service;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	Map<String,Long> map = new HashMap<String,Long>();
	

	@Override
	public List<Rdlm> getselectRdlmByTimeAll(Date startTime, Date endTime)
			throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.selectRdlmByTimeAll(startTime, endTime);
	}

	@Override
	public List<Rdlm> selectByPageRdlm(Long currPage, Long pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return hothitsMapper.selectByPageRdlm(map);
	}

	@Override
	public Long selectCountRdlm() throws Exception {
		// TODO Auto-generated method stub
		return hothitsMapper.selectCountRdlm();
	}
}
