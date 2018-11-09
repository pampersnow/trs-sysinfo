package com.sys.mapper;

import java.util.List;
import java.util.Map;
import com.sys.pojo.SiteInfo;

public interface SiteInfoMapper {

	/**
	 * @Description: 分页查询
	 * @param map
	 * @return
	 * @throws
	 */
	List<SiteInfo> selectByPage(Map<String, Long> map);

	/**
	 * @Description: 查询总数
	 * @return Long
	 * @throws
	 */
	Long selectCount();
}
