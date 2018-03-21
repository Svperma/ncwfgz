<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/tlds/ggCodeTld" prefix="tlds"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
		<div id="div-show" style="display:none;">
			<form class="layui-form layui-form-pane" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">管理员账号</label>
					<div class="layui-input-block">
					  <input type="text" name="title" autocomplete="off" value="${sessionScope.ggUser.userCode }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">原始密码</label>
					<div class="layui-input-inline">
					  <input type="password" id="mpass" name="mpass" placeholder="请输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">请务必填正确</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline">
					  <input type="password" name="newpass" id="newpass" placeholder="请输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">密码格式为"xxxxxxx"</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认新密码</label>
					<div class="layui-input-inline">
					  <input type="password" name="renewpass" id="renewpass" placeholder="请输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">必须与上面填写一致</div>
				</div>
			</form>
		</div>
		<div class="layui-layout-admin" style="height:100%;padding:5px;">
			<form class="layui-form" action="">
				<table class="layui-table">
				  <tbody>
					<tr>
						<th>帐号</th>
						<td>${sessionScope.ggUser.userCode }</td>
					  <th>名称</th>
					  <td>${sessionScope.ggUser.userName }</td>
					</tr>
					<tr>
					  <th>联系人电话</th>
					  <td>${sessionScope.ggUser.telePhone }</td>
					  <th>权限</th>
					  <td>
					  		<c:choose>
								<c:when test="${sessionScope.ggUser.role == 'provinceAuditor' }">省级审核</c:when>
								<c:when test="${sessionScope.ggUser.role == 'cityAuditor' }">市级审核</c:when>
								<c:when test="${sessionScope.ggUser.role == 'countyAuditor' }">县级审核用户</c:when>
								<c:when test="${sessionScope.ggUser.role == 'provinceDealer' }">省级操作员</c:when>
								<c:when test="${sessionScope.ggUser.role == 'cityDealer' }">市级操作员</c:when>
								<c:when test="${sessionScope.ggUser.role == 'countyDealer' }">县级操作员</c:when>
								<c:when test="${sessionScope.ggUser.role == 'ceshi' }">测试</c:when>
								<c:when test="${sessionScope.ggUser.role == 'ds' }">德圣</c:when>
								<c:otherwise>其它</c:otherwise>
							</c:choose>
					</td>
					</tr>
					<tr>
					  <th>联系地址</th>
					  <td colspan="3">
					  		<tlds:name codeType="Province" codeCode="${sessionScope.ggUser.province }" />
					  		<tlds:name codeType="City" codeCode="${sessionScope.ggUser.city }" />
					  		<tlds:name codeType="County" codeCode="${sessionScope.ggUser.county }" />
					  		${sessionScope.ggUser.address }
					  </td>
					</tr>
				  </tbody>
				</table>
				<div style="width:100%;text-align:center;">
					<div class="site-demo-button" style="margin-bottom: 0;display:inline-block;">
						<a data-method="offset" data-type="t" class="layui-btn layui-btn-normal" style="background-color:green;">修改密码</a>
					</div>
					<a class="layui-btn layui-btn-normal" href="javascript:history.back(-1)">返回</a>
				</div>
			</form>
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
        ,id: 'LAY_demo'+type //防止重复弹出
		,area: ['500px', '500px']
        ,content: $('#div-show')
        ,btn: ['确定','取消']
//         ,btn1:function(){btn1.target = "_blank"}
        ,btnAlign: 'c' //按钮居中
        ,shade: 0 //不显示遮罩
        ,yes: function(){
	          var mpass = document.getElementById("mpass").value;//初始密码
	          var newpass = document.getElementById("newpass").value;//新密码
	          var renewpass = document.getElementById("renewpass").value;//确定密码
	          if (mpass == null || mpass == ""){
	          	alert("初始密码不可为空，请输入！");
	          	return false;
	          }if (newpass == null || newpass == ""){
	          	alert("请填写新密码！");
	          	return false;
	          }if (renewpass == null || renewpass == "") {
				alert("请填写确认新密码！");
				return false;
			  }if (newpass != renewpass) {
				alert("两次输入的密码不一致，请重新输入");
				return false;
			  }
              var newTab=window.open('about:blank');
			  $.ajax({
						type : "post",
						url : "/user/ChangePassword",
						data : JSON.stringify({"mpass":mpass,"newpass":newpass}),
						dataType : "json",
						contentType : "application/json;charset=UTF-8",
						success : function(data){
							if (data == "passwordSuccess") {
                                newTab.location.href = "${basePath}/login.jsp";
							}else if (data == "passwordError") {
								alert("初始密码不正确，请重新输入");
								return false;
							}
						},
						error : function (){
							alert("请稍后重试");
						}
						
					});
        }
      });
    }
  };
  
  $('.site-demo-button .layui-btn').on('click', function(){
    var othis = $(this), method = othis.data('method');
    active[method] ? active[method].call(this, othis) : '';
  });
  
});
</script>
	</body>

</html>