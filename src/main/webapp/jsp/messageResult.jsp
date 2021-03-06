<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tlds/ggCodeTld" prefix="code" %>
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
    <script src="${basePath}/js/jquery.js" type="text/javascript"></script>
    <style>
        table {
            table-layout: fixed;
        }


        td {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div id="show-div2" style="display:none;">
    <form class="layui-form layui-form-pane" action="" name="f1" id="f1">
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label">户主姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入户主姓名" id="username" autocomplete="off" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入身份证号" id="identityid" autocomplete="off" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label">人口数</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入人口数" id="peoplenumber" autocomplete="off" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
                <label class="layui-form-label">开户行</label>
                <div class="layui-input-inline">
                    <input type="text" name="bank" lay-verify="required" id="bank" autocomplete="off" class="layui-input" disabled>
                </div>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入账号" id="account" autocomplete="off" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
                <label class="layui-form-label">贫困类型</label>
                <div class="layui-input-inline">
                    <input type="text" name="type" lay-verify="required" id="type" autocomplete="off" class="layui-input" disabled>
                </div>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
                <label class="layui-form-label">危房等级</label>
                <div class="layui-input-inline">
                    <input type="text" name="grade" lay-verify="required" id="grade" autocomplete="off" class="layui-input" disabled>
                </div>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
                <label class="layui-form-label">纳入时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="startyear" lay-verify="required" id="startyear" autocomplete="off" class="layui-input" disabled>
                </div>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label">补助金额</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" value="100万" id="amount" autocomplete="off" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
                <label class="layui-form-label">城市</label>
                <div class="layui-input-inline">
                    <input type="text" name="city" lay-verify="required" id="city" autocomplete="off" class="layui-input" disabled>
                </div>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
                <label class="layui-form-label">区县</label>
                <div class="layui-input-inline">
                    <input type="text" name="county" lay-verify="required" id="county" autocomplete="off" class="layui-input" disabled>
                </div>
        </div>
    </form>
</div>
<div class="layui-layout-admin" style="height:100%;padding:5px;">
    <form class="layui-form" action="${basePath}/init/messageContext" name="fm" id="fm">
        <table class="layui-table">
            <thead>
            <tr>
                <th>市</th>
                <th>县</th>
                <th>户主姓名</th>
                <th>身份证号</th>
                <th>开户行</th>
                <th>卡号</th>
                <th>贫困类型</th>
                <th>危房等级</th>
                <th>纳入改造时间</th>
                <th>应兑付金额</th>
                <th>已兑付金额</th>
                <th>是否销户</th>
                <th>详情</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.pagination.resultList}" var="build" varStatus="index">
                <tr>
                    <td><code:name codeCode="${build.city}" codeType="City"/></td>
                    <td><code:name codeCode="${build.county}" codeType="County" remark="${build.city}"/></td>
                    <td title="${build.householder}">${build.householder}</td>
                    <td title="${build.identityid}">${build.identityid}</td>
                    <td><code:name codeCode="${build.bank}" codeType="bankType"/></td>
                    <td title="${build.account}">${build.account}</td>
                    <td><code:name codeCode="${build.type}" codeType="povertyType"/></td>
                    <td><code:name codeCode="${build.grade}" codeType="grade"/></td>
                    <td>${build.startyear}</td>
                    <td>${build.sunamount}</td>
                    <td>${build.finishamount}</td>
                    <td><code:name codeCode="${build.finishstatus}" codeType="FinishStatus"/></td>
                    <input type="hidden" id="id${index.index}" value="${build.id}"/>
                    <td>
                        <div class="site-demo-button" style="margin-bottom: 0;">
                            <a data-method="offset" data-param="${index.index}" data-type="t" class="layui-btn layui-btn-normal">查看</a>
                            <%--<a data-method="offset" data-type="t${index.index}" class="layui-btn layui-btn-normal">修改</a>--%>
                        </div>
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
    var form1;
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;
            form1 = form;
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
                        Math.random()*($(window).height()-400)
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
                var index = othis.data("param");
                var inp = document.getElementById("id" + index);
                var buildingmst;
                $.ajax({
                    url:"<%= basePath%>init/buildingas?id="+inp.value,
                    type:"get",
                    async:false,
//                    data:{"id":inp.value},
//                    contextType:'application/json;charset=utf-8',
                    dataType:"json",
                    success:function(data) {
//                        buildingmst = data;
                        console.log(data)
                        document.getElementById("username").value = data.householder;
                        document.getElementById("identityid").value = data.identityid;
                        document.getElementById("peoplenumber").value = data.peoplenumber;
                        document.getElementById("bank").value = data.bank;
                        document.getElementById("account").value = data.account;
                        document.getElementById("type").value = data.type;
                        document.getElementById("grade").value = data.grade;
                        document.getElementById("startyear").value = data.startyear;
                        document.getElementById("amount").value = data.finishamount;
                        document.getElementById("city").value = data.province;
                        document.getElementById("county").value = data.county;
                       form1.render()
                    }
                })
                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'LAY_demo'+type //防止重复弹出
                    ,btn: ['关闭']/*'保存',*/
                    ,title: '改造户详情'
                    ,area: ['1000px', '330px']
                    ,content: $('#show-div2')  // id
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    /*,yes: function(){
                        layer.closeAll();
                    }*/
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

    });

    function checkvalue(options,data){
        for(var x = 0; x < options.length; x++){
            console.log(options[x].text + ":" + data.trim());
            if(options[x].text.trim() == data.trim()){
                console.log(data.trim())
                options[x].selected = true;
            }
        }
    }

</script>
</body>

</html>