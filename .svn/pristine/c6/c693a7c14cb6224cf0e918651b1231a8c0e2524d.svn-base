<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>表单</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" href="${basePath }/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${basePath }/plugins/font-awesome/css/font-awesome.min.css">
	</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
	<body>
		<div class="layui-layout-admin" style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>请选择</legend>
			</fieldset>
			<form class="layui-form" name="fm" action="">
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="show" lay-verify="">
					  <option value="">首页</option>
					  <option value="1">是</option>
					  <option value="0">否</option>
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="type" lay-verify="">
					  <option value="">选择添加类型</option>
					  <option value="1">上部轮播</option>
					  <option value="9">中部轮播</option>
					  <option value="2">新闻动态</option>
					  <option value="3">保险信息</option>
					  <option value="4">农业新闻</option>
					  <option value="6">典型案例</option>
					  <option value="5">优惠政策</option>
					  <option value="7">市场信息</option>
					  <option value="8">知识问答</option>
					</select>  
				</div>
				
				<div class="layui-form-item layui-inline layui-form-select">
					<input name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" type="text">
				</div>
				<div class="layui-form-item layui-inline">
					<a href="javascript:search();" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i> 查询</a>
					<a href="${basePath }/adminManage/prepareAdd" class="layui-btn" style="margin-left:20px;"><i class="layui-icon">&#xe608;</i> 新增</a>
				</div>
				
			</form>
		</div>
		<div class="layui-layout-admin" style="margin: 15px;height:1000px;">
			<iframe src="${basePath }/adminManage/initAdmin" height="100%" name="resultFrame" width="100%" frameborder="0" scrolling="auto" marginheight="0"></iframe>
		</div>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
		<script type="text/javascript" src="${basePath }/plugins/layui/layui.js"></script>
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
			
			function search(){
				fm.action = "${basePath }/adminManage/search";
				fm.target = "resultFrame";
				fm.submit();
			}
		</script>
	</body>

</html>