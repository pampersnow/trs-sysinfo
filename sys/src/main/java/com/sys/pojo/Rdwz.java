package com.sys.pojo;

import java.util.Date;

/**
 * @author JYB
 *创建日期：2018-05-16
 *创建时间：下午 1:33
 *实体类说明：热点文章     字段封装
 */
public class Rdwz {
	private String siteid;
	private String pageid;
	private String type;
	private String title;
	private int count;
	private Date accesstime;
	private Date startTime;
	private Date endTime;
	private Date writetime;
	public Rdwz() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rdwz(String siteid, String pageid, String type, String title,
			int count, Date accesstime, Date startTime, Date endTime,
			Date writetime, String articleid) {
		super();
		this.siteid = siteid;
		this.pageid = pageid;
		this.type = type;
		this.title = title;
		this.count = count;
		this.accesstime = accesstime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.writetime = writetime;
		this.articleid = articleid;
	}
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	private String articleid;
	
	
	public String getArticleid() {
		return articleid;
	}
	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}	
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
