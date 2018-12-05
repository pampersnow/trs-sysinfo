package com.sys.pojo;

import java.util.Date;

/**
 * @author JYB 
 * 创建日期：2018-06-1 
 * 创建时间：09:20 
 * 实体类说明：热点栏目 字段封装
 */
public class Rdlm {

		private String siteid;
		private String sitename;
		private String pageid;
		private Integer count;
		private Date accesstime;
		private Date startTime;
		private Date endTime;
		public String getSitename() {
			return sitename;
		}
		public void setSitename(String sitename) {
			this.sitename = sitename;
		}
		public Rdlm() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Rdlm(String siteid,String sitename, String pageid, Integer count,
				Date accesstime, Date startTime, Date endTime, String type) {
			super();
			this.siteid = siteid;
			this.pageid = pageid;
			this.count = count;
			this.accesstime = accesstime;
			this.startTime = startTime;
			this.endTime = endTime;
			this.type = type;
			this.sitename = sitename;
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
		public Date getAccesstime() {
			return accesstime;
		}
		public void setAccesstime(Date accesstime) {
			this.accesstime = accesstime;
		}
		public Integer getCount() {
			return count;
		}
		public void setCount(Integer count) {
			this.count = count;
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
		private String type;
}
