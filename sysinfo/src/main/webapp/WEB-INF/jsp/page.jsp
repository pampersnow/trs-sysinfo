<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>TRS内网信息统计平台</title>
<style type="text/css">
#pagination,.f-16,#pagination li{
	display: inline;
}

</style>
</head>
<body>

<div class="text-c" style="padding-top: 40px;">
        
        <c:if test="${totalPage>0}">
        	<c:if test="${currPage!=1}">
        		<button class="btn size-L btn-secondary radius" onclick="nextPage(1,${pageSize })">首页</button>
        	</c:if>
        	<c:if test="${currPage>1}"> 
        		<button class="btn size-L btn-primary radius" onclick="nextPage(${currPage>1?currPage-1:1},${pageSize})">上一页</button>        	                        
            </c:if>
            
            <c:if test="${totalPage<= 8}">  
            	<c:forEach var="i" begin="1" end="${totalPage}">
            		<ul id="pagination">
                        <c:choose>
                            <c:when test="${i==currPage}">  
                                <li><button class="btn size-L size-MINI btn-secondary radius" onclick="nextPage(${currPage==totalPage?currPage:currPage+1},${pageSize})">${i}</button></li>  
                            </c:when>
                            <c:otherwise>  
                                <li><button class="btn size-L size-MINI radius" onclick="nextPage(${i},${pageSize})">${i}</button></li>  
                            </c:otherwise>
                        </c:choose>
                    </ul>  
                </c:forEach>  
            </c:if>
            <c:if test="${totalPage > 8}">          
            	<c:if test="${currPage< 8}">  
                        <c:forEach var="i" begin="1" end="8">
                        	<ul id="pagination">  
                            <c:choose>  
                                <c:when test="${i ==currPage}">  
                                    <li class="active"><button class="btn size-L btn-secondary radius" onclick="nextPage(${i},${pageSize})">${i}</button></li>  
                                </c:when>  
                                <c:otherwise>  
                                    <li><button class="btn size-L radius" onclick="nextPage(${i},${pageSize})">${i}</button></li>  
                                </c:otherwise>  
                            </c:choose>
                            </ul>  
                        </c:forEach>  
                </c:if>
                
                <c:if test="${currPage >= 8}">  
                        <c:forEach var="j" begin="${currPage-4}" end="${currPage+3}"> 
                        	<ul id="pagination">
                            <c:if test="${j <= totalPage}">  
                                <c:choose>  
                                    <c:when test="${j == currPage}">  
                                        <li class="active"><button class="btn size-L btn-secondary radius" onclick="nextPage(${j},${pageSize})">${j}</button></li>  
                                    </c:when>  
                                    <c:otherwise>  
                                        <li><button class="btn size-L radius" onclick="nextPage(${j},${pageSize})">${j}</button></li>  
                                    </c:otherwise>  
                                </c:choose>  
                            </c:if>
                            </ul>  
                        </c:forEach>  
                    </c:if>
            </c:if>         	
            <c:if test="${currPage<totalPage}">              	       
            	<button class="btn size-L btn-primary radius" onclick="nextPage(${currPage==totalPage?currPage:currPage+1},${pageSize})">下一页</button>
            </c:if>
            <c:if test="${currPage!=totalPage}">
            	<button class="btn size-L btn-secondary radius" onclick="nextPage(${totalPage},${pageSize})">尾页</button>
            </c:if>
           	&nbsp;&nbsp;&nbsp;&nbsp;
               	<p class="f-16">跳转</p>
                <input class="input-text radius size-M" type="text" style="width: 50px;" id="jumpPage" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)" onblur="this.v();" >
                <label class="btn size-M btn-success"  onclick="jumpPage(${totalPage},${pageSize })">GO</label>         
           &nbsp;&nbsp;&nbsp;&nbsp;
           显示
			<select id="pageSize" name="pageSize">
				<option value="10">10</option>			            	
				<option value="20" <c:if test="${pageSize==20}">selected</c:if>>20</option>
				<option value="50" <c:if test="${pageSize==50}">selected</c:if>>50</option>
				<option value="100" <c:if test="${pageSize==100}">selected</c:if>>100</option>			            	
			</select> 条 <a class="btn size-M btn-success" onclick="showPageSize()" >确认</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<span>当前页：${currPage } 页      共：${totalPage } 页&nbsp;&nbsp; ${count}条</span>
      </c:if>
      </div>

</body>
</html>