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
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
 <script>
 window.onload = function () {
     tableToExcel('tableToExcel', '访客列表')
 };
 //base64转码
 var base64 = function (s) {
     return window.btoa(unescape(encodeURIComponent(s)));
 };
 //替换table数据和worksheet名字
 var format = function (s, c) {
     return s.replace(/{(\w+)}/g,
         function (m, p) {
             return c[p];
         });
 }
 function tableToExcel(tableid, sheetName) {
     var uri = 'data:application/vnd.ms-excel;base64,';
     var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"' +
         'xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
         + '<x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets>'
         + '</x:ExcelWorkbook></xml><![endif]-->' +
         ' <style type="text/css">' +
         'table td {' +
         'border: 1px solid #000000;' +
         'width: 200px;' +
         'height: 30px;' +
         ' text-align: center;' +
         'background-color: #ffffff;' +
         'color: #000000' +
         ' }' +
         '</style>' +
         '</head><body ><table class="excelTable">{table}</table></body></html>';
     if (!tableid.nodeType) tableid = document.getElementById(tableid);
     var ctx = {worksheet: sheetName || 'Worksheet', table: tableid.innerHTML};
     document.getElementById("excelOut").href = uri + base64(format(template, ctx));
 }

    </script>
<title>管理员用户列表</title>
</head>
<script type="text/javascript">
//搜索
function sub(){		
	//获取被选中的option标签
    var datemin = $("#datemin").val();
    var datemax = $("#datemax").val();
	//console.info("start:"+start);
	$.ajax({
		url: "<%=ctxPath%>/liveHits/doByTime.do",
	    type: "GET",
		dataType: "text",
		//把获取到的value值传给服务器
		data: {"startTime": datemin,"endTime":datemax},
		success: function(data) {
			if (data!=null && data.length>0){
				var json = eval('(' + data + ')');
				alert("数据："+json)
				//console.info($("#tab"));
			}
		},
		error:function(){
			console.info("error");
		}
	});
}
</script>
<body>
<br>
 <div class="text-c" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期范围：
    <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" name="startTime" class="input-text Wdate" style="width:120px;">
    -
    <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" name="endTime" class="input-text Wdate" style="width:120px;">    
    <input type="text" class="input-text" style="width:100px" placeholder="模糊查询" id="state" name="state">
    <button type="submit" class="btn btn-success radius" id="" name="" onclick="sub()"><i class="icon-search"></i>检索GO</button>
    <button type="button" class="btn btn-primary  radius" id="reset" name="reset" ><i class="icon-search"></i> 重置</button>
  </div>
  	<div class="fl-r" id="export" style="float: right;">
       <button id="btn" type="button" class="btn btn-default btn-primary" id="exportBtn">
         <a class="glyphicon glyphicon-export" aria-hidden="true" download="访客列表" id="excelOut" href="#" style="color: white;">导出报表</a>
       </button>
       &nbsp;&nbsp;&nbsp;&nbsp;
    </div>
<br>
<div class="pd-20">
   <table cellspacing="0" cellpadding="0"  id="tableToExcel" class="table table-border table-bordered table-bg table-hover">
        <thead>
            <tr>
				<th>IP</th>
				<th>访客地区</th>
				<th>访问时间</th>
				<th>站点ID</th>
				<th>栏目ID</th>
				<th>栏目名称</th>
				<th>文章ID</th>
				<th>文章标题</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach var="listfklb" items="${listFklb }" >
				<tbody>
					<tr >
						<td class="teble-style">${listfklb.ip }</td>
						<td class="teble-style">${listfklb.area }</td>
						<td class="teble-style"><fmt:formatDate value="${listfklb.accesstime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td class="teble-style">${listfklb.siteid }</td>
						<td class="teble-style">${listfklb.pageid }</td>
						<td class="teble-style">${listfklb.type }</td>
						<td class="teble-style">${listfklb.articleid }</td>
						<td class="teble-style">${listfklb.title }</td>
					</tr>
				</tbody>
			</c:forEach>  
        </tbody>
    </table>
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

</body>
</html>