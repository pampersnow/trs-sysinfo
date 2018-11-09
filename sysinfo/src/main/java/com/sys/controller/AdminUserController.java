package com.sys.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sys.pojo.AdminUser;
import com.sys.pojo.AdminUserRoles;
import com.sys.pojo.Role;
import com.sys.service.AdminUserService;
import com.sys.service.RoleService;
import com.sys.shiro.ShiroUtils;

/**  
* @ClassName: AdminUserController  
* @Description: 管理员用户管理
* @author JYB
* @Date 2018年9月9日上午10:36:03
* @version 1.00
*/
@RequestMapping("adminUser")
@Controller
public class AdminUserController {
	protected final static Logger logger = LogManager.getLogger(AdminUserController.class);
	protected Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
	
	@Resource
	private AdminUserService adminUserService;
	@Resource
	private RoleService roleService;
	
	/**
	* @Description: 管理员用户列表
	* @param request
	* @param curr
	* @param pageSize
	* @return
	* @throws  
	 */
	@RequestMapping("list.do")
	public String toList(HttpServletRequest request,
						@RequestParam(value="currPage",required=false) Long curr,
						@RequestParam(value="pageSize",required=false) Long pageSize){
		if(curr==null){
			curr=1L;
		}
		if(pageSize==null){
			pageSize=10L;
		}
		Long currPage = (curr-1)*pageSize;
		Long count = adminUserService.selectCount();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<AdminUser> adminUserList = adminUserService.selectByPage(currPage, pageSize);
		request.setAttribute("adminUserList", adminUserList);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "adminUser/list";
	}

	/**
	* @Description: 修改密码
	* @param userID
	* @param newpassword
	* @return
	* @throws  
	 */
	@RequestMapping("update.do")
	@ResponseBody
	public Map<String,Object> update(@RequestParam(value="userID",required=false) Long userID,
									 @RequestParam(value="newpassword",required=false)String newpassword){
		AdminUser pojo = new AdminUser();
		if(userID!=null&&newpassword!=null){
			pojo.setId(userID);
			pojo.setPassword(ShiroUtils.getStrByMD5(newpassword));	
		}
		int update = adminUserService.update(pojo);
		if(update==1){
			resultMap.put("status", 200);
			resultMap.put("message", "修改成功！");
		}else{
			resultMap.put("status", 500);
			resultMap.put("message", "修改失败！");
		}
		return resultMap;
	}
	
	/**
	* @Description: 删除管理员用户
	* @param id
	* @param attr
	* @return
	* @throws  
	 */
	@RequestMapping("delete.do")
	public String delete(@RequestParam(value="id",required=false) Long id,RedirectAttributes attr){
		try{
			//先删除用户和角色关联
			adminUserService.delAdminUserRole(id, null);
			adminUserService.delete(id);
			return "redirect:list.do";
		}catch(Exception e){
			logger.debug(e);
			attr.addFlashAttribute("message", "删除失败！");
			return "redirect:list.do";
		}
		
	}
	
	/**
	* @Description: 添加用户页面-跳转
	* @return
	* @throws  
	 */
	@RequestMapping("adminUserAdd")
	public String goAdd(HttpServletRequest request){
		List<Role> roleList = roleService.selectList();
		request.setAttribute("roleList", roleList);
		return "adminUser/add";
	}
	
	/**
	* @Description: 添加管理员用户-提交
	* @param request
	* @param attr
	* @param account
	* @param password
	* @param checkPID
	* @return
	* @throws  
	 */
	@RequestMapping(value="adminUserAdd.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doAdd(HttpServletRequest request,RedirectAttributes attr,
						@RequestParam(value="account",required=false) String account,
						@RequestParam(value="password",required=false) String password,
						@RequestParam(value="checkPID") String checkPID){
		AdminUser pojo = new AdminUser();
		pojo.setAccount(account);
		pojo.setPassword(ShiroUtils.getStrByMD5(password));
		pojo.setPasswordSalt(ShiroUtils.getStrByMD5(password));
		pojo.setIsDisabled(false);
		try{
			adminUserService.insert(pojo);
			AdminUser adminUser = adminUserService.selectOne(pojo);
			/**遍历勾选的角色ID,添加用户和角色关联*/
			if(checkPID!=null&&checkPID!=""){
				String[] checkPid = checkPID.split(",");
				for(String check:checkPid){
					adminUserService.addAdminUserRole(adminUser.getId(), Long.parseLong(check));
				}			
			}
			resultMap.put("status", 200);
			resultMap.put("message", "添加成功！");
		}catch(Exception e){
			logger.debug(e);
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败！");
		}
		return resultMap;	
	}
	
	/**
	* @Description: 验证原密码是否正确
	* @param request
	* @param attr
	* @param password
	* @param userID
	* @return
	* @throws  
	 */
	@RequestMapping(value="authentication.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authentication(HttpServletRequest request,RedirectAttributes attr,
							@RequestParam(value="password",required=false) String password,
							@RequestParam(value="userID") Long userID){
			AdminUser au = adminUserService.selectOne(userID);
			if(ShiroUtils.getStrByMD5(password).equals(au.getPassword())){	
				resultMap.put("status", 200);
				resultMap.put("message", true);
			}else{
				resultMap.put("status", 204);
				resultMap.put("message", false);
			}
			return resultMap;	
		}
	
	/**
	* @Description: 添加用户时验证是否已存在
	* @param request
	* @param attr
	* @param account
	* @return
	* @throws  
	 */
	@RequestMapping(value="checkUserName.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkUserName(HttpServletRequest request,RedirectAttributes attr,
							@RequestParam(value="account",required=false) String account){
			AdminUser user = new AdminUser(account);
			AdminUser au = adminUserService.selectOne(user);
			if(null==au){	
				resultMap.put("status", 200);
				resultMap.put("message", true);
			}else{
				resultMap.put("status", 204);
				resultMap.put("message", false);
			}
			return resultMap;	
		}	
	
		
	/**
	* @Description: 分配角色-跳转
	* @param request
	* @param userID
	* @return
	* @throws  
	 */
	@RequestMapping("updateAdminUserRole")
	public String updateAdminUserRole(HttpServletRequest request,@RequestParam(value="id") Long userID){
		List<Role> roleList = roleService.selectList();
		List<AdminUserRoles> userRoleList = adminUserService.selectAdminUserRole(userID, null);
		request.setAttribute("roleList", roleList);
		request.setAttribute("userRoleList", userRoleList);
		request.setAttribute("adminUserId", userID);
		return "adminUserRole/update";
	}
	
	/**
	* @Description: 分配角色-提交
	* @param request
	* @param attr
	* @return
	* @throws  
	 */
	@RequestMapping("updateAdminUserRole.do")
	public String updateAdminUserRoleDo(HttpServletRequest request,RedirectAttributes attr){
		Long adminUserId = Long.parseLong(request.getParameter("adminUserId"));
		String[] roleIds = request.getParameterValues("roleIds");
		try{
			adminUserService.delAdminUserRole(adminUserId, null);
			if(roleIds!=null&&roleIds.length>0){
				for(int i=0;i<roleIds.length;i++){
					adminUserService.addAdminUserRole(adminUserId, Long.parseLong(roleIds[i]));	
				}
			}	
		}catch(Exception e){
			logger.debug(e);
			attr.addFlashAttribute("message", "操作失败！");
			return "redirect:updateAdminUserRole?id="+adminUserId+"";	
		}
		attr.addFlashAttribute("message", "操作成功！");
		return "redirect:list.do";
	}
	
	
	/**
	* @Description: 禁用/启用
	* @param request
	* @param attr
	* @param userID
	* @return
	* @throws  
	 */
	@RequestMapping("updateDisabled.do")
	public String updateDisabled(HttpServletRequest request,RedirectAttributes attr,
								@RequestParam(value="id") Long userID){
		try{
			AdminUser au = adminUserService.selectOne(userID);
			if(au.getIsDisabled()){
				adminUserService.updateDisabled(userID, false);
			}else{
				adminUserService.updateDisabled(userID, true);
			}
		}catch(Exception e){
			logger.debug(e);
			attr.addFlashAttribute("message", "操作失败！");
			return "redirect:list.do";
		}
		return "redirect:list.do";
	}
		
}
