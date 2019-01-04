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
	<div style="width: 980px;">
	<table class="table table-border table-bordered table-striped">
		<tr>
			<th>接口名称</th>
			<td>statistical.js</td>
		</tr>
		<tr>
			<th>接口参数</th>
			<td>ip(IP地址), area(区域), siteid(站点ID), pageid(栏目ID), type(栏目名称),
				writetime(文档撰写时间), title(文档标题), articleid(文档ID),sessionid(访问来源),
				link(文档链接)</td>
		</tr>
		<tr>
			<th>接口路径</th>
			<td>sysinfo/src/main/webapp/site/js/addData/statistical.js</td>
		</tr>
		<tr>
			<th>Demo</th>
			<td>var ip = "0.0.0.0";&nbsp;var area = "1号楼12层";&nbsp;var
				siteid = "25237752";&nbsp;var pageid = "000000"; &nbsp;var type =
				"测试栏目";&nbsp;var writetime = "2018-09-09";&nbsp;var title =
				"测试文档标题...";&nbsp;var articleid = "111111"; &nbsp;var sessionid =
				3;&nbsp;var link = "http:test.2018/test_000.html";</td>
		</tr>
		<tr>
			<th>接口调用</th>
			<td>statistical(ip, area, siteid, pageid, type, writetime,title, articleid,sessionid, link);</td>
		</tr>
	</table>
	</div>
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
	//statistical(ip, area, siteid, pageid, type, writetime, title, articleid,sessionid, link);
</script>
</html>