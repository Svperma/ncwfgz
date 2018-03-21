<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tlds/ggCodeTld" prefix="code" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <script src="js/jquery.js" type="${basePath}/text/javascript"></script>
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div class="layui-layout-admin" style="height:100%;padding:5px;">
    <form class="layui-form" action="${basePath}/order/paymentsPage" id="fm" name="fm" method="post">
        <table class="layui-table">
            <thead>
            <tr>
                <th>兑付日期</th>
                <th>兑付危房数量</th>
                <th>兑付金额</th>
                <th>资料</th>
                <th>录入人</th>
                <th>类型</th>
                <th>状态</th>
                <th>详情</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${sessionScope.pagination.resultList}" var="payment">
                    <tr>
                        <input type="hidden" value="${payment.ORDERNO}">
                        <td><fm:formatDate value="${payment.ORDERDATE}" pattern="yyyy-MM-dd"/></td>
                        <td>${payment.SUMQUANTITY}</td>
                        <td>${payment.SUMAMOUNT}</td>
                        <td><a href="${basePath}/order/download?id=${payment.ORDERNO}"  style="color: #1E9FFF;" title="点击下载附件" name="ziliao" class="afilepath" title="点击下载附件">${payment.ATTACHMENTPATH}</a></td>
                        <td>${payment.INPUTCODE}</td>
                        <td>
                            <c:choose>
                                <c:when test="${payment.STATUS == 0}">
                                    信息录入
                                </c:when>
                                <c:when test="${payment.STATUS == 1}">
                                    兑付确认
                                </c:when>
                            </c:choose>
                        </td>
                        <%--<script>--%>
                        <%--onclick="aaa('${payment.ORDERNO}')"--%>
                            <%--function aaa(path){--%>
                                <%--console.log(path)--%>
                                <%--$.ajax({--%>
                                    <%--url:'${basePath}/order/download?path='+path,--%>
                                    <%--type:"get",--%>
                                    <%--success:function(){--%>
                                        <%--alert("success")--%>
                                    <%--}--%>
                                <%--})--%>
                            <%--}--%>
                        <%--</script>--%>
                        <c:choose>
                            <c:when test="${payment.AUDITSTATUS == 1}">
                                <td>审核中</td>
                            </c:when>
                            <c:when test="${payment.AUDITSTATUS == 2}">
                                <td>未通过</td>
                            </c:when>
                            <c:when test="${payment.AUDITSTATUS == 3}">
                                <td>审核通过</td>
                            </c:when>
                        </c:choose>
                        <td>
                            <a href="javascript:;" onclick="forConmit('${payment.ORDERNO}');" target="_parent" style="color:#00a6e3;">查看</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <jsp:include page="${basePath }/common/pagination.jsp"></jsp:include>

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
    function forConmit(orderNo){
        var path = '${basePath}/order/retrieve?orderNo='+orderNo;
        window.open(path,"_parent");
    }


    window.onload = function subZiliao(){
        var arr = document.getElementsByName("ziliao");
        for(var x = 0; x< arr.length; x++){
            var filepath = arr[x].innerText
            var val = filepath.substring(filepath.lastIndexOf("\\\\")+2);
            arr[x].innerHTML = val
        }
    }
</script>
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
        laypage({
            cont: 'pageDemo' //分页容器的id
            ,pages: 100 //总页数
            ,skin: '#5FB878' //自定义选中色值
            ,skip: true //开启跳页
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第'+ obj.curr +'页');
                }
            }
        });
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
                    ,id: 'LAY_demo'+type //防止重复弹出
                    ,btn: ['保存','取消']
                    ,title: '改造户详情'
                    ,area: ['1200px', '500px']
                    ,content: $('#show-div2')
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
            ,offset1: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();

                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'LAY_demo'+type //防止重复弹出
                    ,btn: '关闭全部'
                    ,area: ['980px', '500px']
                    ,content: $('#show-div3')
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
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
                    ,btn: '关闭全部'
                    ,area: ['300px', '300px']
                    ,content: $('#show-div4')
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
        };

        $('.site-demo-button .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        $(function(){
            $(".afilepath").hover(
                function(){
                    $(this).css("color","#FF5722") ;
                } ,
                function(){
                    $(this).css("color","#1E9FFF") ;
                }
            ) ;
        }) ;
    });
</script>
</body>

</html>