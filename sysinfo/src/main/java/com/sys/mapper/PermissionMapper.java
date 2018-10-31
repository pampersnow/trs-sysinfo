package com.sys.mapper;

import java.util.List;
import java.util.Map;

import com.sys.pojo.Permission;
import com.sys.pojo.RolePermissions;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* @ClassName: PermissionMapper  
* @Description: TODO 
* @author JYB
* @date 2018年9月9日下午3:40:56  
* @version 1.00
 */
public interface PermissionMapper extends IMapper<Permission> {

	/**
	* @Description: 删除角色和权限关联
	* @param rp
	* @return
	* @throws  
	 */
	Boolean delRolePermission(RolePermissions rp);
	
	/**
	* @Description: 添加角色和权限关联
	* @param rp
	* @return
	* @throws  
	 */
	Boolean addRolePermission(RolePermissions rp);

	/**
	* @Description: 分页查询
	* @param map
	* @return
	* @throws  
	 */
	List<Permission> selectByPage(Map<String, Long> map);
	
	/**
	* @Description: 查询总数
	* @return
	* @throws  
	 */
	Long selectCount();
	
	/**
	* @Description: 查询角色和权限关联
	* @param rp
	* @return
	* @throws  
	 */
	List<RolePermissions> selectRolePermission(RolePermissions rp);
	
}
