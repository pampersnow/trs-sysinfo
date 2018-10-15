package com.sys.common;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Collection;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import sun.misc.BASE64Decoder;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In 
* FileName: CommonUtils.java
* 工具方法
* @author JYB
* @Date    2017年9月9日 上午11:45:53
* @version 1.00
*/
@SuppressWarnings("restriction")
public class CommonUtils {
    private static final Logger logger = LogManager.getLogger(CommonUtils.class);
	
    /**
    * 判断字符串是否为空
    * @param str 需要判断是否为空的字符串参数
    * @return 为空或者null返回true
    */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }
    
	/**
	* 对参数进行Base64解码
	* @param param 待解析的字符串
	* @return 返回解析的byte数组
	* @throws IOException
	*/
	public static byte[] decodeBase64(String param) throws IOException {
		// 对base64数据进行解码 生成 字节数组，不能直接用Base64.decode（）；进行解密
		byte[] photoimg = new BASE64Decoder().decodeBuffer(param);
		for (int i = 0; i < photoimg.length; ++i) {
			if (photoimg[i] < 0) {
				// 调整异常数据
				photoimg[i] += 256;
			}
		}
		return photoimg;
	}
    
    /**
    * 对参数param进行lang类型的转换
    * @param param 一个可以装换为long类型的数字
    * @return 如果没有出现异常会返回一个long类型数字，如果出现异常会抛出NumberFormatException
    */
    public static Long convertLong(String param){
    	try {
    		return Long.valueOf(param);
		} catch (NumberFormatException e) {
			logger.error("转换失败，在调用通用方法CommonUilts.convertLong对参数：{}进行Long类型转换的时候，出现了异常，请确认传入的是数字",param,e);
			throw new RuntimeException(e);
		}
    }

    /**
    * 判断一个字符串中是否包含“#”
    * @param param 需要判断的字符串
    * @return 如果此字符串包含 param，则返回 true，否则返回 false
    */
    public static boolean isComma(String param){
    	return param.contains("#");
    }
    
    /**
    * 判断集合是否为空
    * @param collection 需要判断的集合
    * @return 为空或者null返回true
    */
    @SuppressWarnings("rawtypes")
    public static boolean isEmpty(Collection collection) {
        return collection == null || collection.size() < 1;
    }

    /**
    * 判断Map是否为空的方法
    * @param map 需要判断的map
    * @return 为空或者null返回true
    */
    @SuppressWarnings("rawtypes")
    public static boolean isEmpty(Map map) {
        return map == null || map.size() < 1;
    }

    /**
    * 判断字符串是否满足指定值
    * @param str 需要判断的字符串
    * @param length 需要满足的值
    * @return 字符串不为null且满足指定长度返回true
    */
    public static boolean isLengthEnough(String str, int length) {
        if (str == null) {
            return false;
        }
        return str.length() >= length;
    }

    /**
    * 计算一个字符串的MD5值
    * @param s 
    * @return 返回MD5值
    */
    public final static String calculateMD5(String s) {
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
    * 用一个随机数加UUID码，生成一个RC4对称密钥
    * @param param 随机数
    * @param UUID
    * @return 返回一个RC4对称密钥
    */
    public static String HloveyRC4(String param, String UUID) {
        int[] iS = new int[256];
        byte[] iK = new byte[256];
        for (int i = 0; i < 256; i++)
            iS[i] = i;
        int j = 1;
        for (short i = 0; i < 256; i++) {
            iK[i] = (byte) UUID.charAt((i % UUID.length()));
        }
        j = 0;
        for (int i = 0; i < 255; i++) {
            j = (j + iS[i] + iK[i]) % 256;
            int temp = iS[i];
            iS[i] = iS[j];
            iS[j] = temp;
        }
        int i = 0;
        j = 0;
        char[] iInputChar = param.toCharArray();
        char[] iOutputChar = new char[iInputChar.length];
        for (short x = 0; x < iInputChar.length; x++) {
            i = (i + 1) % 256;
            j = (j + iS[i]) % 256;
            int temp = iS[i];
            iS[i] = iS[j];
            iS[j] = temp;
            int t = (iS[i] + (iS[j] % 256)) % 256;
            int iY = iS[t];
            char iCY = (char) iY;
            iOutputChar[x] = (char) (iInputChar[x] ^ iCY);
        }
        return new String(iOutputChar);
    }
    
    /**
    * 将字符串转化为16进制
    * @param param   
    * @return 返回16进制字符串
    */
    public static String toHexString(String param) {  
       String str = "";  
       for (int i = 0; i < param.length(); i++) {  
        int ch = (int) param.charAt(i);  
        String s4 = Integer.toHexString(ch);  
        str = str + s4;  
       }  
       return str;  
    }  
    
    /**
    * 获取一个UUID字符串
    * @return 返回一个去掉“-”，以及全部字母都为大写的UUID字符串
    */
    public static String getUUID(){
    	return UUID.randomUUID().toString().replaceAll("-","").toUpperCase();
    }
    
	/**
	* 校验ip地址是否正确
	* @param ip 需要校验的ip地址
	* @return 正确返回true
	*/
	public static boolean isIpCorrent(String ip){
		String str="\\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b";
		return ip.matches(str);
	}
	
    /**
    * 生成一个14位邀请码
    * @return 返回一个14位字符串邀请码
    */
    public static String getInviteCode() {
        String UUID = CommonUtils.getUUID();
        String random = new Random().nextInt(9000000) + 1000000 + "";
        String rc4 = CommonUtils.HloveyRC4(random, UUID);
        return CommonUtils.toHexString(rc4).toUpperCase();
    }
	
}
