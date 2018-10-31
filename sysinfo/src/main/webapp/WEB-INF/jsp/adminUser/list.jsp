<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<style type="text/css">
#updatePassword{box-shadow: 10px 10px 5px #888888;top:30%;left:29%;position:fixed;z-index:111;width:470px;height:220px;display: none;border:1px solid #0080ff;background:#fff;}
.formControls{width: 80%;}
</style>
<title>管理员用户列表</title>
</head>
<body>
<div class="pd-20">
    <table class="table table-border table-bordered table-bg table-hover">
        <thead>
            <tr>
                <th>管理员账号</th>
                <th>状&nbsp;&nbsp;态</th>
                <th>操&nbsp;&nbsp;作&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn size-MINI btn-secondary radius" onclick="window.location='adminUserAdd'"> 添加</button></th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="adminUserList" items="${adminUserList }">
                <tr>
                    <td>${adminUserList.account}</td>
                  
                    <c:choose>
                    	<c:when test="${adminUserList.isDisabled}">
                    		<td><span class="label label-success radius" style="background-color: red">禁用</span></td>
                    	</c:when>
                    	<c:otherwise>
                    		<td><span class="label label-success radius">已启用</span></td>
                    	</c:otherwise>
                    </c:choose>
                    
                    <td>
                        <shiro:hasPermission name="/adminUser/delete.do">
                        <button class="btn size-MINI btn-danger radius" onclick="adminUserDel(${adminUserList.id})">删除</button>&nbsp;                        
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/adminUser/updatePassWord.do">
                        <button class="btn size-MINI btn-secondary radius" onclick="updatePassword(${adminUserList.id})">重置密码</button>&nbsp;
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/adminUser/updateAdminUserRole.do">
                        <button class="btn size-MINI btn-secondary radius" onclick="window.location='updateAdminUserRole?id=${adminUserList.id}'">分配角色</button>&nbsp;
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/adminUser/updateDisabled.do">
                        <button class="btn size-MINI btn-warning radius" onclick="window.location='updateDisabled.do?id=${adminUserList.id}'">禁用/启用</button>
                        </shiro:hasPermission>
                    </td>
                </tr>
             </c:forEach>  

        </tbody>
    </table>
    <jsp:include page="/WEB-INF/jsp/page.jsp" flush="true"/>
</div>
          
          <!-- 修改管理员用户 -->  
          <div id="updatePassword" >
			    <form action="" class="form form-horizontal" method="post">
			    	<input type="hidden" name="id"  id="userID"/>
			        <div class="row cl">
			            <label class="form-label col-2">旧密码</label>
			            <div class="formControls col-5">			           
			            	<input type="password" class="input-text" id="password" />
			            </div>			           		
			        </div>
			
			        <div class="row cl">
			            <label class="form-label col-2">新密码</label>
			            <div class="formControls col-5">
			            	<input type="password" class="input-text"  id="newpassword" />
			            </div>		       
			        </div>
			        
			        <div class="row cl">
			            <label class="form-label col-2">确认密码</label>
			            <div class="formControls col-5">
			            	<input type="password" class="input-text"  id="renewpassword" />
			            </div>			    
			        </div>
			        
			
			        <div class="row cl">
			            <div class="col-9 col-offset-2">
			                <input class="btn btn-primary radius" type="button" onclick="updatePW()" value="修改" />
			                <input class="btn btn-default radius" type="button" value="关闭" onclick="closer()" style="margin-left: 30px;" />
			            </div>
			        </div>
			    </form>
		</div>  
            
<script type="text/javascript" src="<%=ctxPath %>/js/adminUser.js"></script>

</body>
</html>