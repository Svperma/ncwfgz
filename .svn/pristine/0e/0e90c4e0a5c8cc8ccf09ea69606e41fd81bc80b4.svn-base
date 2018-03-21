<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>贵州农业保险综合信息服务平台</title>
<meta name="Keywords" content="">
<meta name="description" content="">
<link href="${basePath }/adminManage/css/main.css" rel="stylesheet" type="text/css">
<link href="${basePath }/adminManage/css/index.css" rel="stylesheet" type="text/css">
<script src="${basePath }/adminManage/js/jquery-1.10.2.min.js"></script>
<script src="${basePath }/adminManage/js/jquery.tab.js"></script>
<script src="${basePath }/adminManage/js/jquery.slideBox.min.js" type="text/javascript"></script>
<script>
jQuery(function($){
	$('#demo1').slideBox();
	$('#demo2').slideBox({
		direction : 'top',//left,top#方向
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		startIndex : 1//初始焦点顺序
	});
	$('#demo3').slideBox({
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 10
	});
	$('#demo4').slideBox({
		hideBottomBar : true//隐藏底栏
	});
});
</script>
</head>
<body>
<div class="yc_bg_flash flash-replaced" id="bgFlash" style="background:url(images/bg_sea.jpg) no-repeat center top"> 
  <script type="text/javascript" src="js/jcarousellite_index.js"></script>
  <div class="index_banner" id="banner_tabs">
    <ul>
      <li class="first"><a href="#" target="_blank"></a></li>
      <li class="second"><a href="#" target="_blank"></a></li>
      <!--    <li class="third"><a href="#" target="_blank"></a></li>
    <li class="fourth"><a href="#" target="_blank"></a></li>
    <li class="fifth"><a href="#" target="_blank"></a></li>      
    <li class="sixth"><a href="#"></a></li>-->
    </ul>
    <cite style="display:none;"><span class="cur">1</span><span>2</span><!--<span>3</span><span>4</span><span>5</span><span>6</span>--></cite> </div>
  <script type="text/javascript">
			(function(){
		        if(!Function.prototype.bind){
		            Function.prototype.bind = function(obj){
		                var owner = this,args = Array.prototype.slice.call(arguments),callobj = Array.prototype.shift.call(args);
		                return function(e){e=e||top.window.event||window.event;owner.apply(callobj,args.concat([e]));};
		            };
		        }
		    })();
		    var banner_tabs = function(id){
		        this.ctn = document.getElementById(id);
		        this.adLis = null;
		        this.btns = null;
		        this.animStep = 0.1;//动画速度0.1～0.9
		        this.switchSpeed =6;//自动播放间隔(s)
		        this.defOpacity = 1;
		        this.tmpOpacity = 1;
		        this.crtIndex = 0;
		        this.crtLi = null;
		        this.adLength = 0;
		        this.timerAnim = null;
		        this.timerSwitch = null;
		        this.init();
		    };
		    banner_tabs.prototype = {
		        fnAnim:function(toIndex){
		            if(this.timerAnim){window.clearTimeout(this.timerAnim);}
		            if(this.tmpOpacity <= 0){
		                this.crtLi.style.opacity = this.tmpOpacity = this.defOpacity;
		                this.crtLi.style.filter = 'Alpha(Opacity=' + this.defOpacity*100 + ')';
		                this.crtLi.style.zIndex = 0;
		                this.crtIndex = toIndex;
		                return;
		            }
		            this.crtLi.style.opacity = this.tmpOpacity = this.tmpOpacity - this.animStep;
		            this.crtLi.style.filter = 'Alpha(Opacity=' + this.tmpOpacity*100 + ')';
		            this.timerAnim = window.setTimeout(this.fnAnim.bind(this,toIndex),50);
		        },
		        fnNextIndex:function(){
		            return (this.crtIndex >= this.adLength-1)?0:this.crtIndex+1;
		        },
		        fnSwitch:function(toIndex){
		            if(this.crtIndex==toIndex){return;}
		            this.crtLi = this.adLis[this.crtIndex];
		            for(var i=0;i<this.adLength;i++){
		                this.adLis[i].style.zIndex = 0;
		            }
		            this.crtLi.style.zIndex = 2;
		            this.adLis[toIndex].style.zIndex = 1;
		            for(var i=0;i<this.adLength;i++){
		                this.btns[i].className = '';
		            }
		            this.btns[toIndex].className = 'cur'
		            this.fnAnim(toIndex);
		        },
		        fnAutoPlay:function(){
		            this.fnSwitch(this.fnNextIndex());
		        },
		        fnPlay:function(){
		            this.timerSwitch = window.setInterval(this.fnAutoPlay.bind(this),this.switchSpeed*1000);
		        },
		        fnStopPlay:function(){
		            window.clearTimeout(this.timerSwitch);
		        },
		        init:function(){
		            this.adLis = this.ctn.getElementsByTagName('li');
		            this.btns = this.ctn.getElementsByTagName('cite')[0].getElementsByTagName('span');
		            this.adLength = this.adLis.length;
		            for(var i=0,l=this.btns.length;i<l;i++){
		                with({i:i}){
		                    this.btns[i].index = i;
		                    this.btns[i].onclick = this.fnSwitch.bind(this,i);
		                    this.btns[i].onclick = this.fnSwitch.bind(this,i);
		                }
		            }
		            this.adLis[this.crtIndex].style.zIndex = 2;
		            this.fnPlay();
		            this.ctn.onmouseover = this.fnStopPlay.bind(this);
		            this.ctn.onmouseout = this.fnPlay.bind(this);
		        }
		    };
		    var player1 = new banner_tabs('banner_tabs');
		</script>
  <div class="alt"></div>
</div>
<header class="yc_header" style="position:relative;">
  <div class="yc_topBox"><span style="display:block;width:100%;font-size: 40px;height:100%;line-height:200px;text-align:left;color:#fff;text-shadow: 2px 3px #00a6e3;">贵州农业保险综合信息服务平台 </span></div>
</header>
<div class="yc_container">
  <div class="yc_nav_top boxImg"><img src="${basePath }/adminManage/images/img_nav_top.png" width="1000" height="6"></div>
  <div class="yc_shadow">
    <nav class="yc_nav">
      <div class="yc_nav_menu">
        <div class="yc_menu"><a class="yc_menu_link_first" href="${basePath }/adminManage/index" target="_blank" title="首页"></a></div>
        <%-- <div class="yc_menu"><a class="yc_menu_link" href="about.html"></a>
          <div class="yc_submenu yc_menu1" style="display: none;">
            <div class="triangle"></div>
            <div class="yc_sub_content">
              <div class="yc_subleft fl">
                <ul>
                   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
                </ul>
              </div>
              <div class="yc_subright fl"><a href="##"><img src="${basePath }/adminManage/images/img_sub1.jpg" alt="" width="187" height="149"></a></div>
            </div>
          </div>
        </div> --%>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=4" target="_blank"></a>
          <!-- <div class="yc_submenu yc_menu2">
            <div class="triangle"></div>
            <div class="yc_sub_content">
              <div class="yc_sublist">
               <ul>
                   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
                </ul>
              </div>
            </div>
          </div> -->
        </div>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=3" target="_blank"></a>
          <%-- <div class="yc_submenu yc_menu3">
            <div class="triangle"></div>
            <div class="yc_sub_content">
              <div class="yc_subleft fl">
               <ul>
                   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
                </ul>
              </div>
              <div class="yc_subright fl"><a href="#"><img src="${basePath }/adminManage/images/img_sub2.jpg" alt="" width="187" height="149"></a></div>
            </div>
          </div> --%>
        </div>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=8" target="_blank"></a>
          <!-- <div class="yc_submenu yc_menu4" style="display:none;">
            <div class="triangle"></div>
            <div class="yc_sub_content">
              <div class="yc_subleft4 fl">
                <ul>
                   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
                </ul>
              </div>
              <div class="yc_subright fl"><a href="#"><img src="images/img_sub3.jpg" alt="" width="187" height="149"></a></div>
            </div>
          </div> -->
        </div>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=5" target="_blank"></a>
          <!-- <div class="yc_submenu yc_menu4" style="display:none;">
            <div class="triangle"></div>
            <div class="yc_sub_content">
              <div class="yc_subleft4 fl">
                <ul>
                   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
				   <li><a href="#">11111</a></li>
                   <li><a href="#">11111</a></li>
                </ul>
              </div>
              <div class="yc_subright fl"><a href="#"><img src="images/img_sub3.jpg" alt="" width="187" height="149"></a></div>
            </div>
          </div> -->
        </div>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=7" target="_blank"></a>
        
        </div>
      </div>
      <!--yc_nav_menu-->
     <!--  <form name="f1" action="http://www.baidu.com/baidu">
        <div class="yc_search">
          <input type="text" name="word" class="yc_s_input fl" value="请输入关键字" onfocus="if(this.value==&#39;请输入关键字&#39;)this.value=&#39;&#39;;" onblur="if(this.value==&#39;&#39;)this.value=&#39;请输入关键字&#39;">
          <input class="yc_btn_Asearch fl" type="image" value="搜索"  onfocus="this.blur()" unselectable="on">
          <input name="tn" type="hidden" value="bds">
          <input name="cl" type="hidden" value="3">
          <input name="ct" type="hidden" value="2097152">
          <input name="si" type="hidden" value="www.nddq.gov.cn/">
        </div>
        search
      </form> -->
    </nav>
    <div class="yc_date_weather">
      <div class="yc_date fl">今天是：<span id=localtime></span>&nbsp;&nbsp;贵州农业网欢迎您!</div>
      <div class="yc_weather fl">
        <iframe width="400" scrolling="no" height="25" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&amp;id=10&amp;icon=1&amp;py=ningde&py=beijing&py=guiyang1"></iframe>
      </div>
    </div>
    <div class="yc_icontent">
      <div class="yc_section_news" >
        <div class="leftbar" >
          <div class="focus"> <span class="mark"><img src="images/img_mark.png"></span> 
            <!--头图轮换-->
            <div id="demo3" class="slideBox" >
              <ul class="items">
              	<c:forEach items="${newsList }" var="news">
              		<c:if test="${news.type == '1' }">
              			<li><a href="#" title="${news.title }"><img src="${news.imagePath }" width="320" height="230"></a></li>
              		</c:if>
              	</c:forEach>
              </ul>
            </div>
            <!--头图轮换结束--> 
          </div>
          <div class="tongzhi">
            <div class="title">
              <h3>保险信息</h3>
              <a href="${basePath }/adminManage/newsList?type=3" target="_blank" class="dq_more">更多>></a></div>
            <div class="content">
              <ul class="list">
              	<c:forEach items="${newsList }" var="news">
              		<c:if test="${news.type == '3' }">
              			<li><a target="${basePath }/adminManage/detail?id=${news.seriesNo }" href="#">${news.title }</a></li>
              		</c:if>
              	</c:forEach>
              </ul>
              <ul class="bot">
                <li><a target="_blank" href="#">开发区领导</a></li>
                <li><a target="_blank" href="#">开发区部门</a></li>
              </ul>
            </div>
          </div>
        </div>
		<div class="leftbar" >
        <%--  <div class="tongzhi" style="height:230px;margin-left:30px;overflow:hidden;margin-top:0px;">
            <div class="title">
              <h3>新闻动态</h3>
              <a href="#" class="dq_more">更多>></a></div>
            <div class="content">
              <ul class="list">
                <c:forEach items="${newsList }" var="news">
              		<c:if test="${news.type == '2' }">
              			<li><a target="_blank" href="#">${news.title }</a></li>
              		</c:if>
              	</c:forEach>
              </ul>
              <ul class="bot">
                <li><a target="_blank" href="#">开发区领导</a></li>
                <li><a target="_blank" href="#">开发区部门</a></li>
              </ul>
            </div>
          </div> --%>
          <div class="tongzhi" style="height:480px;margin-left:30px;overflow:hidden;">
            <div class="title">
              <h3>农业新闻</h3>
              <a href="${basePath }/adminManage/newsList?type=4" target="_blank" class="dq_more">更多>></a></div>
            <div class="content">
              <ul class="list">
                <c:forEach items="${newsList }" var="news">
              		<c:if test="${news.type == '4' }">
              			<li><a target="_blank" href="${basePath }/adminManage/detail?id=${news.seriesNo }">${news.title }</a></li>
              		</c:if>
              	</c:forEach>
              </ul>
              <ul class="bot">
                <li><a target="_blank" href="#">开发区领导</a></li>
                <li><a target="_blank" href="#">开发区部门</a></li>
              </ul>
            </div>
          </div>
        </div>
		  <div class="yc_info_gov" style="float:right;">
          <!-- <div class="yc_ig_title"><a href="/zfxxgk.aspx">登录进入&gt;</a></div> -->
          <div class="yc_ig_list" style="height:475px;border:1px solid #aeddff">
            <ul>
              <li><a href="${basePath }/jsp/jianguan/login.jsp" target="_blank" style="border:1px solid #aeddff">管理人员登录</a></li>
              <li><a href="${basePath }/jsp/jianguan/insurelogin.jsp" target="_blank" style="border:1px solid #aeddff">保险公司登录</a></li>
              <li><a href="${basePath }/nybx/" target="_blank" style="border:1px solid #aeddff">投保服务</a></li>
              <li><a href="${basePath }/adminManage/publicSearch.jsp" target="_blank" style="border:1px solid #aeddff;height:50px;line-height: 50px;">公众查询</a></li>
            </ul>
			<ul>
				 
              <!-- <li style="height:30px;"><a href="#" style="cursor: default;background-image:none;line-height:65px;background:#ededed;font-size:15px;border:1px solid #aeddff">微信公众账号（扫一扫）</a></li> -->
            </ul>
			<div style="width:217px;height:190px;border:1px solid #aeddff;margin-top:0px;">
				<img src="${basePath }/adminManage/images/erweima.png" style="width:100%;height:100%"/>
			</div>
			
          </div>
        </div>
        
      </div>
      <!--yc_section_news-->
      <div class="clearboth"></div>
      <div class="dq_ad">
        <div class="jd_body">
          <div id="jdAdSlide" class="jd_ad_slide"> 
          		<c:forEach items="${newsList }" var="news">
	              		<c:if test="${news.type == '9' }">
	              			<img src="${news.imagePath }" class="jd_ad_img">
	              		</c:if>
	              	</c:forEach>
            <div id="jdAdBtn" class="jd_ad_btn"></div>
            <!-- add active --> 
          </div>
        </div>
        <script src="${basePath }/adminManage/js/jquery-powerSwitch.js"></script> 
        <script>
// 大的图片广告
// 根据图片创建id,按钮元素等，实际开发建议使用JSON数据类似
var htmlAdBtn = '';
$("#jdAdSlide img").each(function(index, image) {
	var id = "adImage" + index;
	htmlAdBtn = htmlAdBtn + '<a href="javascript:" class="jd_ad_btn_a" data-rel="'+ id +'">'+ (index + 1) +'</a>';
	image.id = id;
});
$("#jdAdBtn").html(htmlAdBtn).find("a").powerSwitch({
	eventType: "hover",
	classAdd: "active",
	animation: "fade",
	autoTime: 5000,
	onSwitch: function(image) {
		if (!image.attr("src")) {
			image.attr("src", image.attr("data-src"));	
		}
	}
}).eq(0).trigger("mouseover");

// 便民服务
$("#servNav a").powerSwitch({
	classAdd: "active",
	eventType: "hover",
	onSwitch: function() {
		$("#pointLine").animate({ "left": $(this).position().left}, 200);
	}
});
</script> 
      </div>
      <div class="clearboth"></div>
      <div class="block4H">
        
        <a class="more" href="#"><img src="${basePath }/adminManage/images/img-07.jpg"></a></div>
      <div class="yc_section_info">
        <div class="yc_info_tabs fl">
          <div id="yc_info_tab1">
            <div id="yc_info_tag1">
              <ul>
                <li class="" style="cursor: pointer;"><a href="${basePath }/adminManage/newsList?type=5" target="_blank">优惠政策</a></li>
              </ul>
            </div>
            <div id="yc_info_con1">
              <div class="yc_info_con1" style="display: block;">
                <ul>
                	<c:forEach items="${newsList }" var="news">
	              		<c:if test="${news.type == '5' }">
	              			<li><span>${news.publishDate }</span><a target="_blank" href="${basePath }/adminManage/detail?id=${news.seriesNo }">${news.title }</a></li>
	              		</c:if>
	              	</c:forEach>
                </ul>
                <span class="yc_more1"><a href="${basePath }/adminManage/newsList?type=5" target="_blank">更多&gt;</a></span> </div>
              <div class="yc_info_con1" style="display: none;">
                <ul>
                  <li><span>11-07</span><a target="_blank" href="#showxxgk.aspx?Id=114503&ctlgid=626221">赵存明对全县科技业务工作提出三点要求</a></li>
                  <li><span>11-03</span><a target="_blank" href="#showxxgk.aspx?Id=114378&ctlgid=626221">县政府第35次常务会和第26次县长办公会召开</a></li>
                  <li><span>10-25</span><a target="_blank" href="#showxxgk.aspx?Id=114085&ctlgid=626221">努力做好关心下一代工作</a></li>
                  <li><span>10-23</span><a target="_blank" href="#showxxgk.aspx?Id=114087&ctlgid=626221">蔡萌芽就财税推进工作提三点要求</a></li>
                  <li><span>10-20</span><a target="_blank" href="#showxxgk.aspx?Id=113889&ctlgid=626221">抓住机遇早谋划 凝心聚力促发展</a></li>
                </ul>
                <span class="yc_more1"><a href="#xxgk/zfhy">更多&gt;</a></span> </div>
            </div>
          </div>
          <div id="yc_info_tab2">
            <div id="yc_info_tag2">
              <ul>
                <li class="cur" style="cursor: pointer;"><a href="${basePath }/adminManage/newsList?type=7" target="_blank">市场信息</a></li>
              </ul>
            </div>
            <div id="yc_info_con2">
              <div class="yc_info_con2" style="display: block;">
                <ul>
                  <c:forEach items="${newsList }" var="news">
	              		<c:if test="${news.type == '7' }">
	              			<li><span>${news.publishDate }</span><a target="_blank" href="${basePath }/adminManage/detail?id=${news.seriesNo }">${news.title }</a></li>
	              		</c:if>
	              	</c:forEach>
                </ul>
                <span class="yc_more1"><a href="${basePath }/adminManage/newsList?type=7" target="_blank">更多&gt;</a></span> </div>
              <div class="yc_info_con2" style="display: none;">
                <ul>
                  <li><span>10-27</span><a target="_blank" href="#showxxgk.aspx?Id=114080&ctlgid=67122237">2014年1-9月份规模以上工业生产情况</a></li>
                  <li><span>10-27</span><a target="_blank" href="#showxxgk.aspx?Id=114079&ctlgid=67122237">1-9月主要经济指标运行情况</a></li>
                  <li><span>10-27</span><a target="_blank" href="#showxxgk.aspx?Id=114078&ctlgid=67122237">东侨2014年9月月度数据</a></li>
                  <li><span>10-27</span><a target="_blank" href="#showxxgk.aspx?Id=114077&ctlgid=67122237">2014年1-9月份居民消费价格变动情况</a></li>
                  <li><span>10-23</span><a target="_blank" href="#showxxgk.aspx?Id=113974&ctlgid=67122237">2014年1-9月份社会消费品零售总额情况</a></li>
                </ul>
                <span class="yc_more1"><a href="#xxgk/tjxx">更多&gt;</a></span> </div>
            </div>
          </div>
        </div>
        <div class="yc_info_tabs fl">
          <div id="yc_info_tab3">
            <div id="yc_info_tag3">
              <ul>
                <li class="" style="cursor: pointer;"><a href="${basePath }/adminManage/newsList?type=6" target="_blank">典型案例</a></li>
              </ul>
            </div>
            <div id="yc_info_con3">
              <div class="yc_info_con3" style="display: none;">
                <ul>
                  <li><span>10-29</span><a target="_blank" href="#showxxgk.aspx?Id=114360&ctlgid=76573212">东侨人民政府关于成立东侨农村土地承包经营</a></li>
                  <li><span>10-17</span><a target="_blank" href="#showxxgk.aspx?Id=114004&ctlgid=14481172">东侨人民政府关于东侨2014年度第3批次农用</a></li>
                  <li><span>10-13</span><a target="_blank" href="#showxxgk.aspx?Id=113988&ctlgid=51218777">东侨人民政府关于增补县级治安保卫重点单位的</a></li>
                  <li><span>09-30</span><a target="_blank" href="#showxxgk.aspx?Id=113726&ctlgid=44818433">东侨人民政府关于做好2014年普通高等学校毕业</a></li>
                  <li><span>09-19</span><a target="_blank" href="#showxxgk.aspx?Id=113508&ctlgid=76573212">东侨人民政府关于郭生地等同志职务任免的通知</a></li>
                </ul>
                <span class="yc_more1"><a href="#xxgk/zfwj">更多&gt;</a></span> </div>
              <div class="yc_info_con3" style="display: block;">
                <ul>
                  <c:forEach items="${newsList }" var="news">
	              		<c:if test="${news.type == '6' }">
	              			<li><span>${news.publishDate }</span><a target="_blank" href="${basePath }/adminManage/detail?id=${news.seriesNo }">${news.title }</a></li>
	              		</c:if>
	              	</c:forEach>
                </ul>
                <span class="yc_more1"><a href="${basePath }/adminManage/newsList?type=6" target="_blank">更多&gt;</a></span> </div>
            </div>
          </div>
          <div id="yc_info_tab4">
            <div id="yc_info_tag4">
              <ul>
                <li class="cur" style="cursor: pointer;"><a href="${basePath }/adminManage/newsList?type=8" target="_blank">专家问答</a></li>
              </ul>
            </div>
            <div id="yc_info_con4">
              <div class="yc_info_con4" style="display: block;">
                <ul>
                  <c:forEach items="${newsList }" var="news">
	              		<c:if test="${news.type == '8' }">
	              			<li><span>${news.publishDate }</span><a target="_blank" href="${basePath }/adminManage/detail?id=${news.seriesNo }">${news.title }</a></li>
	              		</c:if>
	              	</c:forEach>
                </ul>
                <span class="yc_more1"><a href="${basePath }/adminManage/newsList?type=8" target="_blank">更多&gt;</a></span> </div>
              <div class="yc_info_con4" style="display: none;">
                <ul>
                  <li><span>10-27</span><a target="_blank" href=""></a></li>
                  <li><span>10-27</span><a target="_blank" href=""></a></li>
                  <li><span>10-27</span><a target="_blank" href=""></a></li>
                  <li><span>10-27</span><a target="_blank" href=""></a></li>
                  <li><span>10-23</span><a target="_blank" href=""></a></li>
                </ul>
                <span class="yc_more1"><a href="#xxgk/tjxx">更多&gt;</a></span> </div>
            </div>
          </div>
        </div>
        
      <div class="clearboth"></div>
      <div class="dq_ad">
        <div class="jd_body">
          <div id="jdAdSlide1" class="jd_ad_slide"> <a href="#"><img src="${basePath }/adminManage/images/bar1.jpg" class="jd_ad_img"></a> <a href="#"><img data-src="${basePath }/adminManage/images/bar2.jpg" class="jd_ad_img"></a> <a href="#"><img data-src="images/bar3.jpg" class="jd_ad_img"></a>
            <div id="jdAdBtn1" class="jd_ad_btn"></div>
            <!-- add active --> 
          </div>
        </div>
        <script src="${basePath }/adminManage/js/jquery-powerSwitch.js"></script> 
        <script>
// 大的图片广告
// 根据图片创建id,按钮元素等，实际开发建议使用JSON数据类似
var htmlAdBtn = '';
$("#jdAdSlide1 img").each(function(index, image) {
	var id = "adImage1" + index;
	htmlAdBtn = htmlAdBtn + '<a href="javascript:" class="jd_ad_btn_a" data-rel="'+ id +'">'+ (index + 1) +'</a>';
	image.id = id;
});
$("#jdAdBtn1").html(htmlAdBtn).find("a").powerSwitch({
	eventType: "hover",
	classAdd: "active",
	animation: "fade",
	autoTime: 5000,
	onSwitch: function(image) {
		if (!image.attr("src")) {
			image.attr("src", image.attr("data-src"));	
		}
	}
}).eq(0).trigger("mouseover");

// 便民服务
$("#servNav a").powerSwitch({
	classAdd: "active",
	eventType: "hover",
	onSwitch: function() {
		$("#pointLine").animate({ "left": $(this).position().left}, 200);
	}
});
</script> 
      <!--yc_section_public-->
      <div class="clearboth"></div>
     
      <!--yc_section_sites--> 
      
    </div>
    <!--index content--> 
    
    <script>
$("#yc_intab").tab({
	tabId: "#yc_intag",
	tabTag: "li",
	conId: "#yc_incont",
	conTag: ".yc_incont",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});

$("#yc_intab1").tab({
	tabId: "#yc_intag1",
	tabTag: "li",
	conId: "#yc_incont1",
	conTag: ".yc_incont1",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});

$("#yc_info_tab1").tab({
	tabId: "#yc_info_tag1",
	tabTag: "li",
	conId: "#yc_info_con1",
	conTag: ".yc_info_con1",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});


$("#yc_info_tab2").tab({
	tabId: "#yc_info_tag2",
	tabTag: "li",
	conId: "#yc_info_con2",
	conTag: ".yc_info_con2",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});

$("#yc_info_tab3").tab({
	tabId: "#yc_info_tag3",
	tabTag: "li",
	conId: "#yc_info_con3",
	conTag: ".yc_info_con3",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});

$("#yc_info_tab4").tab({
	tabId: "#yc_info_tag4",
	tabTag: "li",
	conId: "#yc_info_con4",
	conTag: ".yc_info_con4",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});



$("#yc_work_tab").tab({
	tabId: "#yc_work_tag",
	tabTag: "li",
	conId: "#yc_work_con",
	conTag: ".yc_work_con",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});

$("#yc_survey_tab").tab({
	tabId: "#yc_survey_tag",
	tabTag: "li",
	conId: "#yc_survey_con",
	conTag: ".yc_survey_con",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});

$("#yc_sites_tab").tab({
	tabId: "#yc_sites_tag",
	tabTag: "li",
	conId: "#yc_sites_con",
	conTag: ".yc_sites_con",
	curClass: "cur",
	act: "mouseover",
	dft: 0
});
</script> 
  </div>
  <!--shadow-->
  <div class="yc_shadow_bot boxImg"><img src="${basePath }/adminManage/images/img_shadow_bot.png" width="1014" height="6"></div>
</div>
<!--container-->

			<footer class="yc_footer">
				<div class="yc_flinks">
					<a  href="${basePath }/adminManage/index">首页</a>|
        			<a href="${basePath }/adminManage/newsList?type=4">农业新闻</a> | 
        			<a href="${basePath }/adminManage/newsList?type=3">保险信息</a> | 
        			<a href="${basePath }/adminManage/newsList?type=8">专家问答</a> | 
        			<a href="${basePath }/adminManage/newsList?type=5">优惠政策</a> | 
        			<a href="${basePath }/adminManage/newsList?type=7">市场信息</a> |
        			<a href="${basePath }/adminManage/login.jsp" target="_blank">首页管理</a>
        		</div>
  				<div class="yc_copyright"> 版权所有&copy;<a href="#">xxxxxxxx</a> Copyright&copy;xxxxxx <a href="http://www.nddq.gov.cn/">xxxxxxx</a> xxxxxxx<br>
    xxxxxxxx<a href="#" target="_blank">xxxxxxx</a><br></div>
</footer>
<script src="js/jquery.flash.js"></script> 
<script>
$(document).ready(function(){
  $(".yc_menu").on("mouseenter",function(){
    $(this).find(".yc_submenu").slideDown(300);
  });
  $(".yc_menu").on("mouseleave",function(){
    $(this).find(".yc_submenu").slideUp(200);
  });
  
  /*启用动画背景请删除此注释并修改相关文件名*
   $('#bgFlash').flash(
        { 
		  src: '/swf/bg.swf',
          width: '100%',
          height: 400,
		  flashvars: { foo: 'bar', baz: 'zoo' },
		  wmode: 'transparent'
		},
	     { version: 9}    
	 );
  */
});
</script> 

<!--[if IE 6]>
	 <script src="/js/DD_belatedPNG.js"></script>
	 <script>DD_belatedPNG.fix('.yc_logo img,.yc_shadow,.yc_shadow_bot img,.sub_content,.img_mark,.yc_gzcy_left_menu li span img');</script>
	 <script>
	  document.execCommand("BackgroundImageCache", false, true);
	 </script>
<![endif]--> 
<script type="text/javascript">
function showLocale(objD)
{
	var str,colorhead,colorfoot;
	var yy = objD.getYear();
	if(yy<1900) yy = yy+1900;
	var MM = objD.getMonth()+1;
	if(MM<10) MM = '0' + MM;
	var dd = objD.getDate();
	if(dd<10) dd = '0' + dd;
	var hh = objD.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = objD.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = objD.getSeconds();
	if(ss<10) ss = '0' + ss;
	var ww = objD.getDay();
	if  ( ww==0 )  colorhead="<font color=\"#FF0000\">";
	if  ( ww > 0 && ww < 6 )  colorhead="<font color=\"#373737\">";
	if  ( ww==6 )  colorhead="<font color=\"#008000\">";
	if  (ww==0)  ww="星期日";
	if  (ww==1)  ww="星期一";
	if  (ww==2)  ww="星期二";
	if  (ww==3)  ww="星期三";
	if  (ww==4)  ww="星期四";
	if  (ww==5)  ww="星期五";
	if  (ww==6)  ww="星期六";
	colorfoot="</font>"
	str=colorhead
						+ yy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "  " + ww + colorfoot;
	return(str);
}
function
						tick()
{
	var today;
	today=new
						Date();
	document.getElementById("localtime").innerHTML=showLocale(today);window.setTimeout("tick()", 1000);
}
tick();
</script>
</body>
</html>