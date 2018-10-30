<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<title>添加站点</title>
</head>
<body>
<div class="pd-20">
    <form action="" class="form form-horizontal">
    
        <div class="row cl">
            <label class="form-label col-2">站点ID</label>
            <div class="formControls col-5">
                <input id="account" type="text" class="input-text" name="siteid" value="" />
            </div>
            <div class="col-5" ></div>
        </div>

        <div class="row cl">
            <label class="form-label col-2">站点名称</label>
            <div class="formControls col-5">
                <input id="text" type="text" class="input-text" name="sitename" value=""  />
            </div>
            <div class="col-5"></div>
        </div>
          <div class="row cl">
            <label class="form-label col-2">站点URL</label>
            <div class="formControls col-5">
                <input id="text" type="text" class="input-text" name="siteurl" value=""  />
            </div>
            <div class="col-5"></div>
        </div><div class="row cl">
            <label class="form-label col-2">创建者</label>
            <div class="formControls col-5">
                <input id="text" type="text" class="input-text" name="createname" value=""  />
            </div>
            <div class="col-5"></div>
        </div>

        <div class="row cl">
            <div class="col-9 col-offset-2">
                <input class="btn btn-primary radius" type="button" value="添加" onclick="addsite()" />
                <input class="btn btn-default radius" type="button" value="关闭" onclick="location.href='list.do'" style="margin-left: 30px;" />
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="<%=ctxPath %>/js/adminUser.js"></script>
</body>
</html>