<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<style>
			li{
				    display: inline-block;
				    vertical-align: middle;
				    width: 127px;
				    line-height: 25px;
				    padding: 20px 0;
				    margin-right: -1px;
				    margin-bottom: -1px;
				    border: 1px solid #e2e2e2;
				    font-size: 14px;
				    text-align: center;
				    color: #666;
				    transition: all .3s;
				    -webkit-transition: all .3s;
			}
		</style>
	</head>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------------------------------>
	<body onload="">
	<div style="width:90%; margin-left:5%;">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
		  <legend>修改菜单</legend>
		</fieldset>
				<form class="layui-form" name="fm" action="" method="post" enctype="multipart/form-data">
				
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">菜单名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="menuName" value="${ggMenu.menuName }" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">菜单代码</label>
				      <div class="layui-input-inline">
				        <input type="text" name="menuCode" id="countya" value="${ggMenu.menuCode }" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">菜单图标</label>
				      <div class="layui-input-inline">
				        <input type="text" id="iconInput" data-type="t" data-method="iconSelect" name="icon" value="${ggMenu.icon }" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">菜单级别</label>
				      <div class="layui-input-inline">
						<select name="menuLevel" lay-filter="menuLevel">
						<c:if test="${ggMenu.menuLevel == '1' }">
							<option value="1" selected="selected">一级</option>
						  	<option value="2">二级</option>
						</c:if>
						<c:if test="${ggMenu.menuLevel == '2' }">
							<option value="1">一级</option>
						  	<option value="2"  selected="selected">二级</option>
						</c:if>
						</select> 
						</div> 
					</div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">操作地址</label>
				      <div class="layui-input-inline">
				        <input type="text" name="actionUrl" value="${ggMenu.actionUrl }" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">上级菜单</label>
				      <div class="layui-input-inline">
						<select name="upperCode" id="upperCode" lay-filter="">
						  <option value=" ">无</option>
						  <c:forEach items="${sessionScope.upperMenu }" var="menu">
						  	<option value="${menu.menuCode }" selected>${menu.menuName }</option>
						  </c:forEach>
						</select>  
						</div>
					</div>
				</div>
				<div class="layui-form-item  layui-form-select"></div>
				<div class="layui-form-item layui-inline layui-form-select">
					<div class="layui-inline">
				      <label class="layui-form-label">显示序号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="displayNo" value="${ggMenu.displayNo }" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				    </div>
				</div>
	<div id="iconDiv" style="display:none;">
		<ul class="site-doc-icon">
      <li onclick="getIcon(this)">
        <i class="layui-icon"> </i>
        <div class="name">播放</div>
        <div class="code">&amp;#xe652;</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">播放暂停</div>
        <div class="code">&amp;#xe651;</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">音乐</div>
        <div class="code">&amp;#xe6fc;</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">视频</div>
        <div class="code">&amp;#xe6ed;</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">语音</div>
        <div class="code">&amp;#xe688;</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">喇叭</div>
        <div class="code">&amp;#xe645;</div>
      </li>
    
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">对话</div>
        <div class="code">&amp;#xe611;</div>
        <div class="fontclass">.duihua</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon" ></i>
      <div class="name">设置</div>
      <div class="code">&amp;#xe614;</div>
      <div class="fontclass">.shezhi</div>
      </li>
      
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">隐身-im</div>
      <div class="code">&amp;#xe60f;</div>
      <div class="fontclass">.yinshenim</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">搜索</div>
      <div class="code">&amp;#xe615;</div>
      <div class="fontclass">.search</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">分享</div>
      <div class="code">&amp;#xe641;</div>
      <div class="fontclass">.fenxiang1</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">ဂ</i>
        <div class="name">刷新</div>
        <div class="code">&amp;#x1002;</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop"></i>
        <div class="name">loading</div>
        <div class="code">&amp;#xe63d;</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop"></i>
        <div class="name">loading</div>
        <div class="code">&amp;#xe63e;</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">设置</div>
      <div class="code">&amp;#xe620;</div>
      <div class="fontclass">.shezhi1</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">引擎</div>
      <div class="code">&amp;#xe628;</div>
      <div class="fontclass">.yinqing</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon">ဆ</i>
      <div class="name">阅卷错号</div>
      <div class="code">&amp;#x1006;</div>
      <div class="fontclass">.yuejuancuohao</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon">ဇ</i>
      <div class="name">错-</div>
      <div class="code">&amp;#x1007;</div>
      <div class="fontclass">.cuo</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">报表</div>
      <div class="code">&amp;#xe629;</div>
      <div class="fontclass">.baobiao</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">star</div>
      <div class="code">&amp;#xe600;</div>
      <div class="fontclass">.star</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">圆点</div>
      <div class="code">&amp;#xe617;</div>
      <div class="fontclass">.yuandian</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">客服</div>
      <div class="code">&amp;#xe606;</div>
      <div class="fontclass">.kefu</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">发布</div>
      <div class="code">&amp;#xe609;</div>
      <div class="fontclass">.logo</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">21cake_list</div>
      <div class="code">&amp;#xe60a;</div>
      <div class="fontclass">.list</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">图表</div>
      <div class="code">&amp;#xe62c;</div>
      <div class="fontclass">.tubiao</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon">စ</i>
      <div class="name">正确</div>
      <div class="code">&amp;#x1005;</div>
      <div class="fontclass">.right</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">换肤2</div>
      <div class="code">&amp;#xe61b;</div>
      <div class="fontclass">.huanfu2</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">在线</div>
      <div class="code">&amp;#xe610;</div>
      <div class="fontclass">.On-line</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">右右</div>
      <div class="code">&amp;#xe602;</div>
      <div class="fontclass">.youyou</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">左左</div>
      <div class="code">&amp;#xe603;</div>
      <div class="fontclass">.zuozuo</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">表格</div>
        <div class="code">&amp;#xe62d;</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">icon_树</div>
      <div class="code">&amp;#xe62e;</div>
      <div class="fontclass">.icon5</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">上传</div>
      <div class="code">&amp;#xe62f;</div>
      <div class="fontclass">.iconfont17</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">添加</div>
      <div class="code">&amp;#xe61f;</div>
      <div class="fontclass">.tianjia</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">下载</div>
      <div class="code">&amp;#xe601;</div>
      <div class="fontclass">.xiazai</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">选择模版48</div>
      <div class="code">&amp;#xe630;</div>
      <div class="fontclass">.xuanzemoban48</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">工具</div>
      <div class="code">&amp;#xe631;</div>
      <div class="fontclass">.gongju</div>
      </li>
      
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">添加</div>
        <div class="code">&amp;#xe654;</div>
      </li>
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">编辑</div>
        <div class="code">&amp;#xe642;</div>
      </li>
      <li onclick="getIcon(this)">
        <i class="layui-icon"></i>
        <div class="name">删除</div>
        <div class="code">&amp;#xe640;</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">向下</div>
      <div class="code">&amp;#xe61a;</div>
      <div class="fontclass">.xiangxia</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">文件</div>
      <div class="code">&amp;#xe621;</div>
      <div class="fontclass">.wenjian</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">布局</div>
      <div class="code">&amp;#xe632;</div>
      <div class="fontclass">.layouts</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">对勾</div>
      <div class="code">&amp;#xe618;</div>
      <div class="fontclass">.duigou</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">添加</div>
      <div class="code">&amp;#xe608;</div>
      <div class="fontclass">.tianjia1</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">么么直播－翻页</div>
      <div class="code">&amp;#xe633;</div>
      <div class="fontclass">.yaoyaozhibofanye</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">404</div>
      <div class="code">&amp;#xe61c;</div>
      <div class="fontclass">.404</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">轮播组图</div>
      <div class="code">&amp;#xe634;</div>
      <div class="fontclass">.lunbozutu</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">help</div>
      <div class="code">&amp;#xe607;</div>
      <div class="fontclass">.help</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">代码1</div>
      <div class="code">&amp;#xe635;</div>
      <div class="fontclass">.daima1</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">进水</div>
      <div class="code">&amp;#xe636;</div>
      <div class="fontclass">.jinshui</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">关于</div>
      <div class="code">&amp;#xe60b;</div>
      <div class="fontclass">.guanyu</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">向上</div>
      <div class="code">&amp;#xe619;</div>
      <div class="fontclass">.xiangshang</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">日期</div>
      <div class="code">&amp;#xe637;</div>
      <div class="fontclass">.riqi</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">文件</div>
      <div class="code">&amp;#xe61d;</div>
      <div class="fontclass">.wenjian1</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">top</div>
      <div class="code">&amp;#xe604;</div>
      <div class="fontclass">.top</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">好友请求</div>
      <div class="code">&amp;#xe612;</div>
      <div class="fontclass">.haoyouqingqiu</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">对</div>
      <div class="code">&amp;#xe605;</div>
      <div class="fontclass">.weibiaoti1</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">窗口</div>
      <div class="code">&amp;#xe638;</div>
      <div class="fontclass">.chuangkou</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">表情</div>
      <div class="code">&amp;#xe60c;</div>
      <div class="fontclass">.comiisbiaoqing</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">正确</div>
      <div class="code">&amp;#xe616;</div>
      <div class="fontclass">.zhengque</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">我的好友</div>
      <div class="code">&amp;#xe613;</div>
      <div class="fontclass">.iconfontwodehaoyou</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">文件下载</div>
      <div class="code">&amp;#xe61e;</div>
      <div class="fontclass">.wenjianxiazai</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">图片</div>
      <div class="code">&amp;#xe60d;</div>
      <div class="fontclass">.tupian</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">链接</div>
      <div class="code">&amp;#xe64c;</div>
      <div class="fontclass">.lianjie</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">记录</div>
      <div class="code">&amp;#xe60e;</div>
      <div class="fontclass">.jilu</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">文件夹</div>
      <div class="code">&amp;#xe622;</div>
      <div class="fontclass">.liucheng</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">font-strikethrough</div>
      <div class="code">&amp;#xe64f;</div>
      <div class="fontclass">.fontstrikethrough</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">unlink</div>
      <div class="code">&amp;#xe64d;</div>
      <div class="fontclass">.unlink</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">编辑_文字</div>
      <div class="code">&amp;#xe639;</div>
      <div class="fontclass">.bianjiwenzi</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">三角</div>
      <div class="code">&amp;#xe623;</div>
      <div class="fontclass">.sanjiao</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">单选框-候选</div>
      <div class="code">&amp;#xe63f;</div>
      <div class="fontclass">.danxuankuanghouxuan</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">单选框-选中</div>
      <div class="code">&amp;#xe643;</div>
      <div class="fontclass">.danxuankuangxuanzhong</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">居中对齐</div>
      <div class="code">&amp;#xe647;</div>
      <div class="fontclass">.juzhongduiqi</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">右对齐</div>
      <div class="code">&amp;#xe648;</div>
      <div class="fontclass">.youduiqi</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">左对齐</div>
      <div class="code">&amp;#xe649;</div>
      <div class="fontclass">.zuoduiqi</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">勾选框（未打勾）</div>
      <div class="code">&amp;#xe626;</div>
      <div class="fontclass">.gongsisvgtubiaozongji22</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">勾选框（已打勾）</div>
      <div class="code">&amp;#xe627;</div>
      <div class="fontclass">.gongsisvgtubiaozongji23</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">加粗</div>
      <div class="code">&amp;#xe62b;</div>
      <div class="fontclass">.jiacu</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">聊天 对话 IM 沟通</div>
      <div class="code">&amp;#xe63a;</div>
      <div class="fontclass">.liaotianduihuaimgoutong</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">文件夹_反</div>
      <div class="code">&amp;#xe624;</div>
      <div class="fontclass">.wenjianjiafan</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">手机</div>
      <div class="code">&amp;#xe63b;</div>
      <div class="fontclass">.shouji</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">表情</div>
      <div class="code">&amp;#xe650;</div>
      <div class="fontclass">.biaoqing</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">html</div>
      <div class="code">&amp;#xe64b;</div>
      <div class="fontclass">.html</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">表单</div>
      <div class="code">&amp;#xe63c;</div>
      <div class="fontclass">.biaodan</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">tab</div>
      <div class="code">&amp;#xe62a;</div>
      <div class="fontclass">.25</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">emw_代码</div>
      <div class="code">&amp;#xe64e;</div>
      <div class="fontclass">.emwdaima</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">字体-下划线</div>
      <div class="code">&amp;#xe646;</div>
      <div class="fontclass">.zitixiahuaxian</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">三角</div>
      <div class="code">&amp;#xe625;</div>
      <div class="fontclass">.sanjiao1</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">图片</div>
      <div class="code">&amp;#xe64a;</div>
      <div class="fontclass">.tupian-copy-copy</div>
      </li>
      <li onclick="getIcon(this)">
      <i class="layui-icon"></i>
      <div class="name">斜体</div>
      <div class="code">&amp;#xe644;</div>
      <div class="fontclass">.xieti</div>
      </li>
    </ul>
	</div>
	<div style="width:90%; margin-left:5%;">
		
		<div class="site-demo-button" style="margin-top: 20px;">
		   <button class="layui-btn site-demo-layedit lay-submit" onclick="submitFm()" data-type="content">提交</button>
		  <!--<button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
		  <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button> 
		  <a href="javascript:submitFm();" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe608;</i>提交</a>-->
		  <button class="layui-btn site-demo-layedit" onclick="history.go(-1);">返回</button>
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
			var $j;
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form(),
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate
					,$ = layui.jquery;
					$j = $;
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
					},
					required : function(value,item){
						if(value == null || value == ""){
							return '必要数据，不能为空';
						}
					}
				});

				//编辑器外部操作
				  var active = {
				    iconSelect : function(othis){
				    	 var type = othis.data('type')
     					 ,text = othis.text();
				    	 layer.open({
					        type: 1
					        ,title:'图标'
					        //,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
					        ,id: 'iconDiv'+type //防止重复弹出
					        ,content: $("#iconDiv")
					        ,btn: '关闭'
					        ,btnAlign: 'c' //按钮居中
					        ,area: ['980px', '500px']
					        ,btnAlign: 'c' //按钮居中
					        ,shade: 0 //不显示遮罩
					        ,yes: function(){
					          layer.closeAll();
					        }
					      });
				    }
				  };
				  
				  $('#iconInput').on('click', function(){
				    var othis = $(this), method = othis.data('method');
				    active[method] ? active[method].call(this, othis) : '';
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
				form.on('select(menuLevel)',function(data){
					var upperCode = document.getElementById("upperCode");
					upperCode.options.length = 1;
					layui.form().render();
					if(data.value == "2"){
						$.ajax({
							type : "get",
							url : "/adminManage/listUpperMenus",
							contentType: "application/json;chartset=utf-8",
							data : {
								
							},
							//dataType : "json",
							success : function(data) {
								for(var i=0;i<data.length;i++){
									var item = data[i];
									var option = document.createElement("option");
									option.value = item.menuCode;
									option.text = item.menuName;
									upperCode.appendChild(option);
								}
								layui.form().render();
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								/* alert(XMLHttpRequest.status);
								alert(XMLHttpRequest.responseText);
								alert(textStatus + ":" + errorThrown);  */
								alert("查询有误...")
							}
						});
					}
					
				});	
				
			});
			
			function getIcon(o){
				var icon = $j(o).children(".code").text();
				document.getElementById("iconInput").value = icon;
			}
			
			function submitFm(){
				fm.action = "${basePath }/adminManage/updateMenu";
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
				var county = document.getElementById("countya").value;
				if(county == ""){
					document.getElementById("countya").focus();
					alert("请输入菜单代码");
					return;
				}
				$.ajax({
					type : "get",
					url : "/adminManage/checkMenuCode",
					contentType: "application/json;chartset=utf-8",
					data : {
						"menuCode":county
					},
					//dataType : "json",
					success : function(data) {
						if(data == "Y"){
							document.getElementById("countya").focus();
							alert("菜单代码已存在");
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						/* alert(XMLHttpRequest.status);
						alert(XMLHttpRequest.responseText);
						alert(textStatus + ":" + errorThrown);  */
						alert("查询有误...")
					}
				});

			}
		</script>
	
	</body>

</html>