package com.sys.mapper;

import java.util.List;
import java.util.Map;

import com.sys.pojo.Role;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* @ClassName: RoleMapper  
* @Description: TODO 
* @author JYB  
* @date 2018年9月9日下午1:54:56  
* @version 1.00
 */
public interface RoleMapper extends IMapper<Role> {

	/**
	* @Description: 分页查询
	* @param map
	* @return
	* @throws  
	 */
	List<Role> selectByPage(Map<String, Long> map);
	
	/**
	* @Description: 查询总数
	* @return
	* @throws  
	 */
	Long selectCount();
	
}
