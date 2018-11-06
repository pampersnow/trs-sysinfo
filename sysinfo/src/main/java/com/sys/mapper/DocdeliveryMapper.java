package com.sys.mapper;

import java.util.List;

import com.sys.pojo.Docdelivery;

/**  
* Copyright (C) Beijing TRS information technology co. LTD.In 
* @ClassName: Docdelivery  
* @Description: 文档推送实体类
* @author JYB
* @date 2018年10月13日下午3:01:39
* @version 1.00 
*/
public interface DocdeliveryMapper {
	List<Docdelivery> selectall()throws Exception;
}
