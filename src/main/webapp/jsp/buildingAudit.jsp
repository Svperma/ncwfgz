<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/tlds/ggCodeTld" prefix="code" %>
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
		<script src="${basePath }/js/jquery.js" type="text/javascript"></script>
	</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
	<body>
		<div id="show-div2">
			<form class="layui-form layui-form-pane" id="auditFm" action="${basePath }/init/buildingAudit" method="post" target="BottomInner">
				<input type="hidden" id="id" name="ggBuildingmst.id" value="${sessionScope.buildingmstHis.id }">
				<input type="hidden" id="id" name="businessno" value="${sessionScope.buildingmstHis.businessno }">
		        <input type="hidden" id="village" name="village" value="${sessionScope.buildingmstHis.village }">
		        <input type="hidden" id="address" name="address" value="${sessionScope.buildingmstHis.address }">
		        <input type="hidden" id="finishstatus" name="finishstatus" value="${sessionScope.buildingmstHis.finishstatus }">
		        <input type="hidden" id="inputcode" name="inputcode" value="${sessionScope.buildingmstHis.inputcode}">
		        <input type="hidden" id="inputtime" name="inputtime" value='<fmt:formatDate value="${sessionScope.buildingmstHis.inputtime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
		        <input type="hidden" id="" name="finishamount" value="${sessionScope.buildingmstHis.finishamount }">
		        <input type="hidden" id="" name="progress" value="${sessionScope.buildingmstHis.progress }">
		         <input type="hidden" id="" name="updatecode" value="${sessionScope.ggBuildingmst.updatecode }">
		          <input type="hidden" id="" name="updatetime" value='<fmt:formatDate value="${sessionScope.ggBuildingmst.updatetime }" pattern="yyyy-MM-dd HH:mm:ss"/>'>
		          <input type="hidden" id="" name="confirmcode" value="${sessionScope.ggBuildingmst.confirmcode }">
		          <input type="hidden" id="" name="confirmtime" value='<fmt:formatDate value="${sessionScope.ggBuildingmst.confirmtime }" pattern="yyyy-MM-dd HH:mm:ss"/>'>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">户主姓名</label>
					<div class="layui-input-inline">
					  <input type="text" name="householder" lay-verify="required" placeholder="请输入户主姓名" value="${sessionScope.buildingmstHis.householder }" autocomplete="off" class="layui-input" readonly>
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-inline">
					  <input type="text" name="identityid" lay-verify="required" placeholder="请输入身份证号" value="${sessionScope.buildingmstHis.identityid }" autocomplete="off" class="layui-input" readonly>
					</div>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">人口数</label>
					<div class="layui-input-inline">
					  <input type="text" name="peoplenumber" lay-verify="required" placeholder="请输入人口数" value="${sessionScope.buildingmstHis.peoplenumber }" autocomplete="off" class="layui-input" readonly>
					</div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
				  <select name="bank" lay-filter="aihao">
					<code:options codeType="bankType" selected="${sessionScope.buildingmstHis.bank }"/>
				  </select>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">账号</label>
					<div class="layui-input-inline">
						<c:if test="${sessionScope.buildingmstHis.account == ''}">
							<input type="text" name="account" lay-verify="required" value="无" autocomplete="off" class="layui-input">
						</c:if>
						<c:if test="${sessionScope.buildingmstHis.account != ''}">
					  		<input type="text" name="account" lay-verify="required" value="${sessionScope.buildingmstHis.account }" autocomplete="off" class="layui-input">
						</c:if>
					</div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
				  <select name="ggBuildingmst.type" lay-filter="aihao">
					<code:options codeType="povertyType" selected="${sessionScope.buildingmstHis.type }"/>
				  </select>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
				  <select name="grade" lay-filter="aihao">
					<code:options codeType="grade" selected="${sessionScope.buildingmstHis.grade }"/>
				  </select>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
				  <select name="startyear" lay-filter="aihao">
					<code:options codeType="startTime" selected="${sessionScope.buildingmstHis.startyear }"/>
				  </select>
				</div>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">补助金额</label>
					<div class="layui-input-inline">
					  <input type="text" name="sunamount" lay-verify="required" value="${sessionScope.buildingmstHis.sunamount }" autocomplete="off" class="layui-input" readonly>
					</div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="city" lay-verify="">
					  <code:options codeType="City" selected="${sessionScope.buildingmstHis.city }"/>
					</select>  
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<select name="county" lay-verify="">
					  <code:options codeType="County" remark="${sessionScope.buildingmstHis.city }" selected="${sessionScope.buildingmstHis.county }"/>
					</select>  
				</div>
					<%--<textarea role="30" cols="5" name="discirption">${sessionScope.buildingmstHis.discirption}</textarea>--%>
				<!-- <div class="layui-form-item layui-inline">
					<label class="layui-form-label">文件</label>
					<div class="layui-input-inline"> -->
				<c:if test="${sessionScope.buildingmstHis.filePath != '' }">
						<%--<a name="filePath" href="${sessionScope.buildingmstHis.filePath}" id="filepath">点击下载文件</a>--%>
						<a name="filePath" href="${basePath}/init/download?id=${sessionScope.buildingmstHis.businessno}" id="filepath">点击下载文件</a>
					<input type="hidden" name="filePath" value="${sessionScope.buildingmstHis.filePath}">
				</c:if>
				<!-- 	</div>
				</div> -->

				<br>
				<div class="layui-form-item layui-inline">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-inline">
						<textarea name="discription" id="discription" cols="100" rows="3" style="border:#8B8986 1px solid" readonly>${sessionScope.buildingmstHis.discription}</textarea>
					</div>
				</div>

				<fieldset class="layui-elem-field layui-field-title">
				  <legend>审核记录</legend>
				</fieldset>
				<div class="layui-form">
				  <table class="layui-table">
					<thead>
					  <tr>
						<th>序号</th>
						<th>审核人姓名</th>
						<th>审核时间</th>
						<th>审核状态</th>
						<th>审核意见</th>
					  </tr> 
					</thead>
					<tbody>
						<c:forEach items="${sessionScope.auditList }" var="item" varStatus="vs">
						  <tr>
							<td>${vs.count }</td>
							<td>${item.auditCode }</td>
							<td><fmt:formatDate value="${item.auditTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${item.auditStatus == '1' }">
										审核通过
									</c:when>
									<c:when test="${item.auditStatus == '2' }">
										审核不通过
									</c:when>
								</c:choose>
							</td>
							<td>${item.auditAdevice }</td>
						  </tr>
					   </c:forEach>
					</tbody>
				  </table>
				</div>
				<div class="layui-form-item layui-form-text">
					<input type="hidden" name="id" value="${sessionScope.buildingmstHis.businessno }">
					<input type="hidden" name="seriesNo" value="${fn:length(sessionScope.auditList)+1 }">
					<input type="hidden" name="type" value="1">
					<label class="layui-form-label">审核意见内容</label>
					<div class="layui-input-block">
					  <textarea placeholder="请输入内容" name="auditAdevice" class="layui-textarea" maxlength="200"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
					  <input type="radio" name="auditStatus" title="审核通过" value="1" checked="">
					  <input type="radio" name="auditStatus" title="审核不通过" value="2" >
					</div>
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
			offset: function(othis){
			  var type = othis.data('type')
			  ,text = othis.text();
			  
			  layer.open({
				type: 2
				,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
				
				,btn: ['提交','取消']
				,title: '改造户详情'
				,area: ['1200px', '500px']
				,content: "${basePath}/login.jsp"//$('#show-div2')
				,btnAlign: 'c' //按钮居中
				,shade: 0 //不显示遮罩
				,yes: function(){
				  layer.closeAll();
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
		<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  var start = {
    min: laydate.now()
    ,max: '2099-06-16 23:59:59'
    ,istoday: false
    ,choose: function(datas){
      end.min = datas; //开始日选好后，重置结束日的最小日期
      end.start = datas //将结束日的初始值设定为开始日
    }
  };
  
  var end = {
    min: laydate.now()
    ,max: '2099-06-16 23:59:59'
    ,istoday: false
    ,choose: function(datas){
      start.max = datas; //结束日选好后，重置开始日的最大日期
    }
  };
  
  document.getElementById('LAY_demorange_s').onclick = function(){
    start.elem = this;
    laydate(start);
  }
  document.getElementById('LAY_demorange_e').onclick = function(){
    end.elem = this
    laydate(end);
  }
  
});


</script>
	</body>

</html>