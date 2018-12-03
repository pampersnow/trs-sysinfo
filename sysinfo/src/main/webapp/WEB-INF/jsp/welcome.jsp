<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<style type="text/css">
#updatePassword{box-shadow: 10px 10px 5px #888888;top:30%;left:29%;position:fixed;z-index:111;width:470px;height:220px;display: none;border:1px solid #0080ff;background:#fff;}
.formControls{width: 80%;}
.teble-style{ max-width: 100px;overflow: hidden; text-overflow:ellipsis;white-space: nowrap}
.box { position:relative; }
.box input { position:absolute; left:0px; top:0px; }
</style>
<link rel="stylesheet" href="<%=ctxPath %>/css/jquery-ui.min.css"> 
<link rel="stylesheet" href="<%=ctxPath %>/css/select-2.css"> 
<script src="<%=ctxPath %>/site/js/echarts.js"></script>
<script src="<%=ctxPath %>/site/js/theme/macarons.js"></script>
<title>管理员用户列表</title>
</head>
<body onload="init()" style="overflow-y:hidden">
<script type="text/javascript">
</script>	
<div class="pd-20">
<div class="container">	
<div class="row clearfix">	
		<div class="col-md-4 column">
			<h4 style="color:#DC143C;">
				今日热点文章
			</h4>
			<p style="color:#BA55D3;">		
				<tbody>		
					<tr>
					 	<c:forEach items="${list}" var="lists" varStatus="vs">
					 		<li limit="14" style="color: #1E90FF">${lists.title}</li> 
					 	</c:forEach>	
					</tr> 
				</tbody>
			</p>
			<p>
				 <a href="<%=ctxPath %>/hotHits/hotarticle.do" style="color:#ADD8E6">点击更多 >></a>
			</p>
		</div>	
		<div class="col-md-4 column">
			<h2 style="color:#DC143C;">
				今日浏览量
			</h2>
			<span id="sp" style="color:#BA55D3; font-size:18px;"></span>
				<script type="text/javascript">						       						
					$.ajax({
						url : '../siteStat/getEchartsData.do',
						date : "",
						type : 'get',
						dataType : "json",
						async : false, //同步
						contentType : 'application/json;charset=utf-8',
						success : function(data) {
						$("#sp").html(data.count);  
					}
				}) 							
				</script>			
			<p>
				 <a href="<%=ctxPath %>/siteStat/zqgk.do" style="color:#ADD8E6">点击更多 >></a>
			</p>
		</div>
		
		<div class="col-md-4 column">
			<div class="col-xs-6" style="float: right;">			
			<span class="select-box" style="float: right; width: 210px;">
				<select id="test" class="select" size="1" name="province" onChange="tt(this.id)" style="font-size:16px;color: #1E90FF">												
				</select>	
				<script>
					$.ajax({
						url : '../Welcome/getSite.do',
						date : "",
						type : 'get',
						dataType : "json",
						async : false, //同步
						contentType : 'application/json;charset=UTF-8',
						success : function(data) {
					          /* if(data['success']){ */
		                          var html="<option value=''>请选择站点</option>";
		                          for(var i=0;i<data.length;i++){
		                               html += "<option value= '"+data[i].siteid+"'>"+data[i].sitename+"</option>";
		                          }
		                          $("#test").html('').append(html);  
		                      /* } */
						}
					})            
			</script>			
			</span>
		</div>	
			<img alt="" src="<%=ctxPath %>/images/tjs.png">&nbsp;
	 		<input id="txt" readonly="readonly" type=text name="" maxlength=12 
	 			size=22 style="font-size:25px; color: #64849b; border: 0px; font-weight: bold;" >
	 		<script>
            function tt(id) {
                var aa = document.getElementById(id);
                var i = aa.selectedIndex;
                var text = aa.options[i].text;
                var value = aa.options[i].value;
                if(value == 3) {

                    text = "请手动填写原因";
                document.getElementById("txt").disabled=false;
                }
                document.getElementById("txt").value = text;
            }
        </script>	 			
			<p>
				 <a href="<%=ctxPath %>/adminsite/list.do" style="color:#ADD8E6">点击更多 >></a>
			</p>
		</div>
	</div>
</div>
	<div id="mai" style="width: 100%; height: 435px; float: left;">
		<script type="text/javascript">								
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('mai'),'macarons');				        
 			option = {
 					title : {
 				        text: '站点访问来源统计',
 				        subtext: '本站点统计'
 				    },
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
				    xAxis : [
				        {	name :'访问来源',
				            type : 'category',
				            splitLine : {show : false},
				            data : []
				        }
				    ],
				    yAxis : [
				        {	name :'浏览数',
				            type : 'value',
				            position: 'left'
				        }
				    ],
				    series : [				        
				        {
				            name:'访问量',
				            type:'line',
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
				        },
				        
				    ]
				}; 
 			var _session = [];
			var _sessioncount = [];
 			$.ajax({
 				url : "../Welcome/RefererCount.do",//请求发送
				date : "",
				type : "get", //get请求方式															
				dataType : "json", //返回数据形式为json
				success : function(data) {
					if (data != null&& data.length > 0) {
						for (var i = 0; i < data.length; i++) {
							_session.push(data[i].session);
							_sessioncount.push(data[i].sessioncount);
						}
						myChart.hideLoading(); //隐藏加载动画	
						myChart.setOption(option);
						myChart.setOption({ //载入数据
							xAxis : {
								data : _session
							//填入X轴数据
							},
							series : [ //填入系列（内容）数据
							{
								// 根据名字对应到相应的系列						
								data : _sessioncount
							} ]
						});
					} else {
						alert("图表请求数据失败，可能是服务器开小差了");
					}
				}
 			});
			myChart.setOption(option, true);
		</script>
	</div>
<hr/>
</div>          
         
<script type="text/javascript" src="<%=ctxPath %>/js/adminUser.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/excanvas.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/jquery.flot.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/jquery.flot.pie.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/jquery.flot.orderBars.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/site/js/charts/bar.js"></script>
<script type="text/javascript"> 
    var limit=[];
    var Text=[];
    var Pox=document.getElementsByTagName('*');//不要*自己改什么节点下的XXX
    for(var i=0;i<Pox.length;i++){
        if(Pox[i].getAttribute("limit")){
            limit[i]=Pox[i].getAttribute("limit");
            Text[i]=Pox[i].innerHTML;
            if(limit[i]<Text[i].length){
                Pox[i].innerHTML=Text[i].substring(0,limit[i])+"...";
            }
        }
    }  				
</script>
</body>
</html>