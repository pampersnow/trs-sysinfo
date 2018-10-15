package com.sys.pojo;

import java.io.Serializable;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: RolePermissions  
* @Description: 角色权限关联表 
* @author JYB  
* @date 2018年9月9日上午9:00:12  
* @version 1.00
*/
public class RolePermissions implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** 外键表，指向角色表  */
	private Long roleId;
	/** 外键表，指向权限表 */
	private Long permissionId;
	
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public Long getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
