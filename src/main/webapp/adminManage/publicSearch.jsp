<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>公众查询</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery.sudoSlider.min.js"></script>
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
<header class="yc_header">
  <div class="yc_topBox"><span style="display:block;width:100%;font-size: 40px;height:100%;line-height:200px;text-align:left;color:#fff;text-shadow: 2px 3px #00a6e3;">贵州农业保险综合信息服务平台 </span></div>
</header>
<div class="yc_container">
 <div class="yc_nav_top boxImg"><img src="${basePath }/adminManage/images/img_nav_top.png" width="1000" height="6"></div>
  <div class="yc_shadow">
    <nav class="yc_nav">
      <div class="yc_nav_menu">
        <div class="yc_menu"><a class="yc_menu_link_first" href="${basePath }/adminManage/index" title="首页"></a></div>
        
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=4" target="_blank"></a>
         
        </div>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=3" target="_blank"></a>
          
        </div>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=8" target="_blank"></a>
          
        </div>
        <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=5" target="_blank"></a>
        
        </div>
         <div class="yc_menu"><a class="yc_menu_link" href="${basePath }/adminManage/newsList?type=7" target="_blank"></a>
        
        </div>
      </div>
      <!--yc_nav_menu-->
      <!-- <form name="f1" action="http://www.baidu.com/baidu">
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
			  
 <div class="yc_location">当前位置：公众查询</div>
		<div class="yc_content_inner">
        <section class="showCon">
		<form action="/adminManage/publicSearch" name="fm" method="post" target="resultFrame">
			<div>
				<input type="text" name="idNo" id="idNo" style="width:300px;height:30px; border: 1px solid #cdcdcd;"  class="yc_s_input fl" value="在此输入证件号" onfocus="if(this.value==&#39;在此输入证件号&#39;)this.value=&#39;&#39;;" onblur="if(this.value==&#39;&#39;)this.value=&#39;在此输入证件号&#39;">
				<!-- <input type="text" name="userName" id="userName" class="yc_s_input fl" style="margin-left:10px;" value="在此输入被保险人名称" onfocus="if(this.value==&#39;在此输入被保险人名称&#39;)this.value=&#39;&#39;;" onblur="if(this.value==&#39;&#39;)this.value=&#39;在此输入被保险人名称&#39;"> -->
				<input  style="color:black;font-size:12px;width:72px;border: none;height:30px;line-height:30px;cursor: pointer;float:left;margin-left:10px;border:1px solid #aeddff;" onclick="submitFm()" type="button" value="查询"  >
			</div>
			<div style="clear: both;"></div>
		</form>
  <h3><!-- 当前时间：<span id=localtime></span> --></h3>
			 <article id="zoom">
  				<iframe name="resultFrame" src="" width="100%" height="400px" style="border: none;"></iframe>
			 </article>
			<script>
			 function doZoom(size){
			  document.getElementById('zoom').style.fontSize=size+'px'
			  }
			  
			  function submitFm(){
			  	//var userName = document.getElementById("userName").value;
			  	var idNo = document.getElementById("idNo").value;
			  	if((idNo == "在此输入证件号" || idNo == "")){
			  		alert("请输入查询条件");
			  		return;
			  	}
			  	fm.submit();
			  }
			</script>
			 <div class="aboutLink">
			  <h4>相关链接</h4>
			  <div class="aboutList">
			   <ul>
				      <li><span>2012-06-13</span><a target="_blank" title="德圣保险经纪有限公司" href="http://www.dsib.cn">德圣保险经纪有限公司</a></li>

			   </ul>
			  </div>
			  <div class="boxImg"><img src="images/img_radius_bot1.gif" width="900" height="4"></div>
			 </div>
        </section>
		</div><!--yc_content_inner-->

         
	  </div><!--shadow-->
	  <div class="yc_shadow_bot boxImg"><img src="images/img_shadow_bot.png" width="1014" height="6"></div>
	</div>
<!--container-->

<footer class="yc_footer">
				<div class="yc_flinks">
					<a  href="${basePath }/adminManage/index">首页</a>|
        			<a href="${basePath }/adminManage/newsList?type=4">农业新闻</a> | 
        			<a href="${basePath }/adminManage/newsList?type=3">保险信息</a> | 
        			<a href="${basePath }/adminManage/newsList?type=8">专家问答</a> | 
        			<a href="${basePath }/adminManage/newsList?type=5">优惠政策</a> | 
        			<a href="${basePath }/adminManage/newsList?type=7">市场信息</a>
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
	str=colorhead + yy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "  " + ww + colorfoot;
	return(str);
}
function tick()
{
	var today;
	today=new Date();
	document.getElementById("localtime").innerHTML=showLocale(today);window.setTimeout("tick()", 1000);
}
tick();
</script>
</body>
</html>