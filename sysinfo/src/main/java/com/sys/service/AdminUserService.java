package com.sys.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.AdminUserMapper;
import com.sys.pojo.AdminUser;
import com.sys.pojo.AdminUserRoles;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* @ClassName: AdminUserService  
* @Description: 管理员用户管理Service 
* @author JYB  
* @date 2018年9月9日上午9:54:56  
* @version 1.00
 */
@Service
public class AdminUserService extends BaseService<AdminUser> {

	@Resource
	AdminUserMapper adminUserMapper;
	
	Map<String,Long> map = new HashMap<String,Long>();

	/**
	* @Description: 登录认证
	* @param account
	* @param password
	* @return
	* @throws  
	 */
	public AdminUser login(String account,String password) {
		AdminUser adminUser= new AdminUser();
		adminUser.setAccount(account);
		adminUser.setPassword(password);
		return adminUserMapper.login(adminUser);
	}

	/**
	* @Description: 分页查询
	* @param currPage
	* @param pageSize
	* @return
	* @throws  
	 */
	public List<AdminUser> selectByPage(Long currPage,Long pageSize){
		map.put("currPage", currPage);
		map.put("pageSize", pageSize);
		return adminUserMapper.selectByPage(map);
	}
	
	/**
	* @Description: 查询总数
	* @return Long
	* @throws  
	 */
	public Long selectCount(){
		return adminUserMapper.selectCount();
	}
	
	/**
	* @Description: 删除管理员用户和角色关联
	* @param adminUserId
	* @param roleId
	* @return
	* @throws  
	 */
	public Boolean delAdminUserRole(Long adminUserId,Long roleId) throws RuntimeException{
		AdminUserRoles aur = new AdminUserRoles();
		if(adminUserId!=null){
			aur.setAdminUserId(adminUserId);
		}
		if(roleId!=null){
			aur.setRoleId(roleId);
		}
		return adminUserMapper.delAdminUserRole(aur);
	}
	
	/**
	* @Description: 添加管理员用户和角色关联
	* @param adminUserId
	* @param roleId
	* @return
	* @throws  
	 */
	public Boolean addAdminUserRole(Long adminUserId,Long roleId) throws RuntimeException{
		AdminUserRoles aur = new AdminUserRoles();
		aur.setAdminUserId(adminUserId);
		aur.setRoleId(roleId);
		return adminUserMapper.addAdminUserRole(aur);
	}	
	
	/**
	* @Description: 查询管理员用户和角色关联
	* @param adminUserId
	* @param roleId
	* @return
	* @throws  
	 */
	public List<AdminUserRoles> selectAdminUserRole(Long adminUserId,Long roleId){
		AdminUserRoles aur = new AdminUserRoles();
		if(adminUserId!=null){
			aur.setAdminUserId(adminUserId);
		}
		if(roleId!=null){
			aur.setRoleId(roleId);
		}
		return adminUserMapper.selectAdminUserRole(aur);
	}	
	
	/**
	* @Description: 禁用/启用
	* @param id
	* @param isDisabled
	* @return
	* @throws  
	 */
	public Boolean updateDisabled(Long id,boolean isDisabled){
		AdminUser adminUser= new AdminUser();
		adminUser.setId(id);
		adminUser.setIsDisabled(isDisabled);
		return adminUserMapper.updateDisabled(adminUser);
	}

	/**
	* @Description: 根据用户ID查询角色
	* @param adminUserId
	* @return
	* @throws  
	 */
	public Set<String> findRoleByUserId(Long adminUserId){
		return adminUserMapper.findRoleByUserId(adminUserId);
	}
	
	/**
	* @Description: 根据用户ID查询权限
	* @param adminUserId
	* @return
	* @throws  
	 */
	public Set<String> findPermissionByUserId(Long adminUserId){
		return adminUserMapper.findPermissionByUserId(adminUserId);
	}
	
	
}
