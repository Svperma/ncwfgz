<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div class="layui-layout-admin" style="margin: 15px;">
    <form class="layui-form" action="" target="BottomInner" name="fm" id="fm" enctype="multipart/form-data">
        <input type="hidden" value="${paymentOrder.orderno}" name="orderno">
        <div class="layui-form-item layui-inline">
            <input class="layui-input" placeholder="兑付日期" name="orderdate" id="orderdate" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="<fm:formatDate value='${paymentOrder.orderdate}' pattern='yyyy-MM-dd hh:mm:ss'/> " readonly>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label" style="width:150px;">兑付危房数量</label>
            <div class="layui-input-inline">
                <input type="text" name="sumquantity" id="sumquantity" lay-verify="required" value="${paymentOrder.sumquantity}" autocomplete="off" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label">总兑付金额</label>
            <div class="layui-input-inline">
                <input type="text" name="sumamount" id="sumamount" lay-verify="required" value="${paymentOrder.sumamount}" autocomplete="off" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <div class="layui-input-inline">
                <input type="file" name="file" lay-type="file" class="layui-upload-file">
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <a href="#" target="BottomInner" class="layui-btn layui-btn-normal">确认</a>
        </div>

    </form>
</div>
<div class="layui-layout-admin" style="margin: 15px;height:1000px;">
    <iframe src="${basePath}/jsp/orders.jsp" name="BottomInner" height="100%" width="100%" frameborder="0" scrolling="auto" marginheight="0"></iframe>
</div>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<script type="text/javascript" src="${basePath}/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

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
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

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
    layui.use('upload', function(){
        layui.upload({
            url: '' //上传接口
            ,success: function(res){ //上传成功后的回调
                console.log(res)
            }
        });

        layui.upload({
            url: '/test/upload.json'
            ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'get' //上传接口的http类型
            ,success: function(res){
                LAY_demo_upload.src = res.url;
            }
        });
    });

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

    window.onload = function() {
        var cDate = document.getElementById("orderdate").value.trim();
        var sumquantity = document.getElementById("sumquantity").value.trim();
        var sumamount = document.getElementById("sumamount").value.trim();
        if (cDate == null || cDate == "") {
            var time = new Date().format("yyyy-MM-dd hh:mm:ss");
            document.getElementById("orderdate").value = time;
        }
        if(sumamount == null || sumamount == ''){
            document.getElementById("sumamount").value = 0;
        }
        if(sumquantity == null || sumamount == ''){
            document.getElementById("sumquantity").value = 0;
        }
    }
</script>
</body>

</html>