package com.sys.mapper;

import java.util.List;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* FileName: IManyToManyMapper
* 多对多通用mapper
* @param <T> 表示中间表对应的类，
* @param <F> 即first，表示中间表的前半部分对应的类
* @param <S> 即second，表示中间表的后半部分对应的类
* @author JYB
* @Date    2018年9月9日 上午11:52:28
* @version 1.00

*/
public interface IManyToManyMapper <T,F,S> extends IMapper<T>{

    /**
    * 删除UPS信息
    * @param firstId UPSId 
    * @return
    */
    int deleteByFirstId(Long firstId);


    /**
    * 删除分组信息
    * @param secondId 分组id
    * @return
    */
    int deleteBySecondId(Long secondId);

    /**
    * 通过分组id，查询拥有的UPS
    * @param secondId 分组id
    * @return
    */
    List<F> selectFirstListBySecondId(Long secondId);

    /**
    * 通过UPS设备id，查询拥有的分组
    * @param firstId UPSId
    * @return
    */
    List<S> selectSecondListByFirstId(Long firstId);
}
