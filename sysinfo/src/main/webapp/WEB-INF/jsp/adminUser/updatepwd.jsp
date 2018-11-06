<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<title>修改密码</title>
</head>
<body>
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
</body>
</html>