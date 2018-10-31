package com.sys.common;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* Copyright (C),2017, Guangzhou ChangLing info. Co., Ltd.
* FileName: StringUtils.java
* 字符串处理工具类
* @author JYB
* @Date    2018年9月9日 下午3:57:28
* @version 1.00
*/
public class StringUtils {
	private StringUtils() {
		super();
	}

	/**
	* 去除null或者"null"
	* @param src 参数
	* @return 为null或者"null"，就返回""，否则返回src
	*/
	public static String formatNull(String src) {
		return (src == null || "null".equals(src)) ? "" : src;
	}


	/** 判断字符串是否为空的正则表达式，空白字符对应的unicode编码 */
	private static final String EMPTY_REGEX = "[\\s\\u00a0\\u2007\\u202f\\u0009-\\u000d\\u001c-\\u001f]+";

	/**
	* 判断字符串是否为空
	* @param input 参数
	* @return 为空或者null返回true
	*/
	public static boolean isEmpty(String input) {
		return input == null || input.equals("") || input.matches(EMPTY_REGEX);
	}
	
	/**
	* 判断字符串是否为空，取反
	* @param input 参数
	* @return 为空或者null返回false
	*/
	public static boolean isNotEmpty(String input){
		return !isEmpty(input);
	}

	/** 判断四则运算符号的正则*/
	private static final String NUM_REG = "(\\+|\\-)?\\s*\\d+(\\.\\d+)?";

	/**
	* 判断是否数字
	* @param str 参数
	* @return 是数字返回true
	*/
	public static boolean isNumber(String str) {
		if (isEmpty(str)) {
			return false;
		}

		if (str.trim().matches(NUM_REG)) {
			return true;
		}

		return false;
	}


	/**
	* 判断是否包含有乱码的数据,如果字符串中包含有替换字符就认为是乱码，替换字符为"\\ufffd"
	* @param str 参数
	* @return 包含返回true
	*/
	public static boolean containUnreadableCode(String str) {
		return contain(str, "\\ufffd");
	}

	/**
	* 判读是否包含数字
	* @param str 参数
	* @return 包含返回true
	*/
	public static boolean containNumber(String str) {
		return contain(str, "\\d");
	}

	/**
	* 判断是否包含a-zA-Z_0-9
	* @param str 参数
	* @return 包含返回true
	*/
	public static boolean containWord(String str) {
		return contain(str, "\\w");
	}

	/**
	* 是否包含有标点符号
	* @param str 参数
	* @return 包含返回true
	*/
	public static boolean containPunct(String str) {
		return contain(str, PUNCT_REG);
	}

	/**
	* 根据给定的正则regex，判断str是否符合格式
	* @param str 参数
	* @param regex 正则
	* @return 符合返回true
	*/
	public static boolean contain(String str, String regex) {
		if (isEmpty(str) || isEmpty(regex)) {
			return false;
		}

		if (str.trim().matches(regex)) {
			return true;
		}

		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(str);
		if (matcher.find()) {
			return true;
		}

		return false;
	}

	/**
	* 替换所有的（不区分大小写）
	* @param input 参数
	* @param regex 正则
	* @param replacement 替换值
	* @return 返回替换后的字符串
	*/
	public static String replaceAll(String input, String regex,
			String replacement) {
		return Pattern.compile(regex, Pattern.CASE_INSENSITIVE).matcher(input)
				.replaceAll(replacement);
	}

	/**
	* 移除所有空格
	* @param text 参数
	* @return 没有空格的字符串
	*/
	public static String removeAllSpace(String text) {
		if (isEmpty(text)) {
			return text;
		}

		return text.replaceAll("[ ]+", "");
	}

	/** 正则表达式是否标点 */
	private static final String PUNCT_REG = "[^a-zA-Z0-9\\u4e00-\\u9fa5]";

	/**
	* 移除字符串中的所有的中英文标点符号
	* @param str 参数
	* @return 返回没有标点符号的字符串
	*/
	public static String removeAllPunct(String str) {
		if (isEmpty(str)) {
			return str;
		}

		return str.replaceAll(PUNCT_REG, "");
	}

	/**
	* 计算str中包含多少个子字符串sub
	* @param str 参数
	* @param sub 被求值
	* @return 
	*/
	public static int countMatches(String str, String sub) {
		if (isEmpty(str) || isEmpty(sub)) {
			return 0;
		}

		int count = 0;
		int idx = 0;
		while ((idx = str.indexOf(sub, idx)) != -1) {
			count++;
			idx += sub.length();
		}

		return count;
	}

	/**
	* 获得源字符串的一个子字符串
	* @param str 源字符串
	* @param beginIndex 开始索引（包括）
	* @param endIndex 结束索引（不包括）
	* @return 返回beginIndex与endIndex之间的字符串
	*/
	public static String substring(String str, int beginIndex, int endIndex) {
		if (isEmpty(str)) {
			return str;
		}

		int length = str.length();

		if (beginIndex >= length || endIndex <= 0 || beginIndex >= endIndex) {
			return null;
		}

		if (beginIndex < 0) {
			beginIndex = 0;
		}
		if (endIndex > length) {
			endIndex = length;
		}

		return str.substring(beginIndex, endIndex);
	}
	
	/**
	* 计算str中包含子字符串sub所在位置的前一个字符或者后一个字符和sub所组成的新字符串
	* @param str
	* @param sub
	* @return
	*/
	public static Set<String> substring(String str, String sub) {
		if (isEmpty(str) || isEmpty(sub)) {
			return null;
		}

		Set<String> result = new HashSet<String>();
		int idx = 0;
		while ((idx = str.indexOf(sub, idx)) != -1) {
			String temp = substring(str, idx - 1, idx + sub.length());
			if (!isEmpty(temp)) {
				temp = removeAllPunct(temp);
				if (!sub.equalsIgnoreCase(temp) && !containWord(temp)) {
					result.add(temp);
				}

			}

			temp = substring(str, idx, idx + sub.length() + 1);
			if (!isEmpty(temp)) {
				temp = removeAllPunct(temp);
				if (!sub.equalsIgnoreCase(temp) && !containWord(temp)) {
					result.add(temp);
				}
			}

			idx += sub.length();
		}

		return result;
	}
	
	/**
	*  过滤掉XML中无法解析的非法字符
	* @param content
	* @return
	*/
	public static String wrapXmlContent(String content) {
		if (isEmpty(content)) {
			return "";
		}

		StringBuilder result = new StringBuilder();

		for (int i = 0; i < content.length(); i++) {
			char ch = content.charAt(i);
			if ((ch == '\t') || (ch == '\n') || (ch == '\r')
					|| ((ch >= ' ') && (ch <= 55295))
					|| ((ch >= 57344) && (ch <= 65533))
					|| ((ch >= 65536) && (ch <= 1114111))) {
				result.append(ch);
			}
		}

		return result.toString();
	}

	/**
	* 判断字符串的长度
	* @param str 参数
	* @return str长度大于1返回true
	*/
	public static boolean overLength(String str) {
		if (isEmpty(str)) {
			return false;
		}

		return str.length() > 1 ? true : false;
	}


	/**
	* 移除字符串中的特殊字符
	* 移除的字符包括：[^\\u4e00-\\u9fa5 | 0-9| a-zA-Z | \\.]+[\\.]{2,}
	* @param str 参数
	* @return 移除特殊字符后的字符串
	*/
	public static String specialStr(String str) {
		str = str.replaceAll("[^\\u4e00-\\u9fa5 | 0-9| a-zA-Z | \\.]+", " ")
				.replaceAll("[\\.]{2,}", " ").trim();
		return str;
	}

	/**
	* 将特殊符号去掉，但是保留空格
	* 移除的字符包括：[^a-zA-Z0-9\\u4e00-\\u9fa5\\s+]
	* @param str 参数
	* @return 
	*/
	public static String replaceInValidateChar(String str) {
		return str.replaceAll("[^a-zA-Z0-9\\u4e00-\\u9fa5\\s+]", " ");
	}

	/**
	* 返回字符串对应的unicode编码
	* @param str 参数
	* @return
	*/
	public static String[] toHexString(String str) {
		char[] chars = str.toCharArray();

		String[] result = new String[chars.length];

		for (int i = 0; i < chars.length; i++) {
			result[i] = Integer.toHexString((int) chars[i]);
		}

		return result;
	}

	/**
	* 生成一个基础UUID值
	* @return 
	*/
	public static String getUuid() {
		return UUID.randomUUID().toString();
	}
	
	/**
	* 判断str的url合法性
	* @param src url参数
	* @return 合法返回true
	*/
	public static boolean isUrl(String src) {
		String regex = "http[s]?:\\/\\/([\\w-]+\\.[\\w-]+)(\\.[\\w-])+(:\\d{2,10})?.*";
		Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(src);
		return matcher.matches();
	}
	
	/**
	* sql 查询转义
	* @param str 参数
	* @return
	*/
	public static String escapeSql(String str){
		if (StringUtils.isNotEmpty(str)) {
			StringBuffer strbuff = new StringBuffer();
			for (String s : str.split("")) {
				if (s.equals("%") || s.equals("_") || s.equals("\\")) {
					strbuff.append("\\");
				}
				strbuff.append(s);
			}
			return strbuff.toString();
		}
		return str;
	}
	
	/**
	* 将驼峰式命名的字符串转换为下划线大写方式。如果转换前的驼峰式命名的字符串为空，则返回空字符串。</br>
	* 例如：HelloWorld->HELLO_WORLD
	* @param name 转换前的驼峰式命名的字符串
	* @return 转换后下划线大写方式命名的字符串
	*/
	public static String underscoreName(String name) {
	    StringBuilder result = new StringBuilder();
	    if (name != null && name.length() > 0) {
	        // 将第一个字符处理成大写
	        result.append(name.substring(0, 1).toUpperCase());
	        // 循环处理其余字符
	        for (int i = 1; i < name.length(); i++) {
	            String s = name.substring(i, i + 1);
	            // 在大写字母前添加下划线
	            if (s.equals(s.toUpperCase()) && !Character.isDigit(s.charAt(0))) {
	                result.append("_");
	            }
	            // 其他字符直接转成大写
	            result.append(s.toUpperCase());
	        }
	    }
	    return result.toString();
	}
	
	/**
	* 将下划线大写方式命名的字符串转换为驼峰式。如果转换前的下划线大写方式命名的字符串为空，则返回空字符串。</br>
	* 例如：HELLO_WORLD->HelloWorld
	* @param name 转换前的下划线大写方式命名的字符串
	* @return 转换后的驼峰式命名的字符串
	*/
	public static String camelName(String name) {
	    StringBuilder result = new StringBuilder();
	    // 快速检查
	    if (name == null || name.isEmpty()) {
	        // 没必要转换
	        return "";
	    } else if (!name.contains("_")) {
	        // 不含下划线，仅将首字母小写
	        return name.substring(0, 1).toLowerCase() + name.substring(1);
	    }
	    // 用下划线将原始字符串分割
	    String camels[] = name.split("_");
	    for (String camel :  camels) {
	        // 跳过原始字符串中开头、结尾的下换线或双重下划线
	        if (camel.isEmpty()) {
	            continue;
	        }
	        // 处理真正的驼峰片段
	        if (result.length() == 0) {
	            // 第一个驼峰片段，全部字母都小写
	            result.append(camel.toLowerCase());
	        } else {
	            // 其他的驼峰片段，首字母大写
	            result.append(camel.substring(0, 1).toUpperCase());
	            result.append(camel.substring(1).toLowerCase());
	        }
	    }
	    return result.toString();
	}
	  
    /**
    * 拆分字符串 
    * @param string 需要拆分的数据
    * @param len 拆分大小
    * @return 将字符串拆分后，返回数据
    */
    public static String[] splitString(String string, int len) {  
        int x = string.length() / len;  
        int y = string.length() % len;  
        int z = 0;  
        if (y != 0) {  
            z = 1;  
        }  
        String[] strings = new String[x + z];  
        String str = "";  
        for (int i=0; i<x+z; i++) {  
            if (i==x+z-1 && y!=0) {  
                str = string.substring(i*len, i*len+y);  
            }else{  
                str = string.substring(i*len, i*len+len);  
            }  
            strings[i] = str;  
        }  
        return strings;  
    }  
    
    /**
    * BCD转字符串
    * @param bytes 需要转义的byte数组
    * @return 
    */
    public static String bcd2Str(byte[] bytes) {  
        char temp[] = new char[bytes.length * 2], val;  
  
        for (int i = 0; i < bytes.length; i++) {  
            val = (char) (((bytes[i] & 0xf0) >> 4) & 0x0f);  
            temp[i * 2] = (char) (val > 9 ? val + 'A' - 10 : val + '0');  
  
            val = (char) (bytes[i] & 0x0f);  
            temp[i * 2 + 1] = (char) (val > 9 ? val + 'A' - 10 : val + '0');  
        }  
        return new String(temp);  
    } 
}
