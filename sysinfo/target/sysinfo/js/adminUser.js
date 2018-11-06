	/**删除管理员用户*/
	function adminUserDel(id){
		$(".hintl").css({"display":"block"});
		$(".box").css({"display":"block"});
	    
		$(".hintl-in3").click(function(event) {
			$(".hintl").css({"display":"none"});
			$(".box").css({"display":"none"});
			window.location="delete.do?id="+id+"";
		});
		
		$(".hintl-in4").click(function() {
			$(".hintl").css({"display":"none"});
			$(".box").css({"display":"none"});
		});
	}

	/**修改密码*/
	function updatePassword(id){         	
		jQuery("#updatePassword").css({"display":"block"});
		jQuery("#userID").val(id);         		
	}
	function closer(){
		jQuery("#updatePassword").css({"display":"none"});
	}
	function updatePW(){
		var userID = $('#userID').val();
		var password = $('#password').val();
		var newpassword = $('#newpassword').val();
		var renewpassword = $('#renewpassword').val();
		if(newpassword == ''||renewpassword == '') {
			layer.msg('新密码不能为空！');
			return false;
		}
		if(renewpassword != newpassword) {
			layer.msg('新密码输入不一致！');
			return false;
		}
		if(password == '') {
			layer.msg('原密码不能为空！');
			return false;
		}else{
			/**验证原密码是否正确*/
			var data = {userID:userID,password:password};
			$.ajax({
				url:"authentication.do",
				data:data,
				type:"post",
				dataType:"json",
				success:function(result){
					if(result && result.status == 200 && result.message == true){
						updateNewPassWord(userID,newpassword);
				    }else{
				    	layer.msg('原密码不正确！');
				    	return false;
				    }
				},
				error:function(e){
					layer.msg('原密码不正确！');
					return false;
				}
			});
		}
	}

	/**提交新密码修改*/
	function updateNewPassWord(userID,newpassword){
		var data = {userID:userID,newpassword:newpassword};
		var load = layer.load();
		$.ajax({
			url:"update.do",
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
			    	jQuery("#updatePassword").css({"display":"none"});
			    	$('#password').val('');
			    	$('#newpassword').val('');
			    	$('#renewpassword').val('');
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

	
	/**添加用户提交*/
	function adminUserAdd(){
		var account = jQuery("#account").val();
		var password = jQuery("#password").val();
		if(account==null||account==""){
			layer.msg('账号不能为空！');
			return false;
		}
		if(password==null||password==""){
			layer.msg('密码不能为空！');
			return false;
		}
		var checkPID = [];
		var pids =document.getElementsByName("roleIds");
		for(var i =0;i<pids.length;i++){	
			if(pids[i].checked){
				checkPID.push(pids[i].value);
			}
		}
		var cp = checkPID.toString();
		
		var data = {account:account};
		var load = layer.load();
		jQuery.ajax({
			url:"checkUserName.do",
			data:data,
			type:"post",
			dataType:"json",
			success:function(result){
				layer.close(load);
				if(result && result.status == 200 && result.message == true){
					adminUserAddSave(account,password,cp)
				}else{
					layer.msg('此账号已存在！');
				    return false;
				}
			},
			error:function(e){
			    layer.msg('输入账号无法识别！');
			    return false;
			}
		});
	}
	
	/**添加用户提交保存*/
	function adminUserAddSave(account,password,cp){
		var data = {account:account,password:password,checkPID:cp};
		var load = layer.load();
		jQuery.ajax({
			url:"adminUserAdd.do",
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
				    setTimeout(function(){
			    		window.location.href= result.back_url || "list.do";
		    		},1000)
				}
			},
			error:function(e){
			    //alert(e.status+"=="+e.readyState+"=="+e.message);
			    layer.msg('添加提交失败！');
			}
		});
	}	
	
	
