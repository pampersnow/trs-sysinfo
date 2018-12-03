package com.sys.controller;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sys.pojo.Referer;
import com.sys.service.RefererService;

/**
 * Copyright (C) Beijing TRS information technology co. LTD.In
 * @ClassName: WelcomeController
 * @Description: 欢迎页面访问控制
 * @author JYB
 * @date 2018年9月9日	12:24:19
 * @version 1.00
 */
@Controller
@RequestMapping("Welcome")
public class WelcomeController {
	protected final static Logger log = LogManager.getLogger(WelcomeController.class);
	@Autowired
	private  RefererService refererService;
	
	@RequestMapping(value = "/getSite.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public Object querySite() throws Exception{
		List<Referer> data = refererService.getSite();
		Gson gson = new Gson();
		String json=gson.toJson(data);
		return json;
	}
	/**
	 * 首页欢迎页面    
	 * @return 跳转到welcome.do
	 */	
	@RequestMapping(value = "/dowelcome.do")
	public ModelAndView queryinfo()throws Exception {
		int siteid=25237752;
		ModelAndView mv = new ModelAndView();
		List<Referer> list = refererService.getHotArticlesDay(siteid);
		mv.addObject("list", list);
		mv.setViewName("welcome");
		return mv;	
	}
	
	@RequestMapping(value = "/RefererCount.do")
	@ResponseBody
	public Object queryReferer() throws Exception{
		int siteid=25237752;
		List<Referer> list = refererService.getfererCount(siteid);
		Gson gson = new Gson();
		String json=gson.toJson(list);
		return json;
	}
}
