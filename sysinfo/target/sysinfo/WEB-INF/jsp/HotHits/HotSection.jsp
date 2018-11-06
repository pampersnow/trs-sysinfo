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
     tableToExcel('tableToExcel', '热点栏目')
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
<body>
<br>	
	 <div class="text-c" style="float: left;">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期范围：
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
         <a class="glyphicon glyphicon-export" aria-hidden="true" download="热点栏目" id="excelOut" href="#" style="color: white;">导出报表</a>
       </button>
       &nbsp;&nbsp;&nbsp;&nbsp;
    </div>
<br>
<div class="pd-20">
    <table cellspacing="0" cellpadding="0"  id="tableToExcel" class="table table-border table-bordered table-bg table-hover">
        <thead>
            <tr>
				<th>站点ID</th>
				<th>栏目ID</th>
				<th>栏目</th>
				<th>点击量</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach var="list" items="${rdlmlist }" >
				<tbody>
					<tr >
					<td class="teble-style">${list.siteid}</td>
					<td class="teble-style">${list.pageid}</td>
					<td class="teble-style">${list.type}</td>
					<td class="teble-style">${list.count}</td>						
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