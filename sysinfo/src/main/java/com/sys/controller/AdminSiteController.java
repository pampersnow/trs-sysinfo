package com.sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	* @Description: 站点列表
	* @param request
	* @param curr
	* @param pageSize
	* @return
	* @throws  
	 */
	@RequestMapping("list.do")
	public String siteList(HttpServletRequest request,@RequestParam(value="currPage",required=false) Long curr,
													  @RequestParam(value="pageSize",required=false) Long pageSize)throws Exception{
		if(curr==null){
			curr=1L;
		}
		if(pageSize==null){
			pageSize=10L;
		}
		Long currPage = (curr-1)*pageSize;
		Long count = siteInfoService.selectCount();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<SiteInfo> adminSiteList = siteInfoService.selectByPage(currPage, pageSize);
		request.setAttribute("adminSiteList", adminSiteList);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
	 return "adminSite/list";		
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
