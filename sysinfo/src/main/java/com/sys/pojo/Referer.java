package com.sys.pojo;

/**
 * Copyright (C) Beijing TRS information technology co. LTD.In
 * 
 * @ClassName: SiteInfo
 * @Description: 访问来源实体类
 * @author JYB
 * @date 2018年9月23日上午11:01:22
 * @version 1.00
 */
public class Referer {
	private Integer siteid;
	private String sitename;
	private String session;
	private Integer sessioncount;
	private Integer f_count;
	private String title;
	public String getSitename() {
		return sitename;
	}
	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getF_count() {
		return f_count;
	}
	public void setF_count(Integer f_count) {
		this.f_count = f_count;
	}
	public Integer getSiteid() {
		return siteid;
	}
	public void setSiteid(Integer siteid) {
		this.siteid = siteid;
	}
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}
	public Integer getSessioncount() {
		return sessioncount;
	}
	public void setSessioncount(Integer sessioncount) {
		this.sessioncount = sessioncount;
	}
	
}
