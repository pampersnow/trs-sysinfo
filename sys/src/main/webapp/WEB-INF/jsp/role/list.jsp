<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<style type="text/css">
#updateRole{box-shadow: 10px 10px 5px #888888;top:30%;left:29%;position:fixed;z-index:111;width:470px;height:220px;display: none;border:1px solid #0080ff;background:#fff;}
.formControls{width: 80%;}
</style>
<title>角色管理</title>
</head>
<body>
<div class="pd-20">
    <table class="table table-border table-bordered table-bg table-hover">
        <thead>
            <tr>
                <th>角色名称</th>
                <th>描&nbsp;&nbsp;述</th>
                <th>操&nbsp;&nbsp;作&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn size-MINI btn-secondary radius" onclick="window.location='roleAdd'"> 添加</button></th>
            </tr>
        </thead>
        <tbody>
     <c:forEach var="roles" items="${roleList}">
                <tr>
                    <td>${roles.name }</td>
                    <td>${roles.description }</td>
                    <td>                   	
                        <button class="btn size-MINI btn-danger radius" onclick="roleDel(${roles.id})">删除</button>&nbsp;
                        <button class="btn size-MINI btn-secondary radius" onclick="showUpdateRole('${roles.name }','${roles.description }',${roles.id})">修改</button>&nbsp;
                        <button class="btn size-MINI btn-secondary radius" onclick="goRolePermission(${roles.id})">分配权限</button>
                    </td>
                </tr>
	</c:forEach>
        </tbody>
    </table>
    <jsp:include page="/WEB-INF/jsp/page.jsp" flush="true"/>    
</div>


<!-- 修改角色 -->
<div id="updateRole" >
    <form action="" class="form form-horizontal">
        <input type="hidden" name="id" id="roleID" />
        <div class="row cl">
            <label class="form-label col-2">角色名称</label>
            <div class="formControls col-5">             
                <input type="text" class="input-text" name="roleName" id="roleName" />
            </div>    
        </div>

        <div class="row cl">
            <label class="form-label col-2">描&nbsp;&nbsp;述</label>
            <div class="formControls col-5">
            	<textarea name="description" class="textarea"  id="description" ></textarea>
            </div>         
        </div>

        <div class="row cl">
            <div class="col-9 col-offset-2">
                <input class="btn btn-primary radius" type="button" onclick="updateRole()" value="修改" />
                <input class="btn btn-default radius" type="button" value="关闭" onclick="closer()" style="margin-left: 30px;" />
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="<%=ctxPath %>/js/role.js"></script>   

</body>
</html>