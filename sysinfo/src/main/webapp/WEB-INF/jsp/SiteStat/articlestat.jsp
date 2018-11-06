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
				    	show:true,    
				        left: 'left',    
				        y: 'top',
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
				        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎','百度','谷歌','必应','其他']
				    },
				    xAxis : [
				        {
				            type : 'category',
				            splitLine : {show : false},
				            data : ['周一','周二','周三','周四','周五','周六','周日']
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            position: 'right'
				        }
				    ],
				    series : [
				        {
				            name:'直接访问',
				            type:'bar',
				            data:[320, 332, 301, 334, 390, 330, 320]
				        },
				        {
				            name:'邮件营销',
				            type:'bar',
				            tooltip : {trigger: 'item'},
				            stack: '广告',
				            data:[120, 132, 101, 134, 90, 230, 210]
				        },
				        {
				            name:'联盟广告',
				            type:'bar',
				            tooltip : {trigger: 'item'},
				            stack: '广告',
				            data:[220, 182, 191, 234, 290, 330, 310]
				        },
				        {
				            name:'视频广告',
				            type:'bar',
				            tooltip : {trigger: 'item'},
				            stack: '广告',
				            data:[150, 232, 201, 154, 190, 330, 410]
				        },
				        {
				            name:'搜索引擎',
				            type:'line',
				            data:[862, 1018, 964, 1026, 1679, 1600, 1570]
				        },

				        {
				            name:'搜索引擎细分',
				            type:'pie',
				            tooltip : {
				                trigger: 'item',
				                formatter: '{a} <br/>{b} : {c} ({d}%)'
				            },
				            center: [160,130],
				            radius : [0, 50],
				            itemStyle :　{
				                normal : {
				                    labelLine : {
				                        length : 20
				                    }
				                }
				            },
				            data:[
				                {value:1048, name:'百度'},
				                {value:251, name:'谷歌'},
				                {value:147, name:'必应'},
				                {value:102, name:'其他'}
				            ]
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