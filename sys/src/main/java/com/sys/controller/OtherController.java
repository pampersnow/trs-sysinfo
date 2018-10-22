package com.sys.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.sys.common.FebsConstant;
import com.sys.common.HttpUtils;
import com.sys.common.ResponseBo;
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
	 * 首页欢迎页面    
	 * @return 跳转到welcome.do
	 */
	@RequestMapping("welcome.do")
	public ResponseBo welcome(String areaId){
		 try {
	            String data = HttpUtils.sendPost(FebsConstant.MEIZU_WEATHER_URL, "cityIds=" + areaId);
	            return ResponseBo.ok(data);
	        } catch (Exception e) {
	            System.out.println("查询天气失败");
	            return ResponseBo.error("查询天气失败，请联系网站管理员！");
	        }
		/*return new ModelAndView("welcome");*/
	}
	/**
	 * 关于我们
	 */
	@RequestMapping("/AboutUs.do")
	public ModelAndView AboutUs(){
		return new ModelAndView("AboutUs");
	}	
}
