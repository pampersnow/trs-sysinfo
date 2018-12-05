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
<link rel="stylesheet" href="../css/jquery-ui.min.css"> 
<script type="text/javascript" src="../js/DownloadReport.js"></script>
<script type="text/javascript"src="../js/PagingClick.js"></script>  
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<title>推送列表</title>
</head>
<body>
<br>
 <div class="text-c" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期范围：
    <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" name="datemin" class="input-text Wdate" style="width:120px;">
    -
    <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" name="datemax" class="input-text Wdate" style="width:120px;">    
    <input type="text" class="input-text" style="width:100px" placeholder="模糊查询" id="state" name="state">
    <button type="submit" class="btn btn-success radius" id="" name="" ><i class="icon-search"></i>检索GO</button>
    <button type="button" class="btn btn-primary  radius" id="reset" name="reset" ><i class="icon-search"></i> 重置</button>
  </div>
  <div class="col-xs-6">
		<span class="select-box" style="float: right;">
			<select class="select" size="1" name="lmfcount">
				<option value="1" selected>今日</option>
				<option value="2">昨天</option>
				<option value="3">7天</option>
				<option value="4">30天</option>
				<option value="5">半年</option>
				<option value="6">一年</option>
				<option value="7">全部</option>
			</select>
		</span>
	</div>
	<div class="fl-r" id="export" style="float: right;">
       <button id="btn" type="button" class="btn btn-default btn-primary" id="exportBtn">
         <a class="glyphicon glyphicon-export" aria-hidden="true" download="热点推送文章" id="excelOut" href="#" style="color: white;">导出报表</a>
       </button>
       &nbsp;&nbsp;&nbsp;&nbsp;
    </div>
		
<br>
<div class="pd-20">
    <table cellspacing="0" cellpadding="0"  id="tableToExcel" class="table table-border table-bordered table-bg table-hover">
        <thead>
            <tr>
            	<th>来源站点ID</th>
				<th>来源站点名称</th>
				<th>来源栏目ID</th>
				<th>来源栏目名称</th>
				<th>文档ID</th>
				<th>文档名称</th>
				<th>责任编辑</th>
				<th>撰写时间</th>
				<th>首次发布时间</th>
				<th>当前访问量</th>
				<th>当前文档分数</th>
				<th>文档访问链接</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach var="li" items="${doclist }" >
				<tbody>
					<tr >
						<td class="teble-style">${li.siteid}</td>
						<td class="teble-style">${li.sitename	}</td>
						<td class="teble-style">${li.sourcepageid}</td>						
						<td class="teble-style">${li.sourcepage}</td>
						<td class="teble-style">${li.articleid}</td>
						<td class="teble-style">${li.title}</td>
						<td class="teble-style">${li.editorcharge}</td>
						<td class="teble-style"><fmt:formatDate value="${li.writetime}" pattern="yyyy-MM-dd" /></td>
						<td class="teble-style"><fmt:formatDate value="${li.pubtime}" pattern="yyyy-MM-dd" /></td>
						<td class="teble-style">${li.doccount}</td>
						<td class="teble-style">${li.score}</td>
						<td class="teble-style"><a style="color: blue;">${li.link}</a></td>
					</tr>
				</tbody>
			</c:forEach>   
        </tbody>
    </table>
  <%@include file="/WEB-INF/jsp/page.jsp" %>
</div>
<script type="text/javascript">
/**分页*/
function nextPage(currPage,pageSize){	
	window.location="articlepush.do?currPage="+currPage+"&pageSize="+pageSize+"";
}
</script>
</body>
</html>