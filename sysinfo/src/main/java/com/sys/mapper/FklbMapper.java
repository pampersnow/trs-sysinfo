package com.sys.mapper;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sys.pojo.Fklb;

/**
 * @author JYB
 *创建日期：2018-09-9
 *创建时间：下午 1:05
 *接口说明：访客列表		
 */
public interface FklbMapper {
	/**
	* 动态查询	模糊根据站点id查询	
	* @param siteid
	* @return
	* @throws Exception
	*/
	public List<Fklb> queryMore(@Param("siteid") String siteid)throws Exception;

	/**
	* 显示所有信息	按时间排序   默认：降序排列
	* @return
	* @throws Exception
	*/
	public List<Fklb> selectFklbInfo()throws Exception;
	
	 /**
     * 查询用户记录总数
     * @return
     * @throws Exception
     */
    public int selectCount()throws Exception;
    		
	/**
	* 根据日期段查找访客信息
	* @param startTime
	* @param endTime
	* @return
	* @throws Exception
	*/
	 public List<Fklb> selectPeriodOfTimeInfo(@Param("startTime") Date startTime,
			 									@Param("endTime") Date endTime)throws Exception;
}
