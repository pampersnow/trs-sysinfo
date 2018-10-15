<%@page import="com.sys.pojo.Zqgk"%>
<%@page import="javafx.scene.chart.PieChart.Data"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>站群概况</title>
<script src="${pageContext.request.contextPath }/site/js/echarts.js"></script>
<script src="${pageContext.request.contextPath }/site/js/theme/macarons.js"></script>
<script src="${pageContext.request.contextPath }/site/js/jquery-1.7.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="${pageContext.request.contextPath }/site/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/site/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/site/css/font-awesome.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/site/css/adminia.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/site/css/adminia-responsive.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/site/css/pages/dashboard.css" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<h1 class="page-title">
		>>当日访问量统计
	</h1>
		<div class="container">
					<!-- <div class="widget"> -->
						<!-- /widget-header -->
						<h2 style="float: left; width: 870px;">
						
							<a style="cursor: pointer;text-decoration:none;">今日访问量:
								<span id="sp"></span>
								<script type="text/javascript">						       						
									$.ajax({
										url : '${pageContext.request.contextPath }/siteStat/getEchartsData.do',
										date : "",
										type : 'get',
										dataType : "json",
										async : false, //同步
										contentType : 'application/json;charset=utf-8',
										success : function(data) {
											$("#sp").html(data.count);  
										}
									}) 							
								</script></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a style="cursor: pointer;text-decoration:none;">
								总访问量:
								<span id="sp_1"></span>
								<script type="text/javascript">						       						
								$.ajax({
									url : '${pageContext.request.contextPath }/siteStat/queryNum.do',
									date : "",
									type : 'get',
									dataType : "json",
									async : false, //同步
									contentType : 'application/json;charset=utf-8',
									success : function(data) {
										$("#sp_1").html(data.num); 
									}
								})					
								</script>
								</a>
							
						</h2>
						<div id="mai" style="width: 300px; height: 420px; float: left;">
							<script type="text/javascript">								
								var counts = [];
								var nums = [];
								$.ajax({
											url : '${pageContext.request.contextPath }/siteStat/getEchartsData.do',
											date : "",
											type : 'get',
											dataType : "json",
											async : false, //同步
											contentType : 'application/json;charset=utf-8',
											success : function(data) {
												counts.push(data.count);
												// 基于准备好的dom，初始化echarts实例
												var myChart = echarts.init(document.getElementById('mai'),'macarons');												
												option = {
													title : {
														x : 'center'
													},
													tooltip : {
														trigger : 'item',
														formatter : "{a} <br/>{b} : {c} ({d}%)"
													},
													legend : {
														orient : 'vertical',
														x : 'left',
														data : [ '今日访问量',
																'总访问量' ]
													},
													toolbox : {
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
																type : [ 'pie',
																		'funnel' ],
																option : {
																	funnel : {
																		x : '25%',
																		width : '50%',
																		funnelAlign : 'left',
																		max : 1548
																	}
																}
															},
															restore : {
																show : true
															},
															saveAsImage : {
																show : true
															}
														}
													},
													calculable : true,
													series : [ {
														name : '访问量',
														type : 'pie',
														radius : '55%',
														center : [ '50%', '60%' ],
														data : [ {
															value : counts,
															name : '今日访问量'
														}, {
															value : nums,
															name : '总访问量'
														} ]
													} ]
												};

												$.ajax({
															url : '${pageContext.request.contextPath }/siteStat/queryNum.do',
															date : "",
															type : 'get',
															dataType : "json",
															async : false, //同步
															contentType : 'application/json;charset=utf-8',
															success : function(data) {
																nums.push(data.num);
															}
														})
												myChart.setOption(option, true);
											}
										});
							</script>
						</div>

						<div id="main" style="width: 600px; height: 420px; float: right;">

							<script type="text/javascript">
								// 基于准备好的dom，初始化echarts实例
								var myChart = echarts.init(document
										.getElementById('main'),"macarons");
								/*折线图*/
								var option = {										
									title : {
										text : '时刻访问量',
										x : 'center',
										align: 'right'
									},
									tooltip : {
										trigger : 'axis'
									},
									legend: {
								        data:['时刻访问']
								    },
									color : [ '#FF3333', ],								
									toolbox : {
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
									calculable : true,
									xAxis : [ {
										type : 'category',
										name : '时刻',
										data : []
									} ],
									yAxis : [ {
										type : 'value',
										name : '数量',
									} ],
									series : [ {
										name : '访问量',
										type : 'line',
										symbol : 'emptycircle',
										stack : '总量',
										animation: true, 
										lineStyle: {normal: {width: 1}}, 
										data : []
									} ]
								};
								//myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画
								var hCounts = [];
								var hours = [];
								$.ajax({//使用JQuery内置的Ajax方法
											url : "${pageContext.request.contextPath }/siteStat/TimeToVisit.do",//请求发送到ZqgkController处
											date : "",
											type : "get", //get请求方式															
											dataType : "json", //返回数据形式为json
											success : function(data) {
												if (data != null&& data.length > 0) {
													for (var i = 0; i < data.length; i++) {
														hCounts.push(data[i].hCount);
														hours.push(data[i].hour);
													}
													myChart.hideLoading(); //隐藏加载动画	
													myChart.setOption(option);
													myChart.setOption({ //载入数据
														xAxis : {
															data : hours
														//填入X轴数据
														},
														series : [ //填入系列（内容）数据
														{
															// 根据名字对应到相应的系列						
															data : hCounts
														} ]
													});
												} else {
													alert("图表请求数据失败，可能是服务器开小差了");
												}
											}
										});
								//myChart.setOption(option);
							</script>
						</div>
					<!-- </div> -->
					<!-- /widget -->
				</div>
		<!-- /container -->
	</div>
	<!-- /content -->
	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/excanvas.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/jquery.flot.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/jquery.flot.pie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/jquery.flot.orderBars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/site/js/charts/bar.js"></script>
</body>
</html>