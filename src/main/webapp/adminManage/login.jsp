<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>登录</title>
		<link rel="stylesheet" href="${basePath }/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${basePath }/css/login.css" />
		<script type="text/javascript" src="${basePath }/js/jquery.js"></script>
		<script type="text/javascript" src="${basePath }/plugins/layui/layui.js"></script>
	</head>

	<body class="beg-login-bg">
		<div class="beg-login-box">
			<header>
				<h1>后台登录</h1>
			</header>
			<div class="beg-login-main">
				<form action="" name="fm" class="layui-form" method="post"><input name="__RequestVerificationToken" type="hidden" value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    </label>
						<input type="text" name="userName" id="userName" lay-verify="required" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
					</div>
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe642;</i>
                    </label>
						<input type="password" name="password" id="password" lay-verify="required" autocomplete="off" placeholder="这里输入密码" class="layui-input">
					</div>
					<div class="layui-form-item">
						<!-- <div class="beg-pull-left beg-login-remember">
							<label>记住帐号？</label>
							<input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">
						</div> -->
						<div class="beg-pull-right">
							<a class="layui-btn layui-btn-primary" href="javascript:submitFm();" >
	                            <i class="layui-icon">&#xe650;</i> 登录
	                        </a>
						</div>
						<div class="beg-clear"></div>
					</div>
				</form>
			</div>
			<footer>
				<p>德圣业务管理系统</p>
			</footer>
		</div>
		
		<script>
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
					$ = layui.jquery,
					form = layui.form();
				
				form.on('submit(login)',function(data){
					
					
					return false;
				});
			});
			
		</script>
		<script type="text/javascript">
			var $j = jQuery.noConflict();
			function submitFm(){
				var usercode = $j("#userName").val();
				var password = document.getElementById("password").value;
				$j.ajax({
					type:"post",
					url:"${basePath}/adminManage/checkLogin",
					data:{
						"userCode" : usercode,
						"password" : password
					},
					dataType : "json",
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
						alert(XMLHttpRequest.statusText);
						alert(XMLHttpRequest.responseText);
						alert(textStatus);
						alert(errorThrown);
						alert("Error");
					},
					success : function(data) {
						var jdata = data.adminResult;
						if (jdata == "loginNull") {
							alert("账号或密码错误,请重新输入！");
						} else if (jdata == "loginPassFail") {
							alert("账号或密码错误,请重新输入！");
						}else if(jdata == "success"){
							location.href = "${basePath }/adminManage/dsManageMain.jsp";
						}
					}
				});
			}
		</script>
	</body>

</html>