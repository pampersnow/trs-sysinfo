<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/theme/macarons.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/beijing.js"></script>
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#allmap {width:100%;height:100%;font-family:"微软雅黑";}
#showAnnouncement{box-shadow: 10px 10px 5px #888888;top:15%;left:15%;position:fixed;z-index:111;width:70%;height:70%;display: none;border:1px solid #0080ff;background:#fff;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ab6TdFaqCmUCKAL0oTCLc1te0keLaIOX"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>我的桌面</title>
</head>
<body>


	<div class="pd-20"  style="width: 60%;">
	    <table class="table table-border table-bordered table-bg table-hover">
	        <thead>
	            <tr>
	                <th>
		                <span class="f-l">&nbsp;<i style="font-size: 18px;" class="Hui-iconfont">&#xe671;</i>&nbsp;地图总览</span>
		            </th>
	            </tr>
	        </thead>
	        <tbody>
	                <tr>
	                    <td id="map" style="height: 512px;margin: 0;padding: 0;">    
		                   <script type="text/javascript">
		                  /* 基于准备好的dom，初始化echarts实例 */
		                   var myChart = echarts.init(document.getElementById('map'));
							    // 市区坐标
							    var geoCoordMap = {
							        "东城区": [116.418757, 39.937544],
							        "西城区": [116.366794, 39.910309],
							        "朝阳区": [116.486409, 39.991489],
							        "丰台区": [116.286968, 39.863642],
							        "石景山区": [116.170445, 39.974601],
							        "海淀区": [116.280316, 40.039074],
							        "门头沟区": [115.905381, 40.009183],
							        "房山区": [115.701157, 39.735535],
							        "通州区": [116.758603, 39.802486],
							        "顺义区": [116.753525, 40.128936],
							        "昌平区": [116.235906, 40.318085],
							        "大兴区": [116.338033, 39.658908],
							        "怀柔区": [116.607122, 40.524272],
							        "平谷区": [117.112335, 40.244783],
							        "密云区": [116.943352, 40.477362],
							        "延庆区": [115.985006, 40.465325]
							    };
							    var rawData = [
							        ["东城区",10,20,30],
							        ["西城区",10,20,30],
							        ["朝阳区",10,20,30],
							        ["丰台区",10,20,30],
							        ["石景山区",10,20,30],
							        ["海淀区",10,20,30],
							        ["门头沟区",10,20,30],
							        ["房山区",10,20,30],
							        ["通州区",10,20,30],
							        ["顺义区",10,20,30],
							        ["昌平区",10,20,30],
							        ["大兴区",10,20,30],
							        ["怀柔区",10,20,30],
							        ["平谷区",10,20,30],
							        ["密云区",10,20,30],
							        ["延庆区",10,20,30]
							    ];
							    function makeMapData(rawData) {
							        var mapData = [];
							        for (var i = 0; i < rawData.length; i++) {
							            var geoCoord = geoCoordMap[rawData[i][0]];
							            if (geoCoord) {
							                mapData.push({
							                    name: rawData[i][0],
							                    value: geoCoord.concat(rawData[i].slice(1))
							                });
							            }
							        }
							        return mapData;
							    };
							    option = {
							        animation: false,
							        // 地图背景颜色
							        backgroundColor: new echarts.graphic.RadialGradient(0.5, 0.5, 0.4, [{
							            offset: 0,
							            color: '#4b5769'
							        }, {
							            offset: 1,
							            color: '#404a59'
							        }]),
							        tooltip: {
							            trigger: 'axis'
							        },
							        geo: {
							            map: '北京',
							            roam: true,
							            zoom: 1.155, // 地图初始大小
							            center: [116.366794, 40.400309], // 初始中心位置
							            label: {
							                emphasis: {
							                    show: false,
							                    areaColor: '#eee'
							                }
							            },
							            // 地区块儿颜色
							            itemStyle: {
							                normal: {
							                    areaColor: '#55C3FC',
							                    borderColor: '#fff'
							                },
							                emphasis: {
							                    areaColor: '#21AEF8'
							                }
							            }
							        },
							        series: []
							    };
							    function renderEachCity() {
							        var option = {
							            xAxis: [],
							            yAxis: [],
							            grid: [],
							            series: []
							        };
							        echarts.util.each(rawData, function(dataItem, idx) {
							            var geoCoord = geoCoordMap[dataItem[0]];
							            var coord = myChart.convertToPixel('geo', geoCoord);
							            idx += '';
							            inflationData = [30,50,20];
							            option.xAxis.push({
							                id: idx,
							                gridId: idx,
							                type: 'category',
							                name: dataItem[0],
							                nameLocation: 'middle',
							                nameGap: 3,
							                splitLine: {
							                    show: false
							                },
							                axisTick: {
							                    show: false
							                },
							                axisLabel: {
							                    show: false
							                },
							                axisLine: {
							                    onZero: false,
							                    lineStyle: {
							                        color: '#666'
							                    }
							                },
							                // data: xAxisCategory,
							                data: ["数据A","数据B","数据C"],
							                z: 100
							            });
							            option.yAxis.push({
							                id: idx,
							                gridId: idx,
							                splitLine: {
							                    show: false
							                },
							                axisTick: {
							                    show: false
							                },
							                axisLabel: {
							                    show: false
							                },
							                axisLine: {
							                    show: false,
							                    lineStyle: {
							                        color: '#1C70B6'
							                    }
							                },
							                z: 100
							            });
							            option.grid.push({
							                id: idx,
							                width: 30,
							                height: 40,
							                left: coord[0] - 15,
							                top: coord[1] - 15,
							                z: 100
							            });
							            option.series.push({
							                id: idx,
							                type: 'bar',
							                xAxisId: idx,
							                yAxisId: idx,
							                barGap: 0,
							                barCategoryGap: 0,
							                // data: inflationData,
							                data: inflationData,
							                z: 100,
							                itemStyle: {
							                    normal: {
							                        color: function(params){
							                            // 柱状图每根柱子颜色
							                            var colorList = ['#F75D5D','#59ED4F','#4C91E7'];
							                            return colorList[params.dataIndex];
							                        }
							                    }
							                }
							            });
							        });
							        console.time('a');
							        myChart.setOption(option);
							        console.timeEnd('a');
							    }
							    setTimeout(renderEachCity, 0);
							    // 缩放和拖拽
							    function throttle(fn, delay, debounce) {
							        var currCall;
							        var lastCall = 0;
							        var lastExec = 0;
							        var timer = null;
							        var diff;
							        var scope;
							        var args;
							        delay = delay || 0;
							        function exec() {
							            lastExec = (new Date()).getTime();
							            timer = null;
							            fn.apply(scope, args || []);
							        }
							        var cb = function() {
							            currCall = (new Date()).getTime();
							            scope = this;
							            args = arguments;
							            diff = currCall - (debounce ? lastCall : lastExec) - delay;
							            clearTimeout(timer);
							            if (debounce) {
							                timer = setTimeout(exec, delay);
							            } else {
							                if (diff >= 0) {
							                    exec();
							                } else {
							                    timer = setTimeout(exec, -diff);
							                }
							            }
							            lastCall = currCall;
							        };
							        return cb;
							    }
							    var throttledRenderEachCity = throttle(renderEachCity, 0);
							    myChart.on('geoRoam', throttledRenderEachCity);
							    myChart.setOption(option);
							    // 点击显示柱状图
							    myChart.on('click',function(e){
							        console.log(e)
							        // console.log(params);
							        if(e.componentSubType == "bar"){
							            // 先清除所有柱状图
							            $('.tongJiTu').remove();
							            // 创建遮挡层
							            creatWrap();
							            // 创建柱状图容器
							            var divObj = document.createElement('div');
							            $(divObj).addClass('tongJiTu');
							            divObj.id = 'zhuzhuang';
							            var divX = getMousePos()['x']; 
							            var divY = getMousePos()['y']; 
							            $(divObj).css({
							                'width': 250,
							                'height': 180,
							                'border': '1px solid #ccc',
							                'position': 'absolute',
							                'top': divY,
							                'left': divX
							            }).appendTo('.wrap');
							            // 创建柱状图
							            zhuZhuangTu();
							            // 点击遮挡层消失
							            clearWrap('.zhedang');
							        }
							        return;
							    });
							    // 获取横纵坐标
							    function getMousePos(e) {
							        var e = event || window.event;
							        var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft;
							        var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
							        var x = e.pageX || e.clientX + scrollX;
							        var y = e.pageY || e.clientY + scrollY;
							        // console.log(x,y)
							        return {'x': x,'y': y};
							    }
							    // 生成柱状图
							    function zhuZhuangTu() {
							        var zhuzhuang = echarts.init(document.getElementById('zhuzhuang'));
							        option = {
							            backgroundColor: 'rgba(255,255,255,.3)',
							            legend: {
							                data: ['数据A','数据B','数据C']
							            },
							            xAxis: [
							                {
							                    type: 'category',
							                    data: ['数据A','数据B','数据C']
							                }
							            ],
							            yAxis: [
							                {
							                    splitLine: {
							                        show: false
							                    },
							                    type: 'value'
							                }
							            ],
							            series: [
							                {
							                    type: 'bar',
							                    itemStyle: {
							                        normal: {
							                            color: function(params){
							                                var colorList = ['#F75D5D','#59ED4F','#4C91E7'];
							                                return colorList[params.dataIndex];
							                            },
							                            label: {
							                                show: true,
							                                position: 'top',
							                                textStyle: {
							                                    color: '#000'
							                                }
							                            }
							                        }
							                    },
							                    data: [10,20,30]
							                }
							            ]
							        };
							        zhuzhuang.setOption(option);
							    }
							    // 生成遮挡层
							    function creatWrap(){
							        var zheDang = document.createElement('div');
							        $(zheDang).addClass('zhedang').css({
							            width: '100%',
							            height: '100%',
							            position: 'absolute',
							            top: 0,
							            left: 0,
							            backgroundColor: 'rgba(0,0,0,.2)'
							        }).appendTo('.wrap');
							    }
							    // 去掉遮挡层
							    function clearWrap(id){
							        $(id).click(function(e){
							            // console.log(this);
							            this.remove();
							            $('.tongJiTu').remove();
							            return false;
							        });
							    }
		                   </script>
						</td>                   
					</tr>
	        </tbody>
	    </table>
	</div>




	<div class="" style="width: 36%;height: 573px;position: fixed;right: 20px;top: 20px;">
	    <div class="">	        
	        <table class="table table-border table-bordered table-bg table-hover">
		        <thead>
		            <tr>
		                <th>
			                <span class="f-l">&nbsp;<i style="font-size: 18px;" class="Hui-iconfont">&#xe63b;</i>&nbsp;站点栏目访问统计</span>			           
		                </th>
		            </tr>
		        </thead>
	        </table>

	        <div id="main1" style="border: 1px #ddd solid;height: 390px;">	                                    					
					<script type="text/javascript">
					 /* 基于准备好的dom，初始化echarts实例 */
	                   var myChart = echarts.init(document.getElementById('main1'),
	                   		"macarons");
	                   var app = {};
	                   option = null;
	                   var weatherIcons = {
	                		    'Sunny': './data/asset/img/weather/sunny_128.png',
	                		    'Cloudy': './data/asset/img/weather/cloudy_128.png',
	                		    'Showers': './data/asset/img/weather/showers_128.png'
	                		};

	                		option = {
	                		    title: {
	                		        text: '今日栏目访问',
	                		        left: 'center'
	                		    },
	                		    tooltip : {
	                		        trigger: 'item',
	                		        formatter: "{a} <br/>{b} : {c} ({d}%)"
	                		    },
	                		    legend: {
	                		        // orient: 'vertical',
	                		        // top: 'middle',
	                		        bottom: 10,
	                		        left: 'center',
	                		        data: ['首页', '关于我部','中联发布','党际交往动态','聚焦中共','对外工作计实','时事纵横','世界政党','考试录用']
	                		    },
	                		    series : [
	                		        {
	                		            type: 'pie',
	                		            radius : '65%',
	                		            center: ['50%', '50%'],
	                		            selectedMode: 'single',
	                		            data:[	                		              
	                		                {value:535, name: '首页'},
	                		                {value:510, name: '关于我部'},
	                		                {value:634, name: '中联发布'},
	                		                {value:735, name: '党际交往动态'},
	                		                {value:435, name: '聚焦中共'},
	                		                {value:610, name: '对外工作计实'},
	                		                {value:634, name: '时事纵横'},
	                		                {value:435, name: '考试录用'}
	                		            ],
	                		            itemStyle: {
	                		                emphasis: {
	                		                    shadowBlur: 10,
	                		                    shadowOffsetX: 0,
	                		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                		                }
	                		            }
	                		        }
	                		    ]
	                		};

					 myChart.setOption(option, true);
					</script>
			</div>
	    </div>

	    <div class="" style="margin-top: 8px;">
	        <table class="table table-border table-bordered table-bg table-hover">
		        <thead>
		            <tr>
		                <th>
			                <span class="f-l">&nbsp;<i style="font-size: 18px;" class="Hui-iconfont">&#xe62f;</i>&nbsp;公告通知</span>
			            </th>
		            </tr>
		        </thead>
	        </table>	
	        
	         <div  style="border: 1px #ddd solid;height: 60px;">	                                    					
					<h4 style="float: left; width: 870px;">
						
							<a style="cursor: pointer;text-decoration:none;">今日访问量:
								<span id="sp">34521</span>
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
								</script></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a style="cursor: pointer;text-decoration:none;">
								总访问量:
								<span id="sp_1">234235</span>
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
							
						</h4>
			</div>        
	    </div>
	</div>

<div id="showAnnouncement">
        <div class="row cl" >        
            <div class="formControls col-5"  id="announcementValue" style="width:99.5%;overflow-y:scroll;height:450px;margin: 5px;">            	       
			</div>
        </div>
        <div align="center" ><button class="btn btn-default radius" onclick="closer()">关闭</button></div>
</div>		

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/bikesMap.js"></script>
<script type="text/javascript">
function showAnnouncement(value){	
	jQuery.post("showAnnouncement.do",{id:value},function(data) {
		jQuery("#showAnnouncement").css({"display":"block"});
		jQuery("#announcementValue").html(data);
		});
}

function closer(){
		jQuery("#showAnnouncement").css({"display":"none"});
	}
</script>
</body>
</html>