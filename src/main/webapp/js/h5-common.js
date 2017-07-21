
    function getQueryString(key){
        var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result?decodeURIComponent(result[2]):null;
    }

	var pathName = window.location.pathname;  
	var paths = pathName.split('/');
	var rootUri = window.location.protocol +'//'+window.location.host + '/' + paths[1];
	
    Vue.filter('replaceLineFeed', function (input) {
        return input.replace(/\n/g, '<p>');
    })
    