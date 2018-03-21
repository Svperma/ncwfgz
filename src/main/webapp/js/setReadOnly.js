function appendStrElement(data, dataValue){
    var len = data.options.length;
    for(var x = 0; x<len; x++){
        if(data[x].value == dataValue){
            data[x].selected = true
            return;
        }
    }
}

function deleteStrElement(data, dataValue){
    var len = data.options.length;
    for(var x = 0; x<len; x++){
        if(data[x].value == dataValue){
            continue;
        }
        data[x].setAttribute("disabled","disabled")
    }

}

function deleteIds(id) {
    var ops = document.getElementById(id);
    for(var x =0; x<ops.options.length; x++){
        ops[x].removeAttribute("disabled")
    }
}

function setNotReadOnly(id,str){
    var ele = document.getElementById(id);
    ele.value = str
}

function setReadOnly(id,str) {
    var ele = document.getElementById(id);
    ele.value = str
    ele.setAttribute("readOnly","readOnly");
}

function setSeleteNotReOnly(id,str) {
    var ele = document.getElementById(id);
    appendStrElement(ele, str);
}

function setSelectOnly(id,str){
    var ele = document.getElementById(id);
    deleteStrElement(ele, str);
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