package com.sys.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author JYB
 *创建日期：2018-9-9
 *	创建时间：下午 1:03
 *	实体类说明：访客明细	字段封装
 */
public class Fklb {
	private int	id;
	private String ip;
	private String area;
	@DateTimeFormat(pattern = "yyyy-MM-dd")  
	private Date accesstime;
	private String siteid;
	private String sitename;
	private String pageid;
	private String type;
	private Date startTime;
	private String articleid;
	private String link;
	@DateTimeFormat(pattern = "yyyy-MM-dd")  
	private Date writetime;
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getArticleid() {
		return articleid;
	}
	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}
	private Date endTime; 
	
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private String title;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Date getAccesstime() {
		return accesstime;
	}
	public void setAccesstime(Date accesstime) {
		this.accesstime = accesstime;
	}
	public String getSiteid() {
		return siteid;
	}
	public void setSiteid(String siteid) {
		this.siteid = siteid;
	}
	public String getPageid() {
		return pageid;
	}
	public void setPageid(String pageid) {
		this.pageid = pageid;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSitename() {
		return sitename;
	}
	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	
	private int sessionid;
	
	public int getSessionid() {
		return sessionid;
	}
	public void setSessionid(int sessionid) {
		this.sessionid = sessionid;
	}
	public Fklb(int id, String ip, String area, Date accesstime, String siteid, String sitename, String pageid,
			String type, Date startTime, String articleid, String link, Date writetime, Date endTime, String title,
			int sessionid) {
		super();
		this.id = id;
		this.ip = ip;
		this.area = area;
		this.accesstime = accesstime;
		this.siteid = siteid;
		this.sitename = sitename;
		this.pageid = pageid;
		this.type = type;
		this.startTime = startTime;
		this.articleid = articleid;
		this.link = link;
		this.writetime = writetime;
		this.endTime = endTime;
		this.title = title;
		this.sessionid = sessionid;
	}
	public Fklb() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
