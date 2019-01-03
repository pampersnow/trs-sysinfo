package com.sys.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sys.mapper.AddDataInfoMapper;
import com.sys.pojo.Fklb;

/**
 * @author JYB
 * @date 2019年1月2日
 * @version 1.0
 * @Title: AddInfoStatisServiceImpl.java
 * @Package com.sys.service
 * @parameter (参数及其意义)
 * @return 返回值
 * @throws 异常类及抛出条件
 * @see 类型(Types)注释标签（类的注释）
 */
@Service
public class AddInfoStatisServiceImpl implements AddInfoStatisService {

	@Resource
	private AddDataInfoMapper addDataInfoMapper;

	/**
	 * Title: addInfo
	 * @param fklb
	 * @return false
	 * @throws Exception
	 * @see com.sys.service.AddInfoStatisService#addInfo(com.sys.pojo.Fklb)
	 * @see 覆盖方法(Overriding Methods)标签
	 */
	@Override
	public boolean addInfo(Fklb fklb) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		if (flag) {
		} else {
			int info = addDataInfoMapper.addInfoStatis(fklb);
			if (info > 0) {
				flag = true;
				System.out.println("add success!");
			} else {
				System.out.println("add failed!");
			}
		}

		return false;
	}

}
