<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<title>获取嵌码</title>
</head>
<body style="background:#FCFCFC;">
<header class="hui-header">
    <div id="hui-back"></div>
</header>
<div class="hui-wrap">    
        <div class="hui-form-items">
            <div class="hui-form-items-title" style="font-size: 16px; color: #DC143C;">&nbsp;&nbsp;站点统计JS嵌码  </div>
            <div class="hui-form-textarea">
                <textarea name="note" style="width: 800px; height: 200px;" id="input">
                	<script id="" src="ta.js?mpid=478"async="async" defer="defer"></script>	
                </textarea>
            </div>
        </div>
        <div style="padding:15px 8px;">
            <button type="button" class="btn size-MINI btn-secondary radius"onclick="copyText()">
            	&nbsp;&nbsp;&nbsp;&nbsp;复制代码</button>
        </div>
</div>
<script type="text/javascript">
function copyText() {
	   var text = document.getElementById("text").innerText;
	   var input = document.getElementById("input");
	   input.value = text; // 修改文本框的内容
	   input.select(); // 选中文本
	   document.execCommand("copy"); // 执行浏览器复制命令
	   alert("复制成功");
	  }
</script>
</html>
