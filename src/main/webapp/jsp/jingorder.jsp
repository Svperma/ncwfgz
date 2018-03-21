<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2017/8/9
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/tlds/ggCodeTld" prefix="code" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="utf-8">
    <title>表单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="${basePath}/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${basePath}/plugins/font-awesome/css/font-awesome.min.css">
    <style>
        .layui-form-item{
            margin-bottom:0;

        }
    </style>
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div class="layui-layout-admin" style="margin: 15px;">
    <form class="layui-form" action="" id="fm1" name="fm1" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${paymentOrder.orderno}" name="orderno">
        <div class="layui-form-item layui-inline" >
            <input class="layui-input" placeholder="兑付日期" name="orderdate" id="orderdate" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})" value="<fm:formatDate value='${paymentOrder.orderdate}' pattern='yyyy-MM-dd'/>" readonly>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label" style="width:100px;" >兑付危房数量</label>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="text" name="sumquantity" id="sumquantity" lay-verify="required" value="${paymentOrder.sumquantity}" autocomplete="off" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label" style="width: 100px;">应兑付金额(元)</label>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="text" name="sumamount" id="sumamount" lay-verify="required" value="${paymentOrder.sumamount}" autocomplete="off" class="layui-input" readonly>
            </div>
            <label class="layui-form-label" style="width: 120px;">本次兑付金额(元)</label>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="text" name="bencisumamount" id="bencisumamount" lay-verify="required" value="0" autocomplete="off" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <div class="layui-input-inline">
                <a href="${basePath}/order/download?id=${paymentOrder.orderno}">点击下载</a>资料文件
                <input type="hidden" name="filePath" value="${paymentOrder.attachmentpath}">
            </div>
        </div>

        <%-----------------------------------------------------------%>


    <div class="layui-layout-admin" style="height:100%;padding:5px;">

            <table class="layui-table" id="fmtab" >
                <thead>
                <tr>
                    <th>户主身份证</th>
                    <th>户主姓名</th>
                    <th>工程进度</th>
                    <th>资金发放日期</th>
                    <th>应兑付金额</th>
                    <th>本次兑付金额</th>
                    <%--<th>操作</th>--%>
                </tr>
                </thead>
                <tbody id="tbody">
                <c:forEach items="${list}" var="temp" varStatus="index">
                    <tr id = "${index.index}">

                        <input type='hidden' value='1' name='biaozhiwei' id="biaozhiwei${index.index}">
                        <td><input type="text" class="layui-input" name="list[${index.index}].identityid" id="identityid${index.index}" value="${temp.identityid}" readonly></td>
                        <td><input type="text" class="layui-input" name="list[${index.index}].householder" id="householder${index.index}" value="${temp.householder}" readonly></td>
                        <td>
                            <select id="progress${index.index}" name="list[${index.index}].progress" lay-verify="">
                                <option value=""></option>
                                <code:options codeType="Progress" selected="${temp.progress}"/>
                            </select>
                        </td>
                        <td>
                            <div class="layui-form-item layui-inline">
                                <input class="layui-input" id="operatetdate${index.index}" name="list[${index.index}].operatetdate" placeholder="兑付日期" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})" value="<fm:formatDate value="${temp.operatetdate}" pattern="yyyy-MM-dd"/>" >
                            </div>
                        </td>
                        <td><input type="text" name="list[${index.index}].paymentamount"  id="paymentamount${index.index}" class="layui-input" value="${temp.paymentamount}" readonly></td>
                        <td><input type="text" name="list[${index.index}].yetcashamount" id="yetcashamount${index.index}" class="layui-input" onkeyup="checkAmount(this)" maxlength="5"></td>   <%--本次兑付金额--%>
                        <%--<td>--%>
                            <%--<a data-method="offset" data-type="t" id="rem" class="layui-btn layui-btn-normal" style="background-color:red;" onclick='deletetr(${index.index})' disabled>删除</a>--%>
                        <%--</td>--%>
                        <input type="hidden" value="${temp.id}" name="list[${index.index}].id" id="id${index.index}">
                        <input type="hidden" value="${temp.peoplenumber}" name="list[${index.index}].peoplenumber" id="peoplenumber${index.index}">
                        <input type="hidden" value="${temp.type}" name="list[${index.index}].type" id="type${index.index}">
                        <input type="hidden" value="${temp.grade}" name="list[${index.index}].grade" id="grade${index.index}">
                        <input type="hidden" value="${temp.startyear}" name="list[${index.index}].startyear" id="startyear${index.index}">
                        <input type="hidden" value="${temp.sunamount}" name="list[${index.index}].sunamount" id="sunamount${index.index}">
                        <input type="hidden" value="${temp.sunamount}" name="list[${index.index}].sunamount" id="sunamount${index.index}"/>
                        <input type="hidden" value="${temp.bank}" name="list[${index.index}].bank" id="bank${index.index}"/>
                        <input type="hidden" value="${temp.account}" name="list[${index.index}].account" id="account${index.index}"/>
                        <input type="hidden" value="${temp.province}" name="list[${index.index}].province" id="province${index.index}"/>
                        <input type="hidden" value="${temp.city}" name="list[${index.index}].city" id="city${index.index}"/>
                        <input type="hidden" value="${temp.county}" name="list[${index.index}].county" id="county${index.index}"/>
                        <input type="hidden" value="${temp.town}" name="list[${index.index}].town" id="town${index.index}"/>
                        <input type="hidden" value="${temp.village}" name="list[${index.index}].village" id="village${index.index}"/>
                        <input type="hidden" value="${temp.address}" name="list[${index.index}].address" id="address${index.index}"/>
                        <input type="hidden" value="${temp.finishamount}" name="list[${index.index}].finishamount" id="finishamount${index.index}"/>
                        <input type="hidden" value="${temp.finishstatus}" name="list[${index.index}].finishstatus" id="finishstatus${index.index}"/>
                        <input type="hidden" value="${temp.inputcode}" name="list[${index.index}].inputcode" id="inputcode${index.index}"/>
                        <input type="hidden" value="${temp.updatecode}" name="list[${index.index}].updatecode" id="updatecode${index.index}"/>
                        <input type="hidden" value="${temp.confirmcode}" name="list[${index.index}].confirmcode" id="confirmcode${index.index}"/>
                        <input type="hidden" value="<fm:formatDate value="${temp.paymentdate}" pattern="yyyy-MM-dd"/>" name="list[${index.index}].paymentdate" id="paymentdate${index.index}"/>
                        <input type="hidden" value="<fm:formatDate value="${temp.inputtime}" pattern="yyyy-MM-dd"/>" name="list[${index.index}].inputtime" id="inputtime${index.index}"/>
                        <input type="hidden" value="<fm:formatDate value="${temp.updatetime}" pattern="yyyy-MM-dd"/>" name="list[${index.index}].updatetime" id="updatetime${index.index}"/>
                        <input type="hidden" value="<fm:formatDate value="${temp.confirmtime}" pattern="yyyy-MM-dd"/>" name="list[${index.index}].confirmtime" id="confirmtime${index.index}"/>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="d1" style="display: none"  class="layui-table">
                <table id="tab">
                    <tr>
                        <td>用户姓名</td>
                        <td>身份证号</td>
                        <td>市</td>
                        <td>县</td>
                        <td>开户行</td>
                        <td>帐号</td>
                        <td>贫困类型</td>
                        <td>危房等级</td>
                        <td>纳入改造时间</td>
                        <td>是否销户</td>
                    </tr>
                </table>
            </div>
            <div style="width:100%;text-align:center;">
                <%--<a href="javascript:;" onclick="addtrElement();" target="BottomInner" class="layui-btn layui-btn-normal" style="background-color:green;">增加一条</a>--%>
                <a href="javascript:;" onclick="fmSubmit()" target="BottomInner" class="layui-btn layui-btn-normal">提交</a>
            </div>
            <%--<div style="width:100%;text-align:center;margin-top:1.25em;">--%>
                <%--&lt;%&ndash;<a data-method="offset" data-type="t" onclick="insertSum()" class="layui-btn layui-btn-normal" style="background-color:green;">提交</a>&ndash;%&gt;--%>
            <%--</div>--%>
            <div id="pageDemo" style="float:right;"></div>

    </div>
    </form>
</div>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<script type="text/javascript" src="${basePath}/plugins/layui/layui.js"></script>
<script>
    var fm;
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;
            fm = form;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            title: function(value) {
                if(value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function(value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>
<script>
    layui.use(['layer', 'laypage', 'element'], function(){
        var layer = layui.layer
            ,laypage = layui.laypage
            ,element = layui.element();



        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.msg('切换了：'+ this.innerHTML);
            console.log(data);
        });

        //分页

    });
</script>
<script>
    var $;
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var layer = layui.layer; //独立版的layer无需执行这一句
        $ = layui.jquery;

        //触发事件
        var active = {
            setTop: function(){
                var that = this;
                //多窗口模式，层叠置顶
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '当你选择该窗体时，即会在最顶端'
                    ,area: ['390px', '260px']
                    ,shade: 0
                    ,maxmin: true
                    ,offset: [ //为了演示，随机坐标
                        Math.random()*($(window).height()-300)
                        ,Math.random()*($(window).width()-390)
                    ]
                    ,content: 'http://layer.layui.com/test/settop.html'
                    ,btn: ['继续弹出', '全部关闭'] //只是为了演示
                    ,yes: function(){
                        $(that).click();
                    }
                    ,btn2: function(){
                        layer.closeAll();
                    }

                    ,zIndex: layer.zIndex //重点1
                    ,success: function(layero){
                        layer.setTop(layero); //重点2
                    }
                });
            }
            ,confirmTrans: function(){
                //配置一个透明的询问框
                layer.msg('大部分参数都是可以公用的<br>合理搭配，展示不一样的风格', {
                    time: 20000, //20s后自动关闭
                    btn: ['明白了', '知道了', '哦']
                });
            }
            ,notice: function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '300px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['火速围观', '残忍拒绝']
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.css('text-align', 'center');
                        btn.find('.layui-layer-btn0').attr({
                            href: 'http://www.layui.com/'
                            ,target: '_blank'
                        });
                    }
                });
            }
            ,offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();

                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id:'LAY_demo'+type //防止重复弹出
                    ,btn: ['确定']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩\
                    ,area: ['980px', '500px']
                    ,content: $('#show-div')
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
            ,offset2: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id:'hello'+type //防止重复弹出
                    ,btn: ['确定', '取消']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩\
                    ,area: ['980px', '500px']
                    ,content: $('#show-div2')
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
        };

        $('#LAY_demo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#hello .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
</script>
<script>

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
        var identityid = document.getElementById("identityid"+trid).value
        $("#tab tr:gt(0)").remove();
        $.ajax({
            url:"${basePath}/init/buildingas1",
            type:"post",
            data:"householder=" + householder + "&identityid=" + identityid,
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
                        str += "<td>"+data[x].identityid +"</td>";
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


    function biaozhi(th) {
        document.getElementById("biaozhiwei"+th).value = "0";
    }

    function findObj(id) {
        $.ajax({
            url:"${basePath}/init/building1?id=" + id,
            type:"get",
            success:function(data) {
                console.log(data)
                document.getElementById("biaozhiwei" + trid).value = "1";
                if(data == null || data == ''){
                    document.getElementById("d1").style.display = 'none';
                }
                obj = data;
                document.getElementById("householder"+trid).value = data.householder;
                document.getElementById("identityid"+trid).value = data.identityid;
                document.getElementById("d1").style.display = 'none';
                var str = "<input type='hidden' value='"+data.id+"' name='list["+trid+"].id'>"
                str += "<input type='hidden' value='"+data.account+"' name='list["+trid+"].account'>"
                str += "<input type='hidden' value='"+data.bank+"' name='list["+trid+"].bank'>"
                str += "<input type='hidden' value='"+data.inputcode+"' name='list["+trid+"].inputcode'>"
                str += "<input type='hidden' value='"+data.sunamount+"' name='list["+trid+"].sunamount'>"
                str += "<input type='hidden' value='"+data.finishstatus+"' name='list["+trid+"].finishstatus'>"
                str += "<input type='hidden' value='"+data.finishamount+"' name='list["+trid+"].finishamount'>"

                str += "<input type='hidden' value='"+data.peoplenumber+"' name='list["+trid+"].peoplenumber'>"
                str += "<input type='hidden' value='"+data.type+"' name='list["+trid+"].type'>"
                str += "<input type='hidden' value='"+data.grade+"' name='list["+trid+"].grade'>"
                str += "<input type='hidden' value='"+data.startyear+"' name='list["+trid+"].startyear'>"
                str += "<input type='hidden' value='"+data.province+"' name='list["+trid+"].province'>"
                str += "<input type='hidden' value='"+data.city+"' name='list["+trid+"].city'>"
                str += "<input type='hidden' value='"+data.county+"' name='list["+trid+"].county'>"
                str += "<input type='hidden' value='"+data.updatecode+"' name='list["+trid+"].updatecode'>"
                str += "<input type='hidden' value='"+data.confirmcode+"' name='list["+trid+"].confirmcode'>"
                str += "<input type='hidden' value='"+data.village+"' name='list["+trid+"].village'>"
                str += "<input type='hidden' value='"+data.address+"' name='list["+trid+"].address'>"
                str += "<input type='hidden' value='"+data.town+"' name='list["+trid+"].town'>"

                str += "<input type='hidden' value='"+new Date().format('yyyy-MM-dd')+"' name='list["+trid+"].paymentdate'>"
                str += "<input type='hidden' value='"+new Date(data.inputtime).format('yyyy-MM-dd')+"' name='list["+trid+"].inputtime'>"
                str += "<input type='hidden' value='"+new Date(data.updatetime).format('yyyy-MM-dd')+"' name='list["+trid+"].updatetime'>"
                str += "<input type='hidden' value='"+new Date(data.confirmtime).format('yyyy-MM-dd')+"' name='list["+trid+"].confirmtime'>"
                $("#"+trid+"").append(str)

                // 累加应兑付金额
            }
        })
    }



    function fmSubmit() {
        var fmtable = document.getElementById("fmtab");
        var arr = fmtable.getElementsByTagName("tr");
        for(var x = 0; x<arr.length-1; x++){
            var biaozhiwei = document.getElementById("biaozhiwei"+x);
            if(biaozhiwei.value == "0"){
                alert("第"+(x+1)+"行户主身份证以及姓名请选择，手动输入无效");
                return;
            }

            var identityid = document.getElementById("identityid"+x).value;
            if(identityid == null || identityid == ""){
                alert("第"+(x+1)+"个户主身份证信息为空，请选择");
                return false;
            }
            var householder = document.getElementById("householder"+x).value;
            if(householder == null || householder == ""){
                alert("第"+(x+1)+"个户主姓名为空，请选择");
                return false;
            }
            var progress = document.getElementById("progress"+x).value;
            if(progress == null || progress == ""){
                alert("请选择第"+(x+1)+"个工程进度");
                return false;
            }
            var operatetdate = document.getElementById("operatetdate"+x).value;
            if(operatetdate == null || operatetdate == ""){
                alert("第"+(x+1)+"个资金发放日期为空，请选择");
                return false;
            }
            var paymentamount = document.getElementById("paymentamount"+x).value;
            if(paymentamount == null || paymentamount == ""){
                alert("第"+(x+1)+"个兑付金额为空，请输入");
                return false;
            }
            var yetcashamount = document.getElementById("yetcashamount"+x).value;
            if(yetcashamount == null || yetcashamount == ""){
                alert("第"+(x+1)+"个本次兑付金额为空，请输入");
                return false;
            }


        }
        var fmj = document.forms["fm1"];
        fmj.action = "${basePath}/order/insertOrder";
        fmj.submit();
    }


    function checkAmount(ele) {
        var fmtable = document.getElementById("fmtab");
        var arr = fmtable.getElementsByTagName("input");
        var sum = 0;
        var index = ele.id.substring(ele.id.length-1);
        var paymentamountValue = document.getElementById("paymentamount"+index).value
        /* 验证兑付金额是否超限
        if(parseInt(ele.value) > paymentamountValue){
            alert("本次兑付金额超出限额最多兑付" + paymentamountValue + "元")
            ele.value = '';
            ele.focus()
        }*/

        typeof sum;
        for(var x = 0; x<arr.length; x++){
            var name = arr[x].name.substring(arr[x].name.indexOf('.') + 1,arr[x].name.length);
            var value = arr[x].value;
            if(value == ''){
                continue;
            }
            switch(name){
                case 'yetcashamount':
                    var reg = /^[1-9]\d*$/;
                    if(!reg.test(value)){
                        alert("请输入正确的数字");
                        arr[x].focus()
                        return false;
                    }
                    sum += parseInt(value);
            }
        }
        $("#bencisumamount").val(sum);


    }

    window.onload = function () {
        var sumquantity = document.getElementById("sumquantity");
        var sumamount = document.getElementById("sumamount");
        var orderdate = document.getElementById("orderdate");
        sumquantity.value = sumquantity.value == '' ? 0 : sumquantity.value;
        sumamount.value = sumamount.value == '' ? 0 : sumamount.value;
        orderdate.value = orderdate.value == '' ? new Date().format("yyyy-MM-dd") : orderdate.value;
    }
</script>
</body>

</html>