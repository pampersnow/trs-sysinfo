/**
 * 
 */
package com.sys.shiro;


import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.crypto.hash.Md5Hash;

import net.sf.json.JSONObject;


/**  
* Copyright (C) Beijing TRS information technology co. LTD.In
* @ClassName: ShiroUtils  
* @Description: shiro封装工具类 
* @author JYB 
* @date 2018年9月9日下午2:25:46  
* @version 1.00 
*/
public class ShiroUtils {
	protected final static Logger logger = LogManager.getLogger(ShiroUtils.class);

	
    /**
    * @Description: 加盐
    * @param password
    * @return
    * @throws  
     */
    public static String getStrByMD5(String password){
    	return new Md5Hash(password,"3.14159").toString();
    }
    
    /**
     * 密码加密
     */
	public static String getMD5Str(String password) throws Exception{
		StringBuffer buffer = new StringBuffer("3.14159");
		buffer.append(password);
		String pString = buffer.toString();
		MessageDigest md = MessageDigest.getInstance("MD5");
		char[] charArray = pString.toCharArray();
		byte[] byteArray = new byte[charArray.length];
		for(int i=0;i<charArray.length;i++){
			byteArray[i] = (byte) charArray[i];
		}
		byte[] mdBytes = md.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for(int i=0;i<mdBytes.length;i++){
			int val = ((int)mdBytes[i])&0xff;
			if(val<16){
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();		
	}    
    
    
	/**
	* @Description: 是否是Ajax请求
	* @param request
	* @return
	* @throws  
	 */
	public static boolean isAjax(ServletRequest request){
		return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"));
	}
	
	/**
	* @Description: response 输出JSON
	* @param response
	* @param resultMap
	* @throws IOException
	 */
	public static void out(ServletResponse response, Map<String, String> resultMap){
		
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.println(JSONObject.fromObject(resultMap).toString());
		} catch (Exception e) {
			logger.debug(e);
			logger.info("输出JSON报错!");
		}finally{
			if(null != out){
				out.flush();
				out.close();
			}
		}
	}  
    
    
    
}
