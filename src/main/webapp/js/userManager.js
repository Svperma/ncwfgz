var localpath = window.document.location.href;
var pathName = window.document.location.pathname;
var index = localpath.indexOf(pathName);
var basePath = localpath.substring(0,index);

function retrieveForm() {

    var fm = document.forms["retrieve"];
    fm.action = basePath+'/user/initUser'
    fm.submit();
}

function deleteUser(userCode) {
    if(confirm("确定要删除么？")){
        location.href = basePath+"/user/deleteUser?userCode="+userCode;
    }
}


function selectetOp(ele, value){
    debugger
    var len = ele.options.length;
    for(var x = 0; x< len; x++){
        var op = ele.options[x];
        if(op.value == value){
            op.selected = true;
        }
    }
}











Date.prototype.format =function(format)
{
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(), //day
        "h+" : this.getHours(), //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4- RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
            RegExp.$1.length==1? o[k] :
                ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}
