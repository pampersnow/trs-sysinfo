package com.sys.service;
import java.util.List;
import com.sys.pojo.Docdelivery;

public interface DocdeliveryService {
	/**
	* 分页查询所有访客记录	按时间排序   默认：降序排列
	* @return
	* @throws Exception
	*/
	 List<Docdelivery> selectByPage(Long currPage,Long pageSize)throws Exception;
	 
	/**
	* 查询总记录数
	* @return
	* @throws Exception
	*/
	 Long selectCount()throws Exception;
}
