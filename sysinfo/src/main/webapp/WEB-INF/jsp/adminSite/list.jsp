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
<title>站点管理</title>
<script type="text/javascript"src="../js/PagingClick.js"></script> 
</head>
<body>
<div class="pd-20">
    <table class="table table-border table-bordered table-bg table-hover">
        <thead>
            <tr>
                <th>站点ID</th>
                <th>站点名称</th>
                <th>用户标识</th>
                <th>站点URL</th>
                <th>获取嵌码</th>
                <th>嵌码时间</th>
                <th>创建者</th>
                <th>创建时间</th>
                <th>状&nbsp;&nbsp;态</th>
                <th>操&nbsp;&nbsp;作&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn size-MINI btn-secondary radius" href="<%=ctxPath %>/adminsite/add.do">添加站点</a></th>
            </tr>
        </thead>
        <tbody>
         <c:forEach var="adminSiteList" items="${adminSiteList }" > 
                <tr>
                    <td>${adminSiteList.siteid}</td>
                  	<td>${adminSiteList.sitename}</td>
                  	<td><span><shiro:principal/></span></td>
                  	<td>${adminSiteList.siteurl}</td>
                  	<td><a href="<%=ctxPath %>/adminsite/embedcode.do">获取嵌码</a></td>
                  	<td><fmt:formatDate value="${adminSiteList.addjstime}" pattern="yyyy-MM-dd" /></td>
                  	<td>${adminSiteList.createname}</td>
                  	<td><fmt:formatDate value="${adminSiteList.createtime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                  	
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
                        <shiro:hasPermission name="/adminUser/updateDisabled.do">
                        <button class="btn size-MINI btn-warning radius" onclick="window.location='updateDisabled.do?id=${adminUserList.id}'">禁用/启用</button>
                        </shiro:hasPermission>
                    </td> 
                </tr>
             </c:forEach>  

        </tbody>
    </table>
    <%@include file="/WEB-INF/jsp/page.jsp" %>
</div>  

<script type="text/javascript">
/**分页*/
function nextPage(currPage,pageSize){	
	window.location="list.do?currPage="+currPage+"&pageSize="+pageSize+"";
}
</script>   
</body>
</html>