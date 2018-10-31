<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${message!=null}">
	<div id="showMessage">
		<input type="hidden" id="message" value="${message==null?1:message}"/>
		<div class="box"></div>
				<div class="hint">
						<div class="hint-in1">					
							<div class="hint2">系统消息!</div>					
						</div>
						<div class="hint-in2">${message}</div>
						<div class="hint-in3">确定</div>
				</div>
	</div>
	<script type="text/javascript">	
	setTimeout(function() {document.getElementById("showMessage").style.display = 'none';},3000);		
	</script>			
</c:if>



<div class="hintl" style="display:none;">
		<div class="hintl-in1">	
			<div class="hintl2">确认消息！</div>
		</div>
		<div class="hintl-in2">你确定删除吗？</div>
		<div class="hintl-in3">确定</div>
		<div class="hintl-in4">返回</div>
</div>


