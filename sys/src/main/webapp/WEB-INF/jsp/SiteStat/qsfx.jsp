<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>趋势分析</title>
<script src="../site/js/echarts.js"></script>
<script src="../site/js/theme/macarons.js"></script>
<script src="../site/js/jquery-1.7.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="../site/css/bootstrap.min.css" rel="stylesheet" />
<link href="../site/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="../site/css/font-awesome.css" rel="stylesheet" />
<link href="../site/css/adminia.css" rel="stylesheet" />
<link href="../site/css/adminia-responsive.css" rel="stylesheet" />
<link href="../site/css/pages/dashboard.css" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <h1 class="page-title">
		>>趋势分析
	</h1>
	<div class="container">
					<div class="widget">
						<h3 style="float:left; width: 870px;">
							<a style="cursor: pointer;text-decoration:none;">当月:
								<span id="month"></span>
								<script type="text/javascript">						       						
									$.ajax({
										url : '../siteStat/doDuringTheMonth.do',
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
										url : '../siteStat/doInTheQuarter.do',
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
										url : '../siteStat/doThatYear.do',
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
								url : '../siteStat/doDuringTheMonth.do',
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
										url : '../siteStat/doInTheQuarter.do',
										date : "",
										type : 'get',
										dataType : "json",
										async : false, //同步
										contentType : 'application/json;charset=utf-8',
										success : function(data) {
											seasonCounts.push(data.seasonCount);
										$.ajax({
												url : '../siteStat/doThatYear.do',
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


						<div id="main" style="width: 635px; height: 400px; float:right;">
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
									            mark : {show: true},
									            dataView : {show: true, readOnly: false},
									            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
									            restore : {show: true},
									            saveAsImage : {show: true}
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
						                     data:[],
						             		markPoint : {
						            			data : [ {
						            				type : 'max',
						            				name : '最大值'
						            			}, {
						            				type : 'min',
						            				name : '最小值'
						            			} ]
						            		},
						            		markLine : {
						            			data : [ {
						            				type : 'average',
						            				name : '平均值'
						            			} ]
						            		}
						                    }  
						                ]  
						            };  
								var monthCounts = [];
								var dayPeriods = [];
								$.ajax({//使用JQuery内置的Ajax方法
									url : "../siteStat/doTimeVisitorsCount.do",//请求发送到ZqgkController处
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
		<!-- /container -->
	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="../site/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../site/js/excanvas.min.js"></script>
	<script type="text/javascript" src="../site/js/jquery.flot.js"></script>
	<script type="text/javascript" src="../site/js/jquery.flot.pie.js"></script>
	<script type="text/javascript" src="../site/js/jquery.flot.orderBars.js"></script>
	<script type="text/javascript" src="../site/js/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="../site/js/bootstrap.js"></script>
	<script type="text/javascript" src="../site/js/charts/bar.js"></script>
</body>
</html>