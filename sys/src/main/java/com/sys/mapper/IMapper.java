package com.sys.mapper;

import java.util.List;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* FileName: IMapper
* 父接口
* @author JYB
* @Date    2018年9月9日 下午1:49:37
* @version 1.00
*/
public interface IMapper<T> {
	int insert(T pojo);
	
	/**
	* 根据id进行更新
	* @param pojo
	* @return 返回更新的列数
	*/
	int update(T pojo);

	/**
	* 根据id删除数据
	* @param id 数据的id值
	* @return 返回删除的数据条数
	*/
	int delete(Long id);
	
	/**
	* 以非空字段值作为查询条件进行查询
	* @param pojo
	* @return 查询到的结果集，以集合形式返回
	*/
	List<T> select(T pojo);
}
