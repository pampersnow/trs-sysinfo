/**
 * 
 */
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sys.pojo.Permission;
import com.sys.service.PermissionService;

/**  
* @ClassName: PermissionController  
* @Description: 权限管理 
* @author JYB
* @Date 2018年9月9日上午9:15:45
* @version 1.00
*/
@RequestMapping("permission")
@Controller
public class PermissionController {

	protected final static Logger logger = LogManager.getLogger(PermissionController.class);
	protected Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
	
	@Resource
	private PermissionService permissionService;
	
	/**
	* @Description: 分页显示列表
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
		Long count = permissionService.selectCount();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<Permission> permissionList = permissionService.selectByPage(currPage, pageSize);
		request.setAttribute("permissionList", permissionList);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "permission/list";
	}
	
	/**
	* @Description: 删除权限
	* @param id
	* @param attr
	* @return
	* @throws  
	 */
	@RequestMapping("delete.do")
	public String delete(Long id,RedirectAttributes attr){
		try{
			//先删除角色和权限关联
			permissionService.delRolePermission(null, id);
			permissionService.delete(id);
			return "redirect:list.do";
		}catch(Exception e){
			logger.debug(e);
			attr.addFlashAttribute("message", "删除失败！");
			return "redirect:list.do";
		}
	}
	
	/**
	* @Description: 添加权限
	* @param permission
	* @param description
	* @return
	* @throws  
	 */
	@RequestMapping("permissionAdd.do")
	@ResponseBody
	public Map<String,Object> add(String permission,String description){
		Permission pojo = new Permission();
		pojo.setPermission(permission);
		pojo.setDescription(description);
		try{
			permissionService.insert(pojo);
			Long permissionId = permissionService.selectOne(pojo).getId();
			/**新添加一个权限都加入到超级管理员角色*/
			permissionService.addRolePermission(1L, permissionId);
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
	* @Description: 修改权限
	* @param permission
	* @param description
	* @param permissionID
	* @return
	* @throws  
	 */
	@RequestMapping("permissionUpdate.do")
	@ResponseBody
	public Map<String,Object> update(String permission,String description,Long permissionID){
		Permission pojo = new Permission();
		pojo.setPermission(permission);
		pojo.setDescription(description);
		pojo.setId(permissionID);
		int update = permissionService.update(pojo);
		if(update==1){
			resultMap.put("status", 200);
			resultMap.put("message", "修改成功！");
		}else{
			resultMap.put("status", 500);
			resultMap.put("message", "修改失败！");
		}
		return resultMap;
	}
	
}
