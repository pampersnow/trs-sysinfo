package com.sys.controller;
import java.util.List;
import javax.annotation.Resource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.sys.pojo.SiteInfo;
import com.sys.service.SiteInfoService;

@RequestMapping("index")
@Controller
public class IndexSiteInfoController {
	//日志
		protected final static Logger logger = LogManager.getLogger(IndexSiteInfoController.class);	
		//业务接口注入
		@Resource
		private SiteInfoService siteInfoService;
		
		 @RequestMapping(value="/siteinfo.do",method=RequestMethod.POST)
		 @ResponseBody
		    public Object xialacaidanPOST() throws Exception{
		        List<SiteInfo> list =siteInfoService.querySiteinfo();
		        Gson gson = new Gson();
				String json=gson.toJson(list);
		        return json;
		    }
}
