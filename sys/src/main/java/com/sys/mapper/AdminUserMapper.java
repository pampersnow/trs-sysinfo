package com.sys.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.sys.pojo.AdminUser;
import com.sys.pojo.AdminUserRoles;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: AdminUserMapper  
* @Description: 管理员用户 
* @author JYB
* @date 2018年9月9日上午9:51:53  
* @version 1.00
 */
public interface AdminUserMapper extends IMapper<AdminUser> {

    /**
    * @Description: 登录认证
    * @param adminUser
    * @return 返回用户详细信息
    * @throws  
     */
    AdminUser login(AdminUser adminUser);

    /**
    * @Description: 分页查询
    * @param map
    * @return
    * @throws  
     */
    List<AdminUser> selectByPage(Map<String, Long> map);
    
    /**
    * @Description: 查询总数
    * @return Long
    * @throws  
     */
    Long selectCount();
    
    /**
    * @Description: 删除管理员用户和角色关联
    * @param aur
    * @return
    * @throws  
     */
    Boolean delAdminUserRole(AdminUserRoles aur);
    
    /**
    * @Description: 添加管理员用户和角色关联
    * @param aur
    * @return
    * @throws  
     */
    Boolean addAdminUserRole(AdminUserRoles aur);
    
    /**
    * @Description: 查询管理员用户和角色关联
    * @param aur
    * @return
    * @throws  
     */
    List<AdminUserRoles> selectAdminUserRole(AdminUserRoles aur);
    
    /**
    * @Description: 禁用/启用
    * @param adminUser
    * @return
    * @throws  
     */
    Boolean updateDisabled(AdminUser adminUser);
    
    /**
    * @Description: 根据用户ID查询角色
    * @param adminUserId
    * @return
    * @throws  
     */
    Set<String> findRoleByUserId(Long adminUserId);
    
    /**
    * @Description: 根据用户ID查询权限
    * @param adminUserId
    * @return
    * @throws  
     */
    Set<String> findPermissionByUserId(Long adminUserId);
    
}
