/**
 * 
 */
package com.sys.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import com.sys.pojo.Role;
import com.sys.pojo.RolePermissions;
import com.sys.service.AdminUserService;
import com.sys.service.PermissionService;
import com.sys.service.RoleService;

/**  
* @ClassName: RoleController  
* @Description: 角色管理 
* @author JYB
* @Date 2018年9月9日下午2:11:03
* @version 1.00
*/
@RequestMapping("role")
@Controller
public class RoleController {

	protected final static Logger logger = LogManager.getLogger(RoleController.class);
	protected Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
	/**定义一个全局的权限复选框Map，分配权限时把Map存到session*/
	Map<Long, Boolean> CheckPermissions = new HashMap<Long, Boolean>();
	
	@Resource
	private RoleService roleService;
	@Resource
	private PermissionService permissionService;
	@Resource
	private AdminUserService adminUserService;
	
	
	/**
	* @Description: 分页显示角色列表
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
		Long count = roleService.selectCount();
		Long totalPage = 0L;
		if(count>0){
			totalPage = count%pageSize==0?count/pageSize:(count/pageSize)+1;
		}
		List<Role> roleList = roleService.selectByPage(currPage, pageSize);
		request.setAttribute("roleList", roleList);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "role/list";
	}
	
	/**
	* @Description: 添加角色页面-跳转
	* @return
	* @throws  
	 */
	@RequestMapping("roleAdd")
	public String goAdd(HttpServletRequest request){
		List<Permission> permissionList = permissionService.selectList();
		request.setAttribute("permissionList", permissionList);
		return "role/add";
	}
	
	@RequestMapping("roleAdd.do")
	public String add(HttpServletRequest request,RedirectAttributes attr){
		String roleName = request.getParameter("roleName");
		String description = request.getParameter("description");
		String[] pID = request.getParameterValues("permissionIds");
		Role pojo = new Role();
		pojo.setName(roleName);
		pojo.setDescription(description);
		try{
			roleService.insert(pojo);
			Role role = roleService.selectOne(pojo);
			if(pID!=null){
				for(int i=0;i<pID.length;i++){
					permissionService.addRolePermission(role.getId(), Long.parseLong(pID[i]));	
				}
			}
		}catch(Exception e){
			logger.debug(e);
			attr.addFlashAttribute("message", "添加失败！");
			return "redirect:roleAdd";
		}		
		return "redirect:list.do";
	}
	
	/**
	* @Description: 删除角色
	* @param id
	* @param attr
	* @return
	* @throws  
	 */
	@RequestMapping("delete.do")
	public String delete(@RequestParam(value="id",required=false) Long id,RedirectAttributes attr){
		try{
			//删除用户和角色关联
			adminUserService.delAdminUserRole(null, id);
			//删除角色和权限关联
			permissionService.delRolePermission(id, null);
			roleService.delete(id);
			return "redirect:list.do";
		}catch(Exception e){
			logger.debug(e);
			attr.addFlashAttribute("message", "删除失败！");
			return "redirect:list.do";
		}
	}
	
	/**
	* @Description: 修改角色
	* @param roleName
	* @param description
	* @param roleID
	* @return
	* @throws  
	 */
	@RequestMapping("updateRole.do")
	@ResponseBody
	public Map<String,Object> update(@RequestParam(value="roleName",required=false) String roleName,
									 @RequestParam(value="description",required=false) String description,
									 @RequestParam(value="roleID",required=false)Long roleID){
		Role pojo = new Role();
		pojo.setName(roleName);
		pojo.setDescription(description);
		pojo.setId(roleID);
		int update = roleService.update(pojo);
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
	* @Description: 分配权限-跳转
	* @param request
	* @param roleId
	* @param curr
	* @param pageSize
	* @param checkPID
	* @param pids
	* @return
	* @throws  
	 */
	@RequestMapping("goRolePermission")
	public String goRolePermission(HttpServletRequest request,
								@RequestParam(value="roleId",required=false) Long roleId,
								@RequestParam(value="currPage",required=false) Long curr,
								@RequestParam(value="pageSize",required=false) Long pageSize,
								@RequestParam(value="checkPID",required=false) String checkPID,
								@RequestParam(value="pids",required=false) String pids){
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
		/**把上一页所有复选框ID设置为false*/
		if(pids!=null&&pids!=""){
			String[] pIDs = pids.split(",");
			for(String p:pIDs){
				CheckPermissions.put(Long.parseLong(p), false);
			}
		}
		/**把勾选的覆盖session的Map设置为true*/
		if(checkPID!=null&&checkPID!=""){
			String[] checkPid = checkPID.split(",");
			for(String check:checkPid){
				CheckPermissions.put(Long.parseLong(check), true);
			}			
		}
		/**首次访问时初始化所有数据*/
		if(roleId!=null){
			for(Permission p:permissionList){
				CheckPermissions.put(p.getId(), false);
			}
			List<RolePermissions> checkRolePermission = permissionService.selectRolePermission(roleId, null);
			for(RolePermissions check:checkRolePermission){
				CheckPermissions.put(check.getPermissionId(), true);
			}
			request.getSession().setAttribute("roleId", roleId);
		}
		
		request.setAttribute("permissionList", permissionList);
		request.getSession().setAttribute("CheckPermissions", CheckPermissions);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currPage", curr);
		request.setAttribute("pageSize", pageSize);
		return "rolePermission/update";
	}	
	
	/**
	* @Description: 分配权限-提交
	* @param request
	* @param attr
	* @param checkPID
	* @param pids
	* @return resultMap
	* @throws  
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(path="updateRolePermission.do")
	@ResponseBody
	public Map<String, Object> rolePermissionUpdateSave(HttpServletRequest request,
									RedirectAttributes attr,
									@RequestParam(value="checkPID",required=false) String checkPID,
									@RequestParam(value="pids",required=false) String pids){		
		try{
			String [] pIDs = pids.split(",");
			/**把最后一页所有复选框ID设置为false*/
			for(String p:pIDs){
				CheckPermissions.put(Long.parseLong(p), false);
			}
			/**把勾选的覆盖session的Map设置为true*/
			if(checkPID!=null&&checkPID!=""){
				String [] checkPid = checkPID.split(",");
				for(String check:checkPid){
					CheckPermissions.put(Long.parseLong(check), true);
				}			
			}
			/**根据角色ID清空原有的角色和权限关联*/
			Long roleId =  (Long) request.getSession().getAttribute("roleId");
			permissionService.delRolePermission(roleId, null);
			Map<Long,Boolean> map = (Map<Long, Boolean>)request.getSession().getAttribute("CheckPermissions");
			/**遍历session中所有复选框的map值,为true则选中,重新加入关联*/
			for(Entry<Long, Boolean> pID:map.entrySet()){
				if(pID.getValue()){
					permissionService.addRolePermission(roleId, pID.getKey());
				}
			}
			request.getSession().removeAttribute("roleId");
			request.getSession().removeAttribute("CheckPermissions");
			resultMap.put("status", 200);
			resultMap.put("message", "分配权限成功！");
		}catch(Exception e){
			logger.debug(e);
			resultMap.put("status", 500);
			resultMap.put("message", "分配权限失败！");
		}
		return resultMap;	
			
	}	
	
	
	
}
