package com.sys.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.RoleMapper;
import com.sys.pojo.Role;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* @ClassName: RoleService  
* @Description: 角色管理 Service
* @author JYB 
* @date 2018年9月9日下午1:56:45  
* @version 1.00
 */
@Service
public class RoleService extends BaseService<Role> {

	@Resource
	RoleMapper roleMapper;

	Map<String,Long> map = new HashMap<String,Long>();
	
	/**
	* @Description: 分页查询
	* @param currPage
	* @param pageSize
	* @return
	* @throws  
	 */
	public List<Role> selectByPage(Long currPage,Long pageSize){
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return roleMapper.selectByPage(map);
	}

	/**
	* @Description: 查询总数
	* @return
	* @throws   
	 */
	public Long selectCount(){
		return roleMapper.selectCount();
	}
	
}
