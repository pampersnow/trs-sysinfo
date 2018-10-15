/**
 * 
 */
package com.sys.pojo;

import java.io.Serializable;

/**  
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: AdminUserRoles  
* @Description: 用户角色关联表 
* @author JYB
* @date 2018年9月9日上午8:53:33
* @version 1.00 
*/
public class AdminUserRoles implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 外键表，指向管理员用户表  */
	private Long adminUserId;
	/** 外键表，指向角色表 */
	private Long roleId;
	
	
	public Long getAdminUserId() {
		return adminUserId;
	}
	public void setAdminUserId(Long adminUserId) {
		this.adminUserId = adminUserId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
