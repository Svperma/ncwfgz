<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tlds/ggCodeTld" prefix="code" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div class="layui-layout-admin" style="height:100%;padding:5px;">
    <form class="layui-form" action="${basePath }/order/audit" name="fm">
        <table class="layui-table">
            <tr>
                <th>兑付日期</th>
                <td><fmt:formatDate value="${guPaymentOrder.orderdate}" pattern="yyyy-MM-dd"/> </td>
                <th>兑付危房数量</th>
                <td>${guPaymentOrder.sumquantity}</td>
                <th>总兑付金额</th>
                <td>${guPaymentOrder.sumamount}</td>
                <th>资料</th>
                <td>
                	<%--<a href="${guPaymentOrder.attachmentpath}" id="afile"  style="color: #1E9FFF;" title="点击下载附件">查看</a>--%>
                	<a href="${basePath}/order/download?id=${guPaymentOrder.orderno}" id="afile"  style="color: #1E9FFF;" title="点击下载附件">查看</a>
                </td>
            </tr>
        </table>
        <table class="layui-table">
            <thead>
            <tr>
                <th>户主身份证</th>
                <th>户主姓名</th>
                <th>工程进度</th>
                <th>总兑付金额</th>
                <th>已兑付金额</th>
                <%--<th>资金发放日期</th>--%>
                <th>兑付金额</th>
                <c:choose>
                    <c:when test="${sessionScope.guPaymentOrder.status != 0}">
                        <th>本次兑付金额</th>
                    </c:when>
                </c:choose>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${paymentList}" var="parment" varStatus="index">
                <tr>
                    <input type="hidden" value="${parment.orderNo}">
                    <td>${parment.identityId}</td>
                    <td>${parment.householder}</td>
                    <td><code:name codeType="Progress" codeCode="${parment.progress}"/></td>
                    <td>${parment.sunamount}</td>
                    <td>${parment.finishamount}</td>
                    <%--<td><fmt:formatDate value="${parment.paymentDate}" pattern="yyyy-MM-dd"/> </td>--%>
                    <td>${parment.paymentAmount}</td>
                    <c:choose>
                        <c:when test="${sessionScope.guPaymentOrder.status != 0}">
                            <td>${parment.yetcashamount}</td>
                        </c:when>
                    </c:choose>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <fieldset class="layui-elem-field layui-field-title">
		  <legend>审核记录</legend>
		</fieldset>
		<div class="layui-form">
		  <table class="layui-table">
			<thead>
			  <tr>
				<th>序号</th>
				<th>审核人姓名</th>
				<th>审核时间</th>
				<th>审核状态</th>
				<th>审核意见</th>
			  </tr> 
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.auditList }" var="item" varStatus="vs">
				  <tr>
					<td>${vs.count }</td>
					<td>${item.auditCode }</td>
					<td><fmt:formatDate value="${item.auditTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<c:choose>
							<c:when test="${item.auditStatus == '1' }">
								审核通过
							</c:when>
							<c:when test="${item.auditStatus == '2' }">
								审核不通过
							</c:when>
						</c:choose>
					</td>
					<td>${item.auditAdevice }</td>
				  </tr>
			   </c:forEach>
			</tbody>
		  </table>
		</div>
		<div class="layui-form-item layui-form-text">
			<input type="hidden" name="id" value="${sessionScope.guPaymentOrder.orderno }">
			<input type="hidden" name="seriesNo" value="${fn:length(sessionScope.auditList)+1 }">
			<input type="hidden" name="type" value="2">
			<label class="layui-form-label">审核意见内容</label>
			<div class="layui-input-block">
			  <textarea placeholder="请输入内容" name="auditAdevice" class="layui-textarea" maxlength="200"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
			  <input type="radio" name="auditStatus" title="审核通过" value="1" checked="">
			  <input type="radio" name="auditStatus" title="审核不通过" value="2" >
			</div>
		</div>
        <div style="width:100%;text-align:center;">
        	<a class="layui-btn layui-btn-normal" href="javascript:submitFm();">提交</a>
            <a class="layui-btn layui-btn-normal" href="javascript:history.go(-1);">返回</a>
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
<script  type="text/javascript" src="${basePath}/js/jquery.js"></script>
<script>
	function submitFm(){
		fm.submit();
	}
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
    layui.use(['form','layer'], function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer,form = layui.form(); //独立版的layer无需执行这一句

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
                var id = type.substring(1,type.length);
                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'LAY_demo'+type //防止重复弹出
                    ,btn: '关闭'
                    ,title: '改造户详情'
                    ,area: ['1200px', '500px']
                    ,content: $('#show-div2')
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,success:function(layero,index){
                        $.ajax({
                            url:'${basePath}/init/buildingas?id='+ id,
                            type:'get',
                            success:function(data) {
                                var str = "<tr>"
                                str += "<td>"+ data.city +"</td>";
                                str += "<td>"+ data.county +"</td>";
                                str += "<td>"+ data.householder +"</td>";
                                str += "<td>"+ data.identityid +"</td>";
                                str += "<td>" + data.bank+ "</td>";
                                str += "<td>"+ data.account +"</td>";
                                str += "<td>"+ data.type +"</td>";
                                str += "<td>"+ data.grade+"</td>";
                                str += "<td>"+ data.startyear +"</td>";
                                str += "<td>"+ data.finishstatus+"</td>";
                                var tab = document.getElementById("tbody");
                                tab.innerHTML = str;
                                form.render()
                            }
                        })

                    }
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
            $("#afile").hover(
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
