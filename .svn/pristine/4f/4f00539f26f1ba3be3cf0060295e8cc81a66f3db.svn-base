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
	<body onload="">
	<div style="width:90%; margin-left:5%;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
		  <legend>修改补贴比率</legend>
		</fieldset>
				<form class="layui-form" name="fm1" action="" method="post">
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">地区</label>
				      <div class="layui-input-inline">
				        <input type="text"  readonly="readonly" value="${sessionScope.area.areaName }" autocomplete="off" class="layui-input">
				        <input type="hidden" name="ggRiskConfig.areaCode" value="${sessionScope.area.areaCode }">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">险种</label>
				      <div class="layui-input-inline">
				        <input type="text"  readonly="readonly" value="${sessionScope.mst.agriculKindName }" autocomplete="off" class="layui-input">
				        <input type="hidden" name="ggRiskConfig.riskCode" value="${sessionScope.mst.agriculKindCode }">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select site-demo-upbar">
					<div class="layui-inline">
				      <label class="layui-form-label">中央补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.centralAllowance" id="central" onblur="calculatePerson()" value="${sessionScope.ggRisk.centralAllowance }" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline">
					<div class="layui-inline">
				      <label class="layui-form-label">省级补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.provinceAllowance" id="province" onblur="calculatePerson()" value="${sessionScope.ggRisk.provinceAllowance }" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">市级补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.cityAllowance" id="citya" onblur="calculatePerson()" value="${sessionScope.ggRisk.cityAllowance }"autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">区县级补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.countyAllowance" id="countya" onblur="calculatePerson()" value="${sessionScope.ggRisk.countyAllowance }" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">个人缴纳</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.personAllowance" readonly="readonly" id="person" value="${sessionScope.ggRisk.personAllowance }" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="gRiskConfig.isPolicy" lay-filter="">
					  <option value="1" >政策性保险</option>
					  <option value="0">非政策性保险</option>
					</select>  
				</div>
				
	</div>
	<div style="width:90%; margin-left:5%;">
		
		<div class="site-demo-button" style="margin-top: 20px;">
		   <button class="layui-btn site-demo-layedit" onclick="submitFm()" data-type="content">提交</button>
		  <!--<button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
		  <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button> 
		  <a href="javascript:submitFm();" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe608;</i>提交</a>-->
		  <button class="layui-btn site-demo-layedit" onclick="history.go(-1);">返回</button>
		</div>          
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
			function initPage(n,m){
				var showSelect = document.getElementById("show").options;
				for(var i=0;i<showSelect.length;i++){
					var op = showSelect[i];
					if(op.value == n){
						op.selected = "selected";
					}
				}
				var typeSelect = document.getElementById("type").options; 
				for(var i=0;i<typeSelect.length;i++){
					var op = typeSelect[i];
					if(op.value == m){
						op.selected = "selected";
					}
				}
			}
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form(),
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate
					,$ = layui.jquery;
				layedit.set({
				  uploadImage: {
				    url: '/image/imageInText' //接口url
				    ,type: 'post' //默认post
				  }
				});
				//创建一个编辑器
				var editIndex = layedit.build('contentEdit');
				//自定义验证规则
				form.verify({
					title: function(value) {
						if(value.length < 5) {
							return '标题至少得5个字符啊';
						}
					},
					content: function(value) {
						layedit.sync(editIndex);
					}
				});

				
				
			});
			
			
			function submitFm(){
				var central = document.getElementById("central").value;
				var province = document.getElementById("province").value;
				var city = document.getElementById("citya").value;
				var county = document.getElementById("countya").value;
				
				if(central == null || central == ""){
					return;
				}
				 if(province == null || province == ""){
					return;
				}
				if(city == null || city == ""){
					return;
				}
				if(county == null || county == ""){
					return;
				}
				fm1.action = "${basePath }/adminManage/subsidyAdd";
				fm1.submit();
			}
			function calculatePerson(){
				var central = document.getElementById("central").value;
				var province = document.getElementById("province").value;
				var city = document.getElementById("citya").value;
				var county = document.getElementById("countya").value;
				
				if(central == null || central == ""){
					return;
				}
				 if(province == null || province == ""){
					return;
				}
				if(city == null || city == ""){
					return;
				}
				if(county == null || county == ""){
					return;
				}
				var person = (1000 - parseFloat(central)*1000 - parseFloat(province)*1000 - parseFloat(city)*1000 - parseFloat(county)*1000)/1000;
				
				if(person > 1 || person < 0 || isNaN(person)){
					alert("比例配置有误，请重新输入");
					return;
				}
				//document.getElementById("person").readonly = false;
				document.getElementById("person").value = person;

			}
		</script>
	
	</body>

</html>