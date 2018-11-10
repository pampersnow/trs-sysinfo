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

import com.sys.pojo.Rdlm;
import com.sys.pojo.Rdwz;
import com.sys.service.HotArticleService;
import com.sys.service.HotSectionService;
/**  
* @ClassName: HotHitsController  
* @Description: 热点访问
* @author JYB
* @Date 2018年9月9日上午17:06:33
* @version 1.00
*/
@RequestMapping("hotHits")
@Controller
public class HotHitsController {
	
	//日志
	protected final static Logger logger = LogManager.getLogger(HotHitsController.class);	
	
	//业务接口注入
	@Resource
	private HotSectionService hotSectionService ;	
	//private RdlmService  hotSectionService;
	@Resource
	private HotArticleService hotArticleService;
	//private RdwzService hotArticleService;
	
	/****热点栏目****/
	// 降序排列栏目记录
	@RequestMapping("hotsection.do")
	public String queryRdlmList(HttpServletRequest request,
								@RequestParam(value="currPage",required=false) Long curr,
								@RequestParam(value="pageSize",required=false) Long pageSize ) throws Exception {
		logger.debug("queryRdlmList====================================");
		if(curr==null){
			curr=1L;
		}
		if(pageSize==null){
			pageSize=10L;
		}
		Long currPage = (curr-1)*pageSize;
		Long count = hotSectionService.selectCountRdlm();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<Rdlm> rdlmlist = hotSectionService.selectByPageRdlm(currPage, pageSize);
		request.setAttribute("rdlmlist", rdlmlist);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "HotHits/HotSection";
	}

	// 指定日期查询栏目
	@RequestMapping("doByTimeRdlm.do")
	public ModelAndView queryRdlmByTimeAll(
			@RequestParam(value = "startTime", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startTime,
			@RequestParam(value = "endTime", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endTime)
			throws Exception {

		// 日志打印
		logger.debug("queryRdlmByTimeAll====================================");
		ModelAndView mv = new ModelAndView();
		List<Rdlm> rdlmTimeList = hotSectionService.getselectRdlmByTimeAll(startTime,endTime);
		mv.addObject("rdlmlist", rdlmTimeList);
		mv.setViewName("HotHits/HotSection");
		return mv;
	}
	
	
	/****热点文章****/
	// 降序排列热点文章
	@RequestMapping("hotarticle.do")
	public String getRdwzInfo(HttpServletRequest request,
								@RequestParam(value="currPage",required=false) Long curr,
								@RequestParam(value="pageSize",required=false) Long pageSize ) throws Exception {
		// 日志打印
		logger.debug("getRdwzInfo====================================");
		if(curr==null){
			curr=1L;
		}
		if(pageSize==null){
			pageSize=10L;
		}
		Long currPage = (curr-1)*pageSize;
		Long count = hotArticleService.selectCount();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<Rdwz> rdwzList = hotArticleService.selectByPage(currPage, pageSize);
		request.setAttribute("rdwzList", rdwzList);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "HotHits/HotArticle";
	}


	// 指定日期查询热点文章
	@RequestMapping("doByTimeRdwz.do")
	public ModelAndView queryRdwzByTimeAll(
			@RequestParam(value = "startTime", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startTime,
			@RequestParam(value = "endTime", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endTime)
			throws Exception {

		// 日志打印
		logger.debug("queryRdwzByTimeAll====================================");
		ModelAndView mv = new ModelAndView();
		List<Rdwz> rdwzTimeList = hotArticleService.getselectRdwzByTimeAll(startTime,endTime);
		mv.addObject("rdwzList", rdwzTimeList);
		mv.setViewName("HotHits/HotArticle");
		return mv;
	}

}
