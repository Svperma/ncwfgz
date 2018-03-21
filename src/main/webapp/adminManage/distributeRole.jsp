<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div id="addDiv" style="display: none;">
				<div style="padding:50px;">
				<form class="layui-form" action="${basePath }/adminManage/distributeRoleAdd" name="addForm" id="addForm" method="post">
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="userCode" lay-verify="">
					  <option value=" ">请选择用户</option>
					  <c:forEach items="${sessionScope.unRoledList }" var="user">
					  	<option value="${user.USERCODE }">${user.USERNAME }</option>
					  </c:forEach>
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="roleCode" lay-verify="">
					  <option value=" ">请选择角色</option>
					  <c:forEach items="${sessionScope.roleList }" var="role">
					  	<option value="${role.roleCode }">${role.roleName }</option>
					  </c:forEach>
					</select>  
				</div>
				</form>
				</div>
			</div>
		<div class="layui-layout-admin" style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>请选择</legend>
			</fieldset>
			<form class="layui-form" name="fm" action="">
				<div class="layui-form-item layui-inline layui-form-select">
					<input required lay-verify="required" name="userName" placeholder="请输入用户名称" autocomplete="off" class="layui-input" type="text">
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="roleCode" lay-verify="">
					  <option value=" ">请选择角色</option>
					  <c:forEach items="${sessionScope.roleList }" var="role">
					  	<option value="${role.roleCode }">${role.roleName }</option>
					  </c:forEach>
					</select>  
				</div>
				<div class="layui-form-item layui-inline">
					<a href="javascript:search();" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i> 查询</a>
					<%-- <a href="${basePath }/adminManage/prepareRoleAdd" class="layui-btn" style="margin-left:20px;" target="resultFrame"><i class="layui-icon">&#xe608;</i> 新增</a> --%>
					<button id="addBut" data-method="offset" data-type="auto" class="layui-btn"><i class="layui-icon">&#xe608;</i>新增</button>
				</div>
				
			</form>
			
		</div>
		<div class="layui-layout-admin" style="margin: 15px;height:1000px;">
			<iframe src="${basePath }/adminManage/distributeRoleResult.jsp" height="100%" name="resultFrame" width="100%" frameborder="0" scrolling="auto" marginheight="0"></iframe>
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
			});
			
			function search(){
				fm.action = "${basePath }/adminManage/queryDisRole";
				fm.target = "resultFrame";
				fm.submit();
			}
		</script>
		<script type="text/javascript">
		layui.use('layer', function(){ //独立版的layer无需执行这一句
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
  
  //触发事件
  var active = {
    offset: function(othis){
      var type = othis.data('type');/* 
      var con = document.getElementById("addDiv").innerHTML; */
      layer.open({
        type: 1
        ,title: '增加'
        ,area: ['600px','400px']
        ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
        ,id: 'LAY_demo'+type //防止重复弹出
        ,content: $('#addDiv')
        ,btn: ['确定','取消']
        ,btnAlign: 'c' //按钮居中
        ,shade: 0 //不显示遮罩
        ,btn1: function(){
        	var form = document.getElementById("addForm");
        	form.submit();
          layer.closeAll();
        }
        ,btn2: function(){
        }
      });
    }
  };
  
  $('#addBut').on('click', function(){
    var othis = $(this), method = othis.data('method');
    active[method] ? active[method].call(this, othis) : '';
  });
  
});
		
		</script>
	</body>

</html>