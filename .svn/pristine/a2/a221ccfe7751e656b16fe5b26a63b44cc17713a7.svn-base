<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

	<body>
		<div class="layui-layout-admin" style="height:100%;padding:5px;">
			<form class="layui-form" name="fm" id="fm" action="${basePath }/adminManage/distributeRoleContinue">
				<input type="hidden" name="method" value="${sessionScope.method }"> 
				<table class="layui-table">
				  <thead>
					<tr>
					  <th width="5%">序号</th>
					  <th width="10%">用户代码</th>
					  <th>用户名称</th>
					  <th>角色代码</th>
					  <th>角色名称</th>
					  <th width="20%">操作</th>
					</tr> 
				  </thead>
				  <tbody>
				  	<c:forEach items="${sessionScope.pagination.resultList }" var="role" varStatus="st">
				  		<tr height="20px">
					  		<td>${st.index+1 }</td>
							<td>${role.USERCODE }</td>
							<td>${role.USERNAME }</td>
							<td>${role.ROLECODE }</td>
							<td>${role.ROLENAME }</td>
							<td>
								 <%-- <a href="${basePath }/adminManage/menuUpdate?menuCode=${menu.menuCode}" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i> 修改</a> --%>
						  		 <a href="javascript:del(${role.USERCODE});" class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe615;</i> 删除</a>	
							</td>
						</tr>
				  	</c:forEach>
				  </tbody>
				</table>
				<%@ include file="/common/pagination.jsp" %>
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
			function del(o){
				parent.location.href = "${basePath }/adminManage/distributeRoleDelete?userCode="+o;
			}
		</script>
		
	</body>

</html>