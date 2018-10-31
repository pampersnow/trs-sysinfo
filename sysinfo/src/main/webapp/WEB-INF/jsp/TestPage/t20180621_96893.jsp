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
var test = window.location.href;
alert(test);
</script>
</head>
<body>
<div style="background-color: WhiteSmoke;width:1400px;height: 650px;">
	<div style="margin: 0 auto; border: 0px solid black; width: 50%; height: 50%;">
		<div id="header-wrapper">
			<div class="5grid-layout">
				<div class="row">
					<div class="12u" id="logo">
						<!-- Logo -->
						<h1>网站Demo_测试页面_文章</h1>
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
								<a href="${pageContext.request.contextPath }/Index/zlfb	">中联发布</a>&nbsp;&nbsp;&nbsp;
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
											您的位置： 首页 > 中联发布<br/><br/>
											<div style="float: right:500px;">	
											<h3>陈敏尔将率中共代表团访问乍得、埃及和突尼斯</h3>
											<HR style="float: left;" align=center width=300 color=#987cb9 SIZE=1><br/>
											<p>时间： 2018-06-21</p>
											　应乍得爱国拯救运动、埃及政府和突尼斯政府邀请，中共中央政治局委员、重庆市委书记陈敏尔将于6月24日至7月2日率中国共产党代表团对上述三国进行访问。
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
</div>
	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="<%=basePath%>site/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>site/js/bootstrap.js"></script>
</body>
</html>