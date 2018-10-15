package com.sys.service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sys.mapper.IMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In
* FileName: BaseService<T>.java
* 通用Service类
* @author JYB
* @Date    2018年9月9日 下午5:17:13
* @version 1.00
*/
public class BaseService<T> {
	@Autowired
	private IMapper<T> mapper;
	
	/**
	* 插入方法
	* @param pojo 
	* @return 返回插入成功的条数
	*/
	public int insert(T pojo){
		return mapper.insert(pojo);
	}
	
	/**
	* 更新方法
	* @param pojo
	* @return 返回更新成功的条数
	*/
	public int update(T pojo){
		return mapper.update(pojo);
	}
	
	/**
	* 删除方法
	* @param id 主键id
	* @return 返回删除的条数
	*/
	public int delete(Long id){
		if(id==null){
			throw new RuntimeException("在删除数据的时候，没有指定id的值");
		}
		return mapper.delete(id);
	}
	
	/**
	* 不需要参数的查询
	* @return 返回list参数集合
	*/
	public List<T> selectList(){
		return mapper.select(null);
	}
	
	/**
	* 条件查询
	* @param pojo
	* @return 返回list参数集合
	*/
	public List<T> selectList(T pojo){
		return mapper.select(pojo);
	}
	
	/**
	* 条件排序查询，根据name进行排序并查询
	* @param pojo 
	* @param orderBy 排序条件
	* @return 返回排序的结果集集合
	*/
	public List<T> selectList(T pojo,String orderBy){
		PageHelper.orderBy(orderBy);//利用Mybatis分页插件，完成排序
		return mapper.select(pojo);
	}
	
	/**
	* 查询一条数据。如果查询除了多条数据，就抛出throw异常
	* @param pojo 
	* @return 只返回一条数据
	*/
	public T selectOne(T pojo){
		List<T> list=mapper.select(pojo);
		if(list!=null && list.size()>1){
			throw new RuntimeException("selectOne方法查询出了多条数据");
		}
		if(list==null || list.size()==0){
			return null;
		}
		return list.get(0);
	}

    /**
    * 此方法获取当前泛型类的真实类型
    * @param id 主键id
    * @return 返回当前泛型类的真实类型
    */
    @SuppressWarnings("all")
    protected T createInstanceAndSetIdOfFirstGeneric(Long id) {
        if (id == null) {
        	//为了避免错误的将id设为null时把整张表都删除，在此检查
            throw new RuntimeException("id不能为null");
        }
        try {
            //通过反射创建泛型类对象并调用其setId方法设置id字段值
            ParameterizedType type = (ParameterizedType) getClass().getGenericSuperclass();
            Class clazz = (Class) type.getActualTypeArguments()[0];
            T t = (T) clazz.newInstance();
            clazz.getDeclaredMethod("setId", Long.class).invoke(t, id);
            return t;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
    * 根据id进行查询，查询出多条数据会抛出Runtime异常
    * @param id 主键id
    * @return 只会返回一条记录
    */
    public T selectOne(Long id) {
        T pojo = createInstanceAndSetIdOfFirstGeneric(id);

        List<T> list = mapper.select(pojo);
        if (list == null || list.size() == 0) {
            return null;
        }
        if (list.size() > 1) {
            throw new RuntimeException("selectOne方法查询出了多于1个结果");
        }
        return list.get(0);
    }

    /**
    * 条件分页查询
    * @param pageNum 开始页，从1开始
    * @param pageSize 共多少页
    * @param pojo
    * @return 
    */
    public PageInfo<T> page(int pageNum, int pageSize, T pojo) {
        PageHelper.startPage(pageNum, pageSize);
        List<T> list = mapper.select(pojo);
        return new PageInfo<T>(list);
    }

    /**
    * 条件分页排序查询
    * @param pageNum 开始页，从1开始
    * @param pageSize 共多少页
    * @param pojo
    * @param orderBy 排序规则
    * @return
    */
    public PageInfo<T> page(int pageNum, int pageSize, T pojo, String orderBy) {
        PageHelper.startPage(pageNum, pageSize);//注意pageNum表示页码，从1开始
        PageHelper.orderBy(orderBy);
        List<T> list = mapper.select(pojo);//正常执行自己的Mapper的查询方法
        return new PageInfo<T>(list);
    }

    /**
    * 判断是否已经存在
    * @param pojo
    * @return 存在为true
    */
    public boolean isExisted(T pojo) {
        List<T> list = mapper.select(pojo);
        return list != null && list.size() > 0;
    }
}
