
Vue.filter('date', function (value) {//value为13位的时间戳
    function add0(m) {
        return m < 10 ? '0' + m : m
    }
    var time = new Date(parseInt(value));
    var y = time.getFullYear();
    var m = time.getMonth() + 1;
    var d = time.getDate();

    return y + '年' + add0(m) + '月' + add0(d) + '日';
});


Vue.filter('datetime', function (value) {//value为13位的时间戳
    function add0(m) {
        return m < 10 ? '0' + m : m
    }
    var time = new Date(parseInt(value));
    var y = time.getFullYear();
    var m = time.getMonth() + 1;
    var d = time.getDate();
    var h = time.getHours();
    var mi = time.getMinutes();
    
    return y + '年' + add0(m) + '月' + add0(d) + '日'+ ' ' + h + ':'+ mi;
});