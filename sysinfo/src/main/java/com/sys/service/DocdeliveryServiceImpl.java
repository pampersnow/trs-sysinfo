package com.sys.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.DocdeliveryMapper;
import com.sys.pojo.Docdelivery;
@Service
public class DocdeliveryServiceImpl implements DocdeliveryService {
	
	@Resource
	private DocdeliveryMapper Docdeliverymapper;
	
	@Override
	public List<Docdelivery> queryall() throws Exception {
		// TODO Auto-generated method stub
		return Docdeliverymapper.selectall();
	}

}
