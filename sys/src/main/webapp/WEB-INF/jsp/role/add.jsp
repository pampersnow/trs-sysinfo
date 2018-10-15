<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<title>添加角色</title>
</head>
<body>
<div class="pd-20">
    <form action="roleAdd.do" class="form form-horizontal">
    
        <div class="row cl">
            <label class="form-label col-2">角色名称</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" name="roleName" />
            </div>
            <div class="col-5"></div>
        </div>

        <div class="row cl">
            <label class="form-label col-2">描&nbsp;&nbsp;述</label>
            <div class="formControls col-5">
                <textarea name="description" class="textarea"></textarea>
            </div>
            <div class="col-5"></div>
        </div>
        
        <div class="row cl">
            <label class="form-label col-2">分配权限</label>
            
            <div class="formControls col-6" >
            		<div>
            			<a id="selectAll" class="btn size-MINI btn-secondary radius">全选</a>&nbsp;&nbsp;
            			<a id="callOff" class="btn size-MINI btn-secondary radius">取消</a>
            		</div>
                    <c:forEach var="permissions" items="${permissionList}">
                    <div class="col-3" id="chechALL">
                        <input type="checkbox" name="permissionIds" value="${permissions.id }" id="permissionId4" /><label for="permissionId4">${permissions.description }</label>
                    </div>
                    </c:forEach>
            </div>
        </div>

        <div class="row cl">
            <div class="col-9 col-offset-2">           	
                <input class="btn btn-primary radius" type="submit" value="添加" />
                <input class="btn btn-default radius" type="button" value="关闭" onclick="location.href='list.do'" style="margin-left: 30px;" />
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">  
jQuery("#callOff").click(function (){
    var isCheck=$("#chechALL").is(':checked');  //获得全选复选框是否选中
    $("input[type='checkbox']").each(function() {  
        this.checked = isCheck;       //循环赋值给每个复选框是否选中
    });
});
jQuery("#selectAll").click(function (){
	var inputs = document.getElementsByTagName("input");     
	for(var i=0;i<inputs.length;i++)     
	{     
	  if(inputs[i].getAttribute("type") == "checkbox")     
	  {     
	    inputs[i].checked = true;     
	  }     
	}
});
  
</script>
</html>