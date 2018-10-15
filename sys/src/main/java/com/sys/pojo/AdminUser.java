package com.sys.pojo;

import java.io.Serializable;

/**  
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: AdminUser  
* @Description: 管理员用户表 
* @author JYB  
* @date 2018年9月9日上午8:50:22  
* @version 1.00
*/
public class AdminUser implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	/** 用户名*/
	private String account;
	/** 密码 */
	private String password;
	/** 密码盐 */
	private String passwordSalt;
	/** 禁用/启用 */
	private Boolean isDisabled;
	/** 是否删除*/
	private Boolean isDeleted;
	
	
	
	public AdminUser() {
		super();
	}

	public AdminUser(String account) {
		super();
		this.account = account;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getAccount() {
		return account;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPasswordSalt() {
		return passwordSalt;
	}
	
	public void setPasswordSalt(String passwordSalt) {
		this.passwordSalt = passwordSalt;
	}
	
	public Boolean getIsDisabled() {
		return isDisabled;
	}

	public void setIsDisabled(Boolean isDisabled) {
		this.isDisabled = isDisabled;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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
		AdminUser other = (AdminUser) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
