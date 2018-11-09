package com.sys.service;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sys.pojo.Fklb;

/**
 * @author JYB 
 * 创建日期：2018-09-9 
 * 创建时间：下午 2:05 
 * 接口说明：访客列表 1.展示最近访客明细记录
 */
public interface FklbService {
	
	/**
	* 动态查询	模糊根据站点id查询
	* @param siteid
	* @return
	* @throws Exception
	*/
	List<Fklb> getQueryMore(@Param("siteid")String siteid)throws Exception;

	/**
	* 根据日期查找访客信息
	* @return
	* @throws Exception
	*/
	 List<Fklb> selectFklbByTimeAll(@Param("startTime") Date startTime,@Param("endTime")Date endTime)throws Exception;	
	 	
	 
	/**
	* 分页查询所有访客记录	按时间排序   默认：降序排列
	* @return
	* @throws Exception
	*/
	 List<Fklb> selectByPage(Long currPage,Long pageSize)throws Exception;
	 
	/**
	* 查询总记录数
	* @return
	* @throws Exception
	*/
	 Long selectCount()throws Exception;

}
