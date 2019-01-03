function statistical(ip,area,siteid, pageid, type,writetime, title,articleid,sessionid,link) {
		var pathName = window.location.pathname;
		pathName = pathName.substring(0, pathName.substring(1).indexOf('/') + 1);
		var data = JSON.stringify({
			"ip":ip,			
			"area" : area,
			"siteid" : siteid,
			"pageid" : pageid,
			"type" : type,	
			"writetime" : writetime,
			"title" : title,
			"articleid" : articleid,
			"sessionid" : sessionid,
			"link" : link
		});
		$.ajax({
			url : pathName + '/AddInfoCollect.do',
			type : "post",
			data : data,
			async : false,
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.info("ajaxerr");
				console.info(XMLHttpRequest.status + "_"
						+ XMLHttpRequest.readyState + "_textStatus:"
						+ textStatus);
				console.info(errorThrown);
			}
		});
	};