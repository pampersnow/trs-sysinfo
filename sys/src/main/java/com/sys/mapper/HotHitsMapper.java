package com.sys.mapper;
import java.util.Date;
import java.util.List;
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
	 * 查询所有热点栏目  降序排列
	 * */
	public List<Rdlm> selectRdlm()throws Exception;
	
	/**
	 * 查询所有热点栏目  升序排列
	 * */
	public List<Rdlm> selectRdlmAsc()throws Exception;
	
	/**
	 * 按日期查询热点栏目
	 * */
	public List<Rdlm>  selectRdlmByTimeAll(@Param("startTime") Date startTime,
											@Param("endTime") Date endTime)throws Exception;

	/**
	 * 查询所有热点文章 降序排列
	 * */
	public List<Rdwz> showRdwzInfo()throws Exception;
	
	/**
	 * 查询所有热点文章 升序排列
	 * */
	public List<Rdwz> showRdwzInfoASC()throws Exception;
	
	/**
	 * 按日期查询热点文章
	 * */
	public List<Rdwz> selectRdwzByTimeAll(@Param("startTime") Date startTime,
										@Param("endTime") Date endTime)throws Exception;
	
}
