package com.sys.pojo;

import java.util.Date;

/**
 * @author JYB 
 * 创建日期：2018-06-1 
 * 创建时间：10:00 
 * 实体类说明：站群概况 字段封装
 */
public class Zqgk {

	private Date accesstime;	//时间

	private Integer count;		//今日访问量

	private Integer hCount;		//时刻访问量

	private Integer hour;		//时刻
	
	private Integer num;		//总访问量
	
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
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

	public Integer gethCount() {
		return hCount;
	}

	public void sethCount(Integer hCount) {
		this.hCount = hCount;
	}

	public Integer getHour() {
		return hour;
	}

	public void setHour(Integer hour) {
		this.hour = hour;
	}
}
