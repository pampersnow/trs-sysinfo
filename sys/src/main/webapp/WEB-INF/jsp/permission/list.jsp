<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<style type="text/css">
#addPermission,#updatePermission{box-shadow: 10px 10px 5px #888888;top:30%;left:29%;position:fixed;z-index:111;width:470px;height:220px;display: none;border:1px solid #0080ff;background:#fff;}
.formControls{width: 80%;}
</style>
<title>权限列表</title>
</head>
<body>
<div class="pd-20">
    <table class="table table-border table-bordered table-bg table-hover">
        <thead>
            <tr>
                <th>请求路径</th>
                <th>描&nbsp;&nbsp;述</th>
                <th>操&nbsp;&nbsp;作&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn size-MINI btn-secondary radius" onclick="clickAddPermission()" > 添加</button></th>
            </tr>
        </thead>
        <tbody>

                <c:forEach var="pList" items="${permissionList}">
                <tr>
                    <td>${pList.permission}</td>
                    <td>${pList.description}</td>
                    <td>                    	
                        <button class="btn size-MINI btn-danger radius" onclick="permissionDel(${pList.id})">删除</button>&nbsp;
                        <button class="btn size-MINI btn-secondary radius" onclick="clickUpdatePermission('${pList.permission }','${pList.description }',${pList.id})">修改</button>
                    </td>
                </tr>
                </c:forEach>
            
        </tbody>
    </table>
    <jsp:include page="/WEB-INF/jsp/page.jsp" flush="true"/>
</div>

<!-- 修改权限 -->
<div id="updatePermission" >
    <form action="updatePermission.do" class="form form-horizontal">
        <input type="hidden" name="id" id="permissionID" />
        <div class="row cl">
            <label class="form-label col-2">请求路径</label>
            <div class="formControls col-5">           	
                <input type="text" class="input-text" id="permission" />
            </div>
        </div>
 
        <div class="row cl">
            <label class="form-label col-2">描&nbsp;&nbsp;述</label>
            <div class="formControls col-5">
                <textarea class="textarea" id="description" ></textarea>
            </div>
        </div>

        <div class="row cl">
            <div class="col-9 col-offset-2">
                <input class="btn btn-primary radius" type="button" onclick="updatePermission()" value="修改" />
                <input class="btn btn-default radius" type="button" value="关闭" onclick="closer()" style="margin-left: 30px;" />
            </div>
        </div>
    </form>
</div>


<!-- 添加权限 -->
<div id="addPermission">
    <form action="" class="form form-horizontal" method="post">
        <div class="row cl">
            <label class="form-label col-2">请求路径</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" id="ADDpermission"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2">描&nbsp;&nbsp;述</label>
            <div class="formControls col-5">
                <textarea id="ADDdescription" class="textarea" ></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-2">
                <input class="btn btn-primary radius" type="button" onclick="addPermission()" value="添加" />
                <input class="btn btn-default radius" type="button" value="关闭" onclick="closer()" style="margin-left: 30px;" />
            </div>
        </div>
    </form>
</div>		


</body>
<script type="text/javascript" src="<%=ctxPath %>/js/permission.js"></script>     
</html>