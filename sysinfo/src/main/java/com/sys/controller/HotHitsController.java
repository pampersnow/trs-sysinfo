package com.sys.controller;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
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
	public ModelAndView queryRdlmList() throws Exception {
		logger.debug("queryRdlmList====================================");
		ModelAndView mv = new ModelAndView();
		List<Rdlm> rdlmlist = hotSectionService.getSelectRdlm();
		mv.addObject("rdlmlist", rdlmlist);
		mv.setViewName("HotHits/HotSection");
		return mv;
	}

	// 升序排列栏目记录
	@RequestMapping("doRdlmAsc.do")
	public ModelAndView queryRdlmListAsc() throws Exception {

		logger.debug("queryRdlmListAsc====================================");
		ModelAndView mv = new ModelAndView();
		List<Rdlm> rdlmasclist = hotSectionService.getSelectRdlmAsc();
		mv.addObject("rdlmlist", rdlmasclist);
		mv.setViewName("HotHits/HotSection");
		return mv;
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
	public ModelAndView getRdwzInfo() throws Exception {
		// 日志打印
		logger.debug("getRdwzInfo====================================");
		ModelAndView mv = new ModelAndView();
		List<Rdwz> rdwzList = hotArticleService.getSelectRdwz();		
		mv.addObject("rdwzList", rdwzList);
		mv.setViewName("HotHits/HotArticle");
		return mv;
	}

	// 升序排列热点栏目,文章
	@RequestMapping("doRdlmASC.do")
	public ModelAndView queryRdwzListAsc() throws Exception {
		logger.debug("queryRdwzListAsc====================================");
		ModelAndView mv = new ModelAndView();
		List<Rdwz> rdwzasclist = hotArticleService.getSelectRdwzASC();
		mv.addObject("rdwzList", rdwzasclist);
		mv.setViewName("HotHits/HotArticle");
		return mv;
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
