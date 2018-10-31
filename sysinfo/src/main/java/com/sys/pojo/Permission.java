/**
 * 
 */
package com.sys.pojo;

import java.io.Serializable;

/**  
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: Permission  
* @Description: 权限表 
* @author JYB 
* @date 2018年9月9日上午8:55:01
* @version 1.00 
*/
public class Permission implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	/** 请求路径  */
	private String permission;
	/** 权限描述 */
	private String description;
	/** 是否删除*/
	private Boolean isDeleted;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Boolean isDeleted() {
		return isDeleted;
	}
	public void setDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Permission other = (Permission) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
