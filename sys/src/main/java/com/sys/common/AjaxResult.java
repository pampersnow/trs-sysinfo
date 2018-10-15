package com.sys.common;

/**
* Copyright (C) Beijing TRS information technology co. LTD.In 
* FileName: AjaxResult.java
* JSON返回通用类
* @author JYB
* @Date    2018年9月9日 下午2:52:52
* @version 1.00
*/
public class AjaxResult {
    private String resultCode; 
    /**表示响应信息，提示信息 */
    private String resultMessage;
    /**表示相应数据，移动端需要的数据 */
    private Object data;
    
    public AjaxResult(){}
	public AjaxResult(String resultCode, String resultMessage) {
		super();
		this.resultCode = resultCode;
		this.resultMessage = resultMessage;
	}
	public AjaxResult(String resultCode, String resultMessage, Object data) {
		super();
		this.resultCode = resultCode;
		this.resultMessage = resultMessage;
		this.data = data;
	}

    /**
    * Ajax返回
    * @param resultCode 响应码
    * @param resultMessage 提示信息
    * @return
    */
    public static AjaxResult returnResult(String resultCode,String resultMessage) {
        return new AjaxResult(resultCode, resultMessage);
    }
    
    /**
    * Ajax返回成功，同时返回移动端需要的数据
    * @param resultMessage 成功提示信息
    * @param data 移动端需要的数据
    * @return
    */
    public static AjaxResult successInstance(String resultMessage,Object data){
    	return new AjaxResult("200",resultMessage,data);
    }
	
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMessage() {
		return resultMessage;
	}
	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	} 
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
