<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<style type="text/css">
#updatePassword {
	box-shadow: 10px 10px 5px #888888;
	top: 30%;
	left: 29%;
	position: fixed;
	z-index: 111;
	width: 470px;
	height: 220px;
	display: none;
	border: 1px solid #0080ff;
	background: #fff;
}

.formControls {
	width: 80%;
}

.teble-style {
	max-width: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}
</style>
<link rel="stylesheet" href="<%=ctxPath%>/css/jquery-ui.min.css">
<script src="<%=ctxPath%>/site/js/echarts.js"></script>
<script src="<%=ctxPath%>/site/js/theme/macarons.js"></script>
<link href="../site/css/adminia.css" rel="stylesheet" />
<title>管理员用户列表</title>
</head>
<body>
	<h1 class="page-title">>>今天热点推送文章访问来源统计</h1>
	<div id="mai" style="width: 100%; height: 560px; float: left;">
		<script type="text/javascript">								
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('mai'),'macarons');												
			option = {
				    tooltip : {
				        trigger: 'axis'
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
				    calculable : true,
				    legend: {
				        data:['火狐','360','百度','谷歌','必应','其他']				        
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
				            splitLine : {show : false},
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            name : '访问量',
				            axisLabel : {
				                formatter: '{value} '
				            }
				        },
				        {
				            type : 'value',
				            name : '数量',
				            axisLabel : {
				                formatter: '{value}'
				            }
				        }
				    ],
				    series : [

				        {
				            name:'火狐',
				            type:'bar',
				            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
				        },
				        {
				            name:'360',
				            type:'bar',
				            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
				        },
				        {
				            name:'百度',
				            type:'line',
				            yAxisIndex: 1,
				            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
				        },
				        {
				            name:'谷歌',
				            type:'bar',
				            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
				        },
				        {
				            name:'必应',
				            type:'bar',
				            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
				        },
				        {
				            name:'其它',
				            type:'line',
				            yAxisIndex: 1,
				            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
				        }
				    ]
				};
				                    
				                    				
			myChart.setOption(option, true);
		</script>
	</div>
	</div>
	<script type="text/javascript" src="<%=ctxPath%>/js/adminUser.js"></script>
	<script type="text/javascript"
		src="<%=ctxPath%>/site/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript"
		src="<%=ctxPath%>/site/js/excanvas.min.js"></script>
	<script type="text/javascript"
		src="<%=ctxPath%>/site/js/jquery.flot.js"></script>
	<script type="text/javascript"
		src="<%=ctxPath%>/site/js/jquery.flot.pie.js"></script>
	<script type="text/javascript"
		src="<%=ctxPath%>/site/js/jquery.flot.orderBars.js"></script>
	<script type="text/javascript"
		src="<%=ctxPath%>/site/js/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="<%=ctxPath%>/site/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="<%=ctxPath%>/site/js/charts/bar.js"></script>
</body>
</html>