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
<title>管理员用户列表</title>
</head>
<body onload="init()">
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
					<tr >						
						<li limit="12"> 习近平会见四川航空“中国民航英雄机组”全体成员</li>
						<li limit="12"> 中国共产党民航华北地区管理局第二次代表大会召开</li>
						<li limit="12"> 全国民航冬春航季航班计划将于28日起执行</li>
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
			<p style="color:#BA55D3; font-size:18px;">
				3390
			</p>
			<p>
				 <a href="<%=ctxPath %>/siteStat/zqgk.do" style="color:#ADD8E6">点击更多 >></a>
			</p>
		</div>
		
		<div class="col-md-4 column">
		<form action="" method=post name="creator" enctype="multipart/form-data">
			<div class="col-xs-6" style="float: right;">
			<span class="select-box" style="float: right; width: 120px;">
				<select class="select" size="1" name="province" onChange="select()" style="font-size:16px;color: #1E90FF">	
					<option>请选择站点</option>
					<option>民航局内网</option>	
					<option>中联部内网</option>	
					<option>档案局内网</option>				
				</select>				
			</span>
		</div>
	</form>			
			<img alt="" src="<%=ctxPath %>/images/tjs.png">&nbsp;
	 	<input readonly="readonly" type=text name="" maxlength=12 
	 			size=22 style="font-size:25px; color: #64849b; border: 0px; font-weight: bold;" value="民航内网">
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
				        {	name :'访问来源',
				            type : 'category',
				            splitLine : {show : false},
				            data : ['火狐','360','IE','搜狗','UC','谷歌','其他']
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
				        
				    ]
				};				                                        																				
			myChart.setOption(option, true);
		</script>
	</div>
</div>          
          <!-- 修改管理员用户 -->  
          <!-- <div id="updatePassword" >
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
		</div>              -->
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
</body>
</html>