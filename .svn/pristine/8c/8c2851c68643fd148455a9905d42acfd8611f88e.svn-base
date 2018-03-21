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
    <script type="text/javascript" src="${basePath}/js/selectAddress.js"></script>

    <style>
        .tag_select{
            display: none;
        }

    </style>
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div id="show-div" style="display:none;">
    <form class="layui-form layui-form-pane" action="" method="post" name="update" id="update">
        <table class="layui-table" lay-skin="line">
            <tbody>
            <input type="hidden" id="password" name="password"/>
            <input type="hidden" id="comLevel" name="comLevel"/>
            <input type="hidden" id="userInd" name="userInd"/>
            <input type="hidden" id="validStatus" name="validStatus"/>
            <input type="hidden" id="updator" name="updator"/>
            <input type="hidden" id="remark" name="remark"/>
            <input type="hidden" id="flag" name="flag"/>
            <input type="hidden" id="ckCode" name="ckCode"/>
            <tr>
                <td>用户帐号</td>
                <td><input type="text" name="userCode" id="userCode" lay-verify="title" autocomplete="off" placeholder="dsibwlmq01" class="layui-input" maxlength="15" readonly></td>
            </tr>
            <tr>
                <td>用户姓名</td>
                <td><input type="text" name="userName" id="userName" lay-verify="title" autocomplete="off" placeholder="请输入用户姓名" class="layui-input" maxlength="15" readonly></td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td><input type="text" name="telephone" id="telephone" lay-verify="title" autocomplete="off" placeholder="请输入联系电话" class="layui-input" maxlength="15"></td>
            </tr>
            <tr>
                <td>联系人</td>
                <td><input type="text" name="linkname" id="linkname" lay-verify="title" autocomplete="off" placeholder="请输入联系人" class="layui-input" maxlength="15"></td>
            </tr>
            <tr>
                <td>联系地址</td>
                <td><input type="text" name="address" id="address" lay-verify="title" autocomplete="off" placeholder="请输入联系地址" class="layui-input" maxlength="50"></td>
            </tr>
            <tr>
                <td>手机号码</td>
                <td><input type="text" name="mobile" id="mobile" lay-verify="title" autocomplete="off" placeholder="请输入手机号码" class="layui-input" maxlength="11"></td>
            </tr>
            <tr>
                <td>用户权限</td>
                <td>
                    <div class="layui-form-item layui-inline layui-form-select">
                        <select name="role" id="role">
                            <c:choose>
                                <c:when test="${sessionScope.ggUser.comLevel == 1}">
                                    <option value="provinceAuditor">省级</option>
                                    <option value="cityAuditor">市级</option>
                                    <option value="countyAuditor">县级</option>
                                </c:when>
                                <c:when test="${sessionScope.ggUser.comLevel == 2}">
                                    <option value="cityAuditor">市级</option>
                                    <option value="countyAuditor" >县级</option>
                                </c:when>
                                <c:when test="${sessionScope.ggUser.comLevel == 3}">
                                    <option value="countyAuditor">县级</option>
                                </c:when>
                            </c:choose>
                        </select>
                    </div>
                    <div class="layui-form-item layui-inline layui-form-select">
                        <select name="province" id="province" lay-verify="province" lay-filter="province">
                            <option value="520000" >贵州省</option>
                        </select>
                    </div>
                    <div class="layui-form-item layui-inline layui-form-select">
                            <select name="city" id="city"  lay-verify="city" lay-filter="city">
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
                        <select name="county" id="county" lay-verify="county" lay-filter="county">
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
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="layui-layout-admin" style="height:100%;padding:5px;">
    <form class="layui-form" action="${basePath}/user/pageUser" name="fm" id="fm">
        <table class="layui-table">
            <thead>
            <tr>
                <th>序号</th>
                <th>省份</th>
                <th>市级</th>
                <th>区县</th>
                <th>登录帐号</th>
                <th>用户名称</th>
                <th>权限</th>
                <%--<th>上级管理人</th>--%>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.pagination.resultList}" var="us" varStatus="ind">
                <tr>
                    <td>${ind.index +1}</td>
                    <td>${us.PROVINCE}</td>
                    <td>${us.CITY}</td>
                    <td>${us.COUNTY}</td>
                    <td>${us.USERCODE}</td>
                    <td>${us.USERNAME}</td>
                    <td>${us.ROLE}</td>
                    <%--<td>xxxxxxx</td>--%>
                    <td>
                        <div class="site-demo-button layui-inline" id="LAY_demo" style="margin-bottom: 0;">
                            <div href="#" data-method="offset" data-type="t${us.USERCODE}" class="layui-btn layui-btn-normal" style="background:#F29F22"><i class="layui-icon">&#xe60e;</i>编辑</div>
                        </div>
                        <a href="javascript:checkDelete('${us.USERCODE}');" class="layui-btn layui-btn-normal" style="background-color:red;"><i class="layui-icon">&#xe615;</i>删除</a>
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

        form.on('select(province)',function(data){
            var obj = document.getElementById("city");
            getAreaSelect(null,data.value,obj);
        });
        form.on('select(city)',function(data){
            var obj = document.getElementById("county");
            getAreaSelect(null,data.value,obj);
        });


    });
</script>
<script>
    layui.use(['form','layer'], function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        var form = layui.form;
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
                var userCode = type.substring(1);
                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id:'LAY_demo'+type //防止重复弹出
                    ,btn: ['确定','取消']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩\
                    ,area: ['980px', '500px']
                    ,content: $('#show-div')
                    ,success:function(){
                        $.ajax({
                            url:"<%=basePath%>user/getUser?usercode="+userCode,
                            type:"get",
                            success:function(data) {
                                debugger
                                console.log(data)
                                document.getElementById("userCode").value = data.userCode;
                                document.getElementById("userName").value = data.userName;
                                document.getElementById("telephone").value = data.telePhone;
                                document.getElementById("linkname").value = data.linkName;
                                document.getElementById("mobile").value = data.mobile;
                                document.getElementById("address").value = data.address;
                                document.getElementById("password").value = data.password;
                                document.getElementById("comLevel").value = data.comLevel;
                                document.getElementById("userInd").value = data.userInd;
                                document.getElementById("validStatus").value = data.validStatus;
                                document.getElementById("updator").value = data.updator;
                                document.getElementById("updateDate").value = new Date(data.updateDate).format("yyyy-MM-dd");
                                document.getElementById("remark").value = data.remark;
                                document.getElementById("flag").value = data.flag;
                                document.getElementById("ckCode").value = data.ckCode;

                                var citys = document.getElementById("city");
                                selectetOp(citys,data.city);
                                var role = document.getElementById("role");
                                selectetOp(role,data.role);
                                var county = document.getElementById("county");
                                selectetOp(county,data.county);
                                form.render

                            }
                        })
                    }
                    ,yes: function(){
                    	var zhanghao = /^[a-zA-Z0-9]\w{5,17}$/;// 以字母或数字开头，长度在6~18之间，只能包含字符、数字和下划线
                    	var yonghuName = /^[\u4e00-\u9fa5a-zA-Z0-9]{0,17}$/;//匹配由中文、英文、数字组成的18位以内字符串
                    	var adrressName = /^[\u4e00-\u9fa5a-zA-Z0-9]+$/;//匹配由中文、英文、数字组成的字符串
                    	var tel = /^1[3|4|5|7|8][0-9]{9}$/; //手机号码验证规则

//                     	var userCode = $("#userCode");//用户账号
//                     	var userName = $("#userName");//用户姓名
//                     	var telephone = $("#telephone");//联系方式
//                     	var linkname = $("#linkname");//联系人
//                     	var address = $("#address");//联系地址
//                     	var mobile = $("#mobile");//手机号码
//                     	var role = $("#role");//用户权限
//                     	var province = $("#province");//
//                     	var city = $("#city");//
//                     	var county = $("#county");//
                    	//校验账号非空已经有效性
//                     	if(userCode.value == null || userCode.value == ""){
//                     		alert("用户账号不能为空，请输入");
//                     		return false;
//                     	}if (!zhanghao.test(userCode.value)) {
// 							alert("用户账号只能以字母或数字开头，长度在6~18之间，只能包含字符、数字和下划线");
// 							return false;
// 						}
						//校验用户姓名非空以及有效性
// 						if(userName.value == null || userName.value == ""){
//                     		alert("用户姓名不能为空，请输入");
//                     		return false;
//                     	}if(!yonghuName.test(userName.value)){
//                             alert("用户姓名只能由中文、英文、数字组成的18位以内的字符串");
                            userName.focus();
//                             return false;
//                         }
                        //校验联系方式非空以及有效性
//                         if(telephone.value == null || telephone.value == ""){
//                     		alert("联系方式不能为空，请输入");
//                     		return false;
//                     	}if (!tel.test(telephone.value)) {
// 							alert("联系方式输入格式不正确，请重新输入");
// 							return false;
// 						}
						//校验联系人非空以及有效性
//                     	if(linkname.value == null || linkname.value == ""){
//                     		alert("联系人不能为空，请输入");
//                     		return false;
//                     	}if(!yonghuName.test(linkname.value)){
//                             alert("联系人只能由中文、英文、数字组成的18位以内的字符串");
//                             return false;
//                         }
                        //校验联系地址非空以及有效性
//                         if(address.value == null || address.value == ""){
//                     		alert("联系地址不能为空，请输入");
//                     		return false;
//                     	}if (!adrressName.test(address.value)) {
// 							alert("联系地址只能输入由中文、英文、数字");
// 							return false;
// 						}
                    	//校验手机号码非空以及有效性
//                     	if(mobile.value == null || mobile.value == ""){
//                     		alert("手机号码不能为空，请输入");
//                     		return false;
//                     	}if (!tel.test(mobile.value)) {
// 							alert("手机号码输入格式不正确，请重新输入");
// 							return false;
// 						}
						//校验权限非空、省市区县非空即可
// 						if(role.value == null || role.value == ""){
//                     		alert("请选择用户权限");
//                     		return false;
//                     	}if(province.value == null || province.value == ""){
//                     		alert("请选择用户所在省份");
//                     		return false;
//                     	}if(city.value == null || city.value == ""){
//                     		alert("请选择用户所在城市");
//                     		return false;
//                     	}if(county.value == null || county.value == ""){
//                     		alert("请选择用户所在地区");
//                     		return false;
//                     	}
                    	
                        var updataform = document.forms["update"];
                        updataform.action = '<%= basePath%>user/update'
                        updataform.submit();
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
    function checkDelete(val) {
        var url = '${basePath}/user/deleteUser?userCode=' + val;
        $.ajax({
            url:url,
            type:'get',
            success:function(data) {
                debugger
                if(data > 0 ){
                    if(confirm("此用户有" + data +"个下级用户，是否删除?")){
                        window.location.href = '${basePath}/user/deleteUserTrue?userCode='+val
                    }
                }else {
                    window.location.href = '${basePath}/user/deleteUserTrue?userCode='+val
                }
            },
            error:function(a,b) {
                console.log(a)
                console.log(b)
            }
        })
    }
</script>
</body>

</html>