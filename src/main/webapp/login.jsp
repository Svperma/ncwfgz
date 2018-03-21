<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="${basePath}/Wopop_files/style_log.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/Wopop_files/style.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/Wopop_files/userpanel.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/Wopop_files/jquery.ui.all.css"/>
<script type="text/javascript" src="${basePath}/js/jquery.js"></script>
</head>

<body class="login" mycollectionplug="bind" onkeydown="enter()">
<div class="login_logo" style="margin-top:15em;margin-bottom: 0;">
    <%--<img src="${basePath}/images/logo.png">--%>
</div>
<div class="login_m" style="margin-top: 2em;">

<div class="login_boder">

<div class="login_padding" id="login_model">

  <h2>账号</h2>
  <label>
    <input type="text" id="userCode" name="userCode" class="txt_input txt_input2" onfocus="if (value =='Your name'){value =''}" onblur="if (value ==''){value='Your name'}" value="Your name">
  </label>
  <h2>密码</h2>
  <label>
    <input type="password" name="password" id="userpwd" class="txt_input" onfocus="if (value =='******'){value =''}" onblur="if (value ==''){value='******'}" value="******">
  </label>




  <%--<p class="forgot"><a id="iforget" href="javascript:void(0);">Forgot your password?</a></p>--%>
  <div class="rem_sub">
  <div class="rem_sub_l">
  <input type="checkbox" name="checkbox" id="save_me">
   <label for="checkbox">Remember me</label>
   </div>
    <label>
      <input type="button" onclick="login()" class="sub_button" name="button" id="button" value="登录" style="opacity: 0.7;">
    </label>
  </div>
</div>



<div id="forget_model" class="login_padding" style="display:none">
<br>

   <h1>Forgot password</h1>
   <br>
   <div class="forget_model_h2">(Please enter your registered email below and the system will automatically reset users’ password and send it to user’s registered email address.)</div>
    <label>
    <input type="text" id="usrmail" class="txt_input txt_input2">
   </label>

 
  <div class="rem_sub">
  <div class="rem_sub_l">
   </div>
    <label>
     <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now" style="opacity: 0.7;">
     　　　
     <input type="submit" class="sub_button" name="button" id="denglou" value="Return" style="opacity: 0.7;">　　
    
    </label>
  </div>
</div>

    <div style="clear: both;"></div>

    <div style="width: 100%;text-align: left;margin:1.25em 2.25em;">
        <a href="${basePath}/loginController/download">操作手册</a>
    </div>





<!--login_padding  Sign up end-->
</div><!--login_boder end-->
</div><!--login_m end-->
 <br> <br>




</body>
<script>
	function enter(){
		if(event.keyCode == 13 || event.keyCode == 108){
			event.keyCode = 9;
	 		event.returnValue = false;
			document.getElementById("button").click();
		}
	}
	function login(){
		var userCode = $("#userCode").val();
		var password = $("#userpwd").val();
		if(userCode == null || userCode == ""){
			alert("用户名不能为空");
			return;
		}
		if(password == null || password == ""){
			alert("密码不能为空");
			return;
		}
		$.ajax({
			type:"post",
			url:"${basePath}/loginController/login",
			data:JSON.stringify({
				"userCode":userCode,
				"password":password
			}),
			dataType:"json",
			contentType:"application/json",
			success:function(data){
				var str = data.str;
				if(str == "succ"){
					window.location.href = "${basePath}/index.jsp";
				}else if(str == "userCodeError"){
					alert("用户名或密码不正确");
					return;
				}else if(str == "pwdError"){
					alert("用户名或密码不正确");
					return;
				}else if(str == "admin"){
					window.open("${basePath}/adminManage/dsManageMain.jsp","_parent");
				}
			},
			error:function(){
				alert("登录异常");
			}
		});
	}
</script>
</html>