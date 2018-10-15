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
import com.sys.pojo.Zqgk;
import com.sys.service.ZqgkService;

/**  
* @ClassName: SiteStatisticsController  
* @Description: 站点统计
* @author JYB
* @Date 2018年9月9日上午12:46:33
* @version 1.00
*/
@RequestMapping("siteStat")
@Controller
public class SiteStatisticsController {
	protected final static Logger log = LogManager.getLogger(AdminUserController.class);
	@Autowired
	private ZqgkService zqgkService;	
	/**
	 * 站群概况
	 * 导航标签跳转
	 */
	@RequestMapping("zqgk.do")
	public ModelAndView zqgk(){
		return new ModelAndView("SiteStat/zqgk");
	}
	// 今日总访问量
		@RequestMapping(value = "/getEchartsData.do")
		@ResponseBody
		public Object getTodaysTraffic() throws Exception {
			Zqgk zqgk = zqgkService.getTotalVisits();
			Gson gson = new Gson();
			String json=gson.toJson(zqgk);
			return json;		
		}

		// 时刻访问量
		@RequestMapping(value = "/TimeToVisit.do")
		@ResponseBody
		public Object  getHourlyTraffic() throws Exception {
			List<Zqgk> list = zqgkService.getHourlyTraffic();
			Gson gson = new Gson();
			String json=gson.toJson(list);
			return json;
		}
		
		//历史总访问量
		@RequestMapping(value="/queryNum.do")
		@ResponseBody
		public Object queryNum() throws Exception {
			Zqgk num=zqgkService.getNum();
			Gson gson = new Gson();
			String json=gson.toJson(num);
			return json;	
		}
	
	
	/**
	 * 趋势分析
	 */
	@RequestMapping("qsfx.do")
	public ModelAndView qsfx(){
		return new ModelAndView("SiteStat/qsfx");
}
}