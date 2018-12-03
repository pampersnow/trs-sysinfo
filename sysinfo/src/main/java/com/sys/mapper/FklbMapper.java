package com.sys.mapper;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	* 动态查询	模糊查询 - all	
	* @param siteid
	* @return
	* @throws Exception
	*/
	public List<Fklb> selectFuzzySearch (@Param("ip") String ip,@Param("area") String area,
								@Param("accesstime") String accesstime,@Param("siteid") String siteid,
								@Param("pageid") String pageid,@Param("type") String type,
								@Param("title") String title,@Param("writetime") String writetime,
								@Param("articleid") String articleid)throws Exception;

	/**
	* 分页查询	按时间排序   默认：降序排列
	* @param map
	* @return
	* @throws Exception
	*/
	public List<Fklb> selectByPage(Map<String, Long> map)throws Exception;
	
	 /**
     * 查询访客记录总数
     * @return
     * @throws Exception
     */
    public Long selectCount()throws Exception;
    		
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
