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
	<div style="width:90%; margin-left:5%;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
		  <legend>选择新闻类型</legend>
		</fieldset>
				<form class="layui-form" name="fm" action="" method="post">
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="ggNews.isShow" lay-verify="">
					  <option value="">首页</option>
					  <option value="1">是</option>
					  <option value="0">否</option>
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="ggNews.type" lay-verify="">
					  <option value="">选择添加类型</option>
					  <option value="1">上部轮播</option>
					  <option value="9">中部轮播</option>
					  <option value="3">保险信息</option>
					  <option value="4">农业新闻</option>
					  <option value="6">典型案例</option>
					  <option value="5">优惠政策</option>
					  <option value="7">市场信息</option>
					  <option value="8">知识问答</option>
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<input name="ggNews.origin" required lay-verify="required" placeholder="请输入新闻来源" autocomplete="off" class="layui-input" type="text">
				</div>
				
				
				<div class="layui-form-item layui-inline layui-form-select">
					<input name="ggNews.title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" type="text">
				</div>
				<input type="hidden" id="imagePath" name="ggNews.imagePath" value="">
				<div class="site-demo-upload">
				  <img id="LAY_demo_upload" src="">
				  <div class="site-demo-upbar">
				  <label class="layui-form-label">轮播图片</label>
				    <input type="file" name="myFile" class="layui-upload-file" id="test">
				  </div>
				</div>
	</div>
	<div style="width:90%; margin-left:5%;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
		  <legend>添加新闻内容</legend>
		</fieldset>

		<textarea class="layui-textarea" name="ggNews.content" lay-verify="content" id="contentEdit" >  
		 
		</textarea>
		<div class="site-demo-button" style="margin-top: 20px;">
		   <button class="layui-btn site-demo-layedit" data-type="content">提交</button>
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
				      $("#contentEdit").text(layedit.getContent(editIndex));
				      fm.action = "${basePath }/adminManage/add";
						fm.submit();
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
				
			});
			
			layui.use('upload', function(){
			  layui.upload({
			    url: '/upload/executeUpload' //上传接口
			    ,success: function(res){ //上传成功后的回调
			      console.log(res)
			    }
			  });
			  
			  layui.upload({
			    url: '/upload/executeUpload'
			    ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
			    ,method: 'post' //上传接口的http类型
			    ,success: function(res){
			    	document.getElementById("imagePath").value = res.url;
			      LAY_demo_upload.src = res.url;
			    }
			  });
			});
			
		</script>
	
	</body>

</html>