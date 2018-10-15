package com.sys.common;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;  

/**
* Copyright (C) Beijing TRS information technology co. LTD.In 
* FileName: DatetimeUtils.java
* 日期格式通用类
* @author JYB
* @Date    2018年9月9日 下午5:52:21
* @version 1.00
*/
public class DatetimeUtils {
    /** 格式：EEE, d MMM yyyy HH:mm:ss z*/
    public static final String ENG_DATE_FROMAT = "EEE, d MMM yyyy HH:mm:ss z";  
    public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";  
    public static final String YYYY_MM_DD_HH_MM = "yyyy-MM-dd HH:mm";  
    public static final String YYYY_MM_DD = "yyyy-MM-dd";  
    public static final String YYYY = "yyyy";  
    public static final String MM = "MM";  
    public static final String DD = "dd";  
    public static final String HH_MM_SS="hh:mm:ss";  
    /**
    * 格式化日期对象
    * @param date 待格式化的日期
    * @param formatStr 想要格式化的日期格式
    * @return 根据formatStr的格式，转化为指定格式的date类型
    */
    public static Date date2date(Date date, String formatStr) {  
        SimpleDateFormat sdf = new SimpleDateFormat(formatStr);  
        String str = sdf.format(date);  
        try {  
            date = sdf.parse(str);  
        } catch (Exception e) {  
            return null;  
        }  
        return date;  
    }  
    
    /**
    * 时间对象转换成字符串
    * @param date 待格式化日期
    * @param formatStr 日期格式化格式
    * @return 根据formatStr转换为指定字符串
    */
    public static String date2string(Date date, String formatStr) {  
        String strDate = "";  
        SimpleDateFormat sdf = new SimpleDateFormat(formatStr);  
        strDate = sdf.format(date);  
        return strDate;  
    }  
    
    /**
    * sql时间对象转换成字符串
    * @param timestamp 待装换的SQL格式日期
    * @param formatStr 格式化格式
    * @return 根据formatStr的格式，转换为指定字符串
    */
    public static String timestamp2string(Timestamp timestamp, String formatStr) {  
        String strDate = "";  
        SimpleDateFormat sdf = new SimpleDateFormat(formatStr);  
        strDate = sdf.format(timestamp);  
        return strDate;  
    }  
    
    /**
    * sql时间对象转换成字符串
    * @param timestamp 待装换的SQL格式日期,java.sql.time
    * @param formatStr 格式化格式
    * @return 根据formatStr的格式，转换为指定字符串
    */
    public static String time2string(Time time, String formatStr) {  
        String strDate = "";  
        SimpleDateFormat sdf = new SimpleDateFormat(formatStr);  
        strDate = sdf.format(time);  
        return strDate;  
    }  
   
    /**
    * 字符串转换成时间对象 
    * @param dateString 待装换为date类型的字符串
    * @param formatStr 日期格式化格式
    * @return 根据formatStr的格式，转换为date类型
    */
    public static Date string2date(String dateString, String formatStr) {  
        Date formateDate = null;  
        DateFormat format = new SimpleDateFormat(formatStr);  
        try {  
            formateDate = format.parse(dateString);  
        } catch (ParseException e) {  
            return null;  
        }  
        return formateDate;  
    }  
    
    /**
    * Date类型转换为Timestamp类型
    * @param date 待转换的date类型
    * @return 返回Timestamp
    */
    public static Timestamp date2timestamp(Date date) {  
        if (date == null)  
            return null;  
        return new Timestamp(date.getTime());  
    }  
   
    /**
    * 获得当前年份 
    * @return 返回当前年份：YYYY
    */
    public static String getNowYear() {  
        SimpleDateFormat sdf = new SimpleDateFormat(YYYY);  
        return sdf.format(new Date());  
    }  
    
    /**
    * 获得当前月份 
    * @return 返回当前月份：MM
    */
    public static String getNowMonth() {  
        SimpleDateFormat sdf = new SimpleDateFormat(MM);  
        return sdf.format(new Date());  
    }  
 
    /**
    * 获得当前日期中的日
    * @return 返回当前年月日中的日：dd
    */
    public static String getNowDay(){  
        SimpleDateFormat sdf = new SimpleDateFormat(DD);  
        return sdf.format(new Date());  
    }  
    
    /**
    * 将格式为：“HH:mm:ss”的字符串转换为time类型
    * @param time 格式为：“HH:mm:ss”
    * @return 返回此格式的time类型
    */
    public static Time getTime(String time){
        SimpleDateFormat format=new SimpleDateFormat("hh:mm:ss");
        Date d=null;
        try{
     	   d=format.parse(time);
        } catch(Exception e){
     	   e.printStackTrace();
        }
        Time timeFormat=new Time(d.getTime());
        return timeFormat;
    }
  
    /**
    * 指定时间距离当前时间的中文信息 
    * @param time 
    * @return
    */
    public static String getLnow(long time) {  
        Calendar cal = Calendar.getInstance();  
        long timel = cal.getTimeInMillis() - time;  
        if (timel / 1000 < 60) {  
            return "1分钟以内";  
        } else if (timel / 1000 / 60 < 60) {  
            return timel / 1000 / 60 + "分钟前";  
        } else if (timel / 1000 / 60 / 60 < 24) {  
            return timel / 1000 / 60 / 60 + "小时前";  
        } else {  
            return timel / 1000 / 60 / 60 / 24 + "天前";  
        }  
    }  
    
	/**
	* 计算两个日期的时间差
	* @param one 开始时间，要求格式：yyyy-MM-dd HH:mm:ss
	* @param two 结束时间，要求格式：yyyy-MM-dd HH:mm:ss
	* @return 返回的字符串格式：小时：分钟：秒钟
	*/
	public static String getDistanceTime(Date one, Date two) {  
        long day = 0;  
        long hour = 0;  
        long hour1=0;
        long min = 0;  
        long sec = 0;  
        
        long time1 = one.getTime();  
        long time2 = two.getTime();  
        long diff ;  
        if(time1<time2) {  
            diff = time2 - time1;  
        } else {  
            diff = time1 - time2;  
        }  
        day = diff / (24 * 60 * 60 * 1000);  
        hour = (diff / (60 * 60 * 1000) - day * 24);  
        min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);  
        sec = (diff/1000-day*24*60*60-hour*60*60-min*60);  
            
        hour1=diff / (60 * 60 * 1000);  
        
        return hour1 + ":" + min + ":" + sec;  
    }  
	
	/**
	* 获取当前系统时间，返回格式为字符串
	* @return 返回格式：yyyy-MM-dd HH:mm:ss
	*/
	public static String getNowSystemDatetimeString(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());
	}
	
	/**
	* 生成10位时间戳
	* @return
	*/
	public static String getCurrentTimestamp10() {
		long timeStamp = new Date().getTime() / 1000;
		String timestr = String.valueOf(timeStamp);
		return timestr;
	}

	/**
	* 生成10位时间戳
	* @return
	*/
	public static String getTimeStamp() {
		int time = (int) (System.currentTimeMillis() / 1000);
		return String.valueOf(time);
	}
	
}