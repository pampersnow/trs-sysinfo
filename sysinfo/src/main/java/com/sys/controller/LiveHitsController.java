package com.sys.controller;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sys.pojo.Docdelivery;
import com.sys.pojo.Fklb;
import com.sys.service.DocdeliveryService;
import com.sys.service.FklbService;
/**  
* @ClassName: LiveHitsController  
* @Description: 实时访问
* @author JYB
* @Date 2018年9月9日上午13:06:33
* @version 1.00
*/
@RequestMapping("liveHits")
@Controller
public class LiveHitsController {
	protected final static Logger logger = LogManager.getLogger(AdminUserController.class);	
	/*
	 * 注入FklbService接口
	 * */
	@Resource
	private FklbService fklbService; 
	@Resource
	private DocdeliveryService docdeliveryService;
	
	/*
	 * 分页显示所有访客信息	
	 * 按时间排序  
	 * 默认：降序排列
	 * */
	@RequestMapping("VisitorList.do")
	public String getFklbInfo(HttpServletRequest request,
								@RequestParam(value="currPage",required=false) Long curr,
								@RequestParam(value="pageSize",required=false) Long pageSize ) throws Exception {	
		//日志打印
		logger.debug("getFklbInfo====================================");
		if(curr==null){
			curr=1L;
		}
		if(pageSize==null){
			pageSize=10L;
		}
		Long currPage = (curr-1)*pageSize;
		Long count = fklbService.selectCount();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<Fklb> listFklb=fklbService.selectByPage(currPage, pageSize);
		request.setAttribute("listFklb", listFklb);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "LiveHits/livehits";	
	}
	/*
	 * 多字段模糊查询
	 * */
	@RequestMapping("doMores.do")
	public ModelAndView getGueryMores(@RequestParam(value="siteid",required=false)String siteid)throws Exception{
		//日志打印
		logger.debug("getGueryMores====================================");
		ModelAndView mv=new ModelAndView();
		List<Fklb> listFklb = fklbService.getQueryMore(siteid);
		mv.addObject("listFklb", listFklb);
		mv.setViewName("LiveHits/livehits");
		return mv;		
	}
	
	@RequestMapping("doByTime.do")
	public ModelAndView getselectFklbByTimeAll(@RequestParam(value="startTime",required=false)
												@DateTimeFormat(pattern="yyyy-MM-dd")Date startTime,
												@RequestParam(value="endTime",required=false)
												@DateTimeFormat(pattern="yyyy-MM-dd")Date endTime)throws Exception{
		//日志打印
		logger.debug("getselectFklbByTimeAll====================================");
		ModelAndView mv=new ModelAndView();
		List<Fklb> listFklb=fklbService.selectFklbByTimeAll(startTime, endTime);		
		mv.addObject("listFklb", listFklb);
		mv.setViewName("LiveHits/livehits");
		return mv;
	}
	
	/**
	 * 推送列表
	 * 导航标签跳转
	 */
	@RequestMapping("articlepush.do")
	public String articlepush(HttpServletRequest request,
								@RequestParam(value="currPage",required=false) Long curr,
								@RequestParam(value="pageSize",required=false) Long pageSize ) throws Exception{
		//日志打印
		logger.debug("articlepush====================================");
		if(curr==null){
			curr=1L;
		}
		if(pageSize==null){
			pageSize=10L;
		}
		Long currPage = (curr-1)*pageSize;
		Long count = docdeliveryService.selectCount();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<Docdelivery> doclist=docdeliveryService.selectByPage(currPage, pageSize);
		request.setAttribute("doclist", doclist);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "LiveHits/articlepush";		
	}
}
