<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>访客列表</title>
<script src="${pageContext.request.contextPath }/site/js/echarts.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link
	href="${pageContext.request.contextPath }/site/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/site/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/site/css/font-awesome.css"
	rel="stylesheet" />
<!-- 设置网站标签图标 -->
<!-- <link href="static/images/favicon.ico" rel="shortcut icon" /> -->
<link href="${pageContext.request.contextPath }/site/css/adminia.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/site/css/adminia-responsive.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/site/css/pages/dashboard.css"
	rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${pageContext.request.contextPath }/site/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="./"></a>
				<div class="nav-collapse">

					<ul class="nav pull-right">
						<li class="divider-vertical"></li>
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle " href="#"> </a></li>
					</ul>
				</div>
				<!-- /nav-collapse -->

			</div>
			<!-- /container -->
		</div>

		<!-- /navbar-inner -->
	</div>
	<!-- /navbar -->
	<div class="copyrights"></div>

	<div id="content">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="account-container">
						<div class="account-avatar">
							<img src="${pageContext.request.contextPath }/site/img/cat.png"
								alt="" class="thumbnail" />
						</div>
						<!-- /account-avatar -->
						<div class="account-details">
							<h3>当前登录用户名：</h3>
							<span class="account-name">${userSession.username}</span>							 
						</div>

						<!-- /account-details -->
					</div>
					<!-- /account-container -->
					<hr />
					<ul id="main-nav" class="nav nav-tabs nav-stacked">
						<li><a href="${pageContext.request.contextPath }/sys/2100/dozqgk.html"><i
								class="icon-home"></i>站群概况 </a></li>
						<li><a href="${pageContext.request.contextPath }/sys/2370/doqsfx.html"><i
								class="icon-user"></i>趋势分析 </a></li>
						<li><a
							href="${pageContext.request.contextPath }/sys/2441/dofklb.html"><i
								class="icon-user"></i>访客列表 </a></li>
						<li><a href="${pageContext.request.contextPath }/sys/2850/dordlm.html">
								<i class="icon-user"></i> 热点栏目
						</a></li>
						<li><a href="${pageContext.request.contextPath }/sys/2042/dordwz.html">
								<i class="icon-user"></i> 热点文章
						</a></li>
					</ul>
					<hr />
					<br />
					<div class="sidebar-extra">
						<%
							Calendar rightNow = Calendar.getInstance();
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<script type="text/javascript">
							//从服务器上获取初始时间 
							var currentDate = new Date(
						<%=new java.util.Date().getTime()%>
							);
							function run() {
								currentDate
										.setSeconds(currentDate.getSeconds() + 1);
								var time = "";
								var year = currentDate.getFullYear();
								var month = currentDate.getMonth() + 1;
								var day = currentDate.getDate();
								var hour = currentDate.getHours();
								var minute = currentDate.getMinutes();
								var second = currentDate.getSeconds();
								if (hour < 10) {
									time += "0" + hour;
								} else {
									time += hour;
								}
								time += ":";
								if (minute < 10) {
									time += "0" + minute;
								} else {
									time += minute;
								}
								time += ":";
								if (second < 10) {
									time += "0" + second;
								} else {
									time += second;
								}
								document.getElementById("dt").innerHTML = year
										+ "年" + month + "月" + day + "日" + time;
							}
							window.setInterval("run();", 1000);
						</script>
						<h2 id="dt">当前时间：</h2>
					</div>
					<!-- .sidebar-extra -->
				</div>
				<!-- /span3 -->
				<div class="span9">
					<h1 class="page-title" style="width: 938px;">
						<i class="icon-home"></i>>>访客列表
					</h1>
					<div class="widget widget-table"
						style="height: 25px; width: 1000px;">

						<div id="from1" style="float: left;">
							<form action="${pageContext.request.contextPath }/sys/2441/doByTime.html" method="post">
								<h4>
									按日期查找：从<input class="Wdate" placeholder="请选择日期" type="text"
										name="startTime" onclick="WdatePicker()" />至<input
										class="Wdate" placeholder="请选择日期" type="text"
										name="endTime" onclick="WdatePicker()" /> <input
										type="submit" value="搜索" class="button">
								</h4>
							</form>
						</div>
						<div id="from2" style="margin: auto;">
							<form action="${pageContext.request.contextPath }/sys/2441/doMores.html" method="post">
								<h4>
									&nbsp;&nbsp;按站点ID查找：<input placeholder="支持模糊搜索" name="siteid" />
									<input type="submit" value="搜索" class="button">
								</h4>
							</form>
						</div>
					</div>
					<!-- /widget-header -->
					<!-- <div class="widget-content"> -->
					<div class="widget-header" style="width: 953px;">
						<div style="float: left; width: 953px;">
							<i class="icon-th-list"></i>
							<h3>>>访客列表</h3>
							<div style="float: right;">
							<div style="float: left;">
								<a style="cursor: pointer;"
									href="${pageContext.request.contextPath }/sys/2441/doTodayfklb.html">今天</a>&nbsp;&nbsp;&nbsp;
								<a style="cursor: pointer;"
									href="${pageContext.request.contextPath }/sys/2441/doTheLastThreeDaysfklb.html">最近三天</a>&nbsp;&nbsp;&nbsp;
								<a style="cursor: pointer;"
									href="${pageContext.request.contextPath }/sys/2441/doThisWeekfklb.html">本周访客</a>&nbsp;&nbsp;&nbsp;
								<a
									href="${pageContext.request.contextPath }/sys/2441/doThisMonthfklb.html">本月访客</a>&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath }/sys/2441/dofklb.html">所有访客</a>
							</div>						
					</div>
					<table class="table table-striped table-bordered"
						style="width: 953px;">
						<thead>
							<tr>
								<th>#</th>
								<th>ID</th>
								<th>IP</th>
								<th>访客地区</th>
								<th>访问时间</th>
								<th>站点ID</th>
								<th>栏目ID</th>
								<th>栏目</th>
								<th>文章ID</th>
								<th>文章标题</th>
							</tr>
						</thead>
						<c:forEach items="${listFklb}" var="listfklb" varStatus="vs">
							<tbody>
								<tr>
									<td>${vs.count }</td>
									<td>${listfklb.id }</td>
									<td>${listfklb.ip }</td>
									<td>${listfklb.area }</td>
									<td><fmt:formatDate value="${listfklb.accesstime}"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
									<td>${listfklb.siteid }</td>
									<td>${listfklb.pageid }</td>
									<td>${listfklb.type }</td>
									<td style="”word-wrap: break-word; word-break: break-all;">${listfklb.articleid }</td>
									<td style="”word-wrap: break-word; word-break: break-all;">${listfklb.title }</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
					<!-- /widget-header -->
					<!-- 					</div>
					/widget-content -->
				</div>
				<!-- /span9 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	</div>
</div>
	<!-- /content -->
	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/excanvas.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/jquery.flot.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/jquery.flot.pie.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/jquery.flot.orderBars.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/jquery.flot.resize.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/site/js/charts/bar.js"></script>
</body>
</html>