/*
		 * ajax 函数，处理 ajax 请求
		 * @param function callback 回调函数
		 * @因为要和服务器交互，所以必须在服务器环境运行，不能在硬盘上直接打开
		*/
		function ajax(callback){
		    if(typeof callback!='function') return;
		    var ajaxObject;
		    try{
		        ajaxObject=new XMLHttpRequest();
		    }catch(e){
		        try{
		            ajaxObject=new ActiveXObject('Microsoft.XMLHTTP');
		        }catch(e){
		        }
		    }
		    if(!ajaxObject) return;
		    if(ajaxObject.overrideMimeType){
		        ajaxObject.overrideMimeType('text/html');
		    }
		    //location.href可以换成其他url，但必须是同一个站点的链接，并且文件存在
		    ajaxObject.open('get',location.href);
		    ajaxObject.send(null);
		    ajaxObject.onreadystatechange=function(){
		        if(ajaxObject.readyState==4){
		            if(ajaxObject.status==200){
		                callback(ajaxObject);
		            }
		        }
		    };
		}
		/*
		 * 获取时间并动态刷新
		*/
		function getTime(){
		    ajax(
		        function(ao){
		            //只需要AJAX一次，将服务器时间获取后以毫米为单位保存到一个变量中
		            _timestamp=Date.parse(ao.getResponseHeader('Date'));
		            _timestamp=_timestamp.toString().match(/^\d$/)?_timestamp:new Date().getTime();
		            //设置定时器每过一秒动态刷新一次时间
		            setInterval(
		                function(){
		                    //这里可以自定义时间显示格式
		                    document.getElementById('_timer').innerHTML=new Date(_timestamp).toLocaleString();
		                    _timestamp+=1000;
		                },
		                1000
		            );
		        }
		    );
		}
		window.onload=getTime;