/**
 * get current location URL parameter
 * @param paramName
 * @returns
 */
function getParamFromUrl(paramName) {
	   return (window.location.search.match(new RegExp('[?&]' + paramName + '=([^&]+)')) || [, null])[1];
}

function layerOpen($obj, callback){
	layer.open({
		  type: 1,
		  area: ['700px', '530px'],
		  content: $obj
		  ,btn: ['Save']
		  ,yes: function(index, layero){
			  callback();
		  }
		  ,cancel: function(){ 
		    //右上角关闭回调
		  }
	});
}
function layerOpenIframe(url) {
	//iframe层-父子操作
	layer.open({
	  type: 2,
	  area: ['700px', '530px'],
	  fixed: false, //不固定
	  maxmin: true,
	  content: url
	});
}