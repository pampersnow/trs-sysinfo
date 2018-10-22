package com.sys.service;
import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.sys.pojo.Rdwz;

/**
 * @author JYB 
 * 创建日期：2018-05-16 
 * 创建时间 15:25 
 * 接口说明：热点文章
 */
public interface HotArticleService {

	/**
	 * 查询所有热点文章 降序排列
	 * */
	public List<Rdwz> getSelectRdwz() throws Exception;

	/**
	 * 查询所有热点文章 升序排列
	 * */
	public List<Rdwz> getSelectRdwzASC() throws Exception;

	/**
	 * 按日期查询热点文章
	 * */
	public List<Rdwz> getselectRdwzByTimeAll(
			@Param("startTime") Date startTime, @Param("endTime") Date endTime)
			throws Exception;
	
}
