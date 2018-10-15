<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<link href="site/css/bootstrap.min.css" rel="stylesheet" />
<link href="site/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="site/css/font-awesome.css" rel="stylesheet" />
<link href="site/css/adminia.css" rel="stylesheet" />
<link href="site/css/adminia-responsive.css" rel="stylesheet" />
<link href="site/css/pages/login.css" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">

</script>
</head>
<body>
	<div
		style="margin: 0 auto; border: 0px solid black; width: 50%; height: 50%;">
		<div id="header-wrapper">
			<div class="5grid-layout">
				<div class="row">
					<div class="12u" id="logo">
						<!-- Logo -->
						<h1>网站Demo_测试页面_栏目</h1>
						<br />
					</div>
				</div>
			</div>
			<div id="menu-wrapper">
				<div class="5grid-layout">
					<div class="row">
						<div class="12u" id="menu" style="width: 950px; height: 500;">
							<h2>
								<a href="">首页</a>&nbsp;&nbsp;&nbsp; <a>关于我部</a>&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath }/Index/zlfb">中联发布</a>&nbsp;&nbsp;&nbsp;
								<a>党际交往</a>&nbsp;&nbsp;&nbsp; <a>动态聚焦</a>&nbsp;&nbsp;&nbsp; <a>中共对外</a>&nbsp;&nbsp;&nbsp;
								<a>工作纪实</a>&nbsp;&nbsp;&nbsp; <a>时事纵横</a>&nbsp;&nbsp;&nbsp;
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="page-wrapper">
			<div id="page-bgtop">
				<div id="page-bgbtm">
					<div id="page" class="5grid-layout">
						<div id="page-content-wrapper">
							<div class="row">
								<div class="12u">
									<div id="banner">
										<a href="#"><img src="site/img/pics02.png" alt=""></a>
										<div style="margin: 0 auto; border: 0px solid black;">
											您的位置： 首页 >中联发布
											<h2><a id="lm">中联发布</a></h2>
											<p><a id="a" href="#" onclick="post()">陈敏尔将率中共代表团访问乍得、埃及和突尼斯</a>
												<a id="wt" style="float: right;" href="/trsstatiss/Index/zlfb/201806/t20180621_96893.html">2018/06/21</a>
												<br/>
												<a>
												钱洪山将率中共代表团赴芬兰出席中间党党代会</a>
												<a style="float: right;">2018/06/06</a>
												<br/> 
												<a>中国共产党与世界政党高层对话会专题会议将在深圳举行</a>
												<a style="float: right;">2018/05/21</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Le javascript
================================================== -->
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
	 
	function post(){
		var ip = returnCitySN["cip"]
		//alert(ip)
		var area = returnCitySN["cname"]
		//alert(area)
		
		/* 站点ID */
		var siteid = window.location.href;
		//alert(siteid)

		/* 栏目ID */
		var pageid = window.location.pathname;
		//alert(pageid)
		
		/* 获取访问时间 */
		var accesstime = new Date();
		accesstime = accesstime.getFullYear() + "-"
				+ (accesstime.getMonth() + 1) + "-" + accesstime.getDate()
				+ " " + accesstime.getHours() + ":"
				+ accesstime.getMinutes() + ":" + accesstime.getSeconds();
		//alert(accesstime)
		/* 获取a标签中的栏目名称 */		
		var _type = document.getElementById('lm').innerHTML;
		//alert(_type)
		/* 获取文章撰写时间 */
		var writetime = document.getElementById('wt').innerHTML;
		//alert(writetime)
		//console.log(writetime);
		/* 文章id */
		var articleid = $('#wt').attr('href');
		//console.log(articleid);
		//alert(articleid)
		/* 文章标题 */
		var title = document.getElementById('a').innerHTML;
		
		
			
		$("#a").on("click",function(event){
		event.preventDefault();//使a自带的方法失效
  
			    var data = JSON.stringify({"ip":ip,"area":area, "accesstime":accesstime,"siteid":siteid,
			    			"pageid":pageid, "type":_type,"writetime":writetime,"articleid":articleid,"title":title });			    
				$.ajax({
							url : '${pageContext.request.contextPath }/doTheArticleTitle.html',
							type : "post",
							data : data,
							dataType : "json",
							async:false,
							contentType: "application/json; charset=utf-8",
							success : function(data) {alert("成功!");}					
					}); 
		})
		}
	</script>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="<%=basePath%>site/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>site/js/bootstrap.js"></script>
</body>
</html>