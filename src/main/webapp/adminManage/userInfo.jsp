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
		<script type="text/javascript" src="${basePath }/js/jquery.js"></script>
	</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
	<body>
		<div class="layui-layout-admin" style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>修改密码</legend>
			</fieldset>
			<form class="layui-form" name="fm" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width:200px">请输入原密码</label>
					<div class="layui-input-block">
						<input type="password" style="width:200px;" id="oldPwd" name="oldPwd" lay-verify="required" required autocomplete="off" placeholder="请输入原密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width:200px;">请输入新密码</label>
					<div class="layui-input-block">
						<input type="password" style="width:200px;" id="newPwd" name="newPwd" required lay-verify="required" autocomplete="off" placeholder="请输入新密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width:200px;">请重新输入新密码</label>
					<div class="layui-input-block">
						<input type="password" style="width:200px;" id="confirmPwd" name="confirmPwd" required lay-verify="required" autocomplete="off" placeholder="请重新输入新密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label" style="width:200px"></label>
					<a href="javascript:submitFm();" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i>修改</a>
				</div>
			</form>
          
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

			
				//监听提交
				form.on('submit(demo1)', function(data) {
					layer.alert(JSON.stringify(data.field), {
						title: '最终的提交信息'
					})
					return false;
				});
			});
			
		</script>
		<script type="text/javascript">
			function submitFm(){
				var oldPwd = document.getElementById("oldPwd").value;
				if(oldPwd == null || oldPwd == ''){
					alert("请输入原始密码");
					return;
				}
				var newPwd = document.getElementById("newPwd").value;
				if(newPwd == null || newPwd == ''){
					alert("请输入新密码");
					return;
				}
				var confirmPwd = document.getElementById("confirmPwd").value;
				if(confirmPwd == null || confirmPwd == ''){
					alert("请输入确认密码");
					return;
				}
				if(newPwd != confirmPwd){
					alert("两次密码不一致！");
					return;
				}
				
				$.ajax({
					type : "post",
					url : "${basePath }/adminManage/updatePwd",
					data : {
						"newPwd" : newPwd,
						"oldPwd" : oldPwd
					},
					dataType : "json",
					success: function(data){
						if(data == 'success'){
							alert("修改成功，请重新登录");
							window.open("${basePath }/login.jsp","_parent");
						}else if(data == 'pwdError'){
							alert("原始密码错误");
						}
					},
					error: function(){
						alert("修改失败");
					}
				});
			}
			
		</script>
	</body>

</html>