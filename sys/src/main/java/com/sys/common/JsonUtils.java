package com.sys.common;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In 
* FileName: JsonUtils.java
* 使用Jackson完成JSON操作
* @author JYB
* @Date    2018年9月9日 下午2:57:36
* @version 1.00
*/
public class JsonUtils {

    private static ObjectMapper objectMapper = new ObjectMapper();
    static {
        //设置转换时日期格式
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        //字段为null时不参与序列化
        objectMapper.setSerializationInclusion(Include.NON_NULL);
    }

    /**
    * 把Java对象转换为json格式字符串
    * @param obj
    * @return
    */
    public static String toJson(Object obj) {
        try {
            return objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    /**
    * 为了避免对list元素中的str再次进行处理从而导致转换结果不可用
    * @param strs
    * @return
    */
    public static String toJson(Collection<String> strs) {
        if (strs == null) {
            return "[]";
        }
        StringBuilder builder = new StringBuilder();
        builder.append("[");
        for (String str : strs) {
            builder.append(str);
            builder.append(",");
        }
        if (strs.size() > 0) {
            builder.deleteCharAt(builder.length() - 1);
        }
        builder.append("]");

        return builder.toString();
    }

    /**
    * 可以转换普通类型，如User、Card等，也可以转换带泛型的类，比如List<T>、Map<K,V>、Xxx<T>等
    * @param jsonStr json字符串
    * @param beanClass
    * @param parametricTypes 泛型的具体类型
    * @return
    */
    @SuppressWarnings("all")
    public static <T> T toBean(String jsonStr, Class<T> beanClass, Class... parametricTypes) {
        try {
            if (parametricTypes == null || parametricTypes.length == 0) {
                return objectMapper.readValue(jsonStr, beanClass);
            } else {
                JavaType javaType = objectMapper.getTypeFactory().constructParametricType(beanClass, parametricTypes);
                return objectMapper.readValue(jsonStr, javaType);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * 将json字符串转换为Javabean
     * @param jsonStr 
     * @param beanClass json转换的类型 
     * @return
     */
	public static <T> T toBean(String jsonStr, Class<T> beanClass) throws Exception{
		return objectMapper.readValue(jsonStr, beanClass);
/*		try{
			return objectMapper.readValue(jsonStr, beanClass);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}*/
	}
	
	
	/**
	* 方法的详细使用说明
	* @param jsonStr 
	* @param beanClass json转换的类型 
	* @return 返回beanClass的List类型对象 
	* @throws JsonParseException Json字符串出现了非法字符
	* @throws JsonMappingException json字符串无法被反序列化，或JavaBean没有提供无参构造函数
	* @throws IOException
	*/
	public static <T> List<T> toListBean(String jsonStr, Class<?> beanClass) 
			throws JsonParseException, JsonMappingException, IOException{
		TypeFactory t = TypeFactory.defaultInstance(); 
		// 指定容器结构和类型（这里是ArrayList和beanClass）
		List<T> list = objectMapper.readValue(jsonStr,t.constructCollectionType(ArrayList.class, beanClass));
		// 如果T确定的情况下可以使用下面的方法：
		// List<T> list = objectMapper.readValue(jsonVal, new TypeReference<List<T>>() {}); 
		return list;
	}

}
