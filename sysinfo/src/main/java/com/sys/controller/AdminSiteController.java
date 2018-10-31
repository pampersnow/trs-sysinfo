package com.sys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sys.pojo.SiteInfo;
import com.sys.service.SiteInfoService;
/**  
* @ClassName: AdminUserController  
* @Description: 站点管理
* @author JYB
* @Date 2018年9月22日上午10:36:03
* @version 1.00
*/
@RequestMapping("adminsite")
@Controller
public class AdminSiteController {
	@Autowired
	private SiteInfoService siteInfoService;
	
	/**
	 * 站点列表
	 */
	@RequestMapping("list.do")
	public ModelAndView list()throws Exception{
		ModelAndView mv=new ModelAndView(); 
		List<SiteInfo> adminSiteList = siteInfoService.querySiteinfo();
		mv.addObject("adminSiteList", adminSiteList);
    	mv.setViewName("adminSite/list");
		return mv;
	}
	
	@RequestMapping("add.do")
	public ModelAndView add(){
		return new ModelAndView("adminSite/add");
	}
	
	@RequestMapping("embedcode.do")
	public ModelAndView embedcode(){
		return new ModelAndView("adminSite/embedcode");
	}
}
