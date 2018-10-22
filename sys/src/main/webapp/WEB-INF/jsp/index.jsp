<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link href="<%=ctxPath %>/skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
       
<title>内网访客统计平台</title>

</head>
<body>
<header class="Hui-header cl"> 
    <a class="Hui-logo l" title="内网访客统计平台内网信息统计平台">内网访客统计平台</a> 
	<ul class="Hui-userbar">
		<li><i class="Hui-iconfont">&#xe625;</i><a href="<%=ctxPath%>/">首页</a></li>
		<li class="dropDown dropDown_hover"><a class="dropDown_A"><span><shiro:principal/></span> <i class="Hui-iconfont">&#xe6d5;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="logout.do">退出</a></li>
			</ul>
		</li>
		<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
				<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
				<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
				<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
				<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
				<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
			</ul>
		</li>
	</ul>
	<a aria-hidden="false" class="Hui-nav-toggle" href="#"></a> </header>
    <aside class="Hui-aside">
        <input runat="server" id="divScrollValue" type="hidden" value="" />
        <div class="menu_dropdown bk_2">
            
            <dl id="menu-comments">
                <dt><i class="Hui-iconfont">&#xe60d;</i> 站点统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                    	<li><a _href="<%=ctxPath %>/siteStat/zqgk.do" href="javascript:void(0)">站群概况</a></li>
                    	<li><a _href="<%=ctxPath %>/siteStat/qsfx.do" href="javascript:void(0)">趋势分析 </a></li>
                    	<li><a _href="<%=ctxPath %>/siteStat/articlestat.do" href="javascript:void(0)">文章推送</a></li>                    
                    </ul>
                </dd>
            </dl>
            
            <dl id="menu-comments">
                <dt><i class="Hui-iconfont">&#xe66d;</i> 实时访问<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                    	<li><a _href="<%=ctxPath %>/liveHits/VisitorList.do" href="javascript:void(0)">访客列表</a></li>               
                    	<li><a _href="<%=ctxPath %>/liveHits/articlepush.do" href="javascript:void(0)">推送列表</a></li>               
                    </ul>
                </dd>
            </dl>
            
           <dl id="menu-comments">
                <dt><i class="Hui-iconfont">&#xe64d;</i> 热点访问<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                    	<li><a _href="<%=ctxPath %>/hotHits/hotsection.do" href="javascript:void(0)">热点栏目 </a></li>   
                    	<li><a _href="<%=ctxPath %>/hotHits/hotarticle.do" href="javascript:void(0)">热点文章 </a></li>                  
                    </ul>
                </dd>
            </dl>
        	<shiro:hasPermission name="admin">
            <dl id="menu-comments">
                <dt><i class="Hui-iconfont">&#xe62e;</i> 权限管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <shiro:hasPermission name="/adminUser/list.do">
                        <li><a _href="<%=ctxPath %>/adminUser/list.do" href="javascript:void(0)">管理员用户管理</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/role/list.do">
                        <li><a _href="<%=ctxPath %>/role/list.do" href="javascript:void(0)">角色管理</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/permission/list.do">
                        <li><a _href="<%=ctxPath %>/permission/list.do" href="javascript:void(0)">权限管理</a></li>
                        </shiro:hasPermission>                        
                    </ul>
                </dd>
            </dl>
            </shiro:hasPermission>
            
            <dl id="menu-comments">
                <dt><i class="Hui-iconfont">&#xe63c;</i> 关于系统<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>       
                    <li><a _href="<%=ctxPath %>/AboutUs.do" href="javascript:void(0)">关于我们</a></li>      
                    </ul>
                </dd>
            </dl>
        </div>
    </aside>
<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="welcome.do">我的桌面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.do"></iframe>
		</div>
	</div>
</section>
</body>
</html>