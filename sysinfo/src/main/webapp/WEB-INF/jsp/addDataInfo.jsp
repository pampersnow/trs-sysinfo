<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp"%>
<meta charset="UTF-8">
<title>addDataInfo-demo</title>
</head>
<body>
	<h2>添加测试数据成功!</h2>
	<br />
	<hr />
	<h3>数据接口</h3>
	<ul>
		<li>1.参数: ip, area, siteid, pageid, type, writetime, title, articleid,sessionid, link</li>
		<li>2.接口路径:  sysinfo/src/main/webapp/site/js/addData/statistical.js</li>
		<li>demo: 
			var ip = "0.0.0.0";
			var area = "1号楼12层";
			var siteid = "25237752";
			var pageid = "000000";
			var type = "测试栏目";
			var writetime = "2018-09-09";
			var title = "测试文档标题...";
			var articleid = "111111";
			var sessionid = 3;
			var link = "http:test.2018/test_000.html";
			statistical(ip, area, siteid, pageid, type, writetime, title, articleid,sessionid, link);
		</li>
	</ul>
</body>
<script type="text/javascript">
	var ip = "0.0.0.0";
	var area = "1号楼12层";
	var siteid = "25237752";
	var pageid = "000000";
	var type = "测试栏目";
	var writetime = "2018-09-09";
	var title = "测试文档标题...";
	var articleid = "111111";
	var sessionid = 3;
	var link = "http:test.2018/test_000.html";
	statistical(ip, area, siteid, pageid, type, writetime, title, articleid,sessionid, link);
</script>
</html>