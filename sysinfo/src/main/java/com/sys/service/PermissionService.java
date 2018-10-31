package com.sys.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.PermissionMapper;
import com.sys.pojo.Permission;
import com.sys.pojo.RolePermissions;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* @ClassName: PermissionService  
* @Description: 权限管理 Service
* @author JYB 
* @date 2018年9月9日下午3:43:05  
* @version 1.00
 */
@Service
public class PermissionService extends BaseService<Permission> {

	@Resource
	PermissionMapper permissionMapper;
	
	Map<String,Long> map = new HashMap<String,Long>();
	
	/**
	* @Description: 删除角色和权限关联
	* @param roleId
	* @param permissionId
	* @return
	* @throws  
	 */
	public Boolean delRolePermission(Long roleId,Long permissionId){
		RolePermissions rp = new RolePermissions();
		if(roleId!=null){
			rp.setRoleId(roleId);
		}
		if(permissionId!=null){
			rp.setPermissionId(permissionId);
		}
		return permissionMapper.delRolePermission(rp);
	}
	
	/**
	* @Description: 添加角色和权限关联
	* @param roleId
	* @param permissionId
	* @return
	* @throws  
	 */
	public Boolean addRolePermission(Long roleId,Long permissionId){
		RolePermissions rp = new RolePermissions();
		if(roleId!=null&&permissionId!=null){
			rp.setRoleId(roleId);
			rp.setPermissionId(permissionId);
		}
		return permissionMapper.addRolePermission(rp);
	}
	
	/**
	* @Description: 分页查询
	* @param currPage
	* @param pageSize
	* @return
	* @throws  
	 */
	public List<Permission> selectByPage(Long currPage,Long pageSize){
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return permissionMapper.selectByPage(map);
	}
	
	/**
	* @Description: 查询总数
	* @return Long
	* @throws  
	 */
	public Long selectCount(){
		return permissionMapper.selectCount();
	}
	
	/**
	* @Description: 查询角色和权限关联
	* @param roleId
	* @param permissionId
	* @return
	* @throws  
	 */
	public List<RolePermissions> selectRolePermission(Long roleId,Long permissionId){
		RolePermissions rp = new RolePermissions();
		if(roleId!=null){
			rp.setRoleId(roleId);
		}
		if(permissionId!=null){
			rp.setPermissionId(permissionId);
		}
		return permissionMapper.selectRolePermission(rp);
	}
	
}
