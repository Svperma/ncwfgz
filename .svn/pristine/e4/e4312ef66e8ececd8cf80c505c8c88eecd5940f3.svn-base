
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

var trid = '';
var obj = '';
function checkObj(id) {
    trid = id.substring(id.length - 1, id.length);;
    var householder = document.getElementById("householder"+trid).value
    var udebtutyid = document.getElementById("udebtutyid"+trid).value
    $("#tab tr:gt(0)").remove();
    $.ajax({
        url:"${basePath}/init/buildingas1",
        type:"post",
//            data:[{"householder":householder,"udebtutyid":udebtutyid}],
        data:"householder=" + householder + "&udebtutyid=" + udebtutyid,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        success: function (data) {
            if(data == null || data == ''){
                document.getElementById("d1").style.display = 'none';
            }
            var len = data.length;
            if(len > 0) {
                len  = len > 10 ? 10 : len;
                document.getElementById("d1").style.display = '';
                for (var x = 0; x < len; x++) {
                    var str = "<tr onclick='findObj("+data[x].id+")' id='tr"+x+" ' onmouseout='mouseOut(this)' onmousemove='mouseOver(this)'><td>"+data[x].householder +"</td>";
                    str += "<td>"+data[x].udebtutyid +"</td>";
                    str += "<td>"+data[x].city +"</td>";
                    str += "<td>"+data[x].county +"</td>";
                    str += "<td>"+data[x].bank +"</td>";
                    str += "<td>"+data[x].account +"</td>";
                    str += "<td>"+data[x].type +"</td>";
                    str += "<td>"+data[x].grade +"</td>";
                    str += "<td>"+data[x].startyear +"</td>";
                    str += "<td>"+data[x].finishstatus +"</td></tr>";
                    $("#tab").append(str)
                }

            }
        }
    })
}

function mouseOver(ele){
    ele.style.backgroundColor = '#1A94E6';
}
function mouseOut(ele){
    ele.style.backgroundColor = '#FFFFFF';
}

function deletetr(index){
    document.getElementById("d1").style.display= 'none'
    $("#sumquantity").val($("#sumquantity").val()-1);
    var ele = document.getElementById(index);
    var par = ele.parentNode;
    par.removeChild(ele)
}
function addtrElement() {
    var fmtable = document.getElementById("fmtab");
    var arr = fmtable.getElementsByTagName("input");
    for(var x = 0; x<arr.length; x++){
        var name = arr[x].name.substring(arr[x].name.indexOf('.') + 1,arr[x].name.length);
        switch(name){
            case 'udebtutyid':
            case 'householder':
            case 'operatetdate':
            case 'paymentamount':
                if(arr[x].value == null || arr[x].value == '' || arr[x].value =="0" || arr[x].value== 0){
                    alert("请填写完成信息")
                    arr[x].focus();
                    return false
                }
        }
    }

    var toby = document.getElementById("tbody")
    var index = tbody.rows.length;
    var str = "<tr id = '"+index+"'><td><input type='text' placeholder='请输入' class='layui-input' name='list["+index+"].udebtutyid' id='udebtutyid"+index+"' onkeyup='checkObj(this.id)'></td>";
    str += "<td><input type='text' placeholder='请输入' class='layui-input' name='list["+index+"].householder' id='householder"+index+"' onkeyup='checkObj(this.id)'></td>";
    str += "<td><select name='list["+index+"].progress' id='progress"+index+"' lay-verify=''><option value=''></option><code:options codeType='Progress'/></select></td>";
    str += "<td><div class='layui-form-item layui-inline'><input class='layui-input'  onclick='layui.laydate({elem: this, istime: true, format: \"YYYY-MM-DD\"})' name='list["+index+"].operatetdate' id='operatetdate"+index+"' placeholder='兑付日期'></div></td>";
    str += "<td><input type='text' name='list["+index+"].paymentamount' id='paymentamount"+index+"' placeholder='请输入' class='layui-input'  onkeyup='sumAmount()'></td>";
    str += "<td><a data-method='offset' data-type='t' id='rem' class='layui-btn layui-btn-normal' style='background-color:red;' onclick='deletetr("+index+")' disabled>删除</a></td>";



    str += "</tr>";
    $(toby).append(str);
    var number = $("#sumquantity").val();
    number == '' || number == null ? 0 : number;
    var sumValue = parseInt(number) + 1;

    $("#sumquantity").val(isNaN(sumValue)? 1 : sumValue);
    fm.render();
}
//    function checkValue(index){
//        var udebtutyid  =  document.getElementById(udebtutyid+index);
//        checkNull(udebtutyid);
//        var householder  =  document.getElementById(householder+index);
//        var city  =  document.getElementById(city+index);
//        var operatetdate  =  document.getElementById(operatetdate+index);
//        var paymentamount  =  document.getElementById(paymentamount+index);
//    }
//    function checkNull(ele) {
//        if(ele == null || ele == ''){
//
//        }
//    }


function findObj(id) {
    $.ajax({
        url:"${basePath}/init/building?id=" + id,
        type:"get",
        success:function(data) {
            console.log(data)
            if(data == null || data == ''){
                document.getElementById("d1").style.display = 'none';
            }
            obj = data;
            document.getElementById("householder"+trid).value = data.householder;
            document.getElementById("udebtutyid"+trid).value = data.udebtutyid;
            document.getElementById("d1").style.display = 'none';
            var str = "<input type='hidden' value='"+data.id+"' name='list["+trid+"].id'>"
            str += "<input type='hidden' value='"+data.account+"' name='list["+trid+"].account'>"
            str += "<input type='hidden' value='"+data.bank+"' name='list["+trid+"].bank'>"
            str += "<input type='hidden' value='"+data.inputcode+"' name='list["+trid+"].inputcode'>"

            str += "<input type='hidden' value='"+new Date().format('yyyy-MM-dd')+"' name='list["+trid+"].paymentdate'>"
            $("#"+trid+"").append(str)
        }
    })
}


function sumAmount() {
    var fmtable = document.getElementById("fmtab");
    var arr = fmtable.getElementsByTagName("input");
    var sum = 0;
    typeof sum;
    for(var x = 0; x<arr.length; x++){
        var name = arr[x].name.substring(arr[x].name.indexOf('.') + 1,arr[x].name.length);
        switch(name){
            case 'paymentamount':
                var reg = /^[1-9]\d*$/;
                if(!reg.test(arr[x].value)){
                    alert("请输入正确的数字");
                    arr[x].focus()
                    return false;
                }
                sum += parseInt(arr[x].value);
        }
    }

    $("#sumamount").val(sum);
}

function fmSubmit() {
    var fmj = document.forms["fm1"];
    fmj.action = "${basePath}/order/addOrder";
    fmj.submit();
}

function insertSum(){
    var fmj = document.forms["fm1"];
    fmj.action = "${basePath}/order/insertOrder";
    fmj.submit();
}
