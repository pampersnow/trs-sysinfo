package com.sys.service;
import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.sys.pojo.Rdlm;

/**
 * @author JYB 
 * 创建日期：2018-05-16 
 * 创建时间 14:30 
 * 接口说明：热点栏目
 */
public interface HotSectionService {

	/**
	 * 升序查询热点栏目
	 * */
	public List<Rdlm> getSelectRdlm() throws Exception;

	/**
	 * 降序查询热点栏目
	 * */
	public List<Rdlm> getSelectRdlmAsc() throws Exception;

	/**
	 * 指定日期查询热点栏目
	 * */
	public List<Rdlm> getselectRdlmByTimeAll(
			@Param("startTime") Date startTime, @Param("endTime") Date endTime)
			throws Exception;
}
