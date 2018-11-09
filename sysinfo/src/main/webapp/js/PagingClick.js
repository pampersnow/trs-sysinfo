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