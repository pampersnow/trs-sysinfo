package com.sys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.DocdeliveryMapper;
import com.sys.pojo.Docdelivery;
@Service
public class DocdeliveryServiceImpl implements DocdeliveryService {
	
	@Resource
	private DocdeliveryMapper Docdeliverymapper;
	Map<String,Long> map = new HashMap<String,Long>();

	@Override
	public List<Docdelivery> selectByPage(Long currPage, Long pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return Docdeliverymapper.selectByPage(map);
	}

	@Override
	public Long selectCount() throws Exception {
		// TODO Auto-generated method stub
		return Docdeliverymapper.selectCount();
	}
	


}
