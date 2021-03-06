
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/tlds/ggCodeTld" prefix="code" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="${basePath}/js/jquery.js"></script>
    <script type="text/javascript" src="${basePath}/js/userManager.js"></script>
    

</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div id="show-div" style="display:none;">
    <form class="layui-form layui-form-pane" action="" method="post" id="fm" target="BottomInner">
        <div class="layui-form-item">
            <label class="layui-form-label">登录账号</label>
            <div class="layui-input-inline">
                <input type="text" name="userCode" id="addUserCode" maxlength="15" lay-verify="userCode" placeholder="请输入登录账号" autocomplete="off" class="layui-input" onkeyup="checkUserName(this)">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="addPassWord" maxlength="15" lay-verify="required" placeholder="登录密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名称</label>
            <div class="layui-input-inline">
                <input type="text" name="userName" id="addUserName" lay-verify="required"  maxlength="15" placeholder="请输入用户名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
            <select name="role" id="addRole">
                        <option value="">请选择用户等级</option>
                <c:choose>
                    <c:when test="${sessionScope.ggUser.comLevel == 1}">
                        <option value="provinceAudit">省级审核</option>
                        <option value="cityFinance">市级财政</option>
                        <option value="cityFinanceAudit">市级财政审核</option>
                        <option value="countyFinance">县级财政</option>
                        <option value="countyFinanceAudit">县级财政审核</option>
                        <option value="countyHousing">县级住建</option>
                        <option value="countyHousingAudit">县级住建审核员</option>
                    </c:when>
                    <c:when test="${sessionScope.ggUser.comLevel == 2}">
                        <option value="cityFinance">市级财政</option>
                        <option value="cityFinanceAudit">市级财政审核</option>
                        <option value="countyFinance">县级财政</option>
                        <option value="countyFinanceAudit">县级财政审核</option>
                        <option value="countyHousing">县级住建</option>
                        <option value="countyHousingAudit">县级住建审核员</option>
                    </c:when>
                    <c:when test="${sessionScope.ggUser.comLevel == 3}">
                        <option value="countyFinance">县级财政</option>
                        <option value="countyFinanceAudit">县级财政审核</option>
                        <option value="countyHousing">县级住建</option>
                        <option value="countyHousingAudit">县级住建审核员</option>
                    </c:when>
                </c:choose>
            </select>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
            <select name="province1" id="province1" lay-verify="province1" lay-filter="province1">
                <%--<c:if test="${sessionScope.ggUser.comLevel == '1'}">--%>
                    <option value="520000">贵州省</option>
                <%--</c:if>--%>
                <%--<c:if test="${sessionScope.ggUser.comLevel > '1'}">--%>
                    <%--<option value="520000" disabled>贵州省</option>--%>
                <%--</c:if>--%>
            </select>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
            <select name="city" id="city1" lay-verify="city1" lay-filter="city1">
                <c:if test="${sessionScope.ggUser.comLevel == '1' }">
                    <option value="">请选择城市</option>
                </c:if>
                <c:if test="${sessionScope.ggUser.comLevel <= '2' }">
                    <%--<option value="">请选择城市</option>--%>
                    <c:forEach items="${sessionScope.cityList }" var="city">
                        <option value="${city.codecode }">${city.codecname }</option>
                    </c:forEach>
                </c:if>
                <c:if test="${sessionScope.ggUser.comLevel == '3' }">
                    <c:forEach items="${sessionScope.cityList }" var="city">
                        <option value="${city.codecode }">${city.codecname }</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
            <select name="county" id="county1" lay-verify="county1" lay-filter="county1">
                <c:if test="${sessionScope.ggUser.comLevel == '1' }">
                    <option value="">请选择区县</option>
                </c:if>

                <c:if test="${sessionScope.ggUser.comLevel == '2' }">
                    <option value="">请选择区县</option>
                    <c:forEach items="${sessionScope.countyList }" var="county">
                        <option value="${county.codecode }">${county.codecname }</option>
                    </c:forEach>
                </c:if>
                <c:if test="${sessionScope.ggUser.comLevel >= '3' }">
                    <c:forEach items="${sessionScope.countyList }" var="county">
                        <option value="${county.codecode }">${county.codecname }</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
    </form>
</div>
<div class="layui-layout-admin" style="margin: 15px;">
    <form class="layui-form" action="" name="retrieve" target="BottomInner">
        <div class="layui-form-item layui-inline layui-form-select">
            <select name="city" lay-filter="city">
                <c:if test="${sessionScope.ggUser.comLevel == '1' }">
                    <%--<c:if test="${sessionScope.ggUser.comLevel == '1' }">--%>
                        <%--<option value=" ">请选择城市</option>--%>
                    <%--</c:if>--%>
                    <c:forEach items="${sessionScope.cityList }" var="city">
                        <option value="${city.codecode }">${city.codecname }</option>
                    </c:forEach>
                </c:if>
                <c:if test="${sessionScope.ggUser.comLevel > '2' }">
                    <c:forEach items="${sessionScope.cityList }" var="city">
                        <option value="${city.codecode }" disabled>${city.codecname }</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
        <div class="layui-form-item layui-inline layui-form-select">
            <select name="county" id="county" lay-verify="">
                <c:if test="${sessionScope.ggUser.comLevel < '3' }">
                    <option value="">请选择区县</option>
                </c:if>
                <c:if test="${sessionScope.ggUser.comLevel >= '3' }">
                    <c:forEach items="${sessionScope.countyList }" var="county">
                        <option value="${county.codecode }" disabled>${county.codecname }</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
        <div class="layui-form-item layui-inline">
            <div class="layui-input-inline">
                <input type="text" name="username" id="username" lay-verify="required" placeholder="请输入需要查询的用户名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <a href="javascript:;" onclick="retrieveForm();" target="BottomInner" class="layui-btn layui-btn-normal">
            	<i class="layui-icon">&#xe615;</i> 查询</ahref>
            <div class="site-demo-button layui-inline" id="LAY_demo" style="margin-bottom: 0;">
                <a href="javascript:;" data-method="offset" data-type="t" class="layui-btn layui-btn-normal" style="background:green;">
                	<i class="layui-icon">&#xe60e;</i>添加用户
                </a>
            </div>
        </div>
    </form>
</div>
<div class="layui-layout-admin" style="margin: 15px;height:1000px;">
    <iframe src="${basePath}/user/initUser" name="BottomInner" height="100%" width="100%" frameborder="0" scrolling="auto" marginheight="0"></iframe>
</div>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<script type="text/javascript" src="${basePath}/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${basePath }/js/area.js"></script>
<script type="text/javascript" src="${basePath}/js/verification.js"></script>

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

//        form.on('select(province1)',function(data){
//            var obj = document.getElementById("city1");
//            getAreaSelect(data.value,obj);
//        });
        form.on('select(city1)',function(data){
            var obj = document.getElementById("county1");
            getAreaSelect(data.value,obj);
        });

        form.on('select(city)',function(data){
            var obj = document.getElementById("county");
            getAreaSelect(data.value,obj);
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

        element.on('input(userCode)', function(data){
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
                    ,id:'LAY_demo'+type //防止重复弹出
                    ,btn: ['确定','取消']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩\
                    ,area: ['600px', '400px']
                    ,content: $('#show-div')
                    ,yes: function(){
                        //$("#province1").removeAttr("disabled");
                        var userCode = document.getElementById("addUserCode");
                        if(userCode.value == null || userCode.value == ''){
                            alert("用户名不能为空");
                            userCode.focus();
                            return false;

                        } if(!checkEndAndNoOrXianhuaxian(userCode.value)){
                                alert("用户名只能以字母或数字开头，长度在6~18之间，只能包含字符、数字和下划线");
                                userCode.focus();
                                return false;
                        }
                        var password = document.getElementById("addPassWord");
                        if(password.value == null || password.value == ''){
                            alert("密码不能为空");
                            password.focus();
                            return false;

                        } if(!checkEndAndNoOrXianhuaxian(password.value)){
                            alert("密码只能以字母或数字开头，长度在6~18之间，只能包含字符、数字和下划线");
                            password.focus();
                            return false;
                        }
                        var addUserName = document.getElementById("addUserName");
                        if(addUserName.value == null || addUserName.value == ''){
                            alert("请输入用户名称");
                            addUserName.focus();
                            return false;
                        }
                        var fa = /^[\u4e00-\u9fa5a-zA-Z0-9]{0,17}$/;//匹配由中文、英文、数字组成的字符串
                        if(!fa.test(addUserName.value)){
                            alert("用户名称只能由中文、英文、数字组成的18位以内的字符串");
                            addUserName.focus();
                            return false;
                        }
                        var addRole = document.getElementById("addRole");
                        if(addRole.value == null || addRole.value == ''){
                            alert("请选择用户等级");
                            return ;
                        }

                        /*var province1 = document.getElementById("province1");
                        if(province1.value == null || province1.value == ''){
                            alert("请选择用户所在省份");
                            return ;
                        }*/
                        var city1 = document.getElementById("city1");
                        if(city1.value == null || city1.value == ''){
                            alert("请选择用户所在城市");
                            return ;
                        }
//                        var county1 = document.getElementById("county1");
//                        if(county1.value == null || county1.value == ''){
//                            alert("请选择用户所在地区");
//                            return ;
//                        }
                        var form = document.getElementById("fm");
                        console.log(form)
                        form.action="<%=basePath%>user/addUser";
                        form.acceptCharset = "utf8"
                        form.submit();
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

</script>
<script>
    function checkUserName(ele){
        $.ajax({
            url:basePath+"/user/checkUser?userCode=" + ele.value,
            type:"get",
            success:function (data){
                if(data){
                    alert("登录帐号已存在！");
                    ele.focus()
                }
            }

        })
    }
</script>
</body>

</html>