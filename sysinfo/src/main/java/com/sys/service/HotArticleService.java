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
	* 分页查询热点文章记录	按时间排序   默认：降序排列
	* @return
	* @throws Exception
	*/
	 List<Rdwz> selectByPage(Long currPage,Long pageSize)throws Exception;
	 
	/**
	* 查询热点文章总记录数
	* @return
	* @throws Exception
	*/
	 Long selectCount()throws Exception;

	/**
	 * 按日期查询热点文章
	 * */
	public List<Rdwz> getselectRdwzByTimeAll(
			@Param("startTime") Date startTime, @Param("endTime") Date endTime)
			throws Exception;
	
}
