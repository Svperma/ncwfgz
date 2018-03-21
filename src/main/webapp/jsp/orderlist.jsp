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
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>待确认的兑付单</legend>
</fieldset>
<div class="layui-layout-admin" style="height:100%;padding:5px;">
    <form class="layui-form" action="" >
        <table class="layui-table">
            <thead>
            <tr>
                <th>兑付日期</th>
                <th>兑付危房数量</th>
                <th>兑付金额(元)</th>
                <th>资料</th>
                <th>录入人</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="tbody">
                <c:forEach items="${orderList}" var="order" varStatus="index">
                    <tr>
                        <td><fm:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd"/></td>
                        <td>${order.sumquantity}</td>
                        <td>${order.sumamount}</td>
                        <td><a href="${basePath}/order/download?id=${order.orderno}" style="color:#00a6e3;" id="a-path${index.index}">${order.attachmentpath}</a></td>
                        <td>${order.inputcode}</td>
                        <td>
                           <c:choose>
                               <c:when test="${order.auditstatus == 2}">
                                <a href="${basePath}/order/updateorder?orderNo=${order.orderno}" style="color:#00a6e3;"> 未通过 </a></td>
                               </c:when>
                               <c:when test="${order.auditstatus == 1}">
                                <a href="javascript:;" onclick="alert('数据审核中');" style="color:#00a6e3;"> 待审核 </a></td>
                               </c:when>
                            <c:otherwise>
                                <a href="${basePath}/order/updateorder?orderNo=${order.orderno}" style="color:#00a6e3;"> 修改 </a></td>
                            </c:otherwise>
                           </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="width:100%;text-align:center;">
            <a href="${basePath}/jsp/order.jsp" class="layui-btn layui-btn-normal" style="background-color:green;">录入兑付信息</a>
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

    var tbody = document.getElementById("tbody")
    for(var x = 0; x<tbody.rows.length; x++) {
        var ele = document.getElementById("a-path"+x);
        var apath = ele.innerHTML
        var newpath  = '';
        if(apath != null) {
            newpath = apath.substring(apath.lastIndexOf("\\")+1);
        }
        ele.innerHTML = newpath;
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
</body>

</html>