package com.sys.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sys.pojo.Fklb;
import com.sys.service.AddInfoStatisService;

/**
 * @author JYB
 * @date 2018年10月22日
 * @version 1.0
 * @Title:  AddInfoStatisController.java   
 * @Package com.sys.controller  
 * @parameter 添加访客信息记录
 * @return 返回值
 * @throws 异常类及抛出条件
 * @see 类型(Types)注释标签（类的注释）
 */
@Controller
public class AddInfoStatisController {
	
	/**
	 * 日志记录
	 * */
	protected final static Logger logger = LogManager.getLogger(AddInfoStatisController.class);
	
	@Autowired
	private AddInfoStatisService addInfoStatisService;
	
	@RequestMapping("/AddInfoCollect.do")
	@ResponseBody
	public String addInfoCollect(@RequestBody String data) throws Exception{
		
		logger.debug("添加数据开始>>>>>>>>>>>"+data);
		JSONObject jsonObject = new JSONObject(data);
		Fklb fklb = new Fklb();
		fklb.setIp(jsonObject.getString("ip"));
		fklb.setArea(jsonObject.getString("area"));
		fklb.setAccesstime(new Date());
		fklb.setSiteid(jsonObject.getString("siteid"));
		fklb.setPageid(jsonObject.getString("pageid"));
		fklb.setType(jsonObject.getString("type"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		fklb.setWritetime(sdf.parse(jsonObject.getString("writetime")));
		fklb.setTitle(jsonObject.getString("title"));
		fklb.setArticleid(jsonObject.getString("articleid"));
		fklb.setSessionid(jsonObject.getInt("sessionid"));
		fklb.setLink(jsonObject.getString("link"));
		
		addInfoStatisService.addInfo(fklb);
		System.out.println("OK");
		return "add success!";
	}
	
	//测试页面跳转
	 @RequestMapping("/addDataInfo.do")
		public ModelAndView home(){
			return new ModelAndView("addDataInfo");
		}	
}

















