package com.sys.service;

import com.sys.pojo.Fklb;

/**
 * @author JYB
 * @date 2018年10月22日
 * @version 1.0
 * @Title:  AddInfoStatisService.java   
 * @Package com.sys.service  
 * @parameter 业务逻辑接口_添加信息
 * @return 返回值
 * @throws 异常类及抛出条件
 * @see 类型(Types)注释标签（类的注释）
 */
public interface AddInfoStatisService {
	
	boolean addInfo(Fklb fklb)throws Exception;
}
