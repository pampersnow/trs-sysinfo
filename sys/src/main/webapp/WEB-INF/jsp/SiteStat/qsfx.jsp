<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>趋势分析</title>
<script src="${pageContext.request.contextPath }/site/js/echarts.js"></script>
<script src="${pageContext.request.contextPath }/site/js/theme/macarons.js"></script>
<script
	src="${pageContext.request.contextPath }/site/js/jquery-1.7.2.min.js"></script>
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
							class="dropdown-toggle " href="#"></a></li>
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

					<h1 class="page-title">
						<i class="icon-home"></i>趋势分析
					</h1>
					<div class="widget">
						<h3 style="float:left; width: 870px;">
							<a style="cursor: pointer;text-decoration:none;">当月:
								<span id="month"></span>
								<script type="text/javascript">						       						
									$.ajax({
										url : '${pageContext.request.contextPath }/sys/2370/doDuringTheMonth.html',
										date : "",
										type : 'get',
										dataType : "json",
										async : false, //同步
										contentType : 'application/json;charset=utf-8',
										success : function(data) {
											$("#month").html(data.monthsCount);  
										}
									}) 							
								</script>
							</a>
							<a style="cursor: pointer;text-decoration:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							当季:
							<span id="season"></span>
								<script type="text/javascript">						       						
									$.ajax({
										url : '${pageContext.request.contextPath }/sys/2370/doInTheQuarter.html',
										date : "",
										type : 'get',
										dataType : "json",
										async : false, //同步
										contentType : 'application/json;charset=utf-8',
										success : function(data) {
											$("#season").html(data.seasonCount);  
										}
									}) 							
								</script>
							</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a style="cursor: pointer;text-decoration:none;">当年:
								<span id="year"></span>
								<script type="text/javascript">						       						
									$.ajax({
										url : '${pageContext.request.contextPath }/sys/2370/doThatYear.html',
										date : "",
										type : 'get',
										dataType : "json",
										async : false, //同步
										contentType : 'application/json;charset=utf-8',
										success : function(data) {
											$("#year").html(data.yearCount);  
										}
									}) 							
								</script>
							</a>
						</h3>
						<!-- /widget-header -->
						<div id="mai" style="width: 300px; height: 400px; float: left;">
							<script type="text/javascript">
							var monthsCounts=[];
							var seasonCounts=[];
							var yearCounts=[];
							$.ajax({
								url : '${pageContext.request.contextPath }/sys/2370/doDuringTheMonth.html',
								date : "",
								type : 'get',
								dataType : "json",
								async : false, //同步
								contentType : 'application/json;charset=utf-8',
								success : function(data) {
									monthsCounts.push(data.monthsCount);									
									// 基于准备好的dom，初始化echarts实例
									var myChart = echarts.init(document.getElementById('mai'),'macarons');
									/*统计图*/
									option = {
										    title : {
										        text: '访问量',
										        x:'center'
										    },
										    tooltip : {
										        trigger: 'item',
										        formatter: "{a} <br/>{b} : {c} ({d}%)"
										    },
										    legend: {
										        orient : 'vertical',
										        x : 'left',
										        data:['当月','当季','当年']
										    },
										    toolbox: {
										        show : true,
										        feature : {
										            mark : {show: true},
										            dataView : {show: true, readOnly: false},
										            magicType : {
										                show: true, 
										                type: ['pie', 'funnel'],
										                option: {
										                    funnel: {
										                        x: '25%',
										                        width: '50%',
										                        funnelAlign: 'left',
										                        max: 3000
										                    }
										                }
										            },
										            restore : {show: true},
										            saveAsImage : {show: true}
										        }
										    },
										    calculable : true,
										    series : [
										        {
										            name:'访问量',
										            type:'pie',
										            radius : '55%',
										            center: ['50%', '60%'],
										            data:[
										                {value:monthsCounts, name:'当月'},
										                {value:seasonCounts, name:'当季'},
										                {value:yearCounts, name:'当年'}
										            ]
										        }
										    ]
										};
									$.ajax({
										url : '${pageContext.request.contextPath }/sys/2370/doInTheQuarter.html',
										date : "",
										type : 'get',
										dataType : "json",
										async : false, //同步
										contentType : 'application/json;charset=utf-8',
										success : function(data) {
											seasonCounts.push(data.seasonCount);
										$.ajax({
												url : '${pageContext.request.contextPath }/sys/2370/doThatYear.html',
												date : "",
												type : 'get',
												dataType : "json",
												async : false, //同步
												contentType : 'application/json;charset=utf-8',
												success : function(data) {
													yearCounts.push(data.yearCount);
												}
											}) 	
										}
									}) 	
									myChart.setOption(option,true);
								}
								})								
							</script>
						</div>


						<div id="main" style="width: 570px; height: 400px; float:right;">
							<script type="text/javascript">
								// 基于准备好的dom，初始化echarts实例
								var myChart = echarts.init(document.getElementById('main'),'macarons');
								option = {  
						                title : {  
						                    text: '时间轴统计访客量',  
						                    x: 'center',  
						                    align: 'right'  
						                },  
						                color : [ '#FF3333' ],
						                grid: {  
						                    bottom: 80  
						                },  
						                toolbox: {  
						                	show : true,
											feature : {
												mark : {
													show : true
												},
												dataView : {
													show : true,
													readOnly : false
												},
												magicType : {
													show : true,
													type : [ 'line', 'bar' ]
												},
												restore : {
													show : true
												},
												saveAsImage : {
													show : true
												}
											}
						                },  
						                tooltip : {  
						                    trigger: 'axis',  
						                    axisPointer: {  
						                        animation: false  
						                    }  
						                },  
						                calculable : true,
						                dataZoom: [  
						                    {  
						                        show: true,  
						                        backgroundColor:"rgba(47,69,84,0)",
						                        type: 'slider', 
						                        fillerColor:"rgba(167,183,204,0.4)",  //选中范围的填充颜色。  
						                        borderColor:"#ddd",                     //边框颜色。  
						                        filterMode: 'filter', 
						                        start: 30,  
						                        end: 70  
						                    },  
						                    {  
						                        type: 'inside',  
						                        realtime: true,  
						                        start: 65,  
						                        end: 85  
						                    }  
						                ],  
						                //x轴时间轴  
						                xAxis : [  
						                    {  	name:'日期',
						                        type : 'category',  
						                        data : [] 
						                    }  
						                ],  
						                yAxis: [  
						                    {  
						                        name: '访客量',  
						                        type: 'value'  
						                    }  
						                ],  
						                //y轴  
						                series: [  
						                    {  name:'流量',  
						                        type:'line',  
						                        animation: true, 
						                        symbol : 'emptycircle',
						                     lineStyle: {normal: {width: 1}},  
						                     data:[]  
						                    }  
						                ]  
						            };  
								var monthCounts = [];
								var dayPeriods = [];
								$.ajax({//使用JQuery内置的Ajax方法
									url : "${pageContext.request.contextPath }/sys/2370/doTimeVisitorsCount.html",//请求发送到ZqgkController处
									date : "",
									type : "get", //get请求方式															
									dataType : "json", //返回数据形式为json
									success : function(data) {
										if (data != null&& data.length > 0) {
											for (var i = 0; i < data.length; i++) {
												monthCounts.push( data[i].monthCount),
												dayPeriods.push (data[i].daystr)
											}
										}
										myChart.hideLoading(); //隐藏加载动画
										myChart.setOption(option,true);
										myChart.setOption({ //载入数据
											xAxis : {
												data : dayPeriods
											//填入X轴数据
											},
											series : [ //填入系列（内容）数据
											{
												// 根据名字对应到相应的系列						
												data : monthCounts
											} ]
										});
									}
								})		
							</script>
							<br/>
							<span style="font-style: italic; color: red; float: ">
							请通过以上时间轴选择时间段访客量浏览（支持鼠标悬停折线图滚动）</span>
						</div>


					</div>
					<!-- /widget -->

				</div>
				<!-- /span9 -->

			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

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