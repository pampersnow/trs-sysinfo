package com.sys.pojo;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
/**
 * @author JYB
 *创建日期：2018-06-5 
 *创建时间：9:00 
 * 实体类说明：趋势分析 字段封装
 */
public class Qsfx {
	private Integer monthsCount;
	private Integer seasonCount;
	private Integer yearCount;
	private Date startTime;
	private Date endTime;
	private Integer monthCount;
	private  String daystr;
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8") 
	private Date dayPeriod;
	public Integer getMonthsCount() {
		return monthsCount;
	}
	public void setMonthsCount(Integer monthsCount) {
		this.monthsCount = monthsCount;
	}
	public Integer getSeasonCount() {
		return seasonCount;
	}
	public void setSeasonCount(Integer seasonCount) {
		this.seasonCount = seasonCount;
	}
	public Integer getYearCount() {
		return yearCount;
	}
	public void setYearCount(Integer yearCount) {
		this.yearCount = yearCount;
	}
	public Date getStartTime() {
		return startTime;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")  	
	public Date getDayPeriod() {
		return dayPeriod;
	}
	public void setDayPeriod(Date dayPeriod) {
		this.dayPeriod = dayPeriod;
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
	public Integer getMonthCount() {
		return monthCount;
	}
	public void setMonthCount(Integer monthCount) {
		this.monthCount = monthCount;
	}
	public String getDaystr() {
		return daystr;
	}
	public void setDaystr(String daystr) {
		this.daystr = daystr;
	}
	
}
