package com.sys.mapper;
import java.util.List;
import java.util.Map;
import com.sys.pojo.Docdelivery;
/**  
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: Docdelivery  
* @Description: 文档推送
* @author JYB
* @date 2018年10月13日下午3:01:39
* @version 1.00 
*/
public interface DocdeliveryMapper {
	/**
	* 分页查询	按时间排序   默认：访问量
	* @param map
	* @return
	* @throws Exception
	*/
	public List<Docdelivery> selectByPage(Map<String, Long> map)throws Exception;
	
	 /**
     * 查询推送文档记录总数
     * @return
     * @throws Exception
     */
    public Long selectCount()throws Exception;
}
