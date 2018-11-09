package com.sys.service;
import java.util.List;

import com.sys.pojo.SiteInfo;
public interface SiteInfoService { 
	List<SiteInfo> selectByPage(Long currPage,Long pageSize)throws Exception;
	Long selectCount()throws Exception;
}
