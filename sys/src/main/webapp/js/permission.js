	/**打开修改权限窗口*/
	function clickUpdatePermission(permission,description,id){
		jQuery("#updatePermission").css({"display":"block"});
		jQuery("#permission").val(permission);
        jQuery("#description").val(description);
        jQuery("#permissionID").val(id);
	}
	/**打开添加权限窗口*/
	function clickAddPermission(){
		jQuery("#addPermission").css({"display":"block"});
	}
	/**关闭窗口*/
	function closer(){
		jQuery("#updatePermission").css({"display":"none"});
		jQuery("#addPermission").css({"display":"none"});
	}
         	
	/**删除管理员用户*/
	function permissionDel(id){
		jQuery(".hintl").css({"display":"block"});
		jQuery(".box").css({"display":"block"});
	    
		jQuery(".hintl-in3").click(function(event) {
			jQuery(".hintl").css({"display":"none"});
			jQuery(".box").css({"display":"none"});
			window.location="delete.do?id="+id+"";
		});
		
		jQuery(".hintl-in4").click(function() {
			jQuery(".hintl").css({"display":"none"});
			jQuery(".box").css({"display":"none"});
		});
		
	}
	
	/**提交添加权限*/
	function addPermission(){
		var permission = jQuery('#ADDpermission').val();
		var description = jQuery('#ADDdescription').val();
		if(permission == '') {
			layer.msg('权限路径不能为空！');
			return false;
		}
		     
		var data = {permission:permission,description:description};
		var load = layer.load();
		jQuery.ajax({
			url:"permissionAdd.do",
			data:data,
			type:"post",
			dataType:"json",
			beforeSend:function(){
				layer.msg('正在处理...');
			},
			success:function(result){
				layer.close(load);
				if(result && result.status != 200){
					layer.msg(result.message,function(){});
			    	return;
			    }else{
			    	layer.msg(result.message);
			    	jQuery("#addPermission").css({"display":"none"});
			    	setTimeout(function(){
		    			window.location.href= result.back_url || "list.do";
	    			},1000) 
			    }
			},
			error:function(e){
				console.log(e,e.message);
		        //alert(e.status+"=="+e.readyState+"=="+e.message);
		        layer.msg('添加失败！',new Function());
			}
		});
	}
	
	/**提交修改权限*/
	function updatePermission(){
		var permission = jQuery('#permission').val();
		var description = jQuery('#description').val();
		var permissionID = jQuery('#permissionID').val();
		if(permission == '') {
			layer.msg('权限路径不能为空！');
			return false;
		}
		     
		var data = {permission:permission,description:description,permissionID:permissionID};
		var load = layer.load();
		jQuery.ajax({
			url:"permissionUpdate.do",
			data:data,
			type:"post",
			dataType:"json",
			beforeSend:function(){
				layer.msg('正在处理...');
			},
			success:function(result){
				layer.close(load);
				if(result && result.status != 200){
					layer.msg(result.message,function(){});
			    	return;
			    }else{
			    	layer.msg(result.message);
			    	jQuery("#updatePermission").css({"display":"none"});
			    	setTimeout(function(){
		    			window.location.href= result.back_url || "list.do";
	    			},1000)
			    }
			},
			error:function(e){
				console.log(e,e.message);
		        //alert(e.status+"=="+e.readyState+"=="+e.message);
		        layer.msg('修改失败！',new Function());
			}
		});
	}	


	/**分页*/
	function nextPage(currPage,pageSize){	
		window.location="list.do?currPage="+currPage+"&pageSize="+pageSize+"";
	}

	/**每页显示*/
	function showPageSize(){
		var pageSize = document.getElementById("pageSize").value;
		if(pageSize.length>0){
			nextPage(1,pageSize);
		}		
	}
         		
	/**跳转到具体页*/
	function jumpPage(totalPage,pageSize){
		var page = document.getElementById("jumpPage").value;
		var reg = /^[0-9]*$/;
		if (0!=page&&reg.test(page)&&totalPage>=page) {
			nextPage(page,pageSize);
		}else{				
			layer.msg("请输入正确页数!");
		}
	}	
	