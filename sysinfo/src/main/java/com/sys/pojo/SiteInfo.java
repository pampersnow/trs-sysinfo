package com.sys.pojo;

import java.util.Date;
/**
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: SiteInfo  
* @Description: 站点管理实体类
* @author JYB  
* @date 2018年9月22日上午9:00:12  
* @version 1.00
*/
public class SiteInfo {
	private int id;
	private int siteid;
	private String sitename;
	private String	siteurl;                            
	private Date	addjstime;  
	private String	createname;                      
	private Date	createtime;                           
	public String getSiteurl() {
		return siteurl;
	}
	public void setSiteurl(String siteurl) {
		this.siteurl = siteurl;
	}
	public Date getAddjstime() {
		return addjstime;
	}
	public void setAddjstime(Date addjstime) {
		this.addjstime = addjstime;
	}
	public String getCreatename() {
		return createname;
	}
	public void setCreatename(String createname) {
		this.createname = createname;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	private int	isDeleted; 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSiteid() {
		return siteid;
	}
	public void setSiteid(int siteid) {
		this.siteid = siteid;
	}
	public String getSitename() {
		return sitename;
	}
	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
}
