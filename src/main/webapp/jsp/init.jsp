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

    <link rel="stylesheet" href="${basePath}/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${basePath}/plugins/font-awesome/css/font-awesome.min.css">
    <style>
        .layui-table td, .layui-table th {
            text-align: center;
        }

        hr {
            margin: 2em 0;
        }
    </style>
</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<body>
<div class="layui-layout-admin" style="height:100%;padding:5px;">
    <form class="layui-form" action="">
        <table class="layui-table">
            <thead>
            <tr style="background:#D7F3FD">
                <th rowspan="2">改造户总数</th>
                <th colspan="2">一级危房</th>
                <th colspan="2">二级危房</th>
                <th colspan="2">三级危房</th>
            </tr>
            <tr style="background:#D7F3FD">
                <th>数量</th>
                <th>占比</th>
                <th >数量</th>
                <th >占比</th>
                <th>数量</th>
                <th>占比</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${data.allCount}</td>
                <td>${data.oneCount}</td>
                <td >${data.oneCountProportion}%</td>
                <td>${data.twoCount}</td>
                <td>${data.towCountProportion}%</td>
                <td>${data.threeCount}</td>
                <td>${data.threeCountProportion}%</td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="layui-table">
            <thead>
            <tr>
                <th rowspan="2">应兑付金额</th>
                <th colspan="2">一级危房</th>
                <th colspan="4">二级危房</th>
                <th colspan="2">三级危房</th>
            </tr>
            <tr>
                <th>数量</th>
                <th colspan="2">占比</th>
                <th colspan="2">数量</th>
                <th>占比</th>
                <th>数量</th>
                <th>占比</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${data.allAmount}</td>
                <td>${data.oneAmount}</td>
                <td colspan="2">${data.completeOneCount}%</td>
                <td colspan="2">${data.towAmount}</td>
                <td>${data.completeTowCount}%</td>
                <td>${data.threeAmount}</td>
                <td>${data.completeThreeCount}%</td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="layui-table">
            <thead>
            <tr style="background:#D7F3FD">
                <th rowspan="2">改造完成总数</th>
                <th rowspan="2">完成比</th>
                <th colspan="3">一级危房</th>
                <th colspan="3">二级危房</th>
                <th colspan="3">三级危房</th>
            </tr>
            <tr style="background:#D7F3FD">
                <th>数量</th>
                <th>占比</th>
                <th>完成比</th>
                <th>数量</th>
                <th>占比</th>
                <th>完成比</th>
                <th>数量</th>
                <th>占比</th>
                <th>完成比</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${data.allOverCount}</td>
                <td>${data.allOverProportion}%</td>
                <td>${data.oneOverCount}</td>
                <td>${data.oneOverProportion}%</td>
                <td>${data.oneProportion}%</td>
                <td>${data.towOverCount}</td>
                <td>${data.towProportion}%</td>
                <td>${data.towOverProportion}%</td>
                <td>${data.threeOverCount}</td>
                <td>${data.threeOverProportion}%</td>
                <td>${data.threeProportion}%</td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="layui-table">
            <thead>
            <tr>
                <th rowspan="2">已兑付金额</th>
                <th rowspan="2">完成比</th>
                <th colspan="3">一级危房</th>
                <th colspan="3">二级危房</th>
                <th colspan="3">三级危房</th>
            </tr>
            <tr>
                <th>数量</th>
                <th>占比</th>
                <th>完成比</th>
                <th>数量</th>
                <th>占比</th>
                <th>完成比</th>
                <th>数量</th>
                <th>占比</th>
                <th>完成比</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${data.allOverAmount}</td>
                <td>${data.completeAmount}%</td>
                <td>${data.oneOverAmount}</td>
                <td>${data.completeOverOneAmount}%</td>
                <td>${data.completeOverOneAmounts}%</td>
                <td>${data.towOverAmount}</td>
                <td>${data.completeOverTowAmount}%</td>
                <td>${data.completeOverTowAmounts}%</td>
                <td>${data.threeOverAmount}</td>
                <td>${data.completeOverThreeAmount}%</td>
                <td>${data.completeOverThreeAmounts}%</td>
            </tr>
            </tbody>
        </table>
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
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>
<script>
    layui.use(['layer', 'laypage', 'element'], function () {
        var layer = layui.layer
            , laypage = layui.laypage
            , element = layui.element();


        //监听Tab切换
        element.on('tab(demo)', function (data) {
            layer.msg('切换了：' + this.innerHTML);
            console.log(data);
        });

        //分页
        laypage({
            cont: 'pageDemo' //分页容器的id
            , pages: 100 //总页数
            , skin: '#5FB878' //自定义选中色值
            , skip: true //开启跳页
            , jump: function (obj, first) {
                if (!first) {
                    layer.msg('第' + obj.curr + '页');
                }
            }
        });
    });
</script>
</body>

</html>