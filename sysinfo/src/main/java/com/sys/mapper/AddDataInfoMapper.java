package com.sys.mapper;

import org.apache.ibatis.annotations.Insert;

import com.sys.pojo.Fklb;

/**
 * @author JYB
 * @date 2018年10月22日
 * @version 1.0
 * @Title: AddDataInfo.java
 * @Package com.sys.mapper
 * @parameter 新增访客信息接口
 * @return 返回值
 * @throws 异常类及抛出条件
 * @see 类型(Types)注释标签（类的注释）
 */
public interface AddDataInfoMapper {

	// 添加访客数据
	@Insert("INSERT INTO `sys_info`.`zlvisitdata`(`ip`, `area`, `accesstime`, `siteid`, `pageid`, `type`, `title`, "
			+ "`writetime`, `articleid`, `sessionid`, `link`) VALUES (#{ip},#{area},#{accesstime},#{siteid},#{pageid}"
			+ ",#{type},#{title},#{writetime},#{articleid},#{sessionid},#{link}) ")
	int addInfoStatis(Fklb fklb) throws Exception;
}
