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
	<body onload="">
	<div style="width:90%; margin-left:5%;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
		  <legend>配置补贴比率</legend>
		</fieldset>
				<form class="layui-form" name="fm" action="" method="post">
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="areaCode" id="areaCode" lay-filter="province">
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
					<select name="ggRiskConfig.riskCode" id="riskCode" lay-filter="">
					  <option value="">请选择险种</option>
					  <c:forEach items="${riskList }" var="risk">
					  	<option value="${risk.agriculKindCode }">${risk.agriculKindName }</option>
					  </c:forEach>
					</select>  
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select site-demo-upbar">
					<div class="layui-inline">
				      <label class="layui-form-label">中央补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.centralAllowance" id="central" onblur="calculatePerson()" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline">
					<div class="layui-inline">
				      <label class="layui-form-label">省级补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.provinceAllowance" id="province" onblur="calculatePerson()" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">市级补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.cityAllowance" id="citya" onblur="calculatePerson()" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">区县级补贴</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.countyAllowance" id="countya" onblur="calculatePerson()" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">个人缴纳</label>
				      <div class="layui-input-inline">
				        <input type="text" name="ggRiskConfig.personAllowance" id="person" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="ggRiskConfig.isPolicy" lay-filter="">
					  <option value="1">政策性保险</option>
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

				//编辑器外部操作
				  var active = {
				    content: function(){
				     /*  $("#contentEdit").text(layedit.getContent(editIndex));
				      fm.action = "${basePath }/adminManage/update";
						fm.submit(); */
				    }
				    ,text: function(){
				      alert(layedit.getText(index)); //获取编辑器纯文本内容
				    }
				    ,selection: function(){
				      alert(layedit.getSelection(index));
				    }
				  };
				  
				  $('.site-demo-layedit').on('click', function(){
				    var type = $(this).data('type');
				    active[type] ? active[type].call(this) : '';
				  });
				//监听提交
				/* form.on('submit(demo1)', function(data) {
					layer.alert(JSON.stringify(data.field), {
						title: '最终的提交信息'
					})
					return false;
				}); */
				form.on('select(province)',function(data){
					var obj = document.getElementById("city");
					getAreaSelect(null,data.value,obj);
					
				});
				form.on('select(city)',function(data){
					var obj = document.getElementById("county");
					getAreaSelect(null,data.value,obj);
					
				});	
				
			});
			
			
			
			function submitFm(){
				var areaCode = document.getElementById("areaCode").value;
				if(areaCode == null || areaCode == ""){
					alert("请选择省份");
					return;
				}
				var riskCode = document.getElementById("riskCode").value;
				if(riskCode == null || riskCode == ""){
					alert("请选择险种");
					return;
				}
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
				fm.action = "${basePath }/adminManage/subsidyAdd";
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