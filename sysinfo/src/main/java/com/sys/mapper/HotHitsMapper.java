package com.sys.mapper;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.sys.pojo.Rdlm;
import com.sys.pojo.Rdwz;
/**
 * @author JYB 
 * 创建日期：2018-09-16
 * 创建时间：下午 14:22
 * 接口说明：热点栏目 			
 */
public interface HotHitsMapper {
	
	/**
	* 分页查询热点栏目	按时间排序   默认：降序排列
	* @param map
	* @return
	* @throws Exception
	*/
	public List<Rdlm> selectByPageRdlm(Map<String, Long> map)throws Exception;
	
	 /**
     * 查询热点栏目总数
     * @return
     * @throws Exception
     */
    public Long selectCountRdlm()throws Exception;
	
	/**
	 * 按日期查询热点栏目
	 * */
	public List<Rdlm>  selectRdlmByTimeAll(@Param("startTime") Date startTime,
											@Param("endTime") Date endTime)throws Exception;

	/**
	* 分页查询热点栏目	按时间排序   默认：降序排列
	* @param map
	* @return
	* @throws Exception
	*/
	public List<Rdwz> selectByPageRdwz(Map<String, Long> map)throws Exception;
	
	 /**
     * 查询热点栏目总数
     * @return
     * @throws Exception
     */
    public Long selectCountRdwz()throws Exception;

	
	/**
	 * 按日期查询热点文章
	 * */
	public List<Rdwz> selectRdwzByTimeAll(@Param("startTime") Date startTime,
										@Param("endTime") Date endTime)throws Exception;
	
}
