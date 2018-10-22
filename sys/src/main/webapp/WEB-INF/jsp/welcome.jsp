<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<style type="text/css">
#updatePassword{box-shadow: 10px 10px 5px #888888;top:30%;left:29%;position:fixed;z-index:111;width:470px;height:220px;display: none;border:1px solid #0080ff;background:#fff;}
.formControls{width: 80%;}
.teble-style{ max-width: 100px;overflow: hidden; text-overflow:ellipsis;white-space: nowrap}
</style>
<link rel="stylesheet" href="<%=ctxPath %>/css/jquery-ui.min.css"> 
<link rel="stylesheet" href="<%=ctxPath %>/css/select-2.css"> 
<script src="<%=ctxPath %>/site/js/echarts.js"></script>
<script src="<%=ctxPath %>/site/js/theme/macarons.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <script type="text/javascript">
		       $(document).ready(function(){
		            $.ajax({
		                contentType : "application/json;charset=utf-8",
		                type : "POST",
		                url : "index/siteinfo.do",
		                dataType : "json",
		                success : function(data) {
		                        alert("ss");
		                    $.each(data, function(i, city) {
		                        $('#siteinfo').append(
		                                $('<option>').text(list.sitename).attr('value',
		                                        list.sitename));

		                    });
		                }
		            });
		        });
			</script>
<title>管理员用户列表</title>
</head>
<body>	
<div class="pd-20">
		<div class="col-xs-6" style="float: right;">
		<span class="select-box" style="float: right; width: 120px;">
			<select id="siteinfo" class="select" size="1" name="lmfcount">
				<option value="1" selected >请选择站点</option>
				<option value="2">国家教育部</option>
				<option value="3">中共中联部</option>
			</select>		
		</span>
	</div>

<div class="container">	
	<h2 style="color: #64849b;"><img alt="" src="<%=ctxPath %>/images/tjs.png">&nbsp;中共联络部</h2>
	<div class="row clearfix">
		<div class="col-md-4 column">
			<h2>
				域名
			</h2>
			<p>
				www.moe.gov.cn
			</p>
			<p>
				 <a href="#">点击更多 >></a>
			</p>
		</div>
		<div class="col-md-4 column">
			<h2>
				今日浏览量
			</h2>
			<p>
				346547980
			</p>
			<p>
				 <a href="#">点击更多 >></a>
			</p>
		</div>
		<div class="col-md-4 column">
			<h2>
				总浏览量
			</h2>
			<p>
				769435247
			</p>
			<p>
				 <a href="#">点击更多 >></a>
			</p>
		</div>
	</div>
</div>
	<div id="mai" style="width: 100%; height: 420px; float: left;">
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
				        data:['火狐','360','IE','搜狗','UC','谷歌','其他']
				    },
				    xAxis : [
				        {
				            type : 'category',
				            splitLine : {show : false},
				            data : ['火狐','360','IE','搜狗','UC','谷歌','其他']
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
				            name:'访问来源',
				            type:'line',
				            data:[862, 1018, 964, 1026, 1679, 1600, 1570],
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

				        {
				            name:'浏览器',
				            type:'pie',
				            tooltip : {
				                trigger: 'item',
				                formatter: '{a} <br/>{b} : {c} ({d}%)'
				            },
				            center: [160,130],
				            radius : [0, 50],
				            itemStyle :{
				                normal : {
				                    labelLine : {
				                        length : 20
				                    }
				                }
				            },
				            data:[

								{value:1048, name:'火狐'},
								{value:764, name:'360'},
								{value:308, name:'IE'},
								{value:548, name:'搜狗'},
				                {value:438, name:'UC'},
				                {value:251, name:'谷歌'},
				                {value:102, name:'其他'}
				            ]
				        }
				        
				    ]
				};				                                        																				
			myChart.setOption(option, true);
		</script>
	</div>
	<div id="main" style="width: 300px; height: 400px; float: right;"></div>

  <%--   <jsp:include page="/WEB-INF/jsp/page.jsp" flush="true"/> --%>
</div>          
          <!-- 修改管理员用户 -->  
          <div id="updatePassword" >
			    <form action="" class="form form-horizontal" method="post">
			    	<input type="hidden" name="id"  id="userID"/>
			        <div class="row cl">
			            <label class="form-label col-2">旧密码</label>
			            <div class="formControls col-5">			           
			            	<input type="password" class="input-text" id="password" />
			            </div>			           		
			        </div>
			
			        <div class="row cl">
			            <label class="form-label col-2">新密码</label>
			            <div class="formControls col-5">
			            	<input type="password" class="input-text"  id="newpassword" />
			            </div>		       
			        </div>
			        
			        <div class="row cl">
			            <label class="form-label col-2">确认密码</label>
			            <div class="formControls col-5">
			            	<input type="password" class="input-text"  id="renewpassword" />
			            </div>			    
			        </div>			     			
			        <div class="row cl">
			            <div class="col-9 col-offset-2">
			                <input class="btn btn-primary radius" type="button" onclick="updatePW()" value="修改" />
			                <input class="btn btn-default radius" type="button" value="关闭" onclick="closer()" style="margin-left: 30px;" />
			            </div>
			        </div>
			    </form>
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
</body>
</html>