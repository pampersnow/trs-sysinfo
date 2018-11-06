/*$(function(){
	
	$("#login2").click(function (){
		$.ajax({
            cache: true,
            type: "POST",
            url:"login.do",
            data:$('#loginForm').serialize(),
            async: false,
            error: function(request) {
                alert("Connection error");
            },
            success: function(data) {
            	alert("登录成功！")
                window.location.href="/";
            }
        });
	})
	
})*/


/**权限删除*/
function permissionDel(param) {
	$(".hintl").css({"display":"block"});
	$(".box").css({"display":"block"});
    
	$(".hintl-in3").click(function(event) {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
		window.location="deletePermission.do?id="+param+"";
	});
	
	$(".hintl-in4").click(function() {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
	}); 
}

/**角色删除*/
function roleDel(param) {
	$(".hintl").css({"display":"block"});
	$(".box").css({"display":"block"});
    
	$(".hintl-in3").click(function(event) {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
		window.location="deleteRole.do?id="+param+"";
	});
	
	$(".hintl-in4").click(function() {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
	});
}

/**车辆类型删除*/
function bikesTypeDel(param){
	$(".hintl").css({"display":"block"});
	$(".box").css({"display":"block"});
    
	$(".hintl-in3").click(function(event) {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
		window.location="deleteBikesType.do?id="+param+"";
	});
	
	$(".hintl-in4").click(function() {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
	});
    	

}

/**车辆状态删除*/
function bikesStateDel(param){
	$(".hintl").css({"display":"block"});
	$(".box").css({"display":"block"});
    
	$(".hintl-in3").click(function(event) {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
		window.location="deleteBikesState.do?id="+param+"";
	});
	
	$(".hintl-in4").click(function() {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
	});
    	
}

/**车辆信息删除*/
function bikesInfoDel(param){
	$(".hintl").css({"display":"block"});
	$(".box").css({"display":"block"});
    
	$(".hintl-in3").click(function(event) {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
		window.location="deleteBikesInfo.do?id="+param+"";
	});
	
	$(".hintl-in4").click(function() {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
	});
    	
}



/**电子围栏删除*/
function electricFenceDel(param){
	$(".hintl").css({"display":"block"});
	$(".box").css({"display":"block"});
    
	$(".hintl-in3").click(function(event) {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
		window.location="deleteElectricFence.do?id="+param+"";
	});
	
	$(".hintl-in4").click(function() {
		$(".hintl").css({"display":"none"});
		$(".box").css({"display":"none"});
	});
    	
}

