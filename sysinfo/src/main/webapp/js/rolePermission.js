/**获取复选框‘所有值’与‘被选中的值’放入数组中*/
var checkPID = [];
var pID = new Array();

	function check(){
		var pids =document.getElementsByName("permissionIds");
		for(var i =0;i<pids.length;i++){	
			pID[i] = pids[i].value;
			if(pids[i].checked){
				checkPID.push(pids[i].value);
			}
		}
		
	}

	function donALL(){
	    var isCheck=jQuery("#chechALL").is(':checked');  //获得全选复选框是否选中
	    jQuery("input[type='checkbox']").each(function() {  
	        this.checked = isCheck;       //循环赋值给每个复选框是否选中
	    });
	}
	function chechALL(){
		var inputs = document.getElementsByTagName("input");     
		for(var i=0;i<inputs.length;i++)     
		{     
		  if(inputs[i].getAttribute("type") == "checkbox")     
		  {     
		    inputs[i].checked = true;     
		  }     
		}
	}


		
	/**提交分配权限*/
	function updatePermission(){
		check();
		var cp = checkPID.toString();
		var p = pID.toString();
		var data = {checkPID:cp,pids:p};
		var load = layer.load();
		jQuery.ajax({
			url:"updateRolePermission.do",
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
			    //alert(e.status+"=="+e.readyState+"=="+e.message);
			    layer.msg('分配权限提交失败！');
			}
		});
	}	
	
	
	/**分页*/
	function nextPage(currPage,pageSize){
		check();
		window.location="goRolePermission?currPage="+currPage+"&pageSize="+pageSize+"&checkPID="+checkPID.toString()+"&pids="+pID.toString()+"";
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
	