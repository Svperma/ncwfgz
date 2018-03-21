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
		<div class="layui-layout-admin" style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>请选择</legend>
			</fieldset>
			<form class="layui-form" name="fm" action="">
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="areaCode" lay-filter="province">
					  <option value="">请选择省份</option>
					  <c:forEach items="${areaList }" var="area">
					  	<option value="${area.areaCode }">${area.areaName }</option>
					  </c:forEach>
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="city" id="city" lay-filter="city">
					  <option value="">请选择市</option>
					  
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="county" id="county" lay-filter="county">
					  <option value="">请选择区县</option>
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="riskCode" lay-filter="">
					  <option value="">请选择险种</option>
					  <c:forEach items="${riskList }" var="risk">
					  	<option value="${risk.agriculKindCode }">${risk.agriculKindName }</option>
					  </c:forEach>
					</select>  
				</div>
				<div class="layui-form-item layui-inline">
					<a href="javascript:search();" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i> 查询</a>
					<a href="${basePath }/adminManage/prepareSubsidyAdd" class="layui-btn" style="margin-left:20px;" target="resultFrame"><i class="layui-icon">&#xe608;</i> 新增</a>
				</div>
				
			</form>
		</div>
		<div class="layui-layout-admin" style="margin: 15px;height:1000px;">
			<iframe src="${basePath }/adminManage/searchSubsidy" height="100%" name="resultFrame" width="100%" frameborder="0" scrolling="auto" marginheight="0"></iframe>
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
				form.on('select(province)',function(data){
					var obj = document.getElementById("city");
					getAreaSelect(null,data.value,obj);
					
				});
				form.on('select(city)',function(data){
					var obj = document.getElementById("county");
					getAreaSelect(null,data.value,obj);
					
				});	
			});
			
			function search(){
				fm.action = "${basePath }/adminManage/searchSubsidy";
				fm.target = "resultFrame";
				fm.submit();
			}
function getAreaSelect(province,upperCode,obj){
	if(obj.options.length >1){
		obj.options.length =1;
	}
	var jsonStr = "";
	if(province != null && province != ""){
		jsonStr = "{'remark':'province'}";
	}else{
		if(upperCode == null || upperCode == ""){
			//alert("请选择上级地区");
			return;
		}else{
			jsonStr="upperCode="+upperCode;
		}
	}
	var actionUrl = "getArea";
	$.ajax({
				type : "get",
				url : actionUrl,
				contentType: "application/json;chartset=utf-8",
				data : jsonStr,
				dataType : "json",
				success : function(data) {
					var op;
					for ( var i = 0; i < data.length; i++) {
						op = document.createElement("option");
						op.value = data[i].areaCode;
						op.text = data[i].areaName;
						obj.appendChild(op);
					}
					layui.form().render();
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					/* alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.responseText);
					alert(textStatus + ":" + errorThrown);*/ 
					alert("查询有误...")
				}
			});
}
		</script>
	</body>

</html>