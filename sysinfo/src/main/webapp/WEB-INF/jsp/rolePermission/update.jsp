<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<title>分配权限</title>
</head>
<body>
<div class="pd-20">
    <form action="">   
        <table class="table table-border table-bordered table-bg table-hover">
            <thead>
                <tr>
                    <th width="100px"> 
                    	<a href="javascript:chechALL();" class="btn size-MINI btn-secondary radius">全选</a>&nbsp;&nbsp;
            			<a href="javascript:donALL();" class="btn size-MINI btn-secondary radius">取消</a>
            		</th>
                    <th>权限请求路径</th>
                    <th>权限描述</th>
                </tr>
            </thead>
            <tbody>
            
            <c:forEach var="permissions" items="${permissionList}">
                    <tr>
                        <td>                       	
                        	<input type="checkbox" name="permissionIds" value="${permissions.id }"  
	                        	<c:forEach var="CheckPermissions" items='${CheckPermissions }'>
		                        	<c:if test='${permissions.id eq CheckPermissions.key && CheckPermissions.value==true}'>checked="checked"</c:if>     			                      			                        				                        			                        		             	                       	
		                        </c:forEach>
	                       />                        	                    	                        	                      		
                        </td>
                        <td>${permissions.permission }</td>
                        <td>${permissions.description }</td>
                    </tr>
            </c:forEach> 
           
            </tbody>
        </table>
            
        <br>
        <input class="btn btn-primary radius" type="button" value="分配权限" onclick="updatePermission()" />
        <input class="btn btn-default radius" type="button" value="关闭" onclick="location.href='list.do'" style="margin-left: 30px;" />
    </form>
    <jsp:include page="/WEB-INF/jsp/page.jsp" flush="true"/>
</div>

</body>
<script type="text/javascript" src="<%=ctxPath %>/js/rolePermission.js"></script>
</html>