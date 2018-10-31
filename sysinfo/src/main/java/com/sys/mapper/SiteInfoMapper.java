package com.sys.mapper;

import java.util.List;

import com.sys.pojo.SiteInfo;

public interface SiteInfoMapper {
	List<SiteInfo> selectSiteinfo() throws Exception;
}
