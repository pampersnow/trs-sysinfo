package com.sys.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
* FileName: OtherController.java
* 访问后台首页
*/
@Controller
public class OtherController {
	
	/**
	 * 首页访问
	 */
	@RequestMapping("/")
	public ModelAndView index(){
		return new ModelAndView("index");
	}
	
	/**
	 * 首页访问
	 */
	@RequestMapping("/login")
	public ModelAndView home(){
		return new ModelAndView("login");
	}			
	/**
	 * 关于我们
	 */
	@RequestMapping("/AboutUs.do")
	public ModelAndView AboutUs(){
		return new ModelAndView("AboutUs");
	}	
}
